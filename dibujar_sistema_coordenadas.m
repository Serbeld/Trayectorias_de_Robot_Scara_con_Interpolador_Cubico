% Sistema de coordenadas

function dibujar_sistema_coordenadas(T,t,subindice)

    figure(4);
    a0 = [0;0;0;1];
    b0 = [t;0;0;1];
    c0 = [0;t;0;1];
    d0 = [0;0;t;1];

    a1= T*a0;
    b1= T*b0;
    c1= T*c0;
    d1= T*d0;

    rojo= [1 0 0];
    verde=[0 1 0];
    azul= [0 0 1];
    
    line( [a1(1) , b1(1)], [a1(2) , b1(2)], [a1(3) , b1(3)],'color',azul);
    line( [a1(1) , c1(1)], [a1(2) , c1(2)], [a1(3) , c1(3)],'color',rojo);
    line( [a1(1) , d1(1)], [a1(2) , d1(2)], [a1(3) , d1(3)],'color',verde);
    view(-6,80);
    
    text( b1(1),b1(2),b1(3),strcat('x',subindice) );
    text( c1(1),c1(2),c1(3),strcat('y',subindice) );
    text( d1(1),d1(2),d1(3),strcat('z',subindice) );
    
    xlabel('X'); % Etiqueta el eje x
    ylabel('Y'); % Etiqueta el eje y
    zlabel('Z'); % Etiqueta el eje z
    grid on % Activa la grilla
    
end