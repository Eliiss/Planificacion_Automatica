import subprocess
import re
import matplotlib.pyplot as plt
import os

# Creamos una carpeta para los resultados si no existe, para no llenar la carpeta principal de .txt
if not os.path.exists('benchmarks_results'):
    os.makedirs('benchmarks_results')

# Definimos los tamaños exactos
tamanos_a_evaluar = [2, 4, 5, 6, 10, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 320, 321, 322]

tamanos_jshop = []
tiempos_jshop = []

print("=== Iniciando Cálculo de Benchmark Automatizado ===")
print("-" * 51)

for size in tamanos_a_evaluar:
    # Generar el problema
    gen_cmd = f"python3 domains/emergencylogistics/generate-problem.py -l {size} -p {size} -c {size} -g {size} -o domains/emergencylogistics/problem"
    subprocess.run(gen_cmd, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    # Ejecutar JSHOP2
    run_cmd = "./jshop2-console.sh emergencylogistics"
    resultado = subprocess.run(run_cmd, shell=True, capture_output=True, text=True)
    salida_consola = resultado.stdout + resultado.stderr

    # Guardamos la salida en un archivo llamado problem_TAMAÑO.txt dentro de la carpeta 'resultados_logs'
    nombre_log = f"benchmarks_results/problem_{size}.txt"
    with open(nombre_log, "w") as f:
        f.write(salida_consola)

    # Comprobar si JSHOP2 colapsa por límite de compilador Java
    if "code too large" in salida_consola:
        print(f"LÍMITE ALCANZADO EN TAMAÑO {size}: 'code too large'.")
        break

    # Extraer el Tiempo usando expresiones regulares
    match_time = re.search(r"Time Used\s*=\s*([\d\.]+)", salida_consola)

    if match_time:
        tiempo = float(match_time.group(1))
        tamanos_jshop.append(size)
        tiempos_jshop.append(tiempo)
        print(f"Tamaño {size:<4} | Tiempo: {tiempo:<6.3f}s")
    else:
        print(f"Error en tamaño {size} (ver log para detalles)")

# Generación de la Gráfica
if len(tamanos_jshop) > 0:
    plt.figure(figsize=(10, 6))
    plt.plot(tamanos_jshop, tiempos_jshop, '-s', linewidth=2, color='#2ca02c', markerfacecolor='#2ca02c', label='Planificación Jerárquica (JSHOP2)')
    plt.axvline(x=321, color='red', linestyle=':', linewidth=2, label='Máx operativo (X=321)')
    plt.title('Escalabilidad de la Planificación Jerárquica (JSHOP2)', fontsize=14, fontweight='bold')
    plt.xlabel('Tamaño del problema (X = L = P = C = G)', fontsize=12)
    plt.ylabel('Tiempo de resolución (segundos)', fontsize=12)
    plt.grid(True, linestyle='--', alpha=0.7)
    plt.legend(loc='upper left', fontsize=11)
    plt.tight_layout()
    plt.savefig('jshop2_escalabilidad.png', dpi=300)
    print("-" * 50)
    print(f"Gráfica guardada como 'jshop2_escalabilidad.png'")
    print(f"Todos los planes detallados están en la carpeta 'benchmarks_results/'")