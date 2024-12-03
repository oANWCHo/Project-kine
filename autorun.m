R = 3.25;
Radius_C = 1;
% Length_C = 2.4;
Length_C = 4.05;
offset = 0;
model = 'hand';
buttonName = 'Push Button1';
blockPath = 'hand/To File';

% while R < 5
%      load_system(model);
%      fileName = sprintf('sphere_%f.mat', R);
%      set_param(blockPath, 'FileName', fileName);
%      set_param(model, 'StopTime', '10');
%      set_param(model, 'SimulationCommand', 'start');
%      % set_param([model '/' buttonName], 'Value', '1');

% while Radius_C < 4
while Length_C < 8
      load_system(model);
      % fileName = sprintf('Cylindical_R%f.mat', Radius_C);
      fileName = sprintf('Cylindical_R%f.mat', Length_C);
      set_param(blockPath, 'FileName', fileName);
      set_param(model, 'StopTime', '15');
      set_param(model, 'SimulationCommand', 'start');
 
     status = get_param(model, 'SimulationStatus');
     while ~strcmp(status, 'stopped')
         status = get_param(model, 'SimulationStatus');
         disp('Simulation has reached the stop time or stopped.');
         pause(1);
     end 
     % set_param([model '/' buttonName], 'Value', '0');
%      set_param(model, 'SimulationCommand', 'stop');
%      close_system(model, 0);
%      R = R + 0.05;
% end
      set_param(model, 'SimulationCommand', 'stop');
      % Radius_C = Radius_C + 0.05;
      Length_C = Length_C + 0.05;
end
