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
% PREPARACIÓN
% -------------------------------------------------------------------------

% Carga la imagen desde un archivo:

im_ini = imread('GranCanaria2D.png');

% Convierte la imagen a tipo de datos double, con los valores normalizados 
% entre 0 y 1:

im = im2double(im_ini);

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

% Representación gráfica de la inversa de la curva 1:

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
% PUNTO DE INTERSECCIÓN DE LA CURVA 1
% -------------------------------------------------------------------------



% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA INVERSA DE LA CURVA 1
% -------------------------------------------------------------------------



% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA CURVA 2
% -------------------------------------------------------------------------



% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA INVERSA DE LA CURVA 2
% -------------------------------------------------------------------------



% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA CURVA 3
% -------------------------------------------------------------------------



% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA INVERSA DE LA CURVA 3
% -------------------------------------------------------------------------



% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA CURVA 4
% -------------------------------------------------------------------------



% -------------------------------------------------------------------------
% PUNTO DE INTERSECCIÓN DE LA INVERSA DE LA CURVA 4
% -------------------------------------------------------------------------



%% 3) [5 puntos]
%% Solución:

%% NIVEL 2: [8 puntos]

%% 1) [2 puntos]
%% Solución:

% PARAMETROS PARA LAS DIMENSIONES DE LA IMAGEN 
a = 0; % Valor minimo eje X 
b = 380; % Valor maximo eje X (ancho)
c = 0; % Valor minimo eje Y 
d = 406; % Valor maximo eje Y (alto)

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

%% NIVEL 4 (Opcional): [3 puntos extra]

%% Solución:


