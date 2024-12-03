    mR = 1.25;
L = R + 0.25;
model = 'hand';
% while R < 5
     load_system(model);
     set_param(model, 'StopTime', 'inf');
     set_param(model, 'SimulationCommand', 'start');
     while out.simout.Data(end,:) == 0
         disp("dwodowkd")
     end
     set_param(model, 'SimulationCommand', 'stop');
     close_system(model, 0);
     R = R + 0.01;
% end
