%%  Robot ABB 1100 4 580

%   Inicialización
clc; clear all; close all;

%%   Matrices de Denavit Hartenberg
syms l1 l2 l3 l4 q1 q2 q3 q4 q5 q6 pi

% Matrices Denavit Hartenberg (Simbólicas)

% DHC(alpha,a,theta,d)

S01 = DHC(0,0,q1,l1);
S12 = DHC(pi/2,0,(pi/2)+q2,0);
S23 = DHC(0,l2,q3,0);
S34 = DHC(pi/2,0,q4,l3);
S45 = DHC(-pi/2,0,q5,0);
S56 = DHC(pi/2,0,q6,0);
S67 = DHC(0,0,0,l4);


%%  Creación de la Cinemática Directa
%   Multiplicación sucesiva de todos los movimientos articulares
tic

CD = S01*S12*S23*S34*S45*S56*S67;
CDs = simplify(CD);

toc
%% Cinemática para Espacio de Trabajo 

x_et = CD(1,4);
y_et = CD(2,4);
z_et = CD(3,4);

%%  Cinemática Inversa
%   Variables cartesianas a partir de variables articulares

% Declaración de sistema cartesiano de la posición del efector final
syms xe ye ze alpha beta gamma

% Definición de Vector de Posición del Efector Final desde el Sistema Abs
P07 = transl(xe,ye,ze)*rotz(gamma)*roty(beta)*rotx(alpha);

% Solución Geométrica de Cinemática Directa
EQ = CD - P07;

%% Formación de Ecuaciones a partir de Submatrices
global EQ11 EQ12 EQ13 EQ14 EQ21 EQ22 EQ23 EQ24 EQ31 EQ32 EQ33 EQ34

% Ecuaciones de la Matriz de Transformación Homogenea 

% Submatriz de Rotación

EQ11 = EQ(1,1);
EQ12 = EQ(1,2);
EQ13 = EQ(1,3);

EQ21 = EQ(2,1);
EQ22 = EQ(2,2);
EQ23 = EQ(2,3);

EQ31 = EQ(3,1);
EQ32 = EQ(3,2);
EQ33 = EQ(3,3);

% Submatriz de Traslación

EQ14 = EQ(1,4);
EQ24 = EQ(2,4);
EQ34 = EQ(3,4);


%% Modelo Cinemático

% Vectores de Posición que se obtienen de la submatriz de Traslación

P01 = S01(1:3,4);
P12 = S12(1:3,4);
P23 = S23(1:3,4);
P34 = S34(1:3,4);
P45 = S45(1:3,4);
P56 = S56(1:3,4);
P67 = S67(1:3,4);

% Matrices de Rotación relativas  -> Indexado a la submatriz de Rotacion

R01 = S01(1:3,1:3);
R12 = S12(1:3,1:3);
R23 = S23(1:3,1:3);
R34 = S34(1:3,1:3);
R45 = S45(1:3,1:3);
R56 = S56(1:3,1:3);
R67 = S67(1:3,1:3);

%% Propagación de Velocidades

syms q1p q2p q3p q4p q5p q6p

Z = [0;0;1];

% Velocidad Lineal y Angular de 0 visto desde 0
v00 = [0;0;0];
w00 = [0;0;0];

% Velocidad Lineal y Angular de 1 vista desde 1
v11 = transpose(R01)*(v00+cross(w00,P01));
w11 = transpose(R01)*w00+q1p*Z;

% Velocidad Lineal y Angular de 2 vista desde 2
v22 = transpose(R12)*(v11+cross(w11,P12));
w22 = transpose(R12)*w11+q2p*Z;

% Velocidad Lineal y Angular de 3 vista desde 3
v33 = transpose(R23)*(v22+cross(w22,P23));
w33 = transpose(R23)*w22+q3p*Z;

% Velocidad Lineal y Angular de 4 vista desde 4
v44 = transpose(R34)*(v33+cross(w33,P34));
w44 = transpose(R34)*w33+q4p*Z;

% Velocidad Lineal y Angular de 5 vista desde 5
v55 = transpose(R45)*(v44+cross(w44,P45));
w55 = transpose(R45)*w44+q5p*Z;

% Velocidad Lineal y Angular de 6 vista desde 6
v66 = transpose(R56)*(v55+cross(w55,P56));
w66 = transpose(R56)*w55+q6p*Z;

% Velocidad Lineal y Angular de 7 vista desde 7
v77 = transpose(R67)*(v66+cross(w66,P67));
w77 = transpose(R67)*w66+0*Z;

