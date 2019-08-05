function [p,flg] = calculate_sstate_PAYG(s,ini)

% GENERAL
s.a = 1; s.pi = 0; s.adj_pr = 0; s.adj_pr_d = 0; 
s.adj_inv = 0; s.adj_inv_d = 0; 
s.q = 1; s.y = 1;

% DEMOGRAPHY
s.share = s.prob_ret/(s.prob_die-s.prob_ret+s.fert);
s.share_y = 1/(1+s.share);
s.g_ny = s.fert-s.prob_ret;
s.g_no = s.g_ny;
s.g_n = s.g_ny;
s.g = (1+s.g_n)*(1+s.g_a)-1;

% FIRMS
s.mc = 1/(s.markup+1);
s.phi = (s.markup+1)/s.markup;
s.Lambda = s.betta^(1/s.gamma);

    function [p] = prepare(p0)
        p = s;
        p.r = p0(1); p.prob_h = p0(2);
        % monetary
        p.i = p.r;
        % firms
        p.z = p.delta+p.r; 
        p.k = (1+p.g)*p.alpha*p.mc/p.z;
        p.inv = p.k*(1-(1-p.delta)/(1+p.g));
        t = 1+p.hc_w*(1-(1-p.prob_f)*(1+p.g_a)/(1+p.r));
        p.w_g = (1-p.alpha)*(p.mc*(p.alpha/p.z)^p.alpha)^(1/(1-p.alpha))/t;
        % labour
        p.hc = p.hc_w*p.w_g;
        p.l = p.y*(1-p.alpha)*p.mc/(p.w_g*t);
        p.h = p.l*(1-(1-p.prob_f)/(1+p.g_n));
        p.profit = p.y-p.z*p.k/(1+p.g)-p.w_g*p.l-p.hc*p.h;
        % labour        
        p.kappa = p.hc/p.prob_h^p.alpha_hc;
        p.u = (1+p.g_n)*p.h/p.prob_h-p.prob_f*p.l;
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
        p.tau_l = p.tau_pi+p.tau_sf+p.tau_sw;
        p.ib = p.w*p.l/(p.T-(p.T-1)*(1-p.prob_ret)/(1+p.g));
        p.b_pen = 0;
        p.pen_PG_yo = p.nu*p.prob_ret*p.ib/(1+p.g);
        p.pen_PG = p.pen_PG_yo/(1-(1-p.prob_die)/(1+p.g));
        p.pen = p.pen_PG;
        p.exp = p.wu+p.gov+p.pen;
        p.rev = p.pb+p.exp;
        p.lump = p.rev-p.tau_c*p.c-p.tau_l*p.w*p.l;        
        p.gb_tar = p.gb+p.lump;
        % households: old
        p.Lambda_t = 1/(1+p.tau_c);
        p.inc_o = (1-p.xi)*(p.profit-p.lump)/(1-(1+p.g_a)*(1-p.prob_die)/(1+p.r));
        p.PF_o = (1+p.tau_c)/(1-(1-p.prob_die)*(1+p.r)^(1/p.gamma-1)*p.Lambda);
        % households: young
        p.labinc_y = (1-p.tau_lw)*p.w*p.l+p.w_u*p.u;
        p.profinc_y = p.xi*(p.profit-p.lump);
        p.inc_y = (p.labinc_y+p.profinc_y)/(1-(1-p.prob_ret)*(1+p.g_a)/(1+p.r));
        p.PF_y = (1+p.tau_c+(1+p.r)^(1/p.gamma-1)*p.Lambda*p.prob_ret*p.PF_o)/(1-(1+p.r)^(1/p.gamma-1)*p.Lambda*(1-p.prob_ret));
        p.peninc_y = (1+p.g)*(p.pen*p.Omega_o+p.prob_ret/((1+p.g_ny)*p.share)*p.inc_o)/(1-(1-p.prob_ret)/(1+p.r)*(1+p.g_a));
        q1 = (1+p.r)*(1-p.prob_ret)/(1+p.g);
        q2 = (1+p.tau_c)/p.PF_y;
        p.b_y = (-q2*(p.inc_y+p.peninc_y/(1+p.r))+p.labinc_y+p.profinc_y)/...
            (1+q1*(q2-1));
        p.c_y = (p.inc_y+p.peninc_y/(1+p.r)+q1*p.b_y)/p.PF_y;
        % households:
        p.c_o = p.c-p.c_y;
        p.b_o = (1+p.g)/(1+p.r)*(p.c_o*p.PF_o-(p.pen*p.Omega_o+p.inc_o))-p.prob_ret*p.b_y;
        p.w_b_max = p.sigma/(1-p.sigma)*p.hc*(1-p.tau_lw)/(1+p.tau_sf);
        % nominal vars
        p.Y = p.share_y/(p.u+p.l); 
        p.C = p.c*p.Y; p.C_o = p.c_o*p.Y; p.C_y = p.c_y*p.Y; p.PB_GDP = p.pb/p.gdp; p.C_y_GDP = p.c_y/p.gdp; p.C_o_GDP = p.c_o/p.gdp;
        p.Inc_o = p.inc_o*p.Y; p.Inc_y = p.inc_y*p.Y; p.Labinc_y = p.labinc_y*p.Y; p.Profinc_y = p.profinc_y*p.Y; 
        p.Peninc_y = p.peninc_y*p.Y; p.B_o = p.b_o*p.Y; p.B_y = p.b_y*p.Y; p.GDP = p.gdp*p.Y; p.I = p.inv*p.Y; p.I_GDP = p.inv/p.gdp;
        p.Profit = p.profit*p.Y; p.K = p.k*p.Y; 
        p.L = p.l*p.Y; p.H = p.h*p.Y; p.U = p.u*p.Y; p.Gov = p.gov*p.Y; p.Lump = p.lump*p.Y; p.Pen = p.pen*p.Y;
        p.B = p.b*p.Y; p.B_pen = p.b_pen*p.Y; p.PB = p.pb*p.Y; p.GB = p.gb*p.Y; p.GB_tar = p.gb_tar*p.Y; p.Rev = p.rev*p.Y; p.Exp = p.exp*p.Y;
        p.IB = p.ib*p.Y;  p.Pen_PG_yo = p.pen_PG_yo*p.Y; p.Pen_PG = p.pen_PG*p.Y;
    end

    function [dif] = get_dif(p0)
        p1 = prepare(p0);
        dif = zeros(2,1);
        dif(1) = p1.B+p1.q*p1.K-(p1.B_o+p1.B_y+p1.B_pen);
%         dif(1) = p1.C_o*(1+p1.tau_c)+p1.B_o-(p1.Pen+(p1.r+1)/(1+p1.g)*(p1.prob_ret*p1.B_y+p1.B_o));
        dif(2) = p1.sigma/(1-p1.sigma)*p1.hc*(1-p1.tau_lw)/(1+p1.tau_sf)-((1-p1.tau_lw)*p1.w-p1.w_u+(1+p1.g_a)*(1-p1.prob_f)/(1+p1.r)...
            *(1-p1.prob_h)*p1.sigma/(1-p1.sigma)*p1.hc*(1-p1.tau_lw)/(1+p1.tau_sf));
    end

guess = [ini.r, ini.prob_h];
opt.MAXITER = 1e6; opt.TOLFUN = 1e-10; opt.TOLX = 1e-10;
[out, ~, ~, flg] = newtonraphson(@get_dif, guess, opt);
p = prepare(out);
        
end

