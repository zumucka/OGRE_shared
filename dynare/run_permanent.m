%% initialisation
initialize;

global scenario pension_system use_ref sim_per ref_per
scenario = 0;
pension_system = 1;
use_ref = 1;
sim_per = 220;
ref_per = 50;

dep_ratio_increase = 0.05;  % demography
tax_rev_decrease = -0.01; % fiscal expansion
gov_decrease = -0.01; % fiscal contraction
replacement_rate_increase = 0.025; % generous pension system
retirement_increase = 0.004;

sys_list = {'FF','PAYG'};
var_list = {'prob_die','fert','prob_ret','tau_c_rev_GDP','tau_pi_rev_GDP',...
    'tau_sf_rev_GDP','tau_sw_rev_GDP','Gov_GDP','Uwu_GDP','nu','prob_ret'};
scen_list = {'mortality decline','fertility decline','probability of retirement increase',...
    'consumption tax rate cut','personal income tax rate cut', 'social contributions cut (employer)',...
    'social contributions cut (worker)', 'government consumption cut', 'higher unemployment benefits',...
    'replacement rate increase', 'probability of retirement increase'};
value_list = [dep_ratio_increase,dep_ratio_increase,dep_ratio_increase,...
    tax_rev_decrease,tax_rev_decrease, tax_rev_decrease,tax_rev_decrease,...
    gov_decrease,-gov_decrease,replacement_rate_increase,retirement_increase];
out_rep_filename = strcat(sys_list{pension_system+1},'_',var_list{scenario+1});
scenario_name = strcat(sys_list{pension_system+1}, ', ', scen_list{scenario+1});

%% file processing + generation
create_files(var_list, value_list);

%% dynare calculations
dynare OGRE_permanent

%% reporting, plotting
process_results('scenario_name',scenario_name,'out_rep_filename',out_rep_filename, ...
    'db_name', 'OGRE_permanent_results.mat','plot',true,'report',true,'sstate',false,'save_dbs',...
    true,'times', [20 100 200],'cut',20);