%% Cálculo del Jacobiano Relativo (J77)
tic
% Diferencial 

J77 = [diff(v77(1),q1p) diff(v77(1),q2p) diff(v77(1),q3p) diff(v77(1),q4p) diff(v77(1),q5p) diff(v77(1),q6p);...
       diff(v77(2),q1p) diff(v77(2),q2p) diff(v77(2),q3p) diff(v77(2),q4p) diff(v77(2),q5p) diff(v77(2),q6p);...
       diff(v77(3),q1p) diff(v77(3),q2p) diff(v77(3),q3p) diff(v77(3),q4p) diff(v77(3),q5p) diff(v77(3),q6p);...
       diff(w77(1),q1p) diff(w77(1),q2p) diff(w77(1),q3p) diff(w77(1),q4p) diff(w77(1),q5p) diff(w77(1),q6p);...
       diff(w77(2),q1p) diff(w77(2),q2p) diff(w77(2),q3p) diff(w77(2),q4p) diff(w77(2),q5p) diff(w77(2),q6p);...
       diff(w77(3),q1p) diff(w77(3),q2p) diff(w77(3),q3p) diff(w77(3),q4p) diff(w77(3),q5p) diff(w77(3),q6p)]

J77s = simplify(J77)

toc
%% Velocidad Directa Relativa

qp = [q1p;q2p;q3p;q4p;q5p;q6p];

% Velocidad Relativa del Efector Final (7) vista desde si mismo (7)

x77p = J77*qp

%% Velocidad Inversa Relativa

% No se puede utilizar el Jacobiano Reducido porque si necesitamos la
% orientación y como tal el robot está diseñado para tener orientación en
% el efector final y manipular objetos de esa manera

tic
% Jacobiano Inverso

J77i = inv(J77)
J77is = simplify(J77i)

% Cinemática diferencial Inversa

q77p = J77i*x77p;

toc
%% Rango del Jacobiano

% Determinación de Ecuaciones Linearmente Independientes

rank(J77) 

%% Calculo del Determinante
tic

% Determinante del Jacobiano
DETJ77 = det(J77);

% Simplificación del Determinante del Jacobiano
DETJ77s = simplify(DETJ77)

toc
%% Cálculo de la Aceleración Cartesiana
tic

q = [q1;q2;q3;q4;q5;q6];

% Jacobiano de Aceleración

J77p = diff_matrix(J77,qp,q)

% Simplificación del Jacobiano de Aceleración
J77ps = simplify(J77p)

toc

%% Guardado de Resultados en Archivos de Texto
%{
save("ABB1100_CinematicaVariables","DETJ77","DETJ77s","CD","EQ","J77i","J77is","J77ps");

diary("ABB1100_J77i.txt")
J77i
diary off

diary("ABB1100_J77is.txt")
J77is
diary off

diary("ABB1100_J77p.txt")
J77p
diary off

diary("ABB1100_J77ps.txt")
J77ps
diary off
%}

%% Modelo Dinámico

% Aceleraciones Articulares
syms q1pp q2pp q3pp q4pp q5pp q6pp q7pp

% Masa de cuerpos del Robot
syms m1 m2 m3 m4 m5 m6 m7

% Inercia de cuerpos del Robot
syms Ixx1 Ixx2 Ixx3 Ixx4 Ixx5 Ixx6 Ixx7
syms Iyy1 Iyy2 Iyy3 Iyy4 Iyy5 Iyy6 Iyy7
syms Izz1 Izz2 Izz3 Izz4 Izz5 Izz6 Izz7

% Gravedad
syms g

% Matrices de Inercias

I1 = diag([Ixx1 Iyy1 Izz1]);
I2 = diag([Ixx2 Iyy2 Izz2]);
I3 = diag([Ixx3 Iyy3 Izz3]);
I4 = diag([Ixx4 Iyy4 Izz4]);
I5 = diag([Ixx5 Iyy5 Izz5]);
I6 = diag([Ixx6 Iyy6 Izz6]);
I7 = diag([Ixx7 Iyy6 Izz7]);

% Vectores de Posición a Centros de Masa

P01 = S01(1:3,4);
P12 = S12(1:3,4);
P23 = S23(1:3,4);
P34 = S34(1:3,4);
P45 = S45(1:3,4);
P56 = S56(1:3,4);
P67 = S67(1:3,4);

P01_cm = 