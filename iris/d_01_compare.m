close all;

irisdatafile = 'iris_PAYG_1.mat';
dynaredatafile = 'data/dynare_PAYG_prob_die.mat';
load(irisdatafile);
load(dynaredatafile);

sim = cell(2,1);
sim{1} = s;
sim{2} = data;

varlist = {'GDP','C','L','U','C_y','C_o','prob_die','prob_ret','fert','share','g','Labinc_y','Income_y','Income_o',...
    'Pen','tau_c','tau_pi','tau_sf','tau_sw','B_GDP','PB','Rev','I','z','r','w','pi'};
plot_results('data',sim,'label','permanent mortality drop: IRIS vs. DYNARE','vars',varlist,...
    'legend',{'IRIS','DYNARE'},'tmax',200);
