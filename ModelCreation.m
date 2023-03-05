function ModelCreation()

cd('C:\Work\1\MBD\chat_gpt\Simulink_Test_Model');

% Create a new Simulink model
model = new_system('MyModel_test');

% Open the Simulink model
open_system(model);

% Add a Constant block to the model
% constant_block = add_block('simulink/Sources/Constant', ...
%                            [model '/Constant']);
% 

constant_block = add_block('simulink/Sources/Constant', 'MyModel_test/MyConst' ,'MakeNameUnique', 'on');



% Set the Constant block's value to 1
set_param(constant_block, 'Value', '1');

% Add a Gain block to the model
% gain_block = add_block('simulink/Math Operations/Gain', ...
%                        [model '/Gain']);
gain_block = add_block('simulink/Math Operations/Gain','MyModel_test/Mygain');


% Set the Gain block's gain to 2
set_param(gain_block, 'Gain', '2');

% Add a Scope block to the model
scope_block = add_block('simulink/Sinks/Scope', 'MyModel_test/Myscope');

% Connect the Constant block to the Gain block
add_line(model, 'MyConst/1', 'Mygain/1');

% Connect the Gain block to the Scope block
add_line(model, 'Mygain/1', 'Myscope/1');

% Save the Simulink model
save_system(model);
end
