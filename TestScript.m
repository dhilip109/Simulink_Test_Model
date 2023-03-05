function TestScript()

% Define the simulation time
simTime = 10;

% Load the Simulink model
open_system('simple_simulink_model.slx')

% Set the simulation parameters
set_param('simple_simulink_model', 'StopTime', num2str(simTime))

% Start the simulation
sim('simple_simulink_model')

% Plot the output
plot(scope.time, scope.signals.values)

% Save the plot
saveas(gcf, 'simple_simulink_model_plot.png')

% Close the Simulink model
close_system('simple_simulink_model')

end
