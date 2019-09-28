
% q = [0; 0; 0];
% dibujar_robot_scara_3gdl(q)
function robot=dibujar_robot_scara_3gdl(q)
load ('scara.mat');
%valores de los eslabones del robot SCARA
L1 = 320;
L2 = 260;
L3 = 200;

%Definici�n de los parametros DH
theta_dh = [ q(1) , q(2) , 0    ];
d_dh     = [ L1   , 0    , q(3) ];
a_dh     = [ L2   , L3   , 0    ];
alfa_dh  = [ 0    , -pi   , 0    ];

%Obtener la MTH
A01 = dh( theta_dh(1) , d_dh(1) , a_dh(1) , alfa_dh(1) );
A12 = dh( theta_dh(2) , d_dh(2) , a_dh(2) , alfa_dh(2) );
A23 = dh( theta_dh(3) , d_dh(3) , a_dh(3) , alfa_dh(3) );

A00 = eye(4) ;
A01 = A00*A01;
A02 = A01*A12;
A03 = A02*A23;

%dibujar los sistemas coordenados de las articulaciones de robot
t = 150;
figure(4);
dibujar_sistema_coordenadas(A00, t, '0');
dibujar_sistema_coordenadas(A01, t, '1');
dibujar_sistema_coordenadas(A02, t, '2');
dibujar_sistema_coordenadas(A03, t, '3');
view(-6,80);

dibujar_objeto_matlab_from_stl(scara.stl.eslabon0, A00, 0.4);
dibujar_objeto_matlab_from_stl(scara.stl.eslabon1, A01, 0.4);
dibujar_objeto_matlab_from_stl(scara.stl.eslabon2, A02, 0.4);
dibujar_objeto_matlab_from_stl(scara.stl.eslabon3, A03, 0.4);
axis([ -200, 600, -500, 300, -30, 600] );
view(-6,80);;, camlight(40,20);, lighting phong;
xlabel('x');, ylabel('y');, zlabel('z');, grid on

p0 = A00(1:3, 4);
p1 = A01(1:3, 4);
p2 = A02(1:3, 4);
p3 = A03(1:3, 4);

n0    = [p0(1), p0(2), p0(3)];
n1    = [p1(1), p1(2), p1(3)];
n_aux = [p0(1), p0(2), p1(3)];
n2    = [p2(1), p2(2), p2(3)];
n3    = [p3(1), p3(2), p3(3)];
hold on
color = [1, 0, 0];
tam = 2;

dibujar_linea( n0, n_aux);
dibujar_linea( n_aux, n1);
dibujar_linea( n1, n2);
dibujar_linea( n2, n3);
grid on;


grid on 
rotate3d 
robot.A01=A01; 
robot.A02=A02;
robot.A03=A03;
end





