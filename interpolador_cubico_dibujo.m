% 1-b) Crear una función que dibuje la trayectoria definida por una serie splines, junto con los
% puntos de paso. Los parámetros de entrada son el vector que define el tiempo, el número de
% puntos a dibujar en cada intervalo, la posición deseada y opcionalmente la velocidad en los
% puntos de paso.

% ejemplo
%  t = [0, 3, 8, 12, 16, 22, 33];
%  q = [0, 4, 12, 12, 8, 20, 24];
%  qd = [0,-1, 3, 0, 3,-3, 0];
%  npuntos = 300;
%  trayectoria = interpolador_cubico_dibujo(t,npuntos,q,qp)

function trayectoria = interpolador_cubico_dibujo(t,npuntos,q,qd)
%npuntos=200;  %numero de puntos a pintar por intervalo
n=length(q);    % numero de intervalos
 
trayectoria = [];
clf
hold on
 
if nargin==2
P = interpolador_cubico(t,q,qd);
else
P = interpolador_cubico(t,q);
end
 
for intervalo=1:n-1
    ti =P(intervalo,1);
    tf =P(intervalo,2);
    a  =P(intervalo,3);
    b  =P(intervalo,4);
    c  =P(intervalo,5);
    d  =P(intervalo,6);
    
    inc=(tf-ti)/npuntos;
    for tt=ti:inc:tf
        qt=a+b*(tt-ti)+c*(tt-ti)^2+d*(tt-ti)^3; 
        qdt=b+2*c*(tt-ti)+3*d*(tt-ti)^2;
        qddt=2*c+6*d*(tt-ti);
        plot(tt,qt,'k');
        trayectoria=vertcat(trayectoria,[tt,qt,qdt,qddt]);
    end
   
end
plot(t,q,'--b');
grid
hold off
