clc
clear all
% Geothermal Power Plant Model
%add Folder Fucntion
addpath 'Function Economy'\
%% Data Baru
% Data sumur panas bumi (contoh data)
T_fluid_in = 250; % Suhu fluida masuk (°C)
T_fluid_out = 120; % Suhu fluida keluar (°C)
P_fluid = 20; % Tekanan fluida (bar)
m_dot = 100; % Laju aliran massa fluida (kg/s)

% Konstanta
cp = 4.18; % Panas jenis air (kJ/kg°C), asumsi air/saturasi
efficiency = 0.15; % Efisiensi pembangkit (%)

% Perhitungan daya termal
Q_dot = m_dot * cp * (T_fluid_in - T_fluid_out); % kW

% Perhitungan daya listrik (setelah efisiensi)
P_electric = Q_dot * efficiency; % kW

% Perhitungan energi listrik (kWh) dalam waktu tertentu
time_hours = 8760; % Waktu operasi (jam)
E_electric = P_electric * time_hours; % kWh

%% Parameters
% mass_flow_rate = 50; % kg/s, mass flow rate of geothermal fluid
% specific_heat_capacity = 4200; % J/kg·K, specific heat capacity of geothermal fluid
% temperature_drop = 50; % K, temperature drop of the geothermal fluid
% turbine_efficiency = 0.85; % efficiency of the turbine
% generator_efficiency = 0.95; % efficiency of the generator
% 
% % Heat Extracted
% Q_in = mass_flow_rate * specific_heat_capacity * temperature_drop;
% 
% % Power Produced by Turbine
% W_turbine = turbine_efficiency * Q_in;
% 
% % Electrical Power Output
% W_electrical = generator_efficiency * W_turbine;
% 
% % Overall Efficiency
% overall_efficiency = W_electrical / Q_in;
% % 
% % Display Results
% fprintf('Heat Extracted (Q_in): %.2f J\n', Q_in);
% fprintf('Power Produced by Turbine (W_turbine): %.2f J\n', W_turbine);
% fprintf('Electrical Power Output (W_electrical): %.2f J\n', W_electrical);
% fprintf('Overall Efficiency (eta_overall): %.2f %%\n', overall_efficiency * 100);
% 
% % Mass and Energy Balance
% mass_balance = mass_flow_rate; % Assuming steady state
% energy_balance = Q_in - W_electrical; % Simplified energy balance
% 
% fprintf('Mass Balance: %.2f kg/s\n', mass_balance);
% fprintf('Energy Balance (Q_loss): %.2f J\n', energy_balance);

%% Data Economy 

cashFlows = [124, 124, 109, 124, 124, 109, 124, 124, 109, 374];
discountRate = 0.1;
InvestasiAwal = 750;
Net = NPV(cashFlows, discountRate, InvestasiAwal); % Net Present Value
PIR = Net/InvestasiAwal;% Profitability Index Ratio (PIR)
internal = irr(cashFlows) ; % Internal Rate of return (IRR)
Tarif_Kwh_Pembangkit = 800 ;
Benefit = Tarif_Kwh_Pembangkit * E_electric;




 disp(['-------- Result Calculation ', 'Gheothermal Power Plant' ,' With Economic Feasibility Analysis', ' -------------']);
    display(['Heat Extracted             = ',num2str(Q_dot), ' kW']);
    display(['Electrical Power Output    = ',num2str(P_electric), ' kW']);
    display(['Energy Balance             = ',num2str(E_electric), ' kWh']);
 % display(['Heat Extracted             = ',num2str(Q_in), ' J']);
    % display(['Power Produced by Turbine  = ',num2str(W_turbine) ,' J'       ]);
    % display(['Electrical Power Output    = ',num2str(W_electrical)                     ]);
    % display(['Overall Efficiency         = ',num2str(overall_efficiency * 100),' %' ]);
    % display(['Mass Balance               = ',num2str(mass_flow_rate) ,' Kg/s'  ]);
    % display(['Energy Balance             = ',num2str(Q_in - W_electrical),' J']);

    disp('-------------- Economic Analysis -----------------');
    display(['discountRate               = ',num2str(discountRate)  ]);
    display(['Investment                 = ',num2str(InvestasiAwal)  ]);
    display(['Project life               = ',num2str(length(cashFlows)), ' years'  ]);
    display(['Benefit                    = ',num2str(Benefit),   ]);
    display(['NPV                        = ',num2str(Net)  ]);
    display(['IRR                        = ',num2str(internal)   ]);
    display(['PIR                        = ',num2str(PIR)  ]);
    % display(['DPIR                       = ',num2str(sum(BestSol.Emission))   ,unitEmission]);
    % display(['MARR                       = ',num2str(sum(BestSol.Emission))   ,unitEmission]);
    % display(['POT                        = ',num2str(sum(BestSol.Emission))   ,unitEmission]);
    % 
    % disp('----------------- Detail Power -------------------');
    % display(['Daya Beban                = ',num2str(Pd)                      ,unitPower   ]);
    % display(['Daya Loss                 = ',num2str(sum(BestSol.Loss))       ,unitPower   ]);
    % display(['Total Daya Loss + Beban   = ',num2str((Pd + sum(BestSol.Loss))),unitCurrency]);
    % display(['Total Terbangkitkan       = ',num2str(sum(BestSol.Position))   ,unitCurrency]);
    % display(['Total Daya Tak Terpenuhi  = ',num2str(BestSol.Excess)          ,unitPower   ]);
