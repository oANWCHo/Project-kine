<<<<<<< Updated upstream
R = 3.25;
=======
Radius_C = 0.5;
Length_C = 1;
offset = 0;
>>>>>>> Stashed changes
model = 'hand';
buttonName = 'Push Button1';
blockPath = 'hand/To File';

<<<<<<< Updated upstream
while R < 5
     load_system(model);
     fileName = sprintf('sphere_%f.mat', R);
     set_param(blockPath, 'FileName', fileName);
     set_param(model, 'StopTime', '10');
     set_param(model, 'SimulationCommand', 'start');
     % set_param([model '/' buttonName], 'Value', '1');
=======
while Length_C < 4
     load_system(model);
     fileName = sprintf('Cylindical_L%f.mat', Length_C);
     set_param(blockPath, 'FileName', fileName);
     set_param(model, 'StopTime', '10');
     set_param(model, 'SimulationCommand', 'start');
>>>>>>> Stashed changes
     status = get_param(model, 'SimulationStatus');
     while ~strcmp(status, 'stopped')
         status = get_param(model, 'SimulationStatus');
         disp('Simulation has reached the stop time or stopped.');
         pause(1);
     end 
<<<<<<< Updated upstream
     % set_param([model '/' buttonName], 'Value', '0');
     set_param(model, 'SimulationCommand', 'stop');
     % close_system(model, 0);
     R = R + 0.05;
end
=======
     set_param(model, 'SimulationCommand', 'stop');
     Length_C = Length_C + 0.05;
end
>>>>>>> Stashed changes
