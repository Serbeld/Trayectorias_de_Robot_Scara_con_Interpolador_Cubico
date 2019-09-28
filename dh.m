
function MTH=denavit(theta, d ,a, alfa)

MTH=[cos(theta), -cos(alfa)*sin(theta),  sin(alfa)*sin(theta), a*cos(theta);
     sin(theta),  cos(alfa)*cos(theta), -sin(alfa)*cos(theta), a*sin(theta);
              0,             sin(alfa),             cos(alfa),            d;
              0,                     0,                     0,             1];
end
