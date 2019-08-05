%% cleanup
initialize;

%% setup
pension_type = pension(1);
load(strcat('results/params_',char(pension_type),'.mat'), 'p');
load(strcat('results/model_',char(pension_type),'.mat'), 'm');

%% test simulation
antic = true;
infull = true;
presample = 2;
per = 50;
shkname = 'shk_fert'; 
varname = 'fert';
shksize = 0.01; %pct
exopath = p.(varname)*(1+shksize)+zeros(per,1);
exopaths.(varname) = exopath;
sim_0 = simulate_simple_shock(m,per,shkname,shksize*p.(varname),infull,antic,presample);
sim_1 = simulate_plan(m,per,{shkname},exopaths,infull,antic);

%% reporting
varlist = {'share','prob_die','prob_ret','fert','g','C','C_o','C_y','Labinc_y',...
    'Y','I','z','pi','w','L','U','r','Lump','Pen','B','GB','Rev','Exp','GDP'};
plot_results('data',{sim_0,sim_1},'label',shkname,'vars',varlist,'legend',{'temp','perm'});