% dibujar_objeto_matlab_from_stl.m
% Esta funcion dibuja un objeto importado de STL segun la 
% la MTH A
% Ejemplo:
% clear, close all, clc
% objeto = fun_stl2matlab('fig3d1.stl', [1,0,0],0);
% A = [ 1,  0,          0,         30; ...
%       0,  cos(pi/6), -sin(pi/6), 20; ...
%       0,  sin(pi/6),  cos(pi/6), 50; ...
%       0,  0,          0,         1];
% dibujar_objeto_matlab_from_stl(objeto,A);
% view(40,20), camlight(40,20);, lighting phong;


function dibujar_objeto_matlab_from_stl(objeto,A,alfa)

for i=1:objeto.n_faces
    for j=1:3
        p = [ objeto.x(j,i); objeto.y(j,i); objeto.z(j,i); 1];
        pa = A*p;
        objeto_A.x(j,i) = pa(1);
        objeto_A.y(j,i) = pa(2);
        objeto_A.z(j,i) = pa(3);
    end  
end
p=patch(objeto_A.x,objeto_A.y,objeto_A.z,objeto.tcolor);
set(p, 'EdgeColor', 'none' );
set(p, 'FaceAlpha', alfa);