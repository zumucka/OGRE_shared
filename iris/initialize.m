close all
clear all %#ok<CLALL>
clc

addpath data
addpath model
addpath reporting
addpath setparam
addpath simulate
addpath results
addpath utilities

global scenario_options scenario_idx scenario_vars scenario_shks
scenario_options = {'mortality_decrease','fertility_drop'};
scenario_vars = {'prob_die','fert'};
scenario_shks = {'shk_prob_die','shk_fert'};
scenario_idx = 1;
