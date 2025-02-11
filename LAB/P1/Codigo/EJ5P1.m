
%Dar valores a la funcion
[X,Y] = meshgrid(-5:.05:5);
Z = Y * sin(pi*(X/10))+5*cos((X^2+Y^2)/8)+cos(X+Y)*cos(3*X-Y);

%Crear las gráficas
figure('Name', 'Grafica')
hold on
subplot(2,2,1:2)
surf(X,Y,Z)
title('surf')
xlabel('x')
ylabel('y')
zlabel('z')
subplot(2,2,3)
mesh(X,Y,Z)
title('mesh')
xlabel('x')
ylabel('y')
zlabel('z')
subplot(2,2,4)
contourf(X,Y,Z)
colorbar
title('contour')
xlabel('x')
ylabel('y')
zlabel('z')
hold off
