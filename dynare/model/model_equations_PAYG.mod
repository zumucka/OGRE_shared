// DEMOGRAPHY
share = (1-prob_die(-1))/(1-prob_ret(-1)+fert)*share(-1)+prob_ret(-1)/(1-prob_ret(-1)+fert);
share_y = 1/(1+share);
1+g_ny = 1-prob_ret(-1)+fert;
1+g_no = 1-prob_die(-1)+prob_ret(-1)/share(-1);
1+g_n = (1+g_ny)*(1+share)/(1+share(-1));
1+g = (1+g_n)*(1+g_a);
g_a = a/a(-1)*(g_a_ss);

// HOUSEHOLDS
Omega_o = 1+(1-prob_die)/(1+r)*Omega_o(+1);
Inc_o = (1-xi)*(Profit-Lump)+(1+g(+1))/(1+r(+1))*(1-prob_die)/(1+g_no(+1))*Inc_o(+1);
PF_o = (1+tau_c)+(1-prob_die)*(1+r)^(1/gamma-1)*Lambda(+1)*PF_o(+1);
C_o*PF_o = Pen*Omega_o+Inc_o+(1+r(-1))/(1+g)*(prob_ret*B_y(-1)+B_o(-1));

PF_y = (1+tau_c)+(1+r)^(1/gamma-1)*Lambda(+1)*(prob_ret*PF_o(+1)+(1-prob_ret)*PF_y(+1));
Inc_y = Labinc_y+Profinc_y+(1-prob_ret)/(1+r)*(1+g(+1))/(1+g_ny(+1))*Inc_y(+1);
Labinc_y = (1-tau_lw)*w*L+w_u*U;
Profinc_y = xi*(Profit-Lump);
Peninc_y = (1+g(+1))*(Pen(+1)*Omega_o(+1)+prob_ret/((1+g_ny(+1))*share(+1))*Inc_o(+1))+(1-prob_ret(+1))/(1+r(+1))*(1+g(+1))/(1+g_ny(+1))*Peninc_y(+1);
C_y*PF_y = Inc_y+Peninc_y/(1+r)+(1+r(-1))*(1-prob_ret(-1))/(1+g)*B_y(-1);
(1+tau_c)*C_y+B_y = Labinc_y+Profinc_y+(1+r(-1))*(1-prob_ret)/(1+g)*B_y(-1);

Lambda_t = (1+shk_c)/(1+tau_c);
Lambda = (betta*Lambda_t(+1)/Lambda_t)^(1/gamma);

// FIRMS
adj_pr = phi_pr/2*((1+pi)/(1+pi(-1))^gamma_pr-1)^2;
adj_pr_d = phi_pr*((1+pi)/(1+pi(-1))^gamma_pr-1);
(phi-1)+(adj_pr+(1+pi)/(1+pi(-1))^gamma_pr*adj_pr_d)-Y(+1)/Y*(1+g(+1))/(1+r)*adj_pr_d(+1)*(1+pi(+1))/(1+pi)^gamma_pr=phi*mc;
mc = (z/alpha)^alpha*(((1+tau_sf)*w+hc-hc(+1)*(1-prob_f)*(1+g_a(+1))/(1+r))/(a*(1-alpha)))^(1-alpha);
K(-1)/(1+g) = alpha*mc/z*Y;
mc*(1-alpha)*Y/L-(1+tau_sf)*w = hc-hc(+1)*(1-prob_f)*(1+g_a(+1))/(1+r);
Profit = Y-z*K(-1)/(1+g)-(1+tau_sf)*w*L-hc*H-Y*adj_pr;
z(+1)+q(+1)*(1-delta) = (1+r)*q;
adj_inv = phi_inv/2*(I/I(-1)-1)^2;
adj_inv_d = phi_inv*(I/I(-1)-1);
I*(1-adj_inv) = K-(1-delta)*K(-1)/(1+g);
1 = q*(1-adj_inv-adj_inv_d*I/I(-1))+q(+1)/(1+r)*adj_inv_d(+1)*(I(+1)/I)^2;

// LABOUR MARKET
hc = kappa*(prob_h)^alpha_hc;
prob_h = (1+g_n)*H/(U(-1)+prob_f*L(-1));
L = (1-prob_f)*L(-1)/(1+g_n)+H;
w_b_max = sigma/(1-sigma)*hc*(1-tau_lw)/(1+tau_sf);
w_b_max = (1-tau_lw)*w-w_u+(1+g_a(+1))*(1-prob_f)/(1+r)*(1-prob_h(+1))*w_b_max(+1);

