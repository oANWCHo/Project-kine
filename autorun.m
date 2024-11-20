R = 1;

% Set the model name
model = 'hand'; % Replace 'hand' with your Simulink model name

% Load the Simulink model (optional if already loaded)
load_system(model);

% Set simulation time to infinity (so it can run indefinitely)
set_param(model, 'StopTime', 'inf');

% Start the simulation
set_param(model, 'SimulationCommand', 'start');

% Wait for 1 seconds
pause(1);

% Stop the simulation
set_param(model, 'SimulationCommand', 'stop');

% Close the Simulink model (optional)
close_system(model, 0); % The '0' ensures unsaved changes are not discarded

disp('Simulation stopped after 10 seconds.');

R = 2;

load_system(model);

set_param(model, 'SimulationCommand', 'start');

pause(1);

set_param(model, 'SimulationCommand', 'stop');

disp('Simulation stopped after 0 seconds.');