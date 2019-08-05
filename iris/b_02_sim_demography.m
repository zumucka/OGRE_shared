%% cleanup
initialize;

%% setup
opt = [1];
antic = true;
infull = true;
per = 200;
shksize = 0.05*[1 1]; % in p.p.
pension_idx = 1;

global scenario_options scenario_idx scenario_vars scenario_shks
scenario_idx = opt;

%% load nonlinear model & parameters
pension_type = pension(pension_idx);
load(strcat('results/params_',char(pension_type),'.mat'), 'p');
p0 = p;
load(strcat('results/model_',char(pension_type),'.mat'), 'm');

%% simulation
sim = cell(numel(opt),1);
p_term = sim; p_init = sim;
for i=1:numel(opt)
    if opt(i)==2
        newval = p0.prob_ret*(1/(p0.share+shksize(i))+1)-p0.prob_die;
    else
        newval = p0.prob_ret*(1/(p0.share+shksize(i))+1)-p0.fert;
    end
    varname = scenario_vars{i};
    shkname = scenario_shks{i};
    exopaths = struct;
    exopaths.(varname) = newval+zeros(per,1);
    sim{i} = simulate_plan(m,per,{shkname},exopaths,infull,antic);    
    % load(strcat('results/params_',num2str(i),'_',char(pension_type),'.mat'), 'p');
    % p_term{i} = p;
    % p_init{i} = p0;
end

%% reporting
varlist = {'share','prob_die','prob_ret','fert','g','C','C_o','C_y','Labinc_y',...
    'Y','I','z','pi','w','L','U','r','Lump','Pen','B','GB','Rev','Exp','GDP'};
plot_results('data',sim,'label','permanent demography changes (path)','vars',varlist,...
    'legend',scenario_options);
