rosshutdown
controller_name = 'controlador_sugeno_obstaculos_angular.fis';
controller_name_lineal = 'controlador_sugeno_obstaculos_lineal.fis';

Ts=100e-3;
gain = 0.8;
offset_0 = -0.2;         %Sonar0-Sonar5
offset_1 = -0.22;        %Sonar1-Sonar7
offset_2 = -0.18;       %Sonar4-Sonar6
offset_obs1 = 1.82;     %Sonar2-Sonar3
offset_obs2 = -0.06;    %Sonar1-Sonar4
arround_th = 0.01;

saturation1_high = 1.27;
saturation1_low = -1.39;
saturation2_high = 4.53;
saturation2_low = -4.47;
saturation3_high = 3.31;
saturation3_low = -2.01;
saturation4_high = 2.37;
saturation4_low = -5;
saturation5_high = 4.71;
saturation5_low = -3.57;

saturation1_high_lineal = 1.11;
saturation1_low_lineal = -1.38;
saturation2_high_lineal = 4.25;
saturation2_low_lineal = -4.15;
saturation3_high_lineal = 3.30;
saturation3_low_lineal = -2;
saturation4_high_lineal = 2.31;
saturation4_low_lineal = -5;
saturation5_high_lineal = 4.57;
saturation5_low_lineal = -2.87;
% Ejecutar Simulacion
sim('controlador_sugeno_obstaculos_velocidad.slx')


%% Mostrar
out=post_format.signals.values;
velocidad_ = velocidad.signals.values;
x_ = x.signals.values;
y_ = y.signals.values;
figure("Name", "Angular Velocity");plot(out)
figure("Name", "Lineal Velocity");plot(velocidad_)
len = min(size(x_,1), size(y_,1));
figure("Name", "Trajectory");plot(x_(1:len),y_(1:len))

%% errors
e_sonar0_ = e_sonar0.signals.values;
e_sonar1_ = e_sonar1.signals.values;
e_sonar2_ = e_sonar2.signals.values;
e_sonar_obs0_ = e_sonar_obs0.signals.values;
e_sonar_obs1_ = e_sonar_obs1.signals.values;

figure("Name", "e_sonar0");plot(e_sonar0_);
figure("Name", "e_sonar1");plot(e_sonar1_);
figure("Name", "e_sonar2");plot(e_sonar2_);
figure("Name", "e_sonar_obs0");plot(e_sonar_obs0_);
figure("Name", "e_sonar_obs1");plot(e_sonar_obs1_);

%% Sonars

e_sonar0_ = e_sonar0.signals.values;
e_sonar1_ = e_sonar1.signals.values;
e_sonar2_ = e_sonar2.signals.values;
e_sonar_obs0_ = e_sonar_obs0.signals.values;
e_sonar_obs1_ = e_sonar_obs1.signals.values;
out_ = post_format.signals.values;
velocidad_ = velocidad.signals.values;

e_sonar0_(isinf(e_sonar0_)) = 5.0;
e_sonar1_(isinf(e_sonar1_)) = 5.0;
e_sonar2_(isinf(e_sonar2_)) = 5.0;
e_sonar_obs0_(isinf(e_sonar_obs0_)) = 5.0;
e_sonar_obs1_(isinf(e_sonar_obs1_)) = 5.0;

all_data = [e_sonar0_ e_sonar1_ e_sonar2_ e_sonar_obs0_ e_sonar_obs1_ velocidad_];
all_data = double(all_data);

save all_dataTrain2.dat all_data -ascii

