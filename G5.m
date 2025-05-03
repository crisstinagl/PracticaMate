%% Introducción a los Métodos Matemáticos y Numéricos
%% Plantilla para la entrega de la práctica realizada en grupo 
%% Curso 2024-2025
                    
%% Escribir (todos y cada uno de los miembros del grupo)
% (Desarrollador 1)
% Nombre completo: Alexia 
% Apellidos completos: Fernández Millán

% (Desarrollador 2)
% Nombre completo: Claudia
% Apellidos completos: Porcuna Rivas

% (Desarrollador 3)
% Nombre completo: Cristina 
% Apellidos completos: González de Lope

% (Desarrollador 4)
% Nombre completo: Karina Diana
% Apellidos completos: Hincu

% (Desarrollador 5)
% Nombre completo: Alexandra 
% Apellidos completos: Alina Pop 


%% Nivel 1 [12 puntos]
clear 
close all
clc 

%% 1) [5 puntos]
%% Solución:

% -------------------------------------------------------------------------
% PASOS PREVIOS
% -------------------------------------------------------------------------

% Carga la imagen desde un archivo:

im_ini = imread('Espana2D.png');

% Convierte la imagen a tipo de datos double, con los valores normalizados 
% entre 0 y 1:

im = im2double(im_ini);

%%
% Genera una gráfica:

figure

% Muestra la imagen en el dominio [0,1]x[0,1], volteada verticalmente:

imagesc([0 1], [0 1], flip(im, 1));

% Ajusta la dirección del Eje Y en una gráfica:

set(gca,'ydir','normal');

% Oculta los ejes en una gráfica:

axis off

% Iguala la escala en ambos ejes para evitar posibles distornsiones:

axis equal

% Permite añadir más elementos gráficos a la misma figura:

hold on

% Declaración de las variables simbólicas:

syms x y t

% -------------------------------------------------------------------------
% CIRCUNFERENCIA
% -------------------------------------------------------------------------

% Coordenadas del centro de la circunferencia:

C1 = 0.5; % Coordenada X.
C2 = 0.5; % Coordenada Y.

% Radio de la circunferencia:

R = 0.35;

% Definición paramétrica simbólica de la circunferencia:

x_circ(t) = C1 + R * cos(t);
y_circ(t) = C2 + R * sin(t);

% Representación gráfica de la circunferencia completa:

fplot(x_circ, y_circ, [0, 2*pi], 'w', 'LineWidth', 1.5);

% Coordenadas del punto de inicio (START/END) sobre la bisectriz y = x:

starting_point = 0.25;

% Representación gráfica del punto de inicio:

plot (starting_point, starting_point, 'ko', 'LineWidth', 1.5);
hold on

% Representación gráfica de la bisectriz:

F0 = fplot(x, [starting_point, 1], 'w--', 'LineWidth', 1.5);
hold on

% -------------------------------------------------------------------------
% CURVA 1
% -------------------------------------------------------------------------

% Definición simbólica de la curva 1, y = x^2:

curve_1(x) = (x)^2;

% Calcula el desplazamiento vertical para que la curva pase por el punto de
% de inicio:

desplacement_1 = starting_point - curve_1(starting_point);

% Aplica el desplazamiento vertical a la curva:

curve_1 = curve_1 + desplacement_1;

% Representación gráfica de la curva 1:

F1 = fplot(curve_1, [starting_point, 1], 'r', 'LineWidth', 1.5);
hold on

% -------------------------------------------------------------------------
% INVERSA DE LA CURVA 1
% -------------------------------------------------------------------------

% Resuelve simbólicamente la inversa de la función de la curva 1:

inv_curve_1 = solve(curve_1 - y, x);   % Despeja X en función de Y.
inv_curve_1 = subs(inv_curve_1, y, x); % Sustituye Y por X para graficar.

% Selecciona sólo una solución, la adecuada para el dominio:

inv_curve_1 = inv_curve_1(2);

% Representación gráfica de la inversa de la curva 1:

