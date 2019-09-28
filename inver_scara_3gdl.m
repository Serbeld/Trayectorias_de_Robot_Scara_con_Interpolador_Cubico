%CINEMATICA INVERSA ROBOT SCARA

function q =inver_scara_3gdl(P, CODO)

L1 = 135;
L2 = 280;
L3 = 250;
L4 = -200;
Px = P(1);
Py = P(2);
Pz = P(3);
M = sqrt(Px^2+Py^2);

if M > L2+L3 | M < L2-L3
    error('error en las dimenciones');
end
if Pz < -300 | Pz > 700
    error('error.... fuera del espacio de trabajo');
end

q(3)=L1+L4-Pz;
J = sqrt(Px^2+Py^2);
cos_q2 = (J^2-L2^2-L3^2)/(2*L2*L3);    
if cos_q2 > 1 & cos_q2 < 1.00001
    cos_q2 = 1;
end
if cos_q2 < -1 & cos_q2 > -1.00001
    cos_q2 = -1;
end
sen_q2 = CODO*sqrt(1-cos_q2^2);
q(2) = atan2(sen_q2,cos_q2);

q(1) = atan2(Py,Px)-atan2(L3*sen_q2, L2+L3*cos_q2);