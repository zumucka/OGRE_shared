function [ys,check] = OGRE_permanent_steadystate(ys,~)

check = 0;
global M_
params = M_.params;
pension_system = params(end);
% 1 == PAYG
% 0 == FF

% rho_prob_die = params(1); 
% rho_prob_ret = params(2); 
% rho_fert = params(3); 
betta = params(7); 
gamma = params(8);
xi = params(9);           
delta = params(11); 
prob_f = params(16); 
alpha = params(17);
g_a_ss = params(18);
markup = params(19);
alpha_hc = params(21);                 
kappa = params(22);                    
sigma = params(23); 
hc_w = params(24); 
tau_c_rev_GDP_ss = params(43);
tau_pi_rev_GDP_ss = params(44);
tau_sf_rev_GDP_ss = params(45);
tau_sw_rev_GDP_ss = params(46);
Gov_GDP_ss = params(47);
Uwu_GDP_ss = params(48);
B_GDP_ss = params(49);
            
if pension_system
    T = params(57); 
    nu_ss = ys(77);   
end
prob_die_ss = ys(3);
prob_ret_ss = ys(4);  
fert_ss = ys(5); 

% GENERAL
s.a_ss = 1; s.a = s.a_ss; s.pi = 0; s.q = 1;
s.adj_pr = 0; s.adj_pr_d = 0; s.adj_inv = 0; s.adj_inv_d = 0; 
if pension_system 
    s.nu = nu_ss;
end

% DEMOGRAPHY
s.prob_ret = prob_ret_ss; s.prob_die = prob_die_ss; s.fert = fert_ss;
if isnan(s.prob_die)
    s.share = ys(1);
    s.prob_die = s.prob_ret/s.share+s.prob_ret-s.fert;
elseif isnan(s.fert)    
    s.share = ys(1);
    s.fert = s.prob_ret/s.share+s.prob_ret-s.prob_die;
elseif isnan(s.prob_ret)
    s.share = ys(1);
    s.prob_ret = s.share/(1+s.share)*(s.prob_die+s.fert);
else
    s.share = s.prob_ret/(s.prob_die-s.prob_ret+s.fert);
end
s.share_y = 1/(1+s.share);
s.g_a = g_a_ss;
s.g_ny = s.fert-s.prob_ret;
s.g_no = s.g_ny;
s.g_n = s.g_ny;
s.g = (1+s.g_n)*(1+s.g_a)-1;

% FISCAL
s.tau_c_rev_GDP = tau_c_rev_GDP_ss;
s.tau_pi_rev_GDP = tau_pi_rev_GDP_ss;
s.tau_sf_rev_GDP = tau_sf_rev_GDP_ss;
s.tau_sw_rev_GDP = tau_sw_rev_GDP_ss;
s.Gov_GDP = Gov_GDP_ss;
s.Uwu_GDP = Uwu_GDP_ss; 
s.B_GDP = B_GDP_ss; 