inv_F1 = fplot(inv_curve_1, [starting_point, 1], 'r--', 'LineWidth', 1.5);
ylim([0, 1]);

% -------------------------------------------------------------------------
% CURVA 2
% -------------------------------------------------------------------------

% Definición simbólica de la curva 2, y = sin(x):

curve_2(x) = sin(x);

% Calcula el desplazamiento vertical para que la curva pase por el punto de
% de inicio:

desplacement_2 = starting_point - curve_2(starting_point);

% Aplica el desplazamiento vertical a la curva:

curve_2 = curve_2 + desplacement_2;

% Representación gráfica de la curva 2:

F2 = fplot(curve_2, [starting_point, 1], 'g', 'LineWidth', 1.5);
hold on

% -------------------------------------------------------------------------
% INVERSA DE LA CURVA 2
% -------------------------------------------------------------------------

% Resuelve simbólicamente la inversa de la función de la curva 2:

inv_curve_2 = solve(curve_2 - y, x);   % Despeja X en función de Y.
inv_curve_2 = subs(inv_curve_2, y, x); % Sustituye Y por X para graficar.

% Selecciona sólo una solución, la adecuada para el dominio:

inv_curve_2 = inv_curve_2(1);

% Representación gráfica de la inversa de la curva 2:

inv_F2 = fplot(inv_curve_2, [starting_point, 1], 'g--', 'LineWidth', 1.5);
ylim([0, 1]);

% -------------------------------------------------------------------------
% CURVA 3
% -------------------------------------------------------------------------

% Definición simbólica de la curva 3, y = log(x + 1):

curve_3(x) = log(x + 1);

% Calcula el desplazamiento vertical para que la curva pase por el punto de
% de inicio:

desplacement_3 = starting_point - curve_3(starting_point);

% Aplica el desplazamiento vertical a la curva:

curve_3 = curve_3 + desplacement_3;

% Representación gráfica de la curva 3:

F3 = fplot(curve_3, [starting_point, 1], 'b', 'LineWidth', 1.5);
hold on

% -------------------------------------------------------------------------
% INVERSA DE LA CURVA 3
% -------------------------------------------------------------------------

% Resuelve simbólicamente la inversa de la función de la curva 3:

inv_curve_3 = solve(curve_3 - y, x);   % Despeja X en función de Y.
inv_curve_3 = subs(inv_curve_3, y, x); % Sustituye Y por X para graficar.

% Representación gráfica de la inversa de la curva 3:

inv_F3 = fplot(inv_curve_3, [starting_point, 1], 'b--', 'LineWidth', 1.5);
ylim([0, 1]);

% -------------------------------------------------------------------------
% CURVA 4
% -------------------------------------------------------------------------

% Definición simbólica de la curva 4, y = tan(pi*x/4):

curve_4(x) = tan(pi*x/4);

% Calcula el desplazamiento vertical para que la curva pase por el punto de
% de inicio:

desplacement_4 = starting_point - curve_4(starting_point);

% Aplica el desplazamiento vertical a la curva:

curve_4 = curve_4 + desplacement_4;

% Representación gráfica de la curva 4:

F4 = fplot(curve_4, [starting_point, 1], 'm', 'LineWidth', 1.5);
hold on

% -------------------------------------------------------------------------
% INVERSA DE LA CURVA 4
% -------------------------------------------------------------------------

% Resuelve simbólicamente la inversa de la función de la curva 4:

inv_curve_4 = solve(curve_4 - y, x);   % Despeja X en función de Y.
inv_curve_4 = subs(inv_curve_4, y, x); % Sustituye Y por X para graficar.

% Representación gráfica de la inversa de la curva 4:

inv_F4 = fplot(inv_curve_4, [starting_point, 1], 'm--', 'LineWidth', 1.5);
ylim([0, 1]);

%% 2) [2 puntos]
%% Solución:

% -------------------------------------------------------------------------
% PASOS PREVIOS
% -------------------------------------------------------------------------

% Convierte las funciones paramétricas con las que se define la 
% circunferencia a funciones numéricas:

