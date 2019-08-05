%% cleanup
initialize;

%% setup
opt = [1 2];
antic = true;
per = 300;
shksize = 0.05; % in p.p.
pension_idx = 1;

global scenario_idx scenario_options scenario_vars scenario_shks
% scenario_options = {'fertility_drop', 'mortality_increase'};
% scenario_vars = {'fert','prob_die'};
% scenario_shks = {'shk_fert','shk_prob_die'};
scenario_idx = opt;

%% load nonlinear models & parameters
pension_type = pension(pension_idx);
load(strcat('results/params_',char(pension_type),'.mat'), 'p');
load(strcat('results/model_',char(pension_type),'.mat'), 'm');
m_init = m;
p_init = p;

%% simulation
sim = cell(numel(opt),1);
for i=1:numel(opt)
    varname = scenario_vars{i};
    shkname = scenario_shks{i};
    load(strcat('results/params_',num2str(i),'_',char(pension_type),'.mat'), 'p');
    load(strcat('results/model_',num2str(i),'_',char(pension_type),'.mat'), 'm');
    m_term = m;
    p_term = p;
    exopaths = struct;
    exopaths.(varname) = p_term.(varname)+zeros(per,1);
    sim{i} = simulate_permanent(m_init,m_term,per,{shkname},exopaths,antic);
end

%% reporting
varlist = {'share','prob_die','prob_ret','fert','g','C','C_o','C_y','Labinc_y',...
    'Y','I','z','pi','w','L','U','r','Lump','Pen','B','GB','Rev','Exp','GDP'};
plot_results('data',sim,'label','permanent demography changes (sstate)','vars',varlist,'legend',scenario_options);
