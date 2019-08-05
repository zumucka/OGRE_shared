// DEMOGRAPHY
var share;                   // old vs. young ratio 
var share_y;                 // share of young in the population 
var prob_die;                // probability of dying (mortality) 
var prob_ret;                // probability of retirement 
var fert;                    // fertility rate 
var g_n;                     // total popoulation growth rate 
var g_ny;                    // growth rate of young 
var g_no;                    // growth rate of old 
var g;                       // total growth rate 

// HOUSEHOLDS
var Omega_o;                 // stochastic discount factor 
var C;                       // consumption (total)
var C_f;                     // consumption of formal goods (total) 
var C_i;                     // consumption of informal goods (total) 
var C_of;                    // retired: formal goods consumption 
var C_oi;                    // retired: informal goods consumption 
var Inc_o;                   // retired: other income 
var PF_o;                    // retired: consumption price functional 
var B_o;                     // retired: accumulated wealth 
var C_yf;                    // young: formal goods consumption 
var C_yi;                    // young: informal goods consumption 
var PF_y;                    // young: consumption price functional 
var B_y;                     // young: accumulated wealth 
var Inc_y;                   // young: income 
var Labinc_y;                // young: labour income 
var Profinc_y;               // young: profit income 
var Peninc_y;                // young: potential pension income 
var upsilon;
var Lambda_t;
var Lambda;

// FIRMS 
var Y;                       // aggregate production (total)
var I;                       // investment (total) 
var a;                       // technology process 
var g_a;                     // technology growth rate 
var pr_i;                    // relative price of informal goods 
var Profit;                  // profit (total) 
var a_f;                     // formal: technology process 
var z_f;                     // formal: real rental rate on capital 
var K_f;                     // formal: capital stock 
var Y_f;                     // formal: aggregate production 
var mc_f;                    // formal: real marginal costs 
var Profit_f;                // formal: profit 
var q_f;                    // formal: shadow price of capital 
var I_f;                     // formal: investment 
var adj_pr_f;                // formal: price adjustment costs 
var adj_pr_f_d;
var adj_inv_f;               // formal: investment adjustment 
var adj_inv_f_d;
var a_i;                     // informal: technology process 
var z_i;                     // informal: real rental rate on capital 
var K_i;                     // informal: capital stock 
var Y_i;                     // informal: aggregate production 
var mc_i;                    // informal: real marginal costs 
var Profit_i;                // informal: profit 
var q_i;                     // informal: shadow price of capital 
var I_i;                     // informal: investment 
var adj_pr_i;                // informal: price adjustment costs 
var adj_pr_i_d;
var adj_inv_i;               // informal: investment adjustment 
var adj_inv_i_d;
var pi_f;                    // formal: price inflation rate 
var pi_i;                    // informal: price inflation rate 

// LABOUR MARKET
var w_f;                     // formal: real wage 
var L_f;                     // formal: labour supply 
var hc_f;                    // formal: hiring costs 
var H_f;                     // formal: newly hired 
var prob_h_f;                // formal: probability of being hired 
var w_b_f_max;               // formal: wage bargaining max. accepted 
var w_i;                     // informal: real wage 
var L_i;                     // informal: labour supply 
var hc_i;                    // informal: hiring costs 
var H_i;                     // informal: newly hired 
var prob_h_i;                // informal: probability of being hired 
var w_b_i_max;               // informal: wage bargaining max. accepted 
var U;                       // unemployment 

// MONETARY
var r;                       // real interest rate 
var i;                       // nominal interest rate 

// FISCAL
var tau_c;                   // consumption tax rate 
var tau_lw;                  // labour tax rate (households) 
var tau_sf;                  // social security rate (firms) 
var tau_sw;                  // social security rate (workers) 
var tau_pi;                  // personal income tax 
var tau_l;                   // labour tax rate 
var w_u;                     // unemployment benefits 
var Uw_u;                    // total unemployment benefits per unemployed
var Gov;                     // government consumption 
var Lump;                    // lump-sum taxes 
var Pen;                     // pension income 
var B;                       // debt 
var B_pen;                   // total pension savings 
var GDP;                     // GDP 
var PB;                      // primary balance 
var GB;                      // total government balance 
var GB_tar;                  // total government balance target 
var Rev;                     // revenues 
var Ex;                      // expenditures 
var tau_c_rev_GDP tau_pi_rev_GDP tau_sf_rev_GDP tau_sw_rev_GDP;
var Gov_GDP Uwu_GDP B_GDP; 
