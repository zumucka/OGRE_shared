function [p,flg] = calculate_sstate_term_FF(s,type,val)


% DEMOGRAPHY
switch type
    case 1
        s.prob_die = val;
    case 2
        s.fert = val;
    case 3
        s.tau_c_rev_GDP = val;
    case 4
        s.tau_pi_rev_GDP = val;
    case 5
        s.tau_sf_rev_GDP = val;
    case 6
        s.tau_sw_rev_GDP = val;
    case 7
        s.Gov_GDP = val;
    case 8
        s.Uwu_GDP = val;
    case 9
        s.nu = val;
    case 10
        s.prob_ret = val;
    otherwise
        p = s;
        return;
end

% DEMOGRAPHY
s.share = s.prob_ret/(s.prob_die-s.prob_ret+s.fert);
s.share_y = 1/(1+s.share);
s.g_ny = s.fert-s.prob_ret;
s.g_no = s.g_ny;
s.g_n = s.g_ny;
s.g = (1+s.g_n)*(1+s.g_a)-1;

% FIRMS
s.mc_f = 1/(s.markup+1);
s.phi = (s.markup+1)/s.markup;
s.Lambda = s.betta^(1/s.gamma);

    function [p] = prepare(p0)
        p = s;
        p.r = p0(1); p.pr_i = p0(2); p.y_i = p0(3); p.prob_h_f = p0(4); p.prob_h_i = p0(5);
        % monetary
        p.i = p.r;
        % firms
        p.mc_i = p.mc_f*p.pr_i;
        p.z_f = p.delta+p.r; p.z_i = p.z_f;
        p.y_f = 1-p.pr_i*p.y_i;
        p.k_f = (1+p.g)*p.alpha_f*p.mc_f/p.z_f*p.y_f;
        p.k_i = (1+p.g)*p.alpha_i*p.mc_i/p.z_i*p.y_i;
        p.k = p.k_f+p.k_i;
        p.z = (p.k_f*p.z_f+p.k_i*p.z_i)/p.k;
        p.inv_f = p.k_f*(1-(1-p.delta)/(1+p.g));
        p.inv_i = p.k_i*(1-(1-p.delta)/(1+p.g));
        p.inv = p.inv_f+p.inv_i;
        tf = 1+p.hc_w_f*(1-(1-p.prob_f_f)*(1+p.g_a)/(1+p.r));
        p.w_f_g = (1-p.alpha_f)*(p.mc_f*(p.alpha_f/p.z_f)^p.alpha_f)^(1/(1-p.alpha_f))/tf;
        ti = 1+p.hc_w_i*(1-(1-p.prob_f_i)*(1+p.g_a)/(1+p.r));
        p.w_i = (1-p.alpha_i)*(p.mc_i*(p.alpha_i/p.z_i)^p.alpha_i)^(1/(1-p.alpha_i))/ti;
        % labour
        p.hc_f = p.hc_w_f*p.w_f_g;
        p.hc_i = p.hc_w_i*p.w_i;
        p.l_f = p.y_f*(1-p.alpha_f)*p.mc_f/(p.w_f_g*tf);
        p.l_i = p.y_i*(1-p.alpha_i)*p.mc_i/(p.w_i*ti);
        p.h_f = p.l_f*(1-(1-p.prob_f_f)/(1+p.g_n));
        p.h_i = p.l_i*(1-(1-p.prob_f_i)/(1+p.g_n));
        p.profit_f = p.y_f-p.z_f*p.k_f/(1+p.g)-p.w_f_g*p.l_f-p.hc_f*p.h_f;
        p.profit_i = p.y_i*p.pr_i-p.z_i*p.k_i/(1+p.g)-p.w_i*p.l_i-p.hc_i*p.h_i;
        p.profit = p.profit_f+p.profit_i;
        % labour        
        p.kappa_f = p.hc_f/p.prob_h_f^p.alpha_hc;
        p.kappa_i = p.hc_i/p.prob_h_i^p.alpha_hc; 
        p.u = (1+p.g_n)*p.h_f/p.prob_h_f-p.prob_f_f*p.l_f-p.prob_f_i*p.l_i;
        % aggregates
        p.gdp = 1-(p.hc_f*p.h_f+p.pr_i*p.hc_i*p.h_i);
        p.gov = p.gdp*p.Gov_GDP;
        p.c_f = p.y_f-p.inv-p.gov-p.hc_f*p.h_f;
        p.c_i = p.y_i-p.hc_i*p.h_i;
        p.c = p.c_f+p.pr_i*p.c_i;
        % fiscal
        if type == 3
            p.tau_c = p.tau_c_rev_GDP*p.gdp/p.c_f;
        else
            p.tau_c_rev_GDP = p.tau_c*p.c_f/p.gdp;
        end
        if type == 5
            tau_sf_w = p.tau_sf_rev_GDP*p.gdp/p.l_f;
            p.w_f = p.w_f_g - tau_sf_w;
            p.tau_sf = tau_sf_w/p.w_f;
        else
            p.w_f = p.w_f_g/(1+p.tau_sf);
            p.tau_sf_ref_GDP = p.tau_sf*p.w_f*p.l_f/p.gdp;
        end
        if type == 6
            p.tau_sw = p.tau_sw_rev_GDP*p.gdp/(p.w_f*p.l_f);
        else
            p.tau_sw_rev_GDP = p.tau_sw*p.l_f*p.w_f/p.gdp;
        end
        if type == 4
            p.tau_pi = p.tau_pi_rev_GDP*p.gdp/(p.w_f*p.l_f);
        else
            p.tau_pi_rev_GDP = p.tau_pi*p.l_f*p.w_f/p.gdp;
        end
        p.tau_lw = p.tau_pi+p.tau_sw;
        p.w_u = p.Ub_GDP*p.gdp/p.u;
        p.ub = p.Ub_GDP*p.gdp;
        p.b = p.B_GDP*p.gdp;
        p.gb = p.b*(1/(1+p.g)-1);
        p.pb = p.gb+p.r/(1+p.g)*p.b;
        p.Omega_o = (1+p.r)/(p.r+p.prob_die);
        p.exp = p.ub+p.gov;
        p.tau_l = p.tau_pi;
        p.b_pen_y = ((p.tau_sf+p.tau_sw)*p.w_f*p.l_f)/(1-(1+p.r)*(1-p.prob_ret)/(1+p.g));
        p.pen_FF_yo = (1+p.r)*(p.prob_ret*p.b_pen_y)/((1+p.g)*p.Omega_o);
        p.pen_FF = p.pen_FF_yo/(1-(1-p.prob_die)/(1+p.g));
        p.pen = p.pen_FF;
        p.b_pen_o = (p.pen_FF*(1+p.g)-(1+p.r)*p.prob_ret*p.b_pen_y)/(p.r-p.g);
        p.b_pen = p.b_pen_o+p.b_pen_y;
        p.rev = p.pb+p.exp;
        p.lump = p.rev-p.tau_c*p.c_f-p.tau_l*p.w_f*p.l_f;        
        p.gb_tar = p.gb+p.lump;
        % households: old
        p.Lambda_t = 1/(1+p.tau_c);
        p.upsilon = (p.chi*(1+p.tau_c)/p.pr_i)^(1/p.gamma);
        p.inc_o = (1-p.xi)*(p.profit-p.lump)/(1-(1+p.g_a)*(1-p.prob_die)/(1+p.r));
        p.PF_o = (1+p.tau_c+p.pr_i*p.upsilon)/(1-(1-p.prob_die)*(1+p.r)^(1/p.gamma-1)*p.Lambda);
        % households: young
        p.labinc_y = (1-p.tau_lw)*p.w_f*p.l_f+p.w_i*p.l_i+p.w_u*p.u;
        p.profinc_y = p.xi*(p.profit-p.lump);
        p.inc_y = (p.labinc_y+p.profinc_y)/(1-(1-p.prob_ret)*(1+p.g_a)/(1+p.r));
        p.PF_y = (1+p.tau_c+p.pr_i*p.upsilon+(1+p.r)^(1/p.gamma-1)*p.Lambda*p.prob_ret*p.PF_o)/(1-(1+p.r)^(1/p.gamma-1)*p.Lambda*(1-p.prob_ret));
        p.peninc_y = (1+p.g)*(p.pen*p.Omega_o+p.prob_ret/((1+p.g_ny)*p.share)*p.inc_o)/(1-(1-p.prob_ret)/(1+p.r)*(1+p.g_a));
        q1 = (1+p.r)*(1-p.prob_ret)/(1+p.g);
        q2 = (1+p.tau_c+p.pr_i*p.upsilon)/p.PF_y;
        p.b_y = (-q2*(p.inc_y+p.peninc_y/(1+p.r))+p.labinc_y+p.profinc_y)/...
            (1+q1*(q2-1));
        p.c_yf = (p.inc_y+p.peninc_y/(1+p.r)+q1*p.b_y)/p.PF_y;
        p.c_yi = p.upsilon*p.c_yf;
        % households:
        p.c_of = p.c_f-p.c_yf;
        p.b_o = (1+p.g)/(1+p.r)*(p.c_of*p.PF_o-(p.pen*p.Omega_o+p.inc_o))-p.prob_ret*p.b_y;
        p.c_oi = p.c_of*p.upsilon;        
        p.w_b_f_max = p.sigma_f/(1-p.sigma_f)*p.hc_f*(1-p.tau_lw)/(1+p.tau_sf);
        p.w_b_i_max = p.sigma_i/(1-p.sigma_i)*p.hc_i;
        % nominal vars
        p.Y = p.share_y/(p.u+p.l_f+p.l_i); p.Y_f = p.y_f*p.Y; p.Y_i = p.y_i*p.Y;
        p.C = p.c*p.Y; p.C_f = p.c_f*p.Y; p.C_i = p.c_i*p.Y; p.C_oi = p.c_oi*p.Y; p.C_GDP = p.c/p.gdp;
        p.C_of = p.c_of*p.Y; p.C_yi = p.c_yi*p.Y; p.C_yf = p.c_yf*p.Y; p.C_y = p.C_yf+p.pr_i*p.C_yi;p.C_o = p.C_of+p.pr_i*p.C_oi;
        p.c_y = p.c_yf+p.pr_i*p.c_yi; p.c_o = p.c_of+p.pr_i*p.c_oi;
        p.GDP = p.gdp*p.Y; p.PB_GDP = p.pb/p.gdp; p.C_y_GDP = p.c_y/p.gdp; p.C_o_GDP = p.C_o/p.GDP; p.C_GDP = p.C/p.GDP;
        p.Inc_o = p.inc_o*p.Y; p.Inc_y = p.inc_y*p.Y; p.Labinc_y = p.labinc_y*p.Y; p.Profinc_y = p.profinc_y*p.Y; 
        p.Peninc_y = p.peninc_y*p.Y; p.B_o = p.b_o*p.Y; p.B_y = p.b_y*p.Y; p.I = p.inv*p.Y; p.I_f = p.inv_f*p.Y; p.I_i = p.inv_i*p.Y;
        p.Profit_f = p.profit_f*p.Y; p.Profit_i = p.profit_i*p.Y; p.Profit = p.profit*p.Y; p.K_f = p.k_f*p.Y; p.K_i = p.k_i*p.Y; p.I_GDP = p.I/p.GDP; p.K = p.K_f+p.K_i;
        p.L_f = p.l_f*p.Y; p.L_i = p.l_i*p.Y; p.L = p.L_f+p.L_i; p.w = (p.w_f*p.L_f+p.w_i*p.L_i)/p.L;p.H_f = p.h_f*p.Y; p.H_i = p.h_i*p.Y; p.U = p.u*p.Y; p.Gov = p.gov*p.Y; p.Ub = p.ub*p.Y; p.Lump = p.lump*p.Y; p.Pen = p.pen*p.Y;
        p.B = p.b*p.Y; p.B_pen = p.b_pen*p.Y; p.PB = p.pb*p.Y; p.GB = p.gb*p.Y; p.GB_tar = p.gb_tar*p.Y; p.GB_GDP_tar = p.GB_tar/p.gdp; p.Rev = p.rev*p.Y; p.Exp = p.exp*p.Y;
        p.Pen_FF_yo = p.Y*p.pen_FF_yo; p.Pen_FF = p.pen_FF*p.Y; p.B_pen_o = p.b_pen_o*p.Y; p.B_pen_y = p.b_pen_y*p.Y; p.Pen_GDP = p.Pen/p.GDP;
    end

    function [dif] = get_dif(p0)
        p1 = prepare(p0);
        dif = zeros(5,1);
        dif(1) = p1.C_i-(p1.C_oi+p1.C_yi);
        dif(2) = p1.B+p1.q_f*p1.K_f+p1.q_i*p1.K_i-(p1.B_o+p1.B_y+p1.B_pen);
        dif(3) = p1.sigma_f/(1-p1.sigma_f)*p1.hc_f*(1-p1.tau_lw)/(1+p1.tau_sf)-((1-p1.tau_lw)*p1.w_f-p1.w_u+(1+p1.g_a)*(1-p1.prob_f_f)/(1+p1.r)...
            *((1-p1.prob_h_f)*p1.sigma_f/(1-p1.sigma_f)*p1.hc_f*(1-p1.tau_lw)/(1+p1.tau_sf)-p1.prob_h_i*p1.sigma_i/(1-p1.sigma_i)*p1.hc_i));
        dif(4) = p1.sigma_i/(1-p1.sigma_i)*p1.hc_i-(p1.w_i-p1.w_u+(1+p1.g_a)*(1-p1.prob_f_i)/(1+p1.r)...
            *((1-p1.prob_h_i)*p1.sigma_i/(1-p1.sigma_i)*p1.hc_i-p1.prob_h_f*p1.sigma_f/(1-p1.sigma_f)*p1.hc_f*(1-p1.tau_lw)/(1+p1.tau_sf)));
        dif(5) = p1.prob_h_i - (p1.H_i*(1+p1.g_n)/(p1.U+p1.prob_f_f*p1.L_f+p1.prob_f_i*p1.L_i));
    end

guess = [s.r,s.pr_i,s.y_i,s.prob_h_f,s.prob_h_i];
opt.MAXITER = 1e6; opt.TOLFUN = 1e-8; opt.TOLX = 1e-8;
[out, ~, ~, flg] = newtonraphson(@get_dif, guess, opt);
p = prepare(out);
        
end