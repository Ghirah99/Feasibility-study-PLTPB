% Geothermal Power Plant Model
%add Folder Fucntion
addpath 'Function Economy'\

% Parameters
mass_flow_rate = 50; % kg/s, mass flow rate of geothermal fluid
specific_heat_capacity = 4200; % J/kg·K, specific heat capacity of geothermal fluid
temperature_drop = 50; % K, temperature drop of the geothermal fluid
turbine_efficiency = 0.85; % efficiency of the turbine
generator_efficiency = 0.95; % efficiency of the generator

% Heat Extracted
Q_in = mass_flow_rate * specific_heat_capacity * temperature_drop;

% Power Produced by Turbine
W_turbine = turbine_efficiency * Q_in;

% Electrical Power Output
W_electrical = generator_efficiency * W_turbine;

% Overall Efficiency
overall_efficiency = W_electrical / Q_in;

% Display Results
fprintf('Heat Extracted (Q_in): %.2f J\n', Q_in);
fprintf('Power Produced by Turbine (W_turbine): %.2f J\n', W_turbine);
fprintf('Electrical Power Output (W_electrical): %.2f J\n', W_electrical);
fprintf('Overall Efficiency (eta_overall): %.2f %%\n', overall_efficiency * 100);

% Mass and Energy Balance
mass_balance = mass_flow_rate; % Assuming steady state
energy_balance = Q_in - W_electrical; % Simplified energy balance

fprintf('Mass Balance: %.2f kg/s\n', mass_balance);
fprintf('Energy Balance (Q_loss): %.2f J\n', energy_balance);
