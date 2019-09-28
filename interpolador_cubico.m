% 1-a) Crear una función que obtenga los coeficientes de interpolación mediantes spline
% cubicos correspondientes a los tramos de una trayectoria que pasa por un conjunto de n
% puntos.

% ejemplo1
% t = [0, 3, 8, 12, 16, 22, 33];
% q = [0, 4, 12, 12, 8, 20, 24];
% trayectoria = interpolador_cubico(t,q)

% ejemplo2
%  t = [0, 3, 8, 12, 16, 22, 33];
%  q = [0, 4, 12, 12, 8, 20, 24];
%  qd = [0,-1, 3, 0, 3,-3, 0];
%  trayectoria = interpolador_cubico(t,q,qd)


function trayectoria = interpolador_cubico(t,q,qd)

n=length(q);
if n~=length(t)
    error('ERROR en i_cubico: Las dimensiones de q y t deben ser iguales')
end
 
if nargin~= 3    
   qd(1)=0;
   qd(n)=0;
     for i=2:n-1
      if (sign(q(i)-q(i-1))==sign(q(i+1)-q(i)))...
              |q(i)==q(i+1)...
              |q(i-1)==q(i)
          qd(i)=0.5*((q(i+1)-q(i))/(t(i+1)-t(i))+ ...
         +(q(i)-q(i-1))/(t(i)-t(i-1)));
      else
          qd(i)=0;
      end
  end
end
    for i=1:n-1
        ti=t(i);
        tii=t(i+1);
        if tii<=ti
            error ('ERROR en i_cubico. Los tiempos deben estar ordenados: t(i) debe ser < t(i+1)')
        end
        T=tii-ti;
        TT(:,i)=[ti;tii];
        a(i)=q(i);
        b(i)=qd(i);
        c(i)= 3/T^2*(q(i+1)-q(i)) - 1/T  *(qd(i+1)+2*qd(i));
        d(i)=-2/T^3*(q(i+1)-q(i)) + 1/T^2*(qd(i+1)  +qd(i));
 
    end
     trayectoria=[TT;a; b; c; d]';
  
end 