% FIRMS
s.mc = 1/(markup+1);
s.phi = (markup+1)/markup;
s.y = 1;
s.Lambda = betta^(1/gamma);

    function [p] = prepare(p0)
        p = s;
        p.r = p0(1); p.prob_h = p0(2);
        % monetary
        p.i = p.r;
        % firms
        p.z = delta+p.r; 
        p.k = (1+p.g)*alpha*p.mc/p.z;
        p.inv = p.k*(1-(1-delta)/(1+p.g));
        t = 1+hc_w*(1-(1-prob_f)*(1+p.g_a)/(1+p.r));
        p.w_g = (1-alpha)*(p.mc*(alpha/p.z)^alpha)^(1/(1-alpha))/t;
        % labour
        p.hc = hc_w*p.w_g;
        p.l = p.y*(1-alpha)*p.mc/(p.w_g*t);
        p.h = p.l*(1-(1-prob_f)/(1+p.g_n));
        p.profit = p.y-p.z*p.k/(1+p.g)-p.w_g*p.l-p.hc*p.h;
        % labour        
        kappa = p.hc/p.prob_h^alpha_hc;
        p.u = (1+p.g_n)*p.h/p.prob_h-prob_f*p.l;
        % aggregates
        p.gdp = 1-p.hc*p.h;
        p.gov = p.gdp*p.Gov_GDP;
        p.c = p.y-p.inv-p.gov-p.hc*p.h;
        % fiscal
        p.tau_c = p.tau_c_rev_GDP*p.gdp/p.c;
        tau_sf_w = p.tau_sf_rev_GDP*p.gdp/p.l;
        p.w = p.w_g - tau_sf_w;
        p.tau_sf = tau_sf_w/p.w;
        p.tau_sw = p.tau_sw_rev_GDP*p.gdp/(p.w*p.l);
        p.tau_pi = p.tau_pi_rev_GDP*p.gdp/(p.w*p.l);
        p.tau_lw = p.tau_pi+p.tau_sw;
        p.w_u = p.Uwu_GDP*p.gdp/p.u;
        p.wu = p.Uwu_GDP*p.gdp;
        p.b = p.B_GDP*p.gdp;
        p.gb = p.b*(1/(1+p.g)-1);
        p.pb = p.gb+p.r/(1+p.g)*p.b;
        p.Omega_o = (1+p.r)/(p.r+p.prob_die);
        if pension_system
            p.tau_l = p.tau_pi+p.tau_sf+p.tau_sw;
            p.ib = p.w*p.l/(T-(T-1)*(1-p.prob_ret)/(1+p.g));
            p.b_pen = 0;
            p.pen_PG_yo = p.nu*p.prob_ret*p.ib/(1+p.g);
            p.pen_PG = p.pen_PG_yo/(1-(1-p.prob_die)/(1+p.g));
            p.pen = p.pen_PG;
            p.exp = p.wu+p.gov+p.pen;
        else
            p.exp = p.wu+p.gov;
            p.tau_l = p.tau_pi;
            p.b_pen_y = ((p.tau_sf+p.tau_sw)*p.w*p.l)/(1-(1+p.r)*(1-p.prob_ret)/(1+p.g));
            p.pen_FF_yo = (1+p.r)*(p.prob_ret*p.b_pen_y)/((1+p.g)*p.Omega_o);
            p.pen_FF = p.pen_FF_yo/(1-(1-p.prob_die)/(1+p.g));
            p.pen = p.pen_FF;
            p.b_pen_o = (p.pen_FF*(1+p.g)-(1+p.r)*p.prob_ret*p.b_pen_y)/(p.r-p.g);
            p.b_pen = p.b_pen_o+p.b_pen_y;
        end
        p.rev = p.pb+p.exp;
        p.lump = p.rev-p.tau_c*p.c-p.tau_l*p.w*p.l;        
        p.gb_tar = p.gb+p.lump;
        % households: old
        p.Lambda_t = 1/(1+p.tau_c);
        p.inc_o = (1-xi)*(p.profit-p.lump)/(1-(1+p.g_a)*(1-p.prob_die)/(1+p.r));
        p.PF_o = (1+p.tau_c)/(1-(1-p.prob_die)*(1+p.r)^(1/gamma-1)*p.Lambda);
        % households: young
        p.labinc_y = (1-p.tau_lw)*p.w*p.l+p.w_u*p.u;
        p.profinc_y = xi*(p.profit-p.lump);
        p.inc_y = (p.labinc_y+p.profinc_y)/(1-(1-p.prob_ret)*(1+p.g_a)/(1+p.r));
        p.PF_y = (1+p.tau_c+(1+p.r)^(1/gamma-1)*p.Lambda*p.prob_ret*p.PF_o)/(1-(1+p.r)^(1/gamma-1)*p.Lambda*(1-p.prob_ret));
        p.peninc_y = (1+p.g)*(p.pen*p.Omega_o+p.prob_ret/((1+p.g_ny)*p.share)*p.inc_o)/(1-(1-p.prob_ret)/(1+p.r)*(1+p.g_a));
        q1 = (1+p.r)*(1-p.prob_ret)/(1+p.g);
        q2 = (1+p.tau_c)/p.PF_y;
        p.b_y = (-q2*(p.inc_y+p.peninc_y/(1+p.r))+p.labinc_y+p.profinc_y)/...
            (1+q1*(q2-1));
        p.c_y = (p.inc_y+p.peninc_y/(1+p.r)+q1*p.b_y)/p.PF_y;
        % households:
        p.c_o = p.c-p.c_y;
        p.b_o = (1+p.g)/(1+p.r)*(p.c_o*p.PF_o-(p.pen*p.Omega_o+p.inc_o))-p.prob_ret*p.b_y;
        p.w_b_max = sigma/(1-sigma)*p.hc*(1-p.tau_lw)/(1+p.tau_sf);
        % nominal vars
        p.Y = p.share_y/(p.u+p.l); 
        p.C = p.c*p.Y; p.C_o = p.c_o*p.Y; p.C_y = p.c_y*p.Y; 
        p.Inc_o = p.inc_o*p.Y; p.Inc_y = p.inc_y*p.Y; p.Labinc_y = p.labinc_y*p.Y; p.Profinc_y = p.profinc_y*p.Y; 
        p.Peninc_y = p.peninc_y*p.Y; p.B_o = p.b_o*p.Y; p.B_y = p.b_y*p.Y; p.GDP = p.gdp*p.Y; p.I = p.inv*p.Y; 
        p.Profit = p.profit*p.Y; p.K = p.k*p.Y; p.Uw_u = p.wu*p.Y;
        p.L = p.l*p.Y; p.H = p.h*p.Y; p.U = p.u*p.Y; p.Gov = p.gov*p.Y; p.Lump = p.lump*p.Y; p.Pen = p.pen*p.Y;
        p.B = p.b*p.Y; p.B_pen = p.b_pen*p.Y; p.PB = p.pb*p.Y; p.GB = p.gb*p.Y; p.GB_tar = p.gb_tar*p.Y; p.GB_GDP_ss_tar = p.GB_tar/p.gdp; p.Rev = p.rev*p.Y; p.Exp = p.exp*p.Y;
        if pension_system
            p.IB = p.ib*p.Y;  p.Pen_PG_yo = p.pen_PG_yo*p.Y; p.Pen_PG = p.pen_PG*p.Y;
        else
            p.Pen_FF_yo = p.Y*p.pen_FF_yo; p.Pen_FF = p.pen_FF*p.Y; p.B_pen_o = p.b_pen_o*p.Y; p.B_pen_y = p.b_pen_y*p.Y;
        end
    end

    function [dif] = get_dif(p0)
        p1 = prepare(p0);
        dif = zeros(2,1);
        dif(1) = p1.B+p1.q*p1.K-(p1.B_o+p1.B_y+p1.B_pen);
        dif(2) = sigma/(1-sigma)*p1.hc*(1-p1.tau_lw)/(1+p1.tau_sf)-((1-p1.tau_lw)*p1.w-p1.w_u+(1+p1.g_a)*(1-prob_f)/(1+p1.r)...
            *(1-p1.prob_h)*sigma/(1-sigma)*p1.hc*(1-p1.tau_lw)/(1+p1.tau_sf));
    end

