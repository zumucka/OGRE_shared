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
var C_o;                     // retired: consumption 
var Inc_o;                   // retired: other income 
var PF_o;                    // retired: consumption price functional 
var B_o;                     // retired: accumulated wealth 
var C_y;                     // young: consumption 
var PF_y;                    // young: consumption price functional 
var B_y;                     // young: accumulated wealth 
var Inc_y;                   // young: income 
var Labinc_y;                // young: labour income 
var Profinc_y;               // young: profit income 
var Peninc_y;                // young: potential pension income 
var Lambda_t;
var Lambda;

// FIRMS 
var Y;                       // aggregate production (total)
var I;                       // investment (total) 
var a;                       // technology process 
var g_a;                     // technology growth rate 
var Profit;                  // profit (total) 
var z;                       // real rental rate on capital 
var K;                       // capital stock 
var mc;                      // real marginal costs 
var q;                       // shadow price of capital 
var adj_pr;                  // price adjustment costs 
var adj_pr_d;
var adj_inv;                 // investment adjustment 
var adj_inv_d;
var pi;                      // price inflation rate 

// LABOUR MARKET
var w;                       // real wage 
var L;                       // labour supply 
var hc;                      // hiring costs 
var H;                       // newly hired 
var prob_h;                  // probability of being hired 
var w_b_max;                 // wage bargaining max. accepted 
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
