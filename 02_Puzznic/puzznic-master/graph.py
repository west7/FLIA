import os
import re
import matplotlib.pyplot as plt

# Pasta com os logs
output_dir = "outputs"

# Regex para planner e tempo
pattern = re.compile(r"--- (.*?) PLANNER ---.*?time: ([\d.]+) seconds", re.DOTALL)

# Armazenar dados como {problema: {planner: tempo}}
dados = {}

# Pega todos os arquivos de saída
for filename in sorted(os.listdir(output_dir)):
    if filename.endswith(".txt"):
        path = os.path.join(output_dir, filename)
        with open(path, "r") as file:
            content = file.read()

            planner_times = {}
            for match in pattern.findall(content):
                planner = match[0].strip()
                tempo = float(match[1])
                planner_times[planner] = tempo
            
            dados[filename] = planner_times

# Ordenar planners e problemas
planners = sorted({planner for tempos in dados.values() for planner in tempos})
problemas = sorted(dados.keys())

# Criar dados para gráfico
bar_width = 0.2
x = range(len(problemas))

# Cores opcionais
colors = ['skyblue', 'lightgreen', 'salmon', 'mediumpurple', 'orange']

# Plotar barras
plt.figure(figsize=(12, 6))

for i, planner in enumerate(planners):
    tempos = [dados[prob].get(planner, 0) for prob in problemas]
    offsets = [p + bar_width*i for p in x]
    plt.bar(offsets, tempos, width=bar_width, label=planner, color=colors[i % len(colors)])

# Ajustes do eixo X
plt.xticks([p + bar_width for p in x], [p.replace(".pddl.txt", "") for p in problemas], rotation=45)
plt.ylabel("Tempo de execução (s)")
plt.xlabel("Problemas PDDL")
plt.title("Comparação de Planners por Tempo de Execução")
plt.legend()
plt.grid(True, axis="y", linestyle="--", alpha=0.5)
plt.tight_layout()
# plt.show()

# Salvar o gráfico como PNG
plt.savefig("grafico_tempos.png", dpi=300)
