using PDDL, SymbolicPlanners

domain = load_domain("puzznic/puzznic_domain.pddl")
problem = load_problem("puzznic/levels/1/problem-1.pddl")
state = initstate(domain, problem)
spec = MinMetricGoal(problem)

planner = ForwardPlanner()
sol = planner(domain, state, spec)
println(sol.plan)
