#!/usr/bin/env julia
# Copyright (C) 2023  Guilherme Puida
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the license, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRAY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

neededPackages = [:PDDL, :SymbolicPlanners] 
using Pkg;
for neededpackage in neededPackages
    (String(neededpackage) in keys(Pkg.project().dependencies)) || Pkg.add(String(neededpackage))
    @eval using $neededpackage
end

using PDDL, SymbolicPlanners

function print_help()
	println("usage: planner.jl <domain> <problem>")
	println("environment variables:")
	println("  HEURISTIC: HADD,HMAX,FF,GC (default: GC)")
	println("  GOAL: MIN_STEPS,MIN_METRIC,MAX_METRIC (default: MIN_METRIC)")
	println("  PLANNER: FORWARD,UNIFORM,GREEDY,ASTAR (default: FORWARD)")
	println("  TIMEOUT: <seconds> (default: 300)")
end

function get_heuristic()
	heuristic = get(ENV, "HEURISTIC", "GC")
	if heuristic == "HADD"
		return HAdd()
	elseif heuristic == "HMAX"
		return HMax()
	elseif heuristic == "FF"
		return FFHeuristic()
	elseif heuristic == "GC"
		return GoalCountHeuristic()
	else
		println("Unknown heuristic $heuristic")
		print_help()
		exit(1)
	end
end

function get_goal(problem)
	goal = get(ENV, "GOAL", "MIN_METRIC")
	if goal == "MIN_STEPS"
		return MinStepsGoal(problem)
	elseif goal == "MIN_METRIC"
		return MinMetricGoal(problem)
	elseif goal == "MAX_METRIC"
		return MaxMetricGoal(problem)
	else
		println("Unknown goal $goal")
		print_help()
		exit(1)
	end
end

function get_planner(heuristic, timeout)
	planner = get(ENV, "PLANNER", "FORWARD")
	println("using $planner")
	if planner == "ASTAR"
		return AStarPlanner(heuristic, max_time=timeout, save_search=true)
	elseif planner == "FORWARD"
		return ForwardPlanner(heuristic=heuristic, max_time=timeout, save_search=true)
	elseif planner == "GREEDY"
		return GreedyPlanner(heuristic, max_time=timeout, save_search=true)
	elseif planner == "UNIFORM"
		return UniformPlanner(max_time = timeout, save_search=true)
	else
		println("Unknown planner $planner")
		print_help()
		exit(1)
	end
end

function get_timeout()
	timeout = get(ENV, "TIMEOUT", "300")
	return parse(Int, timeout)
end

function main()
	if length(ARGS) != 2
		print_help()
		exit(1)
	end

	domain = load_domain(ARGS[1])
	problem = load_problem(ARGS[2])
	state = initstate(domain, problem)

	spec = get_goal(problem)
	heuristic = get_heuristic()
	timeout = get_timeout()
	planner = get_planner(heuristic, timeout)

	println("starting execution...")
	stats = @timed begin
		solution = planner(domain, state, spec)
	end

	println("solution found:")
	# map(x -> println(write_pddl(x)), solution)
	# println()
	println("time: $(stats.time) seconds")

	map(x -> println(x), solution.plan)
	# println(solution.plan)
end

main()