x_circ_fun = matlabFunction(x_circ);
y_circ_fun = matlabFunction(y_circ);

% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA CURVA 1
% -------------------------------------------------------------------------

% Convierte la curva a función numérica:

curve_1_fun = matlabFunction(curve_1);

% Define la función que mide la diferencia vertical entre la curva y 
% la circunferencia:

intersect_fun = @(t) y_circ_fun(t) - curve_1_fun(x_circ_fun(t));

% Encuentra un valor de t donde se anulan, lo que quiere decir que hay una
% interesección:

t_intersect = fzero(intersect_fun, pi/2);

% Evalúa coordenadas del punto de intersección:

P1x = x_circ_fun(t_intersect);
P1y = y_circ_fun(t_intersect);

% Representación gráfica del punto de intersección:

plot(P1x, P1y, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');

% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA INVERSA DE LA CURVA 1
% -------------------------------------------------------------------------

% Convierte la curva a función numérica:

inv_curve_1_fun = matlabFunction(inv_curve_1);

% Define la función que mide la diferencia vertical entre la curva y 
% la circunferencia:

intersect_fun = @(t) y_circ_fun(t) - inv_curve_1_fun(x_circ_fun(t));

% Encuentra un valor de t donde se anulan, lo que quiere decir que hay una
% interesección:

t_intersect = fzero(intersect_fun, pi/2);

% Evalúa coordenadas del punto de intersección:

inv_P1x = x_circ_fun(t_intersect);
inv_P1y = y_circ_fun(t_intersect);

% Representación gráfica del punto de intersección:

plot(inv_P1x, inv_P1y, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');

% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA CURVA 2
% -------------------------------------------------------------------------

% Convierte la curva a función numérica:

curve_2_fun = matlabFunction(curve_2);

% Define la función que mide la diferencia vertical entre la curva y 
% la circunferencia:

intersect_fun = @(t) y_circ_fun(t) - curve_2_fun(x_circ_fun(t));

% Encuentra un valor de t donde se anulan, lo que quiere decir que hay una
% interesección:

t_intersect = fzero(intersect_fun, pi/2);

% Evalúa coordenadas del punto de intersección:

P2x = x_circ_fun(t_intersect);
P2y = y_circ_fun(t_intersect);

% Representación gráfica del punto de intersección:

plot(P2x, P2y, 'go', 'MarkerSize', 6, 'MarkerFaceColor', 'g');

% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA INVERSA DE LA CURVA 2
% -------------------------------------------------------------------------

% Convierte la curva a función numérica:

inv_curve_2_fun = matlabFunction(inv_curve_2);

% Define la función que mide la diferencia vertical entre la curva y 
% la circunferencia:

intersect_fun = @(t) y_circ_fun(t) - inv_curve_2_fun(x_circ_fun(t));

% Encuentra un valor de t donde se anulan, lo que quiere decir que hay una
% interesección:

t_intersect = fzero(intersect_fun, pi/2);

% Evalúa coordenadas del punto de intersección:

inv_P2x = x_circ_fun(t_intersect);
inv_P2y = y_circ_fun(t_intersect);

% Representación gráfica del punto de intersección:

plot(inv_P2x, inv_P2y, 'go', 'MarkerSize', 6, 'MarkerFaceColor', 'g');

% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA CURVA 3
% -------------------------------------------------------------------------

% Convierte la curva a función numérica también:

curve_3_fun = matlabFunction(curve_3);

% Define la función que mide la diferencia vertical entre la curva y 
% la circunferencia:

intersect_fun = @(t) y_circ_fun(t) - curve_3_fun(x_circ_fun(t));

% Encuentra un valor de t donde se anulan, lo que quiere decir que hay una
% interesección:

t_intersect = fzero(intersect_fun, pi/2);

% Evalúa coordenadas del punto de intersección:

P3x = x_circ_fun(t_intersect);
P3y = y_circ_fun(t_intersect);

% Representación gráfica del punto de intersección:

plot(P3x, P3y, 'bo', 'MarkerSize', 6, 'MarkerFaceColor', 'b');

% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA INVERSA DE LA CURVA 3
% -------------------------------------------------------------------------

% Convierte la curva a función numérica:

inv_curve_3_fun = matlabFunction(inv_curve_3);

% Define la función que mide la diferencia vertical entre la curva y 
% la circunferencia:

intersect_fun = @(t) y_circ_fun(t) - inv_curve_3_fun(x_circ_fun(t));

% Encuentra un valor de t donde se anulan, lo que quiere decir que hay una
% interesección:

t_intersect = fzero(intersect_fun, pi/2);

% Evalúa coordenadas del punto de intersección:

inv_P3x = x_circ_fun(t_intersect);
inv_P3y = y_circ_fun(t_intersect);

% Representación gráfica del punto de intersección:

plot(inv_P3x, inv_P3y, 'bo', 'MarkerSize', 6, 'MarkerFaceColor', 'b');

% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA CURVA 4
% -------------------------------------------------------------------------

% Convierte la curva a función numérica también:

curve_4_fun = matlabFunction(curve_4);

% Define la función que mide la diferencia vertical entre la curva y 
% la circunferencia:

intersect_fun = @(t) y_circ_fun(t) - curve_4_fun(x_circ_fun(t));

% Encuentra un valor de t donde se anulan, lo que quiere decir que hay una
% interesección:

t_intersect = fzero(intersect_fun, pi/2);

% Evalúa coordenadas del punto de intersección:

P4x = x_circ_fun(t_intersect);
P4y = y_circ_fun(t_intersect);

% Representación gráfica del punto de intersección:

plot(P4x, P4y, 'mo', 'MarkerSize', 6, 'MarkerFaceColor', 'm');

% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA INVERSA DE LA CURVA 4
% -------------------------------------------------------------------------

% Convierte la curva a función numérica:

inv_curve_4_fun = matlabFunction(inv_curve_4);

% Define la función que mide la diferencia vertical entre la curva y 
% la circunferencia:

intersect_fun = @(t) y_circ_fun(t) - inv_curve_4_fun(x_circ_fun(t));

% Encuentra un valor de t donde se anulan, lo que quiere decir que hay una
% interesección:

t_intersect = fzero(intersect_fun, pi/2);

% Evalúa coordenadas del punto de intersección:

inv_P4x = x_circ_fun(t_intersect);
inv_P4y = y_circ_fun(t_intersect);

% Representación gráfica del punto de intersección:

plot(inv_P4x, inv_P4y, 'mo', 'MarkerSize', 6, 'MarkerFaceColor', 'm');

%% 3) [5 puntos]
%% Solución:

% -------------------------------------------------------------------------
% PASOS PREVIOS
% -------------------------------------------------------------------------

% Declaración de las variables simbólicas:

syms s

% -------------------------------------------------------------------------
% RECORRIDO 1
% -------------------------------------------------------------------------

% Tramo 1: del punto START hasta el punto de intersección de la 
% circunferencia con la curva 2:

fplot(curve_1_fun, [starting_point, P1x], 'r', 'LineWidth', 2);
hold on

% Tramo 2: del punto de intersección de la circunferencia con la curva 1 
% al punto de intersección de la circunferencia con su inversa, siguiendo 
% el arco de la circunferencia:

% Calcula los ángulos de los dos puntos respecto al centro de la
% circunferencia:

angle1 = atan2(P1y - C2, P1x - C1);
angle2 = atan2(inv_P1y - C2, inv_P1x - C1);

% Asegura que el ángulo final sea mayor que el inicial:

if angle2 < angle1
    angle2 = angle2 + 2*pi;
end

% Define el arco de circunferencia entre ambos puntos:

t_vals = linspace(angle1, angle2, 100);
arc_x = C1 + R * cos(t_vals);
arc_y = C2 + R * sin(t_vals);

% Representación gráfica del arco:

plot(arc_x, arc_y, 'r', 'LineWidth', 2);
hold on

% Tramo 3: del punto de intersección de la circunferenica con la inversa 
% hasta el punto END, siguiendo la inversa:

fplot(inv_curve_1_fun, sort([inv_P1x, starting_point]), 'r', 'LineWidth', 2);
hold on

% -------------------------------------------------------------------------
% RECORRIDO 2
% -------------------------------------------------------------------------

% Tramo 1: del punto START hasta el punto de intersección de la 
% circunferencia con la curva 2:

fplot(curve_2_fun, [starting_point, P2x], 'g', 'LineWidth', 2);
hold on

% Tramo 2: del punto de intersección de la circunferencia con la curva 2 
% al punto de intersección de la circunferencia con su inversa, siguiendo 
% el arco de la circunferencia:

% Calcula los ángulos de los dos puntos respecto al centro de la
% circunferencia:

angle1 = atan2(P2y - C2, P2x - C1);
angle2 = atan2(inv_P2y - C2, inv_P2x - C1);

% Asegura que el ángulo final sea mayor que el inicial:

if angle2 < angle1
    angle2 = angle2 + 2*pi;
end

% Define el arco de circunferencia entre ambos puntos:

t_vals = linspace(angle1, angle2, 100);
arc_x = C1 + R * cos(t_vals);
arc_y = C2 + R * sin(t_vals);

% Representación gráfica del arco:

plot(arc_x, arc_y, 'g', 'LineWidth', 2);
hold on

% Tramo 3: del punto de intersección de la circunferenica con la inversa 
% hasta el punto END, siguiendo la inversa:

fplot(inv_curve_2_fun, sort([inv_P2x, starting_point]), 'g', 'LineWidth', 2);
hold on

% -------------------------------------------------------------------------
% RECORRIDO 3
% -------------------------------------------------------------------------

% Tramo 1: del punto START hasta el punto de intersección de la 
% circunferencia con la curva 3:

fplot(curve_3_fun, [starting_point, P3x], 'b', 'LineWidth', 2);
hold on

% Tramo 2: del punto de intersección de la circunferencia con la curva 3 
% al punto de intersección de la circunferencia con su inversa, siguiendo 
% el arco de la circunferencia:

% Calcula los ángulos de los dos puntos respecto al centro de la
% circunferencia:

angle1 = atan2(P3y - C2, P3x - C1);
angle2 = atan2(inv_P3y - C2, inv_P3x - C1);

% Asegura que el ángulo final sea mayor que el inicial:

if angle2 < angle1
    angle2 = angle2 + 2*pi;
end

% Define el arco de circunferencia entre ambos puntos:

t_vals = linspace(angle1, angle2, 100);
arc_x = C1 + R * cos(t_vals);
arc_y = C2 + R * sin(t_vals);

% Representación gráfica del arco:

plot(arc_x, arc_y, 'b', 'LineWidth', 2);
hold on

% Tramo 3: del punto de intersección de la circunferenica con la inversa 
% hasta el punto END, siguiendo la inversa:

fplot(inv_curve_3_fun, sort([inv_P3x, starting_point]), 'b', 'LineWidth', 2);
hold on

% -------------------------------------------------------------------------
% RECORRIDO 4
% -------------------------------------------------------------------------

% Tramo 1: del punto START hasta el punto de intersección de la 
% circunferencia con la curva 4:

fplot(curve_4_fun, [starting_point, P4x], 'm', 'LineWidth', 2);
hold on

% Tramo 2: del punto de intersección de la circunferencia con la curva 4 
% al punto de intersección de la circunferencia con su inversa, siguiendo 
% el arco de la circunferencia:

% Calcula los ángulos de los dos puntos respecto al centro de la
% circunferencia:

angle1 = atan2(P4y - C2, P4x - C1);
angle2 = atan2(inv_P4y - C2, inv_P4x - C1);

% Asegura que el ángulo final sea mayor que el inicial:

if angle2 < angle1
    angle2 = angle2 + 2*pi;
end

% Define el arco de circunferencia entre ambos puntos:

t_vals = linspace(angle1, angle2, 100);
arc_x = C1 + R * cos(t_vals);
arc_y = C2 + R * sin(t_vals);

% Representación gráfica del arco:

plot(arc_x, arc_y, 'm', 'LineWidth', 2);
hold on

% Tramo 3: del punto de intersección de la circunferenica con la inversa 
% hasta el punto END, siguiendo la inversa:

fplot(inv_curve_4_fun, sort([inv_P4x, starting_point]), 'm', 'LineWidth', 2);
hold on


%% NIVEL 2: [8 puntos]

%% 1) [2 puntos]
%% Solución:

% PARAMETROS PARA LAS DIMENSIONES DE LA IMAGEN 
a = 0; % Valor minimo eje X 
b = 900; % Valor maximo eje X (ancho)
c = 0; % Valor minimo eje Y 
d = 750; % Valor maximo eje Y (alto)

% DEFINICION DEL CONJUNTO DE PUNTOS PARA EL MAPA 2D
%figure
%imagesc([a b], [c d], flip(im,1));
%set(gca,'ydir','normal');

%axis off
%axis equal

%[x,y] = getpts;
%Nombre=[x,y];

%save('coordenadas.mat','Nombre') % Se asigna un nombre a la matriz de puntos
%save('Nombre') % Se guarda el fichero `Nombre.mat'


%% 2) [5 puntos]
%% Solución:

load('Nombre.mat', 'Nombre'); % Se cargan las coordenadas de la imagen

x = Nombre(:,1); 
y = Nombre(:,2);

% Asumimos que ya tienes una variable z asociada a cada (x, y)
% Por ejemplo, podrías obtener z a partir de intensidades de la imagen:
z = zeros(size(x));
for i = 1:length(x)
    col = round((x(i) - a) / (b - a) * size(im,2));
    row = round((d - y(i)) / (d - c) * size(im,1)); % inverso por flip
    z(i) = im(row, col);
end

% Ajustar z para que esté en un rango más representativo
z = z * 1500;  % Escalado para visualizar mejor

% Crear una malla regular
[Xq, Yq] = meshgrid(linspace(min(x), max(x), 100), linspace(min(y), max(y), 100));

% Interpolación cúbica
Zq = griddata(x, y, z, Xq, Yq, 'cubic');

% Gráfica
figure
subplot(1,2,1)
plot3(x, y, z, 'o', 'MarkerFaceColor', 'b')
title('Datos originales')
xlabel('x'); ylabel('y'); zlabel('z')
axis tight
grid on

subplot(1,2,2)
mesh(Xq, Yq, Zq)
title('Superficie interpolada')
xlabel('x'); ylabel('y'); zlabel('z')
axis tight
grid on

%% 3) [1 punto]
%% Solución:




%% NIVEL 3: [5 puntos]

%% Solución:

% -------------------------------------------------------------------------
% PASOS PREVIOS
% -------------------------------------------------------------------------

% Debemos calcular la puntuación de cada recorrido utilizando la fórmula proporcionada:

% SCORE=L+10×V, donde:
% L es la longitud del recorrido,
% V es la velocidad máxima alcanzada durante el recorrido.

% -------------------------------------------------------------------------
% Algunos datos requeridos ya han sido calculados en el nivel 1:
%Curvas y sus inversas: Se utilizan las funciones curve_1_fun, curve_2_fun, 
% curve_3_fun, curve_4_fun y sus inversas inv_curve_1_fun, inv_curve_2_fun, 
% inv_curve_3_fun, inv_curve_4_fun definidas en el Nivel 1.

%Puntos de intersección: Los puntos de intersección P1x, P1y, P2x, P2y, etc., 
% calculados en el Nivel 1 se utilizan para definir los tramos de los recorridos.

%Circunferencia: Las funciones x_circ_fun y y_circ_fun se utilizan para calcular los arcos de circunferencia.
% -------------------------------------------------------------------------


%Ahora bien, necesitamos definir las velocidades máximas para cada tipo de tramo (curva, arco, inversa). 
%Estas velocidades pueden ser constantes o variables según la pendiente del tramo:

% DEFINICION DE VELOCIDADES MAXIMAS
v_max_curve = 10; % Velocidad máxima en las curvas (m/s)
v_max_arc = 8; % Velocidad máxima en el arco de circunferencia (m/s)
v_max_inv_curve = 10; % Velocidad máxima en las inversas de las curvas (m/s)

% Despues, La función curve_length calcula la longitud de un tramo de 
% curva usando la integral de la raíz cuadrada de 1 + (dy/dx)^2:

%FUNCION PARA CALCULAR LA LONGITUD DE UN TRAMO DE CURVA:  
function L = curve_length(f, a, b)
    syms x
    df = diff(f, x);
    L = double(int(sqrt(1 + df^2), a, b));
end


%También necesitamos La función arc_length que calcula la longitud de un arco de circunferencia usando el radio y 
%los ángulos de los puntos de inicio y fin.

%FUNCION PARA CALCULAR LA LONGITUD DE UN ARCO DE CIRCUNFERENCIA:

function L = arc_length(C1, C2, R, angle1, angle2)
    L = R * abs(angle2 - angle1);
end


%CALCULO DE LA LONGITUD DE CADA RECORRIDO:
% Recorrido 1
L1_curve = curve_length(curve_1_fun, starting_point, P1x);
L1_arc = arc_length(C1, C2, R, atan2(P1y - C2, P1x - C1), atan2(inv_P1y - C2, inv_P1x - C1));
L1_inv_curve = curve_length(inv_curve_1_fun, inv_P1x, starting_point);
L1_total = L1_curve + L1_arc + L1_inv_curve;

% Recorrido 2
L2_curve = curve_length(curve_2_fun, starting_point, P2x);
L2_arc = arc_length(C1, C2, R, atan2(P2y - C2, P2x - C1), atan2(inv_P2y - C2, inv_P2x - C1));
L2_inv_curve = curve_length(inv_curve_2_fun, inv_P2x, starting_point);
L2_total = L2_curve + L2_arc + L2_inv_curve;

% Recorrido 3
L3_curve = curve_length(curve_3_fun, starting_point, P3x);
L3_arc = arc_length(C1, C2, R, atan2(P3y - C2, P3x - C1), atan2(inv_P3y - C2, inv_P3x - C1));
L3_inv_curve = curve_length(inv_curve_3_fun, inv_P3x, starting_point);
L3_total = L3_curve + L3_arc + L3_inv_curve;

% Recorrido 4
L4_curve = curve_length(curve_4_fun, starting_point, P4x);
L4_arc = arc_length(C1, C2, R, atan2(P4y - C2, P4x - C1), atan2(inv_P4y - C2, inv_P4x - C1));
L4_inv_curve = curve_length(inv_curve_4_fun, inv_P4x, starting_point);
L4_total = L4_curve + L4_arc + L4_inv_curve;

%Ahora calculamos la puntuación de cada recorrido siguiendo la formula del enunciado:

P1 = L1_total + 10 * v_max_curve;
P2 = L2_total + 10 * v_max_curve;
P3 = L3_total + 10 * v_max_curve;
P4 = L4_total + 10 * v_max_curve;


%Comparamos las puntuaciones de cada recorrido y se escoge la mayor (usando ~ para ignorar el valor máximo y solo obtener el índice):
[~, best_route] = max([P1, P2, P3, P4]);

%Mostramos la puntuación de cada recorrido (redondeando en dos decimales con el especificador de formato %.2f) , y cual es la más alta:
 
fprintf('Puntuación del Recorrido 1: %.2f\n', P1);
fprintf('Puntuación del Recorrido 2: %.2f\n', P2);
fprintf('Puntuación del Recorrido 3: %.2f\n', P3);
fprintf('Puntuación del Recorrido 4: %.2f\n', P4);
fprintf('El recorrido con la puntuación más alta es el Recorrido %d\n', best_route);




%% NIVEL 4 (Opcional): [3 puntos extra]

%% Solución:


