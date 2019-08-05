function [s] = setparam_dynamic()

s = struct;

% demography
s.rho_prob_die = 0.95;
s.rho_prob_ret = 0.95;
s.rho_fert = 0.95;

% firms
s.rho_a = 0.8;
s.phi_inv = 2.5;
s.phi_pr = 60;
s.gamma_pr = 0.75;

% monetary policy
s.rho_i = 0.5;
s.phi_pi = 2;

% fiscal policy
s.eta_lump = 0;
s.rho_lump = 0.9;
s.eta_tau_pi = 1;
s.rho_tau_pi = 0.7;
s.eta_tau_c = 1;
s.rho_tau_c = 0.7;
s.eta_tau_sw = 1;
s.rho_tau_sw = 0.7;
s.eta_tau_sf = 1;
s.rho_tau_sf = 0.7;
s.eta_gov = 1;
s.rho_gov = 0.5;
s.eta_w_u = 1;
s.rho_w_u = 0.5;
s.rho_GB_tar = 0.95;
s.rho_nu = 0.9;

end
