%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'OGRE_transitionpaths';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('OGRE_transitionpaths.log');
M_.exo_names = 'shk_prob_die';
M_.exo_names_tex = 'shk\_prob\_die';
M_.exo_names_long = 'shk_prob_die';
M_.exo_names = char(M_.exo_names, 'shk_prob_ret');
M_.exo_names_tex = char(M_.exo_names_tex, 'shk\_prob\_ret');
M_.exo_names_long = char(M_.exo_names_long, 'shk_prob_ret');
M_.exo_names = char(M_.exo_names, 'shk_fert');
M_.exo_names_tex = char(M_.exo_names_tex, 'shk\_fert');
M_.exo_names_long = char(M_.exo_names_long, 'shk_fert');
M_.exo_names = char(M_.exo_names, 'shk_a');
M_.exo_names_tex = char(M_.exo_names_tex, 'shk\_a');
M_.exo_names_long = char(M_.exo_names_long, 'shk_a');
M_.exo_names = char(M_.exo_names, 'shk_lump');
M_.exo_names_tex = char(M_.exo_names_tex, 'shk\_lump');
M_.exo_names_long = char(M_.exo_names_long, 'shk_lump');
M_.exo_names = char(M_.exo_names, 'shk_tau_pi');
M_.exo_names_tex = char(M_.exo_names_tex, 'shk\_tau\_pi');
M_.exo_names_long = char(M_.exo_names_long, 'shk_tau_pi');
M_.exo_names = char(M_.exo_names, 'shk_tau_sw');
M_.exo_names_tex = char(M_.exo_names_tex, 'shk\_tau\_sw');
M_.exo_names_long = char(M_.exo_names_long, 'shk_tau_sw');
M_.exo_names = char(M_.exo_names, 'shk_tau_sf');
M_.exo_names_tex = char(M_.exo_names_tex, 'shk\_tau\_sf');
M_.exo_names_long = char(M_.exo_names_long, 'shk_tau_sf');
M_.exo_names = char(M_.exo_names, 'shk_tau_c');
M_.exo_names_tex = char(M_.exo_names_tex, 'shk\_tau\_c');
M_.exo_names_long = char(M_.exo_names_long, 'shk_tau_c');
M_.exo_names = char(M_.exo_names, 'shk_uw_u');
M_.exo_names_tex = char(M_.exo_names_tex, 'shk\_uw\_u');
M_.exo_names_long = char(M_.exo_names_long, 'shk_uw_u');
M_.exo_names = char(M_.exo_names, 'shk_gov');
M_.exo_names_tex = char(M_.exo_names_tex, 'shk\_gov');
M_.exo_names_long = char(M_.exo_names_long, 'shk_gov');
M_.exo_names = char(M_.exo_names, 'shk_GB_tar');
M_.exo_names_tex = char(M_.exo_names_tex, 'shk\_GB\_tar');
M_.exo_names_long = char(M_.exo_names_long, 'shk_GB_tar');
M_.exo_names = char(M_.exo_names, 'shk_c');
M_.exo_names_tex = char(M_.exo_names_tex, 'shk\_c');
M_.exo_names_long = char(M_.exo_names_long, 'shk_c');
M_.exo_names = char(M_.exo_names, 'shk_i');
M_.exo_names_tex = char(M_.exo_names_tex, 'shk\_i');
M_.exo_names_long = char(M_.exo_names_long, 'shk_i');
M_.exo_names = char(M_.exo_names, 'shk_nu');
M_.exo_names_tex = char(M_.exo_names_tex, 'shk\_nu');
M_.exo_names_long = char(M_.exo_names_long, 'shk_nu');
M_.endo_names = 'share';
M_.endo_names_tex = 'share';
M_.endo_names_long = 'share';
M_.endo_names = char(M_.endo_names, 'share_y');
M_.endo_names_tex = char(M_.endo_names_tex, 'share\_y');
M_.endo_names_long = char(M_.endo_names_long, 'share_y');
M_.endo_names = char(M_.endo_names, 'prob_die');
M_.endo_names_tex = char(M_.endo_names_tex, 'prob\_die');
M_.endo_names_long = char(M_.endo_names_long, 'prob_die');
M_.endo_names = char(M_.endo_names, 'prob_ret');
M_.endo_names_tex = char(M_.endo_names_tex, 'prob\_ret');
M_.endo_names_long = char(M_.endo_names_long, 'prob_ret');
M_.endo_names = char(M_.endo_names, 'fert');
M_.endo_names_tex = char(M_.endo_names_tex, 'fert');
M_.endo_names_long = char(M_.endo_names_long, 'fert');
M_.endo_names = char(M_.endo_names, 'g_n');
M_.endo_names_tex = char(M_.endo_names_tex, 'g\_n');
M_.endo_names_long = char(M_.endo_names_long, 'g_n');
M_.endo_names = char(M_.endo_names, 'g_ny');
M_.endo_names_tex = char(M_.endo_names_tex, 'g\_ny');
M_.endo_names_long = char(M_.endo_names_long, 'g_ny');
M_.endo_names = char(M_.endo_names, 'g_no');
M_.endo_names_tex = char(M_.endo_names_tex, 'g\_no');
M_.endo_names_long = char(M_.endo_names_long, 'g_no');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'Omega_o');
M_.endo_names_tex = char(M_.endo_names_tex, 'Omega\_o');
M_.endo_names_long = char(M_.endo_names_long, 'Omega_o');
M_.endo_names = char(M_.endo_names, 'C');
M_.endo_names_tex = char(M_.endo_names_tex, 'C');
M_.endo_names_long = char(M_.endo_names_long, 'C');
M_.endo_names = char(M_.endo_names, 'C_o');
M_.endo_names_tex = char(M_.endo_names_tex, 'C\_o');
M_.endo_names_long = char(M_.endo_names_long, 'C_o');
M_.endo_names = char(M_.endo_names, 'Inc_o');
M_.endo_names_tex = char(M_.endo_names_tex, 'Inc\_o');
M_.endo_names_long = char(M_.endo_names_long, 'Inc_o');
M_.endo_names = char(M_.endo_names, 'PF_o');
M_.endo_names_tex = char(M_.endo_names_tex, 'PF\_o');
M_.endo_names_long = char(M_.endo_names_long, 'PF_o');
M_.endo_names = char(M_.endo_names, 'B_o');
M_.endo_names_tex = char(M_.endo_names_tex, 'B\_o');
M_.endo_names_long = char(M_.endo_names_long, 'B_o');
M_.endo_names = char(M_.endo_names, 'C_y');
M_.endo_names_tex = char(M_.endo_names_tex, 'C\_y');
M_.endo_names_long = char(M_.endo_names_long, 'C_y');
M_.endo_names = char(M_.endo_names, 'PF_y');
M_.endo_names_tex = char(M_.endo_names_tex, 'PF\_y');
M_.endo_names_long = char(M_.endo_names_long, 'PF_y');
M_.endo_names = char(M_.endo_names, 'B_y');
M_.endo_names_tex = char(M_.endo_names_tex, 'B\_y');
M_.endo_names_long = char(M_.endo_names_long, 'B_y');
M_.endo_names = char(M_.endo_names, 'Inc_y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Inc\_y');
M_.endo_names_long = char(M_.endo_names_long, 'Inc_y');
M_.endo_names = char(M_.endo_names, 'Labinc_y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Labinc\_y');
M_.endo_names_long = char(M_.endo_names_long, 'Labinc_y');
M_.endo_names = char(M_.endo_names, 'Profinc_y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Profinc\_y');
M_.endo_names_long = char(M_.endo_names_long, 'Profinc_y');
M_.endo_names = char(M_.endo_names, 'Peninc_y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Peninc\_y');
M_.endo_names_long = char(M_.endo_names_long, 'Peninc_y');
M_.endo_names = char(M_.endo_names, 'Lambda_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'Lambda\_t');
M_.endo_names_long = char(M_.endo_names_long, 'Lambda_t');
M_.endo_names = char(M_.endo_names, 'Lambda');
M_.endo_names_tex = char(M_.endo_names_tex, 'Lambda');
M_.endo_names_long = char(M_.endo_names_long, 'Lambda');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'g_a');
M_.endo_names_tex = char(M_.endo_names_tex, 'g\_a');
M_.endo_names_long = char(M_.endo_names_long, 'g_a');
M_.endo_names = char(M_.endo_names, 'Profit');
M_.endo_names_tex = char(M_.endo_names_tex, 'Profit');
M_.endo_names_long = char(M_.endo_names_long, 'Profit');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names_long = char(M_.endo_names_long, 'K');
M_.endo_names = char(M_.endo_names, 'mc');
M_.endo_names_tex = char(M_.endo_names_tex, 'mc');
M_.endo_names_long = char(M_.endo_names_long, 'mc');
M_.endo_names = char(M_.endo_names, 'q');
M_.endo_names_tex = char(M_.endo_names_tex, 'q');
M_.endo_names_long = char(M_.endo_names_long, 'q');
M_.endo_names = char(M_.endo_names, 'adj_pr');
M_.endo_names_tex = char(M_.endo_names_tex, 'adj\_pr');
M_.endo_names_long = char(M_.endo_names_long, 'adj_pr');
M_.endo_names = char(M_.endo_names, 'adj_pr_d');
M_.endo_names_tex = char(M_.endo_names_tex, 'adj\_pr\_d');
M_.endo_names_long = char(M_.endo_names_long, 'adj_pr_d');
M_.endo_names = char(M_.endo_names, 'adj_inv');
M_.endo_names_tex = char(M_.endo_names_tex, 'adj\_inv');
M_.endo_names_long = char(M_.endo_names_long, 'adj_inv');
M_.endo_names = char(M_.endo_names, 'adj_inv_d');
M_.endo_names_tex = char(M_.endo_names_tex, 'adj\_inv\_d');
M_.endo_names_long = char(M_.endo_names_long, 'adj_inv_d');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'L');
M_.endo_names_tex = char(M_.endo_names_tex, 'L');
M_.endo_names_long = char(M_.endo_names_long, 'L');
M_.endo_names = char(M_.endo_names, 'hc');
M_.endo_names_tex = char(M_.endo_names_tex, 'hc');
M_.endo_names_long = char(M_.endo_names_long, 'hc');
M_.endo_names = char(M_.endo_names, 'H');
M_.endo_names_tex = char(M_.endo_names_tex, 'H');
M_.endo_names_long = char(M_.endo_names_long, 'H');
M_.endo_names = char(M_.endo_names, 'prob_h');
M_.endo_names_tex = char(M_.endo_names_tex, 'prob\_h');
M_.endo_names_long = char(M_.endo_names_long, 'prob_h');
M_.endo_names = char(M_.endo_names, 'w_b_max');
M_.endo_names_tex = char(M_.endo_names_tex, 'w\_b\_max');
M_.endo_names_long = char(M_.endo_names_long, 'w_b_max');
M_.endo_names = char(M_.endo_names, 'U');
M_.endo_names_tex = char(M_.endo_names_tex, 'U');
M_.endo_names_long = char(M_.endo_names_long, 'U');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'tau_c');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau\_c');
M_.endo_names_long = char(M_.endo_names_long, 'tau_c');
M_.endo_names = char(M_.endo_names, 'tau_lw');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau\_lw');
M_.endo_names_long = char(M_.endo_names_long, 'tau_lw');
M_.endo_names = char(M_.endo_names, 'tau_sf');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau\_sf');
M_.endo_names_long = char(M_.endo_names_long, 'tau_sf');
M_.endo_names = char(M_.endo_names, 'tau_sw');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau\_sw');
M_.endo_names_long = char(M_.endo_names_long, 'tau_sw');
M_.endo_names = char(M_.endo_names, 'tau_pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau\_pi');
M_.endo_names_long = char(M_.endo_names_long, 'tau_pi');
M_.endo_names = char(M_.endo_names, 'tau_l');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau\_l');
M_.endo_names_long = char(M_.endo_names_long, 'tau_l');
M_.endo_names = char(M_.endo_names, 'w_u');
M_.endo_names_tex = char(M_.endo_names_tex, 'w\_u');
M_.endo_names_long = char(M_.endo_names_long, 'w_u');
M_.endo_names = char(M_.endo_names, 'Uw_u');
M_.endo_names_tex = char(M_.endo_names_tex, 'Uw\_u');
M_.endo_names_long = char(M_.endo_names_long, 'Uw_u');
M_.endo_names = char(M_.endo_names, 'Gov');
M_.endo_names_tex = char(M_.endo_names_tex, 'Gov');
M_.endo_names_long = char(M_.endo_names_long, 'Gov');
M_.endo_names = char(M_.endo_names, 'Lump');
M_.endo_names_tex = char(M_.endo_names_tex, 'Lump');
M_.endo_names_long = char(M_.endo_names_long, 'Lump');
M_.endo_names = char(M_.endo_names, 'Pen');
M_.endo_names_tex = char(M_.endo_names_tex, 'Pen');
M_.endo_names_long = char(M_.endo_names_long, 'Pen');
M_.endo_names = char(M_.endo_names, 'B');
M_.endo_names_tex = char(M_.endo_names_tex, 'B');
M_.endo_names_long = char(M_.endo_names_long, 'B');
M_.endo_names = char(M_.endo_names, 'B_pen');
M_.endo_names_tex = char(M_.endo_names_tex, 'B\_pen');
M_.endo_names_long = char(M_.endo_names_long, 'B_pen');
M_.endo_names = char(M_.endo_names, 'GDP');
M_.endo_names_tex = char(M_.endo_names_tex, 'GDP');
M_.endo_names_long = char(M_.endo_names_long, 'GDP');
M_.endo_names = char(M_.endo_names, 'PB');
M_.endo_names_tex = char(M_.endo_names_tex, 'PB');
M_.endo_names_long = char(M_.endo_names_long, 'PB');
M_.endo_names = char(M_.endo_names, 'GB');
M_.endo_names_tex = char(M_.endo_names_tex, 'GB');
M_.endo_names_long = char(M_.endo_names_long, 'GB');
M_.endo_names = char(M_.endo_names, 'GB_tar');
M_.endo_names_tex = char(M_.endo_names_tex, 'GB\_tar');
M_.endo_names_long = char(M_.endo_names_long, 'GB_tar');
M_.endo_names = char(M_.endo_names, 'Rev');
M_.endo_names_tex = char(M_.endo_names_tex, 'Rev');
M_.endo_names_long = char(M_.endo_names_long, 'Rev');
M_.endo_names = char(M_.endo_names, 'Ex');
M_.endo_names_tex = char(M_.endo_names_tex, 'Ex');
M_.endo_names_long = char(M_.endo_names_long, 'Ex');
M_.endo_names = char(M_.endo_names, 'tau_c_rev_GDP');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau\_c\_rev\_GDP');
M_.endo_names_long = char(M_.endo_names_long, 'tau_c_rev_GDP');
M_.endo_names = char(M_.endo_names, 'tau_pi_rev_GDP');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau\_pi\_rev\_GDP');
M_.endo_names_long = char(M_.endo_names_long, 'tau_pi_rev_GDP');
M_.endo_names = char(M_.endo_names, 'tau_sf_rev_GDP');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau\_sf\_rev\_GDP');
M_.endo_names_long = char(M_.endo_names_long, 'tau_sf_rev_GDP');
M_.endo_names = char(M_.endo_names, 'tau_sw_rev_GDP');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau\_sw\_rev\_GDP');
M_.endo_names_long = char(M_.endo_names_long, 'tau_sw_rev_GDP');
M_.endo_names = char(M_.endo_names, 'Gov_GDP');
M_.endo_names_tex = char(M_.endo_names_tex, 'Gov\_GDP');
M_.endo_names_long = char(M_.endo_names_long, 'Gov_GDP');
M_.endo_names = char(M_.endo_names, 'Uwu_GDP');
M_.endo_names_tex = char(M_.endo_names_tex, 'Uwu\_GDP');
M_.endo_names_long = char(M_.endo_names_long, 'Uwu_GDP');
M_.endo_names = char(M_.endo_names, 'B_GDP');
M_.endo_names_tex = char(M_.endo_names_tex, 'B\_GDP');
M_.endo_names_long = char(M_.endo_names_long, 'B_GDP');
M_.endo_names = char(M_.endo_names, 'Pen_PG');
M_.endo_names_tex = char(M_.endo_names_tex, 'Pen\_PG');
M_.endo_names_long = char(M_.endo_names_long, 'Pen_PG');
M_.endo_names = char(M_.endo_names, 'Pen_PG_yo');
M_.endo_names_tex = char(M_.endo_names_tex, 'Pen\_PG\_yo');
M_.endo_names_long = char(M_.endo_names_long, 'Pen_PG_yo');
M_.endo_names = char(M_.endo_names, 'IB');
M_.endo_names_tex = char(M_.endo_names_tex, 'IB');
M_.endo_names_long = char(M_.endo_names_long, 'IB');
M_.endo_names = char(M_.endo_names, 'nu');
M_.endo_names_tex = char(M_.endo_names_tex, 'nu');
M_.endo_names_long = char(M_.endo_names_long, 'nu');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_3_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_3\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_3_1');
M_.endo_partitions = struct();
M_.param_names = 'rho_prob_die';
M_.param_names_tex = 'rho\_prob\_die';
M_.param_names_long = 'rho_prob_die';
M_.param_names = char(M_.param_names, 'rho_prob_ret');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_prob\_ret');
M_.param_names_long = char(M_.param_names_long, 'rho_prob_ret');
M_.param_names = char(M_.param_names, 'rho_fert');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_fert');
M_.param_names_long = char(M_.param_names_long, 'rho_fert');
M_.param_names = char(M_.param_names, 'prob_ret_ss');
M_.param_names_tex = char(M_.param_names_tex, 'prob\_ret\_ss');
M_.param_names_long = char(M_.param_names_long, 'prob_ret_ss');
M_.param_names = char(M_.param_names, 'prob_die_ss');
M_.param_names_tex = char(M_.param_names_tex, 'prob\_die\_ss');
M_.param_names_long = char(M_.param_names_long, 'prob_die_ss');
M_.param_names = char(M_.param_names, 'fert_ss');
M_.param_names_tex = char(M_.param_names_tex, 'fert\_ss');
M_.param_names_long = char(M_.param_names_long, 'fert_ss');
M_.param_names = char(M_.param_names, 'betta');
M_.param_names_tex = char(M_.param_names_tex, 'betta');
M_.param_names_long = char(M_.param_names_long, 'betta');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'xi');
M_.param_names_tex = char(M_.param_names_tex, 'xi');
M_.param_names_long = char(M_.param_names_long, 'xi');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'phi_pr');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pr');
M_.param_names_long = char(M_.param_names_long, 'phi_pr');
M_.param_names = char(M_.param_names, 'phi_inv');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_inv');
M_.param_names_long = char(M_.param_names_long, 'phi_inv');
M_.param_names = char(M_.param_names, 'gamma_pr');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_pr');
M_.param_names_long = char(M_.param_names_long, 'gamma_pr');
M_.param_names = char(M_.param_names, 'prob_f');
M_.param_names_tex = char(M_.param_names_tex, 'prob\_f');
M_.param_names_long = char(M_.param_names_long, 'prob_f');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'g_a_ss');
M_.param_names_tex = char(M_.param_names_tex, 'g\_a\_ss');
M_.param_names_long = char(M_.param_names_long, 'g_a_ss');
M_.param_names = char(M_.param_names, 'markup');
M_.param_names_tex = char(M_.param_names_tex, 'markup');
M_.param_names_long = char(M_.param_names_long, 'markup');
M_.param_names = char(M_.param_names, 'a_ss');
M_.param_names_tex = char(M_.param_names_tex, 'a\_ss');
M_.param_names_long = char(M_.param_names_long, 'a_ss');
M_.param_names = char(M_.param_names, 'alpha_hc');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_hc');
M_.param_names_long = char(M_.param_names_long, 'alpha_hc');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names_long = char(M_.param_names_long, 'kappa');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'hc_w');
M_.param_names_tex = char(M_.param_names_tex, 'hc\_w');
M_.param_names_long = char(M_.param_names_long, 'hc_w');
M_.param_names = char(M_.param_names, 'rho_i');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_i');
M_.param_names_long = char(M_.param_names_long, 'rho_i');
M_.param_names = char(M_.param_names, 'phi_pi');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi');
M_.param_names_long = char(M_.param_names_long, 'phi_pi');
M_.param_names = char(M_.param_names, 'r_ss');
M_.param_names_tex = char(M_.param_names_tex, 'r\_ss');
M_.param_names_long = char(M_.param_names_long, 'r_ss');
M_.param_names = char(M_.param_names, 'eta_lump');
M_.param_names_tex = char(M_.param_names_tex, 'eta\_lump');
M_.param_names_long = char(M_.param_names_long, 'eta_lump');
M_.param_names = char(M_.param_names, 'rho_lump');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_lump');
M_.param_names_long = char(M_.param_names_long, 'rho_lump');
M_.param_names = char(M_.param_names, 'eta_tau_pi');
M_.param_names_tex = char(M_.param_names_tex, 'eta\_tau\_pi');
M_.param_names_long = char(M_.param_names_long, 'eta_tau_pi');
M_.param_names = char(M_.param_names, 'rho_tau_pi');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_tau\_pi');
M_.param_names_long = char(M_.param_names_long, 'rho_tau_pi');
M_.param_names = char(M_.param_names, 'eta_tau_c');
M_.param_names_tex = char(M_.param_names_tex, 'eta\_tau\_c');
M_.param_names_long = char(M_.param_names_long, 'eta_tau_c');
M_.param_names = char(M_.param_names, 'rho_tau_c');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_tau\_c');
M_.param_names_long = char(M_.param_names_long, 'rho_tau_c');
M_.param_names = char(M_.param_names, 'eta_tau_sw');
M_.param_names_tex = char(M_.param_names_tex, 'eta\_tau\_sw');
M_.param_names_long = char(M_.param_names_long, 'eta_tau_sw');
M_.param_names = char(M_.param_names, 'rho_tau_sw');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_tau\_sw');
M_.param_names_long = char(M_.param_names_long, 'rho_tau_sw');
M_.param_names = char(M_.param_names, 'eta_tau_sf');
M_.param_names_tex = char(M_.param_names_tex, 'eta\_tau\_sf');
M_.param_names_long = char(M_.param_names_long, 'eta_tau_sf');
M_.param_names = char(M_.param_names, 'rho_tau_sf');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_tau\_sf');
M_.param_names_long = char(M_.param_names_long, 'rho_tau_sf');
M_.param_names = char(M_.param_names, 'eta_gov');
M_.param_names_tex = char(M_.param_names_tex, 'eta\_gov');
M_.param_names_long = char(M_.param_names_long, 'eta_gov');
M_.param_names = char(M_.param_names, 'rho_gov');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_gov');
M_.param_names_long = char(M_.param_names_long, 'rho_gov');
M_.param_names = char(M_.param_names, 'eta_uw_u');
M_.param_names_tex = char(M_.param_names_tex, 'eta\_uw\_u');
M_.param_names_long = char(M_.param_names_long, 'eta_uw_u');
M_.param_names = char(M_.param_names, 'rho_uw_u');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_uw\_u');
M_.param_names_long = char(M_.param_names_long, 'rho_uw_u');
M_.param_names = char(M_.param_names, 'rho_GB_tar');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_GB\_tar');
M_.param_names_long = char(M_.param_names_long, 'rho_GB_tar');
M_.param_names = char(M_.param_names, 'tau_c_rev_GDP_ss');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_c\_rev\_GDP\_ss');
M_.param_names_long = char(M_.param_names_long, 'tau_c_rev_GDP_ss');
M_.param_names = char(M_.param_names, 'tau_pi_rev_GDP_ss');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_pi\_rev\_GDP\_ss');
M_.param_names_long = char(M_.param_names_long, 'tau_pi_rev_GDP_ss');
M_.param_names = char(M_.param_names, 'tau_sf_rev_GDP_ss');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_sf\_rev\_GDP\_ss');
M_.param_names_long = char(M_.param_names_long, 'tau_sf_rev_GDP_ss');
M_.param_names = char(M_.param_names, 'tau_sw_rev_GDP_ss');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_sw\_rev\_GDP\_ss');
M_.param_names_long = char(M_.param_names_long, 'tau_sw_rev_GDP_ss');
M_.param_names = char(M_.param_names, 'Gov_GDP_ss');
M_.param_names_tex = char(M_.param_names_tex, 'Gov\_GDP\_ss');
M_.param_names_long = char(M_.param_names_long, 'Gov_GDP_ss');
M_.param_names = char(M_.param_names, 'Uwu_GDP_ss');
M_.param_names_tex = char(M_.param_names_tex, 'Uwu\_GDP\_ss');
M_.param_names_long = char(M_.param_names_long, 'Uwu_GDP_ss');
M_.param_names = char(M_.param_names, 'B_GDP_ss');
M_.param_names_tex = char(M_.param_names_tex, 'B\_GDP\_ss');
M_.param_names_long = char(M_.param_names_long, 'B_GDP_ss');
M_.param_names = char(M_.param_names, 'GB_GDP_tar');
M_.param_names_tex = char(M_.param_names_tex, 'GB\_GDP\_tar');
M_.param_names_long = char(M_.param_names_long, 'GB_GDP_tar');
M_.param_names = char(M_.param_names, 'GB_tar_ss');
M_.param_names_tex = char(M_.param_names_tex, 'GB\_tar\_ss');
M_.param_names_long = char(M_.param_names_long, 'GB_tar_ss');
M_.param_names = char(M_.param_names, 'Lump_ss');
M_.param_names_tex = char(M_.param_names_tex, 'Lump\_ss');
M_.param_names_long = char(M_.param_names_long, 'Lump_ss');
M_.param_names = char(M_.param_names, 'tau_pi_ss');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_pi\_ss');
M_.param_names_long = char(M_.param_names_long, 'tau_pi_ss');
M_.param_names = char(M_.param_names, 'tau_sw_ss');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_sw\_ss');
M_.param_names_long = char(M_.param_names_long, 'tau_sw_ss');
M_.param_names = char(M_.param_names, 'tau_sf_ss');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_sf\_ss');
M_.param_names_long = char(M_.param_names_long, 'tau_sf_ss');
M_.param_names = char(M_.param_names, 'tau_c_ss');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_c\_ss');
M_.param_names_long = char(M_.param_names_long, 'tau_c_ss');
M_.param_names = char(M_.param_names, 'T');
M_.param_names_tex = char(M_.param_names_tex, 'T');
M_.param_names_long = char(M_.param_names_long, 'T');
M_.param_names = char(M_.param_names, 'rho_nu');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_nu');
M_.param_names_long = char(M_.param_names_long, 'rho_nu');
M_.param_names = char(M_.param_names, 'eta_nu');
M_.param_names_tex = char(M_.param_names_tex, 'eta\_nu');
M_.param_names_long = char(M_.param_names_long, 'eta_nu');
M_.param_names = char(M_.param_names, 'nu_ss');
M_.param_names_tex = char(M_.param_names_tex, 'nu\_ss');
M_.param_names_long = char(M_.param_names_long, 'nu_ss');
M_.param_names = char(M_.param_names, 'pension_system');
M_.param_names_tex = char(M_.param_names_tex, 'pension\_system');
M_.param_names_long = char(M_.param_names_long, 'pension_system');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 15;
M_.endo_nbr = 78;
M_.param_nbr = 61;
M_.orig_endo_nbr = 77;
M_.aux_vars(1).endo_index = 78;
M_.aux_vars(1).type = 1;
M_.aux_vars(1).orig_index = 4;
M_.aux_vars(1).orig_lead_lag = -1;
M_.Sigma_e = zeros(15, 15);
M_.Correlation_matrix = eye(15, 15);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('OGRE_transitionpaths_static');
erase_compiled_function('OGRE_transitionpaths_dynamic');
M_.orig_eq_nbr = 77;
M_.eq_nbr = 78;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 30 108;
 0 31 0;
 2 32 0;
 3 33 109;
 4 34 0;
 0 35 0;
 0 36 110;
 0 37 111;
 5 38 112;
 0 39 113;
 0 40 0;
 0 41 0;
 0 42 114;
 0 43 115;
 6 44 0;
 0 45 0;
 0 46 116;
 7 47 0;
 0 48 117;
 0 49 0;
 0 50 0;
 0 51 118;
 0 52 119;
 0 53 120;
 0 54 121;
 8 55 122;
 9 56 0;
 0 57 123;
 0 58 0;
 0 59 124;
 10 60 0;
 0 61 0;
 0 62 125;
 0 63 0;
 0 64 126;
 0 65 0;
 0 66 127;
 11 67 128;
 12 68 0;
 13 69 0;
 0 70 129;
 0 71 0;
 0 72 130;
 0 73 131;
 14 74 0;
 15 75 132;
 16 76 0;
 17 77 0;
 0 78 0;
 18 79 0;
 19 80 0;
 20 81 0;
 0 82 0;
 0 83 0;
 0 84 0;
 0 85 0;
 21 86 0;
 0 87 133;
 22 88 0;
 0 89 0;
 0 90 0;
 0 91 0;
 0 92 0;
 23 93 0;
 0 94 0;
 0 95 0;
 0 96 0;
 0 97 0;
 0 98 0;
 0 99 0;
 24 100 0;
 25 101 0;
 0 102 0;
 26 103 0;
 0 104 0;
 27 105 0;
 28 106 0;
 29 107 0;]';
