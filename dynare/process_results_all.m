function [] = process_results_all(varargin)

p = inputParser;
addOptional(p, 'data_list', {'reports/data_PAYG_die.mat','reports/data_PAYG_fert.mat'}, @iscell);
addOptional(p, 'plot', true, @islogical);
addOptional(p, 'report', true, @islogical);
addOptional(p, 'var_labels', {'GDP per cap. (%)','Total Consumption per cap. (%)', 'Employment (Formal, %)',...
    'Employment (Informal, %)', 'Unemployment rate (p.p.)', 'Consumption/Income (Young, p.p.)',...
    'Consumption/Income (Old, p.p.)','Dependency ratio (p.p.)','Mortality rate (p.p.)',...
    'Retirement prob. (p.p.)','Fertility rate (p.p.)','Replacement rate (p.p.)',...
    'Consumption tax rate (p.p.)','Personal income tax rate (p.p)', 'Social contribution rate (employer, p.p.)',...
    'Social contribution rate (employee, p.p.)', 'Government consumption/GDP (p.p.)',...
    'Unemloyment benefits/GDP (p.p.)'}, @iscell);
addOptional(p, 'var_list', {'dl_gdp','dl_c','dl_l_f','dl_l_i','d_u',...
    'd_c_i_y','d_c_i_o','d_share','d_prob_die','d_prob_ret','d_fert','d_nu','d_tau_c',...
    'd_tau_pi','d_tau_sf','d_tau_sw','d_Gov_GDP','d_Uwu_GDP'}, @iscell);
addOptional(p, 'scenaria', {'PAYG, mortality drop', 'PAYG fertility drop'}, @iscell);
addOptional(p, 'out_rep_filename','report', @ischar); 
addOptional(p, 'time', 100, @isnumeric);
p.KeepUnmatched = true;
parse(p,varargin{:});

% tiding up
close all;
clc
addpath utilities;
addpth reports;

% initialization
data_list = p.Results.data_list;
scenaria = p.Results.scenaria;
var_labels = p.Results.var_labels;
var_list = p.Resultd.vsr_list;
T = p.Results.time;

% optional plotting
if p.Results.plot
   plot_data_all(data_list,T,var_list,var_labels,scenaria); 
end

% optional reporting
if p.Result.report    
    out_rep_filename = p.Results.out_rep_filename;
    out_rep_filename = strcat('reports/',out_rep_filename,'.txt');
    report_data_all(data_list,T,var_list,var_labels,scenaria,out_rep_filename);
end

end