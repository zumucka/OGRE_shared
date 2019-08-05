function [s] = get_data(data_endo,names_endo,~,~,mLag,mLead,pension_system)

s = struct;
mLag = 0;
mLead = 0;

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
% growth
s.g = data_endo(strcmp('g',names_endo),mLag+1:end-mLead);
s.g_a = data_endo(strcmp('g_a',names_endo),mLag+1:end-mLead);
s.g_n = data_endo(strcmp('g_n',names_endo),mLag+1:end-mLead);
% GDP per capita
s.GDP = data_endo(strcmp('GDP',names_endo),mLag+1:end-mLead);
s.dl_gdp = s.GDP./s.GDP(1)-1;
% Production per capita
s.Y = data_endo(strcmp('Y',names_endo),mLag+1:end-mLead);
s.dl_y = s.Y./s.Y(1)-1;
% total household consumption per capita
s.C = data_endo(strcmp('C',names_endo),mLag+1:end-mLead);
s.dl_c = s.C./s.C(1)-1;
% employment
s.L = data_endo(strcmp('L',names_endo),mLag+1:end-mLead);
s.dl_l = s.L/s.L(1)-1;
% unemployment
s.U = data_endo(strcmp('U',names_endo),mLag+1:end-mLead);
% s.U_ratio = s.U./data_endo(strcmp('share_y',names_endo),mLag+1:end-mLead);
s.d_u = s.U-s.U(1);
% real variables
s.mc = data_endo(strcmp('mc',names_endo),mLag+1:end-mLead);
s.r = data_endo(strcmp('r',names_endo),mLag+1:end-mLead);
s.z = data_endo(strcmp('z',names_endo),mLag+1:end-mLead);
s.w = data_endo(strcmp('w',names_endo),mLag+1:end-mLead);
s.pi = data_endo(strcmp('pi',names_endo),mLag+1:end-mLead);
% Consumption/Income ratio - young popoulation
C_y = data_endo(strcmp('C_y',names_endo),mLag+1:end-mLead);
s.Labinc_y = data_endo(strcmp('Labinc_y',names_endo),mLag+1:end-mLead);
Profinc_y = data_endo(strcmp('Profinc_y',names_endo),mLag+1:end-mLead);
SavInc_y = data_endo(strcmp('r',names_endo),mLag+1:end-mLead).*(1-s.prob_ret)./...
    (1+data_endo(strcmp('g',names_endo),mLag+1:end-mLead)).*...
    data_endo(strcmp('B_y',names_endo),mLag+1:end-mLead);
s.Income_y = s.Labinc_y+Profinc_y+SavInc_y;
s.C_I_y = C_y./s.Income_y;
s.d_c_i_y = s.C_I_y-s.C_I_y(1);
% Consumption/Income ratio - old popoulation
C_o = data_endo(strcmp('C_o',names_endo),mLag+1:end-mLead);
Pen = data_endo(strcmp('Pen',names_endo),mLag+1:end-mLead);
Profinc_o = data_endo(strcmp('Inc_o',names_endo),mLag+1:end-mLead);
SavInc_o = data_endo(strcmp('r',names_endo),mLag+1:end-mLead)./...
    (1+data_endo(strcmp('g',names_endo),mLag+1:end-mLead)).*...
    (s.prob_ret.*data_endo(strcmp('B_y',names_endo),mLag+1:end-mLead)+...
    data_endo(strcmp('B_o',names_endo),mLag+1:end-mLead));
s.Income_o = Pen+Profinc_o+SavInc_o;
s.C_I_o = C_o./s.Income_o;
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

s.C = data_endo(strcmp('C',names_endo),mLag+1:end-mLead);
s.I = data_endo(strcmp('I',names_endo),mLag+1:end-mLead);
s.C_o = data_endo(strcmp('C_o',names_endo),mLag+1:end-mLead);
s.C_y = data_endo(strcmp('C_y',names_endo),mLag+1:end-mLead);
s.Pen = data_endo(strcmp('Pen',names_endo),mLag+1:end-mLead);
s.L = data_endo(strcmp('L',names_endo),mLag+1:end-mLead);
s.U = data_endo(strcmp('U',names_endo),mLag+1:end-mLead);
s.tau_c = data_endo(strcmp('tau_c',names_endo),mLag+1:end-mLead);
s.tau_pi = data_endo(strcmp('tau_pi',names_endo),mLag+1:end-mLead);
s.tau_sf = data_endo(strcmp('tau_sf',names_endo),mLag+1:end-mLead);
s.tau_sw = data_endo(strcmp('tau_sw',names_endo),mLag+1:end-mLead);
s.share = data_endo(strcmp('share',names_endo),mLag+1:end-mLead);
s.Gov_GDP = data_endo(strcmp('Gov_GDP',names_endo),mLag+1:end-mLead);
s.Uwu_GDP = data_endo(strcmp('Uwu_GDP',names_endo),mLag+1:end-mLead);
s.B_GDP = data_endo(strcmp('B_GDP',names_endo),mLag+1:end-mLead);
s.PB = data_endo(strcmp('PB',names_endo),mLag+1:end-mLead);
s.Rev = data_endo(strcmp('Rev',names_endo),mLag+1:end-mLead);
s.Ex = data_endo(strcmp('Ex',names_endo),mLag+1:end-mLead);
s.Lump = data_endo(strcmp('Lump',names_endo),mLag+1:end-mLead);
s.Lump_GDP = s.Lump./s.GDP;

end