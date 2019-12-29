
rosshutdown
controller_name = 'sugeno_controller.fis';
Ts=100e-3;
vel = 1;
gain = 1;
offset_0 = -0.2;         %Sonar0-Sonar5
offset_1 = -0.22;        %Sonar1-Sonar7
offset_2 =  -0.18;       %Sonar4-Sonar6
offset_obs1 =  1.82;     %Sonar2-Sonar3
offset_obs2 =  -0.06;    %Sonar1-Sonar4
arround_th = 0.01;

saturation1_high = 1.21;
saturation1_low = -1.39;
saturation2_high = 4.45;
saturation2_low = -4.17;
saturation3_high = 2.81;
saturation3_low = -2.61;
saturation4_high = 2.25;
saturation4_low = -5.19;
saturation5_high = 4.53;
saturation5_low = -1.91;

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

%% Sonars

e_sonar0_ = e_sonar0.signals.values;
e_sonar1_ = e_sonar1.signals.values;
e_sonar2_ = e_sonar2.signals.values;
e_sonar_obs0_ = e_sonar_obs0.signals.values;
e_sonar_obs1_ = e_sonar_obs1.signals.values;
out_ = post_format.signals.values;

e_sonar0_(isinf(e_sonar0_)) = 5.0;
e_sonar1_(isinf(e_sonar1_)) = 5.0;
e_sonar2_(isinf(e_sonar2_)) = 5.0;
e_sonar_obs0_(isinf(e_sonar_obs0_)) = 5.0;
e_sonar_obs1_(isinf(e_sonar_obs1_)) = 5.0;

all_data = [e_sonar0_ e_sonar1_ e_sonar2_ e_sonar_obs0_ e_sonar_obs1_ out_];
all_data = double(all_data);

%%

test = [];
train = [];
validation = [];
for i = 1:size(all_data, 1)
    mod_i = mod(i, 100);
    if mod_i < 70
        train = [train; all_data(i,:)];
    elseif mod_i < 85
        test = [test; all_data(i,:)];
    else
        validation = [validation; all_data(i,:)];
    end
end

%%
%save test test
%save train train
%save validation validation

all_data2 = all_data;
save all_data2
