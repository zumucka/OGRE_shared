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
C_oi = upsilon*C_of;
Inc_o = (1-xi)*(Profit-Lump)+(1+g(+1))/(1+r(+1))*(1-prob_die)/(1+g_no(+1))*Inc_o(+1);
PF_o = (1+tau_c)+pr_i*upsilon+(1-prob_die)*(1+r)^(1/gamma-1)*Lambda(+1)*PF_o(+1);
C_of*PF_o = Pen*Omega_o+Inc_o+(1+r(-1))/(1+g)*(prob_ret*B_y(-1)+B_o(-1));

C_yi = upsilon*C_yf;
PF_y = (1+tau_c)+pr_i*upsilon+(1+r)^(1/gamma-1)*Lambda(+1)*(prob_ret*PF_o(+1)+(1-prob_ret)*PF_y(+1));
Inc_y = Labinc_y+Profinc_y+(1-prob_ret)/(1+r)*(1+g(+1))/(1+g_ny(+1))*Inc_y(+1);
Labinc_y = (1-tau_lw)*w_f*L_f+w_i*L_i+w_u*U;
Profinc_y = xi*(Profit-Lump);
Peninc_y = (1+g(+1))*(Pen(+1)*Omega_o(+1)+prob_ret/((1+g_ny(+1))*share(+1))*Inc_o(+1))+(1-prob_ret(+1))/(1+r(+1))*(1+g(+1))/(1+g_ny(+1))*Peninc_y(+1);
C_yf*PF_y = Inc_y+Peninc_y/(1+r)+(1+r(-1))*(1-prob_ret(-1))/(1+g)*B_y(-1);
(1+tau_c)*C_yf+pr_i*C_yi+B_y = Labinc_y+Profinc_y+(1+r(-1))*(1-prob_ret)/(1+g)*B_y(-1);

upsilon = (chi*(1+tau_c)/pr_i)^(1/gamma);
Lambda_t = (1+shk_c)/(1+tau_c);
Lambda = (betta*Lambda_t(+1)/Lambda_t)^(1/gamma);

// FIRMS
adj_pr_f = phi_pr_f/2*((1+pi_f)/(1+pi_f(-1))^gamma_pr_f-1)^2;
adj_pr_f_d = phi_pr_f*((1+pi_f)/(1+pi_f(-1))^gamma_pr_f-1);
(phi-1)+(adj_pr_f+(1+pi_f)/(1+pi_f(-1))^gamma_pr_f*adj_pr_f_d)-Y_f(+1)/Y_f*(1+g(+1))/(1+r)*adj_pr_f_d(+1)*(1+pi_f(+1))/(1+pi_f)^gamma_pr_f=phi*mc_f;
mc_f = (z_f/alpha_f)^alpha_f*(((1+tau_sf)*w_f+hc_f-hc_f(+1)*(1-prob_f_f)*(1+g_a(+1))/(1+r))/(a_f*(1-alpha_f)))^(1-alpha_f);
K_f(-1)/(1+g) = alpha_f*mc_f/z_f*Y_f;
mc_f*(1-alpha_f)*Y_f/L_f-(1+tau_sf)*w_f = hc_f-hc_f(+1)*(1-prob_f_f)*(1+g_a(+1))/(1+r);
Profit_f = Y_f-z_f*K_f(-1)/(1+g)-(1+tau_sf)*w_f*L_f-hc_f*H_f-Y_f*adj_pr_f;
z_f(+1)+q_f(+1)*(1-delta) = (1+r)*q_f;
adj_inv_f = phi_inv_f/2*(I_f/I_f(-1)-1)^2;
adj_inv_f_d = phi_inv_f*(I_f/I_f(-1)-1);
I_f*(1-adj_inv_f) = K_f-(1-delta)*K_f(-1)/(1+g);
1 = q_f*(1-adj_inv_f-adj_inv_f_d*I_f/I_f(-1))+q_f(+1)/(1+r)*adj_inv_f_d(+1)*(I_f(+1)/I_f)^2;

adj_pr_i = phi_pr_i/2*((1+pi_f)/(1+pi_i(-1))^gamma_pr_i-1)^2;
adj_pr_i_d = phi_pr_i*((1+pi_f)/(1+pi_i(-1))^gamma_pr_i-1);
(phi-1)+(adj_pr_i+(1+pi_i)/(1+pi_i(-1))^gamma_pr_i*adj_pr_i_d)-Y_i(+1)/Y_i*(1+g(+1))/(1+r)*adj_pr_i_d(+1)*(1+pi_i(+1))/(1+pi_i)^gamma_pr_i=phi*mc_i/pr_i;
mc_i = (z_i/alpha_i)^alpha_i*((w_i+hc_i-hc_i(+1)*(1-prob_f_i)*(1+g_a(+1))/(1+r))/(a_i*(1-alpha_i)))^(1-alpha_i);
K_i(-1)/(1+g) = alpha_i*mc_i/z_i*Y_i;
mc_i*(1-alpha_i)*Y_i/L_i-w_i = hc_i-hc_i(+1)*(1-prob_f_i)*(1+g_a(+1))/(1+r);
Profit_i = pr_i*Y_i-z_i*K_i(-1)/(1+g)-w_i*L_i-hc_i*H_i-Y_i*adj_pr_i;
z_i(+1)+q_i(+1)*(1-delta) = (1+r)*q_i;
adj_inv_i = phi_inv_i/2*(I_i/I_i(-1)-1)^2;
adj_inv_i_d = phi_inv_i*(I_i/I_i(-1)-1);
I_i*(1-adj_inv_i) = K_i-(1-delta)*K_i(-1)/(1+g);
1 = q_i*(1-adj_inv_i-adj_inv_i_d*I_i/I_i(-1))+q_i(+1)/(1+r)*adj_inv_i_d(+1)*(I_i(+1)/I_i)^2;

// LABOUR MARKET
hc_f = kappa_f*(prob_h_f)^alpha_hc;
prob_h_f = (1+g_n)*H_f/(U(-1)+prob_f_f*L_f(-1)+prob_f_i*L_i(-1));
L_f = (1-prob_f_f)*L_f(-1)/(1+g_n)+H_f;
w_b_f_max = sigma_f/(1-sigma_f)*hc_f*(1-tau_lw)/(1+tau_sf);
w_b_f_max = (1-tau_lw)*w_f-w_u+(1+g_a(+1))*(1-prob_f_f)/(1+r)*((1-prob_h_f(+1))*w_b_f_max(+1)-prob_h_i(+1)*w_b_i_max(+1));

hc_i = kappa_i*(prob_h_i)^alpha_hc;
prob_h_i = (1+g_n)*H_i/(U(-1)+prob_f_f*L_f(-1)+prob_f_i*L_i(-1));
L_i = (1-prob_f_i)*L_i(-1)/(1+g_n)+H_i;
w_b_i_max = sigma_i/(1-sigma_i)*hc_i;
w_b_i_max = w_i-w_u+(1+g_a(+1))*(1-prob_f_i)/(1+r)*((1-prob_h_i(+1))*w_b_i_max(+1)-prob_h_f(+1)*w_b_f_max(+1));

// MONETARY
(1+i) = (1+i(-1))^rho_i*((1+(r_ss))*(1+pi_f(+1))^phi_pi)^(1-rho_i)*exp(shk_i);
1+i = (1+r)*(1+pi_f(+1));

// FISCAL
B = B(-1)/(1+g)-GB;
GB = PB-r(-1)/(1+g)*B(-1);
PB = Rev-Ex;
Rev = tau_c*C_f+Lump+tau_l*w_f*L_f;
Lump = eta_lump*(Lump_ss)+(1-eta_lump)*(rho_lump*Lump(-1)+(1-rho_lump)*(GB_tar-GB))+Lump_ss*shk_lump;
tau_pi = eta_tau_pi*(tau_pi_ss)+(1-eta_tau_pi)*(rho_tau_pi*tau_pi(-1)+(1-rho_tau_pi)*(GB_tar-GB))+tau_pi_ss*shk_tau_pi;
tau_sw = eta_tau_sw*(tau_sw_ss)+(1-eta_tau_sw)*(rho_tau_sw*tau_sw(-1)+(1-rho_tau_sw)*(GB_tar-GB))+tau_sw_ss*shk_tau_sw;
tau_sf = eta_tau_sf*(tau_sf_ss)+(1-eta_tau_sf)*(rho_tau_sf*tau_sf(-1)+(1-rho_tau_sf)*(GB_tar-GB))+tau_sf_ss*shk_tau_sf;
tau_c = eta_tau_c*(tau_c_ss)+(1-eta_tau_c)*(rho_tau_c*tau_c(-1)+(1-rho_tau_c)*(GB_tar-GB))+tau_c_ss*shk_tau_c;
Gov_GDP = eta_gov*(Gov_GDP_ss)+(1-eta_gov)*(rho_gov*Gov_GDP(-1)/(1+g)+(1-rho_gov)*(-GB_tar+GB))+Gov_GDP_ss*shk_gov;
Uwu_GDP = eta_uw_u*(Uwu_GDP_ss)+(1-eta_uw_u)*(rho_uw_u*Uwu_GDP(-1)/(1+g_a)+(1-rho_uw_u)*(-GB_tar+GB))+Uwu_GDP_ss*shk_uw_u;
tau_lw = tau_pi+tau_sw;
tau_c_rev_GDP = tau_c*C_f/GDP;
tau_sf_rev_GDP = tau_sf*w_f*L_f/GDP;
tau_sw_rev_GDP = tau_sw*w_f*L_f/GDP;
tau_pi_rev_GDP = tau_pi*w_f*L_f/GDP;
Gov_GDP = Gov/GDP;
Uwu_GDP = w_u*U/GDP; 
Uw_u = w_u*U;
B_GDP = B/GDP; 

// MARKET CLEARING
U = share_y-L_f-L_i;
Profit = Profit_f+Profit_i;
Y_f = C_f+I+Gov+hc_f*H_f+I_f*adj_inv_f+I_i*adj_inv_i+adj_pr_f*Y_f;
Y_i = C_i+hc_i*H_i+adj_pr_i*Y_i;
Y = Y_f+pr_i*Y_i;
C_f = C_of+C_yf;
C_i = C_oi+C_yi;
C = C_f+pr_i*C_i;
GDP = C+I+Gov;
I = I_f+I_i;
B+q_f*K_f+q_i*K_i = B_o+B_y+B_pen;

// EXOGENOUS PROCESSES
// prob_die = rho_prob_die*prob_die(-1)+(1-rho_prob_die)*(prob_die_ss)+shk_prob_die;
// prob_ret = rho_prob_ret*prob_ret(-1)+(1-rho_prob_ret)*(prob_ret_ss)+shk_prob_ret;
// fert = rho_fert*fert(-1)+(1-rho_fert)*(fert_ss)+shk_fert;
a_f = rho_a_f*a_f(-1)+(1-rho_a_f)*(a_f_ss)+shk_a_f;
a_f = a;
a_i = rho_a_i*a_i(-1)+(1-rho_a_i)*(a_i_ss)+shk_a_i;
pr_i = pr_i(-1)*(1+pi_i)/(1+pi_f);
GB_tar = rho_GB_tar*GB_tar(-1)+(1-rho_GB_tar)*(GB_tar_ss)+shk_GB_tar;

// PENSION SYSTEM
Ex = w_u*U+Gov;
Pen = Pen_FF;
tau_l = tau_pi;
B_pen_y = (tau_sf+tau_sw)*w_f*L_f+(1+r(-1))*(1-prob_ret(-1))/(1+g)*B_pen_y(-1);
Pen_FF_yo*Omega_o = (1+r(-1))/(1+g)*prob_ret(-1)*B_pen_y(-1);
Pen_FF = Pen_FF_yo+(1-prob_die(-1))/(1+g)*Pen_FF(-1);
(1+r(-1))/(1+g)*(prob_ret(-1)*B_pen_y(-1)+B_pen_o(-1)) = B_pen_o+Pen_FF;
B_pen = B_pen_y+B_pen_o;