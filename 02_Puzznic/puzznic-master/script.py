import os, subprocess

DOMAIN_PATH = "puzznic_domain.pddl"
PROBLEMS_PATH = "levels"
OUTPUT_DIR = "outputs"

os.makedirs(OUTPUT_DIR, exist_ok=True)

problems = []
for level in os.listdir(PROBLEMS_PATH):
    level_path = f'{PROBLEMS_PATH}/{level}'
    # print(level_path)
    if os.path.isdir(level_path):
        problem_path = f'{level_path}/{[file for file in os.listdir(level_path) if file.endswith(".pddl")][0]}'
        problems.append(problem_path)
        # problems + [file for file in os.listdir(level_path) if file.endswith(".pddl")]

# print(problems)

def forward_planner(problem_name, problem_file, output_file):
    try:
        print(f"Executando problema: {problem_name} com Forward Planner...")
        result = subprocess.run(
            ["julia", "puzznic_planner.jl", DOMAIN_PATH, problem_file],
            capture_output=True,
            text=True,
            timeout=300
        )

        # print(result)

        with open(output_file, "a") as f:
            f.write("--- FORWARD PLANNER ---\n")
            f.write(result.stdout)
            if result.stderr:
                f.write("\n--- STDERR ---\n")
                f.write(result.stderr)
        
        if result.stderr:
            print("❌ Solução não encontrada.")
        else:
            print("✅ Problema executado com sucesso.")

    except Exception as e:
        print(f"❌ Erro: {e}")

def astar_planner(problem_name, problem_file, output_file):
    try:
        print(f"Executando problema: {problem_name} com Astar Planner...")
        
        env = os.environ.copy()
        env["PLANNER"] = "ASTAR"

        result = subprocess.run(
            ["julia", "puzznic_planner.jl", DOMAIN_PATH, problem_file],
            capture_output=True,
            text=True,
            timeout=300,
            env=env
        )

        # print(result)

        with open(output_file, "a") as f:
            f.write("--- ASTAR PLANNER ---\n")
            f.write(result.stdout)
            if result.stderr:
                f.write("\n--- STDERR ---\n")
                f.write(result.stderr)
        
        if result.stderr:
            print("❌ Solução não encontrada.")
        else:
            print("✅ Problema executado com sucesso.")

    except Exception as e:
        print(f"❌ Erro: {e}")

for problem_file in problems:
    problem_name = problem_file.split("/")[2]
    output_file = os.path.join(OUTPUT_DIR, f"{problem_name}.txt")

    forward_planner(problem_name, problem_file, output_file)
    astar_planner(problem_name, problem_file, output_file)