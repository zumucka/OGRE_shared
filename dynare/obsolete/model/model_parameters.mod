// DEMOGRAPHY
parameters rho_prob_die;            // probability of dying persistence 
parameters rho_prob_ret;            // probability of retirement persistence
parameters rho_fert;                // fertility rate persistence
parameters prob_ret_ss prob_die_ss fert_ss;

// HOUSEHOLDS
parameters betta;                   // time discount factor 
parameters gamma;                   // inverse of intertemporal elasticity of substitution / relative risk aversion parameter
parameters chi;                     // weight of informal goods in utility 
parameters xi;                      // fraction of young on profits and lump sum 

// FIRMS
parameters phi;                     // demand price elasticity 
parameters delta;                   // capital depreciation rate 
parameters rho_a_f;                 // formal: technology persistence 
parameters phi_pr_f;                // formal: price adjustment cost scaling factor 
parameters phi_inv_f;               // formal: investment adjustment scaling factor 
parameters gamma_pr_f;              // formal: price indexation factor 
parameters prob_f_f;                // formal: probability of firing 
parameters alpha_f;                 // formal: capital share on production 
parameters rho_a_i;                 // informal: technology persistence 
parameters phi_pr_i;                // informal: price adjustment cost scaling factor 
parameters phi_inv_i;               // informal: investment adjustment scaling factor 
parameters gamma_pr_i;              // informal: price indexation factor 
parameters prob_f_i;                // informal: probability of firing 
parameters alpha_i;                 // informal: capital share on production 
parameters g_a_ss markup a_f_ss a_i_ss;

// LABOUR MARKET
parameters alpha_hc;                // hiring costs elasticity w.r.t. probability of hiring 
parameters kappa_f;                 // formal: hiring costs scaling factor 
parameters sigma_f;                 // formal: worker bargaining power 
parameters kappa_i;                 // informal: hiring cost scaling factor 
parameters sigma_i;                 // informal: worker bargaining power 
parameters hc_w_f hc_w_i; 

// MONETARY
parameters rho_i;                   // nominal interest rate persistence 
parameters phi_pi;                  // weight of inflation expectation in the Taylor rule 
parameters r_ss;

// FISCAL
parameters eta_lump;                // lump sum taxes: constancy switcher 
parameters rho_lump;                // lump sum taxes: persistence 
parameters eta_tau_pi;              // personal income tax rate: constancy switcher 
parameters rho_tau_pi;              // personal income tax rate: persistence 
parameters eta_tau_c;               // consumption tax rate: constancy switcher 
parameters rho_tau_c;               // consumption tax rate: persistence 
parameters eta_tau_sw;              // social constribution rate (worker): constancy switcher 
parameters rho_tau_sw;              // social constribution rate (worker): persistence 
parameters eta_tau_sf;              // social constribution rate (firm): constancy switcher 
parameters rho_tau_sf;              // social constribution rate (firm): persistence 
parameters eta_gov;                 // government consumption: constancy switcher 
parameters rho_gov;                 // government consumption: persistence 
parameters eta_uw_u;                // unemployment benefits: constancy switcher 
parameters rho_uw_u;                // unemployment benefits: persistence 
parameters rho_GB_tar;              // total government balance target: persistence 
parameters tau_c_rev_GDP_ss tau_pi_rev_GDP_ss tau_sf_rev_GDP_ss tau_sw_rev_GDP_ss Gov_GDP_ss;
parameters Uwu_GDP_ss B_GDP_ss GB_GDP_tar GB_tar_ss;
parameters Lump_ss tau_pi_ss tau_sw_ss tau_sf_ss tau_c_ss;

