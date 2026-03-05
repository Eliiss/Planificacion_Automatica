% Datos extraidos de las trazas (tiempo real en segundos)
tamanos = [5, 10, 15, 16, 18, 19, 20, 40, 50, 51, 52, 53, 54, 55, 60, 65];
tiempos = [0.21, 0.26, 0.33, 0.46, 0.42, 0.80, 2.56, 20.81, 42.84, 74.45, 162.08, 92.84, 92.84, 98.20, 192.60, 299.13];

% Crear la figura
figure;

% Pintamos la linea con los puntos
plot(tamanos, tiempos, '-o', 'LineWidth', 1.5, 'MarkerFaceColor', 'b', 'Color', 'b');
hold on;

% Linea horizontal roja para el limite de 1 minuto
yline(60, '--r', 'LineWidth', 1.5);

% Linea vertical verde para marcar nuestro tope operativo
xline(50, ':g', 'LineWidth', 1.5);

% Texto y flecha para señalar el pico raro del X=52
text(53, 162, '\leftarrow Pico anómalo', 'FontSize', 11);

% Textos y etiquetas
title('Escalabilidad del planificador Metric-FF');
xlabel('Tamaño del problema (X = L = P = C = G)');
ylabel('Tiempo de resolución (segundos)');

% Añadir la leyenda
legend('Metric-FF', 'Límite (60s)', 'Máx operativo (X=50)', 'Location', 'northwest');

% Activar la cuadricula
grid on;
hold off;