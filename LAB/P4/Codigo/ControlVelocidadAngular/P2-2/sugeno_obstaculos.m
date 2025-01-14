rosshutdown
controller_name = 'controlador_sugeno_obstaculos.fis';
Ts=100e-3;
vel = 1;
gain = 0.8;
offset_0 = -0.2;         %Sonar0-Sonar5
offset_1 = -0.22;        %Sonar1-Sonar7
offset_2 =  -0.18;       %Sonar4-Sonar6
offset_obs1 =  1.82;     %Sonar2-Sonar3
offset_obs2 =  -0.06;    %Sonar1-Sonar4
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

% Ejecutar Simulacion
sim('controlador_sugeno_obstaculos.slx')


%% Mostrar
out=post_format.signals.values;
x_ = x.signals.values;
y_ = y.signals.values;
figure("Name", "Angular Velocity");plot(out)
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

