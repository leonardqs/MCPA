global C

C.q_0 = 1.60217653e-19;             % electron charge
C.hb = 1.054571596e-34;             % Dirac constant
C.h = C.hb * 2 * pi;                % Planck constant
C.m_0 = 9.10938215e-31;             % electron mass
C.kb = 1.3806504e-23;               % Boltzmann constant
C.eps_0 = 8.854187817e-12;          % vacuum permittivity
C.mu_0 = 1.2566370614e-6;           % vacuum permeability
C.c = 299792458;                    % speed of light
C.g = 9.80665; %metres (32.1740 ft) per s²
    
set(0,'DefaultFigureWindowStyle','docked')
set(0,'defaultaxesfontsize',20)
set(0,'defaultaxesfontname','Times New Roman')
set(0,'DefaultLineLineWidth', 2);

%position_x = 0;
%velocity_v = 0;
m = 10;
n = 10;
nSims = 100;
t_step = 1e-3;
Electric_Field = 1;
initial_x = zeros;
initial_v = zeros;
prev_v = 0;
for n = 1: nSims
    random = rand();
    prev_v = initial_v;
    prev_x = initial_x;
    t = [n-1 n]*t_step;
    initial_v =  prev_v + ((C.q_0*Electric_Field)/C.m_0)*t_step;
    initial_x = initial_x+initial_v*t_step;
        if random <= 0.05
            initial_v = 0;
        end
    figure(1)
    subplot(311)
    plot(t,[prev_v initial_v],'r');
    hold on
    subplot(312)
    plot([prev_x initial_x],[prev_v initial_v],'b')
    hold on
    subplot(313)
    plot(t,[prev_x initial_x],'g');
    hold on
    pause(0.5)

end

