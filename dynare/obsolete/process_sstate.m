function [s] = process_sstate(M_,oo_)

varnames_endo_all = cellstr(M_.endo_names);
varnames_exo_all = cellstr(M_.exo_names);
values_endo = oo_.steady_state;
values_exo = oo_.exo_steady_state;

names_endo = {'share','C','C_i','C_f','C_oi','C_yi','C_of','C_yf','pr_i',...
    'Pen','Inc_o','Labinc_y','Profinc_y','r','z','g','B_y','B_o','K_f','K_i',...
    'I_f','I_i','z_f','z_i','GDP','I','prob_h_f','prob_h_i','L_f','w_f',...
    'L_i','w_i','tau_lw','GB','PB','Ex','Rev','tau_pi','tau_sw','tau_sf',...
    'tau_c','Lump','Profit','hc_f','H_f','hc_i','H_i','B_pen','nu','Gov_GDP',...
    'Uwu_GDP','tau_c_rev_GDP','tau_pi_rev_GDP','tau_sf_rev_GDP','tau_sw_rev_GDP'};
for i=1:numel(names_endo)
    s.(names_endo{i}) = values_endo(strcmp(names_endo{i},varnames_endo_all)); 
end

names_exo = {'prob_die','prob_ret','fert'};
for i=1:numel(names_exo)
    s.(names_exo{i}) = values_exo(strcmp(names_exo{i},varnames_exo_all)); 
end

% households
s.C_o = s.pr_i*s.C_oi+s.C_of;
s.C_o_ratio = s.C_o/(1+s.share);
s.C_y = s.pr_i*s.C_yi+s.C_yf;
s.C_y_ratio = s.C_y*s.share/(1+s.share);
s.Income_y = s.Labinc_y+s.Profinc_y+s.r*(1-s.prob_ret)/(1+s.g)*s.B_y;
s.C_Income_y = s.C_y/s.Income_y;
s.Income_o = s.Inc_o+s.Pen+s.r*(s.prob_ret*s.B_y+s.B_o)/(1+s.g);
s.C_Income_o = s.C_o/s.Income_o;
s.c = s.C/s.GDP; s.c_o = s.C_o_ratio/s.GDP; s.c_y = s.C_y_ratio/s.GDP;

% firms & production
s.inv = s.I/s.GDP; s.net_profit = (s.Profit-s.Lump)/s.GDP;

% labour market
s.labinc_f = (1-s.tau_lw)*s.L_f*s.w_f/s.GDP;
s.labinc_i = s.L_i*s.w_i/s.GDP;
s.labinc = s.Labinc_y/s.GDP;
s.w_ratio = (1-s.tau_lw)*s.w_f/s.w_i;
s.hc_loss = (s.hc_f*s.H_f+s.hc_i*s.H_i)/s.GDP;

% fiscal, savings
s.gb = s.GB/s.GDP; s.pb = s.PB/s.GDP; 
s.exp = s.Ex/s.GDP; s.rev = s.Rev/s.GDP; s.lump = s.Lump/s.GDP;
s.b_pen = s.B_pen/s.GDP; 
s.b_o = 1/(1+s.share)*s.B_o/s.GDP; s.b_y = s.share/(1+s.share)*s.B_y/s.GDP;

end