% Sb
%
% Funcion que genera una sistema de coordenadalinea entre dos puntos 
% ejemplo: 
% 
% r=[1,2,3]
% p=[1,2,3]
% dibujar_linea(r,p);
function dibujar_linea( p0, p1)
% vectores que contienen las componentes de los puntos a dibujar
x = [ p0(1), p1(1)];
y = [ p0(2), p1(2)];
z = [ p0(3), p1(3)];
% Dibujo de las lineas
plot3(x,y,z,'b',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
