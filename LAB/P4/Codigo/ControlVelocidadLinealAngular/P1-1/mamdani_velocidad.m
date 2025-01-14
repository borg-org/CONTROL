
rosshutdown
clear all
controller_name = 'controlador_mamdani_velocidad.fis';
Ts=100e-3;
offset_0 = -1.6000;
offset_1 = -0.1000;
offset_2 =  -0.2600;
arround_th = 0.01;

% Ejecutar Simulacion
sim('controlador_mamdani_sinobs_velocidad.slx') 


%% Mostrar
x_=x.signals.values;
y_=y.signals.values;
out_ = post_format.signals.values;
v_ = velocidad.signals.values; 

figure("Name", "Angular Velocity");plot(out_)
figure("Name", "Lineal Velocity");plot(v_)
len = min(size(x_,1), size(y_,1));
figure("Name", "Trajectory");plot(x_(1:len),y_(1:len))

%% errors
e_sonar0_ = e_sonar0.signals.values;
e_sonar1_ = e_sonar1.signals.values;
e_sonar2_ = e_sonar2.signals.values;

figure("Name", "e_sonar0");plot(e_sonar0_);
figure("Name", "e_sonar1");plot(e_sonar1_);
figure("Name", "e_sonar2");plot(e_sonar2_);


%% Sonars
e_sonar0_ = e_sonar0.signals.values;
e_sonar1_ = e_sonar1.signals.values;
e_sonar2_ = e_sonar2.signals.values;
out_ = post_format.signals.values;
velocidad_ = velocidad.signals.values;

e_sonar0_(isinf(e_sonar0_)) = 5.0;
e_sonar1_(isinf(e_sonar1_)) = 5.0;
e_sonar2_(isinf(e_sonar2_)) = 5.0;

train = [e_sonar0_ e_sonar1_ e_sonar2_ velocidad_];
train = double(train);

save trainVelocidad.dat train -ascii