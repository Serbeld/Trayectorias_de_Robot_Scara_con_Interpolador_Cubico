function A03 = directa_scara_3gdl(q)

%valores de los eslabones del robot SCARA
L1 = 135;
L2 = 280;
L3 = 250;


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
end






 




