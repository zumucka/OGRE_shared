%% cleanup
initialize;

%% setup
opt = 1;
antic = true;
infull = true;
per = 220;
tmax = 200;
pension_idx = 1;
shkfilename = 'data/shk_data_0.mat';

global scenario_idx scenario_vars scenario_shks
scenario_idx = opt;

%% load nonlinear model & parameters
pension_type = pension(pension_idx);
load(strcat('results/params_',char(pension_type),'.mat'), 'p');
p0 = p;
load(strcat('results/model_',char(pension_type),'.mat'), 'm');

%% simulation
load(shkfilename);
if infull
    db = sstatedb(m,1:per);
else
    db = zerodb(m,1:per); %#ok<UNRCH>
end
shkname = scenario_shks{opt};
varname = scenario_vars{opt};
db.(shkname)(1:per) = x*p.(varname);
sim = simulate(m,db,1:per,'Anticipate',antic,'Deviations',~infull);

% add extra variables
SavInc_y = sim.r.*(1-sim.prob_ret)./(1+sim.g).*sim.B_y;
sim.Income_y = sim.Labinc_y+sim.Profinc_y+SavInc_y;
SavInc_o = sim.r./(1+sim.g).*(sim.prob_ret.*sim.B_y+sim.B_o);
sim.Income_o = sim.Pen+SavInc_o;
sim.B_GDP = sim.B./sim.GDP;

%% reporting
varlist = {'GDP','C','L','U','C_y','C_o','share','prob_die','prob_ret','fert','g','Labinc_y','Income_y','Income_o',...
    'Pen','tau_c','tau_pi','tau_sf','tau_sw','Gov','B_GDP','PB','Rev','Exp','I','Lump','z','r','w','pi'};
plot_results('data',{sim},'label','permanent demography changes (path)','vars',varlist,...
    'legend',{},'tmax',tmax);
report_results(sim,varlist,strcat('results/results_',char(pension_type),'_',num2str(opt),'.xlsx'),tmax,...
    strcat('results/iris_',char(pension_type),'_',num2str(opt),'.mat'));
