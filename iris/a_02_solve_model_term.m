%% cleanup
initialize;

%% setup
pension_type = pension(1);
shksize = 0.05; % in p.p.
opt = 2;

global scenario_idx 
scenario_idx = opt;
if pension_type==pension.PAYG
    hCalcSState = @calculate_sstate_term_PAYG;
else
    hCalcSState = @calculate_sstate_term_FF;
end
settings.pension_system = char(pension_type);

%% the model
% model definition
model_file = 'model/model_main.model';
model_nonlin = model(model_file, 'linear', false, 'assign', settings);
fprintf('Nonlinear model created\n');

% steady state
load(strcat('results/params_',char(pension_type),'.mat'), 'p');
inputs = p;
try
    [sstate_params,flg] = hCalcSState(inputs,scenario_idx,shksize);
    assert(flg==1);
    fprintf('Steady state solution found.\n');
catch err
    fprintf('Steady state solution not found. Check model calibration and steady-state equations.\n');
    return;
end

params_nonlin = sstate_params+setparam_dynamic;
% check the model consistence
model_nonlin = assign(model_nonlin, params_nonlin);
[flag,list] = chksstate(model_nonlin, 'error', false);
if flag == 1
    disp('Computed steady state is consistent with the sticky price nonlinear model');    
else 
    disp('Computed steady state is not consistent with the sticky price nonlinear model');
    disp(list);
    return;
end

% solve the model
model_nonlin = solve(model_nonlin);

%% save nonlinear model & parameters
m = model_nonlin;
p = params_nonlin;
save(strcat('results/params_',num2str(scenario_idx),'_',char(pension_type),'.mat'), 'p');
save(strcat('results/model_',num2str(scenario_idx),'_',char(pension_type),'.mat'), 'm');