M_.nstatic = 29;
M_.nfwrd   = 20;
M_.npred   = 23;
M_.nboth   = 6;
M_.nsfwrd   = 26;
M_.nspred   = 29;
M_.ndynamic   = 49;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:15];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(78, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(15, 1);
M_.params = NaN(61, 1);
M_.NNZDerivatives = [379; 0; -1];
M_.params( 4 ) = 0.015;
prob_ret_ss = M_.params( 4 );
M_.params( 5 ) = 0.05;
prob_die_ss = M_.params( 5 );
M_.params( 6 ) = 0.03;
fert_ss = M_.params( 6 );
M_.params( 18 ) = 0.015;
g_a_ss = M_.params( 18 );
M_.params( 11 ) = 0.1;
delta = M_.params( 11 );
M_.params( 17 ) = 0.3;
alpha = M_.params( 17 );
M_.params( 19 ) = 0.2;
markup = M_.params( 19 );
M_.params( 9 ) = 1;
xi = M_.params( 9 );
M_.params( 7 ) = 0.99;
betta = M_.params( 7 );
M_.params( 8 ) = 1;
gamma = M_.params( 8 );
M_.params( 43 ) = 0.07;
tau_c_rev_GDP_ss = M_.params( 43 );
M_.params( 44 ) = 0.05;
tau_pi_rev_GDP_ss = M_.params( 44 );
M_.params( 45 ) = 0.05;
tau_sf_rev_GDP_ss = M_.params( 45 );
M_.params( 46 ) = 0.03;
tau_sw_rev_GDP_ss = M_.params( 46 );
M_.params( 47 ) = 0.2;
Gov_GDP_ss = M_.params( 47 );
M_.params( 48 ) = 0.01;
Uwu_GDP_ss = M_.params( 48 );
M_.params( 49 ) = 0.6;
B_GDP_ss = M_.params( 49 );
M_.params( 50 ) = 0;
GB_GDP_tar = M_.params( 50 );
M_.params( 57 ) = 10;
T = M_.params( 57 );
M_.params( 60 ) = 0.85;
nu_ss = M_.params( 60 );
M_.params( 16 ) = 0.1;
prob_f = M_.params( 16 );
M_.params( 23 ) = 0.75;
sigma = M_.params( 23 );
M_.params( 21 ) = 0.5;
alpha_hc = M_.params( 21 );
M_.params( 24 ) = 0.25;
hc_w = M_.params( 24 );
M_.params( 1 ) = 0.95;
rho_prob_die = M_.params( 1 );
M_.params( 2 ) = 0.95;
rho_prob_ret = M_.params( 2 );
M_.params( 3 ) = 0.95;
rho_fert = M_.params( 3 );
M_.params( 12 ) = 0.8;
rho_a = M_.params( 12 );
M_.params( 14 ) = 2.5;
phi_inv = M_.params( 14 );
M_.params( 13 ) = 60;
phi_pr = M_.params( 13 );
M_.params( 15 ) = 0.75;
gamma_pr = M_.params( 15 );
M_.params( 25 ) = 0.5;
rho_i = M_.params( 25 );
M_.params( 26 ) = 2;
phi_pi = M_.params( 26 );
M_.params( 28 ) = 0;
eta_lump = M_.params( 28 );
M_.params( 29 ) = 0.9;
rho_lump = M_.params( 29 );
M_.params( 30 ) = 1;
eta_tau_pi = M_.params( 30 );
M_.params( 31 ) = 0.7;
rho_tau_pi = M_.params( 31 );
M_.params( 32 ) = 1;
eta_tau_c = M_.params( 32 );
M_.params( 33 ) = 0.7;
rho_tau_c = M_.params( 33 );
M_.params( 34 ) = 1;
eta_tau_sw = M_.params( 34 );
M_.params( 35 ) = 0.7;
rho_tau_sw = M_.params( 35 );
M_.params( 36 ) = 1;
eta_tau_sf = M_.params( 36 );
M_.params( 37 ) = 0.7;
rho_tau_sf = M_.params( 37 );
M_.params( 38 ) = 1;
eta_gov = M_.params( 38 );
M_.params( 39 ) = 0.5;
rho_gov = M_.params( 39 );
M_.params( 40 ) = 1;
eta_uw_u = M_.params( 40 );
M_.params( 41 ) = 0.5;
rho_uw_u = M_.params( 41 );
M_.params( 42 ) = 0.95;
rho_GB_tar = M_.params( 42 );
M_.params( 58 ) = 0.9;
rho_nu = M_.params( 58 );
M_.params( 59 ) = 1;
eta_nu = M_.params( 59 );
M_.params( 61 ) = 1;
pension_system = M_.params( 61 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 67 ) = 0.07;
oo_.steady_state( 68 ) = 0.05;
oo_.steady_state( 69 ) = 0.05;
oo_.steady_state( 70 ) = 0.03;
oo_.steady_state( 71 ) = 0.2;
oo_.steady_state( 72 ) = 0.01;
oo_.steady_state( 73 ) = 0.6;
oo_.steady_state( 77 ) = 0.85;
oo_.steady_state( 4 ) = 0.015;
oo_.steady_state( 3 ) = 0.05;
oo_.steady_state( 5 ) = 0.03;
oo_.steady_state(78)=oo_.steady_state(4);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
evalin('base','save results/workspace_ini oo_ M_ options_');
global oo_ x shk_file_name
%
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
oo_.steady_state( 67 ) = 0.0700;
oo_.steady_state( 68 ) = 0.0500;
oo_.steady_state( 69 ) = 0.0500;
oo_.steady_state( 70 ) = 0.0300;
oo_.steady_state( 71 ) = 0.2000;
oo_.steady_state( 72 ) = 0.0100;
oo_.steady_state( 73 ) = 0.6000;
oo_.steady_state( 77 ) = 0.8500;
oo_.steady_state( 4 ) = 0.0150;
oo_.steady_state( 3 ) = 0.0384;
oo_.steady_state( 5 ) = 0.0300;
oo_.steady_state(78)=oo_.steady_state(4);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
evalin('base','save results/workspace_term oo_ M_ options_');
load('setparam/shk_data_0.mat','x');
%
% SHOCKS instructions
%
M_.det_shocks = [];
M_.Sigma_e = zeros(15, 15);
M_.Correlation_matrix = eye(15, 15);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',1:50,'value',x) ];
M_.exo_det_length = 0;
M_.sigma_e_is_diagonal = 1;
options_.periods = 200;
perfect_foresight_setup;
perfect_foresight_solver;
save('OGRE_transitionpaths_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('OGRE_transitionpaths_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('OGRE_transitionpaths_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('OGRE_transitionpaths_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('OGRE_transitionpaths_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('OGRE_transitionpaths_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('OGRE_transitionpaths_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
disp('Note: 1 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
