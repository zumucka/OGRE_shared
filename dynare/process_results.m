function [] = process_results(varargin)

p = inputParser;
addOptional(p, 'db_name', 'OGRE_permanent_results.mat', @ischar);
addOptional(p, 'out_rep_filename','PAYG_nu', @ischar); 
addOptional(p, 'plot', true, @islogical);
addOptional(p, 'report', true, @islogical);
addOptional(p, 'save_dbs', true, @islogical);
addOptional(p, 'scenario_name', 'PAYG, mortality decline', @ischar);
addOptional(p, 'sstate', true, @islogical);
addOptional(p, 'times', [20 100], @isnumeric);
addOptional(p, 'cut', 0, @isnumeric);
p.KeepUnmatched = true;
parse(p,varargin{:});

% tiding up
addpath utilities;
addpath reports;
close all;
global pension_system

% load stuff
load(p.Results.db_name,'oo_','M_');

% definitions
data_endo = oo_.endo_simul;
data_exo = oo_.exo_simul;
mLag = M_.maximum_endo_lag;
mLead = M_.maximum_endo_lead;
per_num = length(data_endo(1,:))-mLag-mLead;
names_endo = cellstr(M_.endo_names);
names_exo  = cellstr(M_.exo_names);    

% retrieve desired series
data = get_data(data_endo,names_endo,data_exo,names_exo,mLag,mLead,pension_system);
% save data
out_rep_filename = p.Results.out_rep_filename;
out_rep_filename = strcat('reports/data_',out_rep_filename, '.mat');
save(out_rep_filename, 'data');
    
t_rep = p.Results.times;
plot_vars = {'GDP','C','L','U','C_y','C_o','share','prob_die','prob_ret','fert','g','Labinc_y','Income_y','Income_o',...
    'Pen','tau_c','tau_pi','tau_sf','tau_sw','Gov_GDP','B_GDP','PB','Rev','Ex','I','Lump_GDP','z','r','w','pi'};

if pension_system
    plot_vars = {plot_vars,'d_nu'};
end

% plot series: short + long-run horizon (+whole time horizon for check)
if p.Results.plot
    cut = p.Results.cut;
    plot_data(data,per_num-cut,plot_vars,plot_vars);
end

% report tables: short vs. long-run impacts
report_vars = plot_vars;
report_labels = plot_vars;
if p.Results.report
    scen_name = p.Results.scenario_name;
    out_rep_filename = strcat('reports/',p.Results.out_rep_filename);
    cut = p.Results.cut;
    report_data(data,t_rep,report_vars, report_labels, ...
        strcat(out_rep_filename,'.txt'), scen_name,per_num-cut,strcat(out_rep_filename,'.xlsx'));
end

% saving dbs under different name
if p.Results.save_dbs    
    out_rep_filename = p.Results.out_rep_filename;
    out_rep_filename = strcat('reports/',out_rep_filename, '.mat');
    save(out_rep_filename, 'M_','oo_');
end

if p.Results.sstate
    load('results/workspace_ini', 'M_','oo_');
    s0 = process_sstate(M_,oo_);
    load('results/workspace_term', 'M_','oo_');
    s1 = process_sstate(M_,oo_);
    scen_name = p.Results.scenario_name;
    filename = strcat('reports/sstate_',p.Results.out_rep_filename,'.txt');
    varlist = plot_vars;
    if pension_system
        varlist = {varlist,'nu'};
    end
    compile_sstates(s0,s1,varlist,lablist,filename,scen_name);
end

end
