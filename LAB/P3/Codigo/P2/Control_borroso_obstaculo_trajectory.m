%Tiempo de muestreo
Ts=100e-3;
error_margin = 0;
w0 = 0;
x0 = -5;
y0 = 0;
x_0 = 0;
y_0 = y0;
th_0 = w0;

obsx=2;
obsy=1;

% Ejecutar Simulacion
fis_name = 'Control_borroso_rapido_obs_trayectoria.fis';

sim('PositionControl_trajectory_obs.slx') 
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
x_ref=x_out.signals.values;
y_ref=y_out.signals.values;

figure
hold on
axis([-10 10 -10 10])
plot(x,y, '-b')
plot(x_ref, y_ref, '-r')
plot(x_0,y_0, 'ob')
plot(x0,y0, 'or')
plot(obsx,obsy, 'og')
grid on
hold off
