function Ecuaciones = ABB1100_CinematicaInversa(q)

% Definición de Posición y Rotación del Efector Final
global xe ye ze alpha beta gamma

% Definición Directa de Parámetros
    
% l1 = .327;
% l2 = .290;
% l3 = .300;
% l4 = .064;

ABB1100_Parametros

% Recuperación de valores de Articulaciones
q1 = q(1);
q2 = q(2);
q3 = q(3);
q4 = q(4);
q5 = q(5);
q6 = q(6);


% Submatriz de Rotación

EQ11 = sin(pi/2)*sin(q6)*(cos(pi/2)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*sin(pi/2)*sin(q1)) - sin(pi/2)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) - sin(pi/2)^2*cos(q4)*sin(q1))) - cos(beta)*cos(gamma) - cos(pi/2)*sin(q6)*(sin(q5)*(cos(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) - cos(pi/2)*sin(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + sin(pi/2)^2*sin(q1)*sin(q4)) + sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*sin(pi/2)*sin(q1)) + cos(pi/2)*cos(q5)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) - sin(pi/2)^2*cos(q4)*sin(q1))) - cos(q6)*(sin(pi/2)*sin(q5)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*sin(pi/2)*sin(q1)) - cos(q5)*(cos(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) - cos(pi/2)*sin(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + sin(pi/2)^2*sin(q1)*sin(q4)) + cos(pi/2)*sin(q5)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) - sin(pi/2)^2*cos(q4)*sin(q1)));
EQ12 = sin(q6)*(sin(pi/2)*sin(q5)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*sin(pi/2)*sin(q1)) - cos(q5)*(cos(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) - cos(pi/2)*sin(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + sin(pi/2)^2*sin(q1)*sin(q4)) + cos(pi/2)*sin(q5)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) - sin(pi/2)^2*cos(q4)*sin(q1))) + cos(alpha)*sin(gamma) - cos(pi/2)*cos(q6)*(sin(q5)*(cos(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) - cos(pi/2)*sin(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + sin(pi/2)^2*sin(q1)*sin(q4)) + sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*sin(pi/2)*sin(q1)) + cos(pi/2)*cos(q5)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) - sin(pi/2)^2*cos(q4)*sin(q1))) - cos(gamma)*sin(alpha)*sin(beta) + sin(pi/2)*cos(q6)*(cos(pi/2)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*sin(pi/2)*sin(q1)) - sin(pi/2)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) - sin(pi/2)^2*cos(q4)*sin(q1)));
EQ13 = sin(pi/2)*(sin(q5)*(cos(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) - cos(pi/2)*sin(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + sin(pi/2)^2*sin(q1)*sin(q4)) + sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*sin(pi/2)*sin(q1)) + cos(pi/2)*cos(q5)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) - sin(pi/2)^2*cos(q4)*sin(q1))) - sin(alpha)*sin(gamma) + cos(pi/2)*(cos(pi/2)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*sin(pi/2)*sin(q1)) - sin(pi/2)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) - sin(pi/2)^2*cos(q4)*sin(q1))) - cos(alpha)*cos(gamma)*sin(beta);

EQ21 = sin(pi/2)*sin(q6)*(cos(pi/2)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(pi/2)*sin(pi/2)*cos(q1)) - sin(pi/2)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*cos(q4))) - cos(q6)*(cos(q5)*(cos(pi/2)*sin(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*sin(q4)) + sin(pi/2)*sin(q5)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(pi/2)*sin(pi/2)*cos(q1)) + cos(pi/2)*sin(q5)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*cos(q4))) - cos(pi/2)*sin(q6)*(sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(pi/2)*sin(pi/2)*cos(q1)) - sin(q5)*(cos(pi/2)*sin(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*sin(q4)) + cos(pi/2)*cos(q5)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*cos(q4))) - cos(beta)*sin(gamma);
EQ22 = sin(q6)*(cos(q5)*(cos(pi/2)*sin(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*sin(q4)) + sin(pi/2)*sin(q5)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(pi/2)*sin(pi/2)*cos(q1)) + cos(pi/2)*sin(q5)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*cos(q4))) - cos(alpha)*cos(gamma) - cos(pi/2)*cos(q6)*(sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(pi/2)*sin(pi/2)*cos(q1)) - sin(q5)*(cos(pi/2)*sin(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*sin(q4)) + cos(pi/2)*cos(q5)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*cos(q4))) + sin(pi/2)*cos(q6)*(cos(pi/2)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(pi/2)*sin(pi/2)*cos(q1)) - sin(pi/2)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*cos(q4))) - sin(alpha)*sin(beta)*sin(gamma);
EQ23 = sin(pi/2)*(sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(pi/2)*sin(pi/2)*cos(q1)) - sin(q5)*(cos(pi/2)*sin(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*sin(q4)) + cos(pi/2)*cos(q5)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*cos(q4))) + cos(pi/2)*(cos(pi/2)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(pi/2)*sin(pi/2)*cos(q1)) - sin(pi/2)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*cos(q4))) + cos(gamma)*sin(alpha) - cos(alpha)*sin(beta)*sin(gamma);

