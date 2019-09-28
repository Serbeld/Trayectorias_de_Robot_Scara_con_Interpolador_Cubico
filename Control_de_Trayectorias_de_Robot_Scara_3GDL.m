% Autor: Sergio Luis Beleño Díaz
% 21 de Junio del 2019
% Robot Scara 3GDL dibujando SB

clear, clc, close all;

num_de_puntos = 2;

% Trayectorias punto a punto con puntos entre trayectoria
px = [linspace(250,150,num_de_puntos),       linspace(150,150,num_de_puntos), linspace(150,250,num_de_puntos) ,             linspace(250,250,num_de_puntos)  ,       linspace(250,150,num_de_puntos)  ,       linspace(150,300,num_de_puntos)  ,       linspace(300,300,num_de_puntos),   linspace(300,400,num_de_puntos), linspace(400,400,num_de_puntos),     linspace(400,300,num_de_puntos) , linspace(300,400,num_de_puntos)  , linspace(400,400,num_de_puntos),  linspace(400,300,num_de_puntos) ,  linspace(300,450,num_de_puntos)];
py = [linspace(100,100,num_de_puntos),       linspace(100,0,num_de_puntos)    , linspace(0,0,num_de_puntos),                linspace(0,-100,num_de_puntos),          linspace(-100,-100,num_de_puntos),       linspace(-100,-100,num_de_puntos),       linspace(-100,100,num_de_puntos),  linspace(100,100,num_de_puntos), linspace(100,0,num_de_puntos),       linspace(0,0,num_de_puntos)     , linspace(0,0,num_de_puntos)      , linspace(0,-100,num_de_puntos),   linspace(-100,-100,num_de_puntos), linspace(-100,-100,num_de_puntos)];
pz = [linspace(-100,-100,num_de_puntos),     linspace(-100,-100,num_de_puntos)    , linspace(-100,-100,num_de_puntos)     , linspace(-100,-100,num_de_puntos)      , linspace(-100,-100,num_de_puntos)      , linspace(-100,-100,num_de_puntos)      , linspace(-100,-100,num_de_puntos), linspace(-100,-100,num_de_puntos), linspace(-100,-100,num_de_puntos), linspace(-100,-100,num_de_puntos), linspace(-100,-100,num_de_puntos),linspace(-100,-100,num_de_puntos),linspace(-100,-100,num_de_puntos), linspace(-100,-100,num_de_puntos)];

% Muestrear la trayectoria obteniendo un Numero de puntos
npuntos=10;

% Tamaño del vector de Numero de puntos encontrados en X
n = length(px);

% Vector tiempo
t = 0:1:n-1;

% Cinematica inversa para obtener todos los movimientos articulares
for i=1:n
    q(i,:)= inver_scara_3gdl([px(i), py(i), pz(i)], 1);
    
end

% Movimiento articular 1
q1 =q(:, 1);
% Movimiento articular 2
q2 =q(:, 2);
% Movimiento articular 3
q3 =q(:, 3);

% Interpolador cubico 
figure(1);
trayectoria1 = interpolador_cubico_dibujo(t, npuntos, q1);title('Movimientos 1era Articulacion'); 
figure(2);
trayectoria2 = interpolador_cubico_dibujo(t, npuntos, q2);title('Movimientos 2da Articulacion'); 
figure(3);
trayectoria3 = interpolador_cubico_dibujo(t, npuntos, q3);title('Movimientos 3era Articulacion'); 

% Trayectoria en 1er articulacion
q1 = trayectoria1(:, 2);
% Trayectoria en 2da articulacion
q2 = trayectoria2(:, 2);
% Trayectoria en 3er articulacion
q3 = trayectoria3(:, 2);

% Matriz de trayectorias articulares
Ap(:, 1) = q1;
Ap(:, 2) = q2;
Ap(:, 3) = q3;

% Tamaño del vector de las trayectorias articulares
tp = length(q1);

% Figura de la animacion
f1 = figure(4);
% set(f1,'Color', [1, 1, 1]);
% writerObj = VideoWriter('SCARA con 10 Puntos');          
% writerObj.FrameRate = 120;                               
% open(writerObj);                                        
% mv = 2;

% Anima los movimientos articulares
for i=1:tp
    
    % clear axis
    cla;
    % Matriz de trayectorias articulares en q
    q= Ap(i, :);
    
    dibujar_robot_scara_3gdl(q);
    A00 = eye(4);
    
    A03 = directa_scara_3gdl(q);
    A=[1, 0, 0, 180; 
       0, 1, 0, 180; 
       0, 0, 1, 180; 
       0, 0, 0, 1];
   
    dibujar_sistema_coordenadas(A, 4, '1');
    
    hold on;
    
    tray(i, :) = A03(1:3, 4)';
    
    line(tray(:, 1),tray(:, 2), tray(:, 3),'Color','k','LineWidth', 3);
     
    pause(0.1);
     
    % Grafica los puntos
    for ah = 1:n
    plot3(px(ah), py(ah),pz(ah)+200,'.','LineWidth', 10)
    hold on;
    end
     
%      for nv = 1:mv                                       
%         frame = getframe(f1);                           
%         writeVideo(writerObj,frame);                    
%     end 
% end
% for nv = 1:30                                           
%     frame = getframe(f1);                               
%     writeVideo(writerObj, frame);                        
end       
% 
% % Termina el video
% close(writerObj); 

% imprime la letra real a que el robot SCARA debe seguir
figure(5)
title('Trayectoria');
grid on;
tray(i,:) = A03(1:3,4)';
line(tray(:,1),tray(:,2),tray(:,3),'Color','b','LineWidth',3);
hold on;
line(px,py,pz,'Color','m','LineWidth',2);

    
    