clc
clear all

load("lowcycle_variables.mat")
a=Power(1:575);
b=Power1(1:575);
t=Time(1:575);

energy=zeros(576,1);
energy2=zeros(576,1);

%%
c=MeasuredRPM(1:575); % of the speed_controlled_drve
d=MeasuredRPM1(1:575); % torque_c_drive
e=RPMSetpoints(1:575); % sp send to the speed_c_drive

f=TorqueEst(1:575); % of the s_c_drive
g=TorquesEsts(1:575); % of the t_c_d
h=Torque_SP(1:575); % sp send to the torque_drive

power_cal=c.*f; %rpm times the torque in rev/min*newton*meter
power_cal=power_cal./9.5488; % needs to be converted like this 
power_cal2=d.*g;
power_cal2=power_cal2./9.5488; % Power(kW)=Torque(N.m)*speed(RPM)/9.5488

%%
for n=1:(length(a)-1)
    energy(n+1) = Power(n+1)+energy(n);
end

for n=1:(length(a)-1)
    energy2(n+1) = Power1(n+1)+energy2(n);
end

energy=energy./3.6; %kWseconds to kWh conversion
energy2=energy2./3.6;
energy(576)=[]; % discarding last element for easier graphing
energy2(576)=[];
%% Power Graph
figure
plot (t,a,'LineWidth',4);
set(gca,'FontSize',20)
grid on;
hold on;

plot (t,b,'LineWidth',4);
hold on;

xlabel('time(s)')
ylabel('Power(kW)')
legend('Speed Controlled Drive', 'Torque Controlled Drive')

%% Power Graph (1:100)
figure
plot (t(1:100),a(1:100),'LineWidth',4);
set(gca,'FontSize',20)
grid on;
hold on;

plot (t(1:100),b(1:100),'LineWidth',4);
hold on;

xlabel('time(s)')
ylabel('Power(kW)')
legend('Speed Controlled Drive', 'Torque Controlled Drive')

%% RPM Graph
figure
plot (t,e,'LineWidth',3.5);
hold on;
plot (t,c,'LineWidth',3.5);
grid on;
set(gca,'FontSize',20)
hold on;
plot (t,d,'LineWidth',3);
hold on;
xlabel('time(s)')
ylabel('RPM(rev/min)')
legend('Speed Controlled Drive', 'Torque Controlled Drive', 'Setpoints for the Speed Controlled Drive')
%% RPM Graph (1:100)
figure
plot (t(1:100),e(1:100),'LineWidth',3.5);
hold on;
plot (t(1:100),c(1:100),'LineWidth',3.5);
grid on;
set(gca,'FontSize',20)
hold on;
plot (t(1:100),d(1:100),'LineWidth',3.5);
hold on;
xlabel('time(s)')
ylabel('RPM(rev/min)')
legend('Speed Controlled Drive', 'Torque Controlled Drive', 'Setpoints for the Speed Controlled Drive')
%% Torque Graph
figure
plot (t,f,'LineWidth',3.5);
grid on;
set(gca,'FontSize',20)
hold on;
plot (t,g,'LineWidth',3.5);
hold on;
plot (t,h,'LineWidth',3.5);
hold on;
xlabel('time(s)')
ylabel('Torque(N.M)')
legend('Speed Controlled Drive', 'Torque Controlled Drive', 'Setpoints for the Speed Controlled Drive')
%% Torque Graph (1:100)
figure
plot (t(1:100),f(1:100),'LineWidth',3.5);
grid on;
set(gca,'FontSize',20)
hold on;
plot (t(1:100),g(1:100),'LineWidth',3.5);
hold on;
plot (t(1:100),h(1:100),'LineWidth',3.5);
hold on;
xlabel('time(s)')
ylabel('Torque(N.M)')
legend('Speed Controlled Drive', 'Torque Controlled Drive', 'Setpoints for the Speed Controlled Drive')
%% Energy Graph
%figure
%plot (t,energy);
%hold on;
%plot (t,energy2);
%hold on;
%xlabel('time(s)')
%ylabel('Energy(kWh)')
%legend('Speed Controlled Drive', 'Torque Controlled Drive')