EQ31 = sin(beta) + cos(q6)*(cos(q5)*(cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*sin(pi/2)*sin(q4) + cos(pi/2)*sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) + cos(pi/2)*sin(q5)*(cos(pi/2)*sin(pi/2)*cos(q4) - sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) + sin(pi/2)*sin(q5)*(sin(pi/2)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3)) - cos(pi/2)^2)) + sin(pi/2)*sin(q6)*(sin(pi/2)*(cos(pi/2)*sin(pi/2)*cos(q4) - sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) - cos(pi/2)*(sin(pi/2)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3)) - cos(pi/2)^2)) + cos(pi/2)*sin(q6)*(cos(pi/2)*cos(q5)*(cos(pi/2)*sin(pi/2)*cos(q4) - sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) - sin(q5)*(cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*sin(pi/2)*sin(q4) + cos(pi/2)*sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) + sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3)) - cos(pi/2)^2));
EQ32 = sin(pi/2)*cos(q6)*(sin(pi/2)*(cos(pi/2)*sin(pi/2)*cos(q4) - sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) - cos(pi/2)*(sin(pi/2)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3)) - cos(pi/2)^2)) - cos(beta)*sin(alpha) - sin(q6)*(cos(q5)*(cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*sin(pi/2)*sin(q4) + cos(pi/2)*sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) + cos(pi/2)*sin(q5)*(cos(pi/2)*sin(pi/2)*cos(q4) - sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) + sin(pi/2)*sin(q5)*(sin(pi/2)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3)) - cos(pi/2)^2)) + cos(pi/2)*cos(q6)*(cos(pi/2)*cos(q5)*(cos(pi/2)*sin(pi/2)*cos(q4) - sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) - sin(q5)*(cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*sin(pi/2)*sin(q4) + cos(pi/2)*sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) + sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3)) - cos(pi/2)^2));
EQ33 = cos(pi/2)*(sin(pi/2)*(cos(pi/2)*sin(pi/2)*cos(q4) - sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) - cos(pi/2)*(sin(pi/2)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3)) - cos(pi/2)^2)) - sin(pi/2)*(cos(pi/2)*cos(q5)*(cos(pi/2)*sin(pi/2)*cos(q4) - sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) - sin(q5)*(cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*sin(pi/2)*sin(q4) + cos(pi/2)*sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) + sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3)) - cos(pi/2)^2)) - cos(alpha)*cos(beta);

% Submatriz de Traslación
EQ14 = l4*(sin(pi/2)*(sin(q5)*(cos(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) - cos(pi/2)*sin(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + sin(pi/2)^2*sin(q1)*sin(q4)) + sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*sin(pi/2)*sin(q1)) + cos(pi/2)*cos(q5)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) - sin(pi/2)^2*cos(q4)*sin(q1))) + cos(pi/2)*(cos(pi/2)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*sin(pi/2)*sin(q1)) - sin(pi/2)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) - sin(pi/2)^2*cos(q4)*sin(q1)))) - xe + l2*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) + l3*sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + l3*cos(pi/2)*sin(pi/2)*sin(q1);
EQ24 = l4*(sin(pi/2)*(sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(pi/2)*sin(pi/2)*cos(q1)) - sin(q5)*(cos(pi/2)*sin(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*sin(q4)) + cos(pi/2)*cos(q5)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*cos(q4))) + cos(pi/2)*(cos(pi/2)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(pi/2)*sin(pi/2)*cos(q1)) - sin(pi/2)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*cos(q4)))) - ye + l2*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) + l3*sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - l3*cos(pi/2)*sin(pi/2)*cos(q1);
EQ34 = l1 - ze + l4*(cos(pi/2)*(sin(pi/2)*(cos(pi/2)*sin(pi/2)*cos(q4) - sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) - cos(pi/2)*(sin(pi/2)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3)) - cos(pi/2)^2)) - sin(pi/2)*(cos(pi/2)*cos(q5)*(cos(pi/2)*sin(pi/2)*cos(q4) - sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) - sin(q5)*(cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*sin(pi/2)*sin(q4) + cos(pi/2)*sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) + sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3)) - cos(pi/2)^2))) + l3*cos(pi/2)^2 + l2*sin(pi/2 + q2)*sin(pi/2) - l3*sin(pi/2)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3));

Ecuaciones = [EQ12;
                EQ22;
                    EQ33;
                        EQ14;
                            EQ24;
                                EQ34];
end