// MONETARY
(1+i) = (1+i(-1))^rho_i*((1+(r_ss))*(1+pi(+1))^phi_pi)^(1-rho_i)*exp(shk_i);
1+i = (1+r)*(1+pi(+1));

// FISCAL
B = B(-1)/(1+g)-GB;
GB = PB-r(-1)/(1+g)*B(-1);
PB = Rev-Ex;
Rev = tau_c*C+Lump+tau_l*w*L;
Lump = eta_lump*(Lump_ss)+(1-eta_lump)*(rho_lump*Lump(-1)+(1-rho_lump)*(GB_tar-GB))+Lump_ss*shk_lump;
tau_pi = eta_tau_pi*(tau_pi_ss)+(1-eta_tau_pi)*(rho_tau_pi*tau_pi(-1)+(1-rho_tau_pi)*(GB_tar-GB))+tau_pi_ss*shk_tau_pi;
tau_sw = eta_tau_sw*(tau_sw_ss)+(1-eta_tau_sw)*(rho_tau_sw*tau_sw(-1)+(1-rho_tau_sw)*(GB_tar-GB))+tau_sw_ss*shk_tau_sw;
tau_sf = eta_tau_sf*(tau_sf_ss)+(1-eta_tau_sf)*(rho_tau_sf*tau_sf(-1)+(1-rho_tau_sf)*(GB_tar-GB))+tau_sf_ss*shk_tau_sf;
tau_c = eta_tau_c*(tau_c_ss)+(1-eta_tau_c)*(rho_tau_c*tau_c(-1)+(1-rho_tau_c)*(GB_tar-GB))+tau_c_ss*shk_tau_c;
Gov_GDP = eta_gov*(Gov_GDP_ss)+(1-eta_gov)*(rho_gov*Gov_GDP(-1)/(1+g)+(1-rho_gov)*(-GB_tar+GB))+Gov_GDP_ss*shk_gov;
Uwu_GDP = eta_uw_u*(Uwu_GDP_ss)+(1-eta_uw_u)*(rho_uw_u*Uwu_GDP(-1)/(1+g_a)+(1-rho_uw_u)*(-GB_tar+GB))+Uwu_GDP_ss*shk_uw_u;
tau_lw = tau_pi+tau_sw;
tau_c_rev_GDP = tau_c*C/GDP;
tau_sf_rev_GDP = tau_sf*w*L/GDP;
tau_sw_rev_GDP = tau_sw*w*L/GDP;
tau_pi_rev_GDP = tau_pi*w*L/GDP;
Gov_GDP = Gov/GDP;
Uwu_GDP = w_u*U/GDP;
Uw_u = w_u*U; 
B_GDP = B/GDP; 

// MARKET CLEARING
U = share_y-L;
Y = C+I+Gov+hc*H+I*adj_inv+adj_pr*Y;
C = C_o+C_y;
GDP = C+I+Gov;
B+q*K = B_o+B_y+B_pen;

// EXOGENOUS PROCESSES
prob_die = rho_prob_die*prob_die(-1)+(1-rho_prob_die)*(prob_die_ss)+prob_die_ss*shk_prob_die;
prob_ret = rho_prob_ret*prob_ret(-1)+(1-rho_prob_ret)*(prob_ret_ss)+prob_ret_ss*shk_prob_ret;
fert = rho_fert*fert(-1)+(1-rho_fert)*(fert_ss)+fert_ss*shk_fert;
a = rho_a*a(-1)+(1-rho_a)*(a_ss)+shk_a;
GB_tar = rho_GB_tar*GB_tar(-1)+(1-rho_GB_tar)*(GB_tar_ss)+shk_GB_tar;

// PENSION SYSTEM
Ex = w_u*U+Gov+Pen;
Pen = Pen_PG;
tau_l = tau_pi+tau_sf+tau_sw;
IB = (w(-1)*L(-1)+(T-1)*(1-prob_ret(-2))*IB(-1)/(1+g(-1)))/T;
Pen_PG_yo = nu*prob_ret(-1)*IB(-1)/(1+g);
Pen_PG = Pen_PG_yo+(1-prob_die(-1))/(1+g)*Pen_PG(-1);
nu = eta_nu*nu_ss+(1-eta_nu)*(rho_nu*nu(-1)+(1-rho_nu)*(nu_ss))+shk_nu;
B_pen = 0;