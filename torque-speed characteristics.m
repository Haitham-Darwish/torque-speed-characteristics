clc;clear; close all;
% M-file: torque_speed_curve.m
% M-file create a plot of the torque-speed curve of the 
%   induction motor of Example 7-5. 
% First, initialize the values needed in this program.
r1 = 0.085;                 % Stator resistance
x1 = 0.196;                 % Stator reactance
r2 = 0.067;                 % Rotor resistance
x2 = 0.161;                 % Rotor reactance
xm = 6.65;                  % Magnetization branch reactance
v_phase = 440 / sqrt(3);    % Phase voltage
f=[15 25 50 65];             % frequency
n_sync = 60*f(3)/4;              % Synchronous speed (r/min)
w_sync = 2*pi*f(3)/4;             % Synchronous speed (rad/s)
% Calculate the Thevenin voltage and impedance from Equations
% 7-41a and 7-43.
v_th = v_phase * ( xm / sqrt(r1^2 + (x1 + xm)^2) );
z_th = ((j*xm) * (r1 + j*x1)) / (r1 + j*(x1 + xm));
r_th = real(z_th);
x_th = imag(z_th);
% Now calculate the torque-speed characteristic for many
% slips between 2 and -1.  Note that the s(51) slip value 
% is set to 0.001 instead of exactly 0 to avoid divide-
% by-zero problems.
s = (-50:1:100) / 50;           % Slip
s(51) = 0.001;
nm = (1 - s) * n_sync;       % Mechanical speed
% For the Rated value V=440
% Calculate torque for original rotor resistance, frequency and voltage 
t_ind2 = (3 * v_th^2 * r2 ./ s) ./ ...
            (w_sync * ((r_th + r2./s).^2 + (x_th + x2)^2) );
% Plot the torque-speed curve
plot(nm,t_ind2,'Color','k','LineWidth',2.0);
xlabel('\itn_{m}','Fontweight','Bold');
ylabel('\tau_{ind}','Fontweight','Bold');
title ('Induction Motor Torque-Speed Characteristic','Fontweight','Bold');
legend ('Rated conditions');
saveas(gcf, "Rated conditions.png")
grid on;
% Plot the torque with s
plot(s,t_ind2,'Color','k','LineWidth',2.0);
xlabel('s','Fontweight','Bold');
ylabel('\tau_{ind}','Fontweight','Bold');
title ('Induction Motor Torque-Speed Characteristic','Fontweight','Bold');
legend ('Rated conditions');
saveas(gcf, "Rated conditions2.png")
grid on;

%=====================%
%b) V = 0.8, 0.6 Vrated, 0.4 Vrated and 0.2 Vrated.
v_phase2 = (0.8:-0.2:0.2).*440 / sqrt(3); 
v_th2 = v_phase2 * ( xm / sqrt(r1^2 + (x1 + xm)^2) );

t_ind2 = (3 * v_th2'.^2 * r2 ./ s) ./ ...
            (w_sync * ((r_th + r2./s).^2 + (x_th + x2)^2) );
% Plot the torque-speed curve
  plot(nm,t_ind2,'LineWidth',2.0);
  hold on
  xlabel('\itn_{m}','Fontweight','Bold');
  ylabel('\tau_{ind}','Fontweight','Bold');
  title ('Induction Motor Torque-Speed Characteristic','Fontweight','Bold');
legend ('0.8*Vrated','0.6*Vrated', ...
          '0.4*Vrated', '0.2*Vrated');
hold off
saveas(gcf, "Voltage sweep.png")
grid on;
% Plot the torque with s
  plot(s,t_ind2,'LineWidth',2.0);
  hold on
  xlabel('s','Fontweight','Bold');
  ylabel('\tau_{ind}','Fontweight','Bold');
  title ('Induction Motor Torque-Speed Characteristic','Fontweight','Bold');
legend ('0.8*Vrated','0.6*Vrated', ...
          '0.4*Vrated', '0.2*Vrated');
hold off
saveas(gcf, "Voltage sweep2.png")
grid on;
 
%c) f = 15 Hz, 25 Hz, 50 Hz, and 65 Hz. 

n_sync2 = 60*f/4;              % Synchronous speed (r/min)
w_sync2 = 2*pi*f/4;             % Synchronous speed (rad/s)
for i=1:length(w_sync2)
  nm2 = (1 - s) * n_sync2(i);       % Mechanical speed

  t_ind2 = (3 * v_th^2 * r2 ./ s) ./ ...
              (w_sync2(i) * ((r_th + r2./s).^2 + (x_th + x2)^2) );
  % Plot the torque-speed curve
  plot(nm2,t_ind2,'LineWidth',2.0);
  xlabel('\itn_{m}','Fontweight','Bold');
  ylabel('\tau_{ind}','Fontweight','Bold');
  title ('Induction Motor Torque-Speed Characteristic','Fontweight','Bold');
  
  legend (strcat("Freq=",num2str(f(i))));
  grid on;
  saveas(gcf, strcat("Freq=",num2str(f(i)),".png"))
end

for i=1:length(w_sync2)
  t_ind2 = (3 * v_th^2 * r2 ./ s) ./ ...
              (w_sync2(i) * ((r_th + r2./s).^2 + (x_th + x2)^2) );
  
  % Plot the torque with s
  plot(s,t_ind2, 'LineWidth',2.0);
  xlabel('s','Fontweight','Bold');
  ylabel('\tau_{ind}','Fontweight','Bold');
  title ('Induction Motor Torque-Speed Characteristic','Fontweight','Bold');
  
  legend (strcat("Freq=",num2str(f(i))));
  grid on;
  saveas(gcf, strcat("Freq=",num2str(f(i)),"2.png"))
 end
 
%d) R1=2R1, R1=3R1 and R1=4R1.
r1 = [2 3 4].*0.085;                 % Stator resistance
% Calculate the Thevenin voltage and impedance from Equations
% 7-41a and 7-43.
v_th = v_phase * ( xm ./ sqrt(r1.^2 + (x1 + xm)^2) );
z_th = ((j*xm) * (r1 + j*x1)) ./ (r1 + j*(x1 + xm));
r_th = real(z_th);
x_th = imag(z_th);
t_ind2 = (3 * v_th'.^2 * r2 ./ s) ./ ...
            (w_sync * ((r_th' + r2./s).^2 + (x_th' + x2).^2) );
% Plot the torque-speed curve
plot(nm,t_ind2,'LineWidth',2.0);
xlabel('\itn_{m}','Fontweight','Bold');
ylabel('\tau_{ind}','Fontweight','Bold');
title ('Induction Motor Torque-Speed Characteristic','Fontweight','Bold');
legend ('2*R1','3*R1','4*R1');
saveas(gcf, "Resistance sweep.png")
grid on;

% Plot the torque with s
plot(s,t_ind2,'LineWidth',2.0);
xlabel('s','Fontweight','Bold');
ylabel('\tau_{ind}','Fontweight','Bold');
title ('Induction Motor Torque-Speed Characteristic','Fontweight','Bold');
legend ('2*R1','3*R1','4*R1');
saveas(gcf, "Resistance sweep2.png")
grid on;


% Another solution
%{
  r=repmat((3 * v_th'.^2 * (r2) ./ s)', 1, 1, 4);
  r2=repmat((w_sync' .* ((r_th + (r2)./s).^2 + (x_th + x2)^2) )', 1, 1, 5);
  r2=permute(r2,[1,3,2]);
  
  t_ind3 =  r./r2;
%}
