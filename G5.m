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

% (desarrollador 3)
% Nombre completo: Cristina 
% Apellidos completos: González de Lope

% (desarrollador 4)
% Nombre completo: Karina Diana
% Apellidos completos: Hincu

% (desarrollador 5)
% Nombre completo: Alexandra 
% Apellidos completos: Alina Pop 


%% Nivel 1 [12 puntos]
clear 
close all
clc 

%% 1) [5 puntos]
%% Solución:
im_ini=imread('GranCanaria2D.png'); % Se lee la imagen
im = im2double(im_ini); % Se convierte la imagen a tipo de datos "double". Convierte los valores de los píxeles de la imagen a un rango entre 0 y 1.


%% 2) [2 puntos]
%% Solución:
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


