function [s] = sstate_inputs(pension_type)

s = struct;

% demography
s.prob_ret = 0.015;
s.prob_die = 0.05; %0.0384
s.fert = 0.03;
% technology
s.g_a = 0.015;
s.delta = 0.1;
s.alpha = 0.3;
s.markup = 0.2;
% households
s.xi = 1;
s.betta = 0.99;
s.gamma = 1;
% fiscal
s.tau_c_rev_GDP = 0.07;
s.tau_pi_rev_GDP = 0.05;
s.tau_sf_rev_GDP = 0.05;
s.tau_sw_rev_GDP = 0.03;
s.Gov_GDP = 0.2;
s.Uwu_GDP = 0.01;
s.B_GDP = 0.6;
s.T = 10;
% labour
s.prob_f = 0.1;
s.sigma = 0.75;
s.alpha_hc = 0.5;
s.hc_w = 0.25;

if pension_type == pension.PAYG
    s.nu = 0.85;
end

end