if pension_system
    s0 = sstate_ini_PAYG();
else
    s0 = sstate_ini_FF();
end
opt.MAXITER = 1e8; opt.TOLFUN = 1e-8; opt.TOLX = 1e-8;
guess = [s0.r,s0.prob_h];
out = newtonraphson(@get_dif, guess, opt);
p = prepare(out);

%% finalize
M_.params(4) = s.prob_ret;
M_.params(5) = s.prob_die;
M_.params(6) = s.fert;
M_.params(10) = s.phi;
M_.params(20) = s.a_ss;
M_.params(22) = kappa;
M_.params(27) = p.r;
M_.params(47) = Gov_GDP_ss;
M_.params(48) = Uwu_GDP_ss;
M_.params(50) = p.GB_GDP_ss_tar;
M_.params(51) = p.GB_tar;
M_.params(52) = p.Lump;
M_.params(53) = p.tau_pi;
M_.params(54) = p.tau_sw;
M_.params(55) = p.tau_sf;
M_.params(56) = p.tau_c;
if pension_system
    M_.params(60) = nu_ss;
end

ys = [p.share, p.share_y, p.prob_die, p.prob_ret, p.fert, p.g_n, p.g_ny, p.g_no, p.g, ...
    p.Omega_o, p.C, p.C_o, p.Inc_o, p.PF_o, p.B_o, p.C_y, ...
    p.PF_y, p.B_y, p.Inc_y, p.Labinc_y, p.Profinc_y, p.Peninc_y, p.Lambda_t, ...
    p.Lambda, p.Y, p.I, p.a, p.g_a, p.Profit, p.z, p.K, p.mc, ...
    p.q, p.adj_pr, p.adj_pr_d, p.adj_inv, p.adj_inv_d, ...
    p.pi, p.w, p.L, p.hc, p.H, p.prob_h, p.w_b_max, p.U, p.r, p.i, p.tau_c, p.tau_lw, ...
    p.tau_sf, p.tau_sw, p.tau_pi, p.tau_l, p.w_u, p.Uw_u, p.Gov, p.Lump, p.Pen, p.B, p.B_pen, p.GDP, ...
    p.PB, p.GB, p.GB_tar, p.Rev, p.Exp, p.tau_c_rev_GDP, p.tau_pi_rev_GDP, p.tau_sf_rev_GDP, ...
    p.tau_sw_rev_GDP, p.Gov_GDP, p.Uwu_GDP, p.B_GDP];

if pension_system
    ys = [ys, p.Pen_PG, p.Pen_PG_yo, p.IB, p.nu];
else
    ys = [ys, p.Pen_FF, p.B_pen_y, p.Pen_FF_yo, p.B_pen_o];
end
ys = ys';

end