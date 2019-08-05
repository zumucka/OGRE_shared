function [s] = get_data(data_endo,names_endo,~,~,mLag,mLead,pension_system)

s = struct;

%% Demography
s.share = data_endo(strcmp('share',names_endo),mLag+1:end-mLead);
s.d_share = s.share-s.share(1);
s.prob_die = data_endo(strcmp('prob_die',names_endo),mLag+1:end-mLead);
s.d_prob_die = s.prob_die-s.prob_die(1);
s.prob_ret = data_endo(strcmp('prob_ret',names_endo),mLag+1:end-mLead);
s.d_prob_ret = s.prob_ret-s.prob_ret(1);
s.fert = data_endo(strcmp('fert',names_endo),mLag+1:end-mLead);
s.d_fert = s.fert-s.fert(1);

%% Key Variables
% GDP per capita
s.GDP = data_endo(strcmp('GDP',names_endo),mLag+1:end-mLead);
s.dl_gdp = s.GDP./s.GDP(1)-1;
% Production per capita
s.Y = data_endo(strcmp('Y',names_endo),mLag+1:end-mLead);
s.dl_y = s.Y./s.Y(1)-1;
% total household consumption per capita
s.C = data_endo(strcmp('C',names_endo),mLag+1:end-mLead);
s.dl_c = s.C./s.C(1)-1;
% employment - formal
s.L_f = data_endo(strcmp('L_f',names_endo),mLag+1:end-mLead);
s.dl_l_f = s.L_f/s.L_f(1)-1;
% s.L_f_ratio = s.L_f./data_endo(strcmp('share_y',names_endo),mLag+1:end-mLead);
% employment - informal
s.L_i = data_endo(strcmp('L_i',names_endo),mLag+1:end-mLead);
s.dl_l_i = s.L_i/s.L_i(1)-1;
% s.L_i_ratio = s.L_i./data_endo(strcmp('share_y',names_endo),mLag+1:end-mLead);
% employment - total
s.L = s.L_f+s.L_i;
s.dl_l = s.L./s.L(1)-1;
% unemployment
s.U = data_endo(strcmp('U',names_endo),mLag+1:end-mLead);
% s.U_ratio = s.U./data_endo(strcmp('share_y',names_endo),mLag+1:end-mLead);
s.d_u = s.U-s.U(1);
% Consumption/Income ratio - young popoulation
C_yf = data_endo(strcmp('C_yf',names_endo),mLag+1:end-mLead);
C_yi = data_endo(strcmp('C_yi',names_endo),mLag+1:end-mLead);
pr_i = data_endo(strcmp('pr_i',names_endo),mLag+1:end-mLead);
C_y = C_yf+pr_i.*C_yi; % consumption of young per capita
Labinc_y = data_endo(strcmp('Labinc_y',names_endo),mLag+1:end-mLead);
Profinc_y = data_endo(strcmp('Profinc_y',names_endo),mLag+1:end-mLead);
SavInc_y = data_endo(strcmp('r',names_endo),mLag:end-mLead-1).*(1-s.prob_ret')./...
    (1+data_endo(strcmp('g',names_endo),mLag+1:end-mLead)).*...
    data_endo(strcmp('B_y',names_endo),mLag:end-mLead-1);
Income_y = Labinc_y+Profinc_y+SavInc_y;
s.C_I_y = C_y./Income_y;
s.d_c_i_y = s.C_I_y-s.C_I_y(1);
% Consumption/Income ratio - old popoulation
C_of = data_endo(strcmp('C_of',names_endo),mLag+1:end-mLead);
C_oi = data_endo(strcmp('C_oi',names_endo),mLag+1:end-mLead);
C_o = C_of+pr_i.*C_oi; % consumption of old per capita
Pen = data_endo(strcmp('Pen',names_endo),mLag+1:end-mLead);
Profinc_o = data_endo(strcmp('Inc_o',names_endo),mLag+1:end-mLead);
SavInc_o = data_endo(strcmp('r',names_endo),mLag:end-mLead-1)./...
    (1+data_endo(strcmp('g',names_endo),mLag+1:end-mLead)).*...
    (s.prob_ret'.*data_endo(strcmp('B_y',names_endo),mLag:end-mLead-1)+...
    data_endo(strcmp('B_o',names_endo),mLag:end-mLead-1));
Income_o = Pen+Profinc_o+SavInc_o;
s.C_I_o = C_o./Income_o;
s.d_c_i_o = s.C_I_o-s.C_I_o(1);

%% Fiscal
s.tau_c_rev_GDP = data_endo(strcmp('tau_c_rev_GDP',names_endo),mLag+1:end-mLead);
s.d_tau_c_rev_GDP = s.tau_c_rev_GDP-s.tau_c_rev_GDP(1);
s.tau_c = data_endo(strcmp('tau_c',names_endo),mLag+1:end-mLead);
s.d_tau_c = s.tau_c-s.tau_c(1);
s.tau_pi_rev_GDP = data_endo(strcmp('tau_pi_rev_GDP',names_endo),mLag+1:end-mLead);
s.d_tau_pi_rev_GDP = s.tau_pi_rev_GDP-s.tau_pi_rev_GDP(1);
s.tau_pi = data_endo(strcmp('tau_pi',names_endo),mLag+1:end-mLead);
s.d_tau_pi = s.tau_pi-s.tau_pi(1);
s.tau_sf_rev_GDP = data_endo(strcmp('tau_sf_rev_GDP',names_endo),mLag+1:end-mLead);
s.d_tau_sf_rev_GDP = s.tau_sf_rev_GDP-s.tau_sf_rev_GDP(1);
s.tau_sf = data_endo(strcmp('tau_sf',names_endo),mLag+1:end-mLead);
s.d_tau_sf = s.tau_sf-s.tau_sf(1);
s.tau_sw_rev_GDP = data_endo(strcmp('tau_sw_rev_GDP',names_endo),mLag+1:end-mLead);
s.d_tau_sw_rev_GDP = s.tau_sw_rev_GDP-s.tau_sw_rev_GDP(1);
s.tau_sw = data_endo(strcmp('tau_sw',names_endo),mLag+1:end-mLead);
s.d_tau_sw = s.tau_sw-s.tau_sw(1);
s.Gov_GDP = data_endo(strcmp('Gov_GDP',names_endo),mLag+1:end-mLead);
s.d_Gov_GDP = s.Gov_GDP-s.Gov_GDP(1);
s.Uwu_GDP = data_endo(strcmp('Uwu_GDP',names_endo),mLag+1:end-mLead);
s.d_Uwu_GDP = s.Uwu_GDP-s.Uwu_GDP(1);
if pension_system
    s.nu = data_endo(strcmp('nu',names_endo),mLag+1:end-mLead);
    s.d_nu = s.nu-s.nu(1);
end


end