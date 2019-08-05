function [s] = process_sstate(M_,oo_)

varnames_endo_all = cellstr(M_.endo_names);
varnames_exo_all = cellstr(M_.exo_names);
values_endo = oo_.steady_state;
values_exo = oo_.exo_steady_state;

names_endo = {'share','C','C_o','C_y',...
    'Pen','Inc_o','Labinc_y','Profinc_y','r','z','g','B_y','B_o','K',...
    'I','GDP','prob_h','L','w','tau_lw','GB','PB','Ex','Rev','tau_pi','tau_sw','tau_sf',...
    'tau_c','Lump','Profit','hc','H','B_pen','nu','Gov_GDP',...
    'Uwu_GDP','tau_c_rev_GDP','tau_pi_rev_GDP','tau_sf_rev_GDP','tau_sw_rev_GDP'};
for i=1:numel(names_endo)
    s.(names_endo{i}) = values_endo(strcmp(names_endo{i},varnames_endo_all)); 
end

names_exo = {'prob_die','prob_ret','fert'};
for i=1:numel(names_exo)
    s.(names_exo{i}) = values_exo(strcmp(names_exo{i},varnames_exo_all)); 
end

% households
s.C_o_ratio = s.C_o/(1+s.share);
s.C_y_ratio = s.C_y*s.share/(1+s.share);
s.Income_y = s.Labinc_y+s.Profinc_y+s.r*(1-s.prob_ret)/(1+s.g)*s.B_y;
s.C_Income_y = s.C_y/s.Income_y;
s.Income_o = s.Inc_o+s.Pen+s.r*(s.prob_ret*s.B_y+s.B_o)/(1+s.g);
s.C_Income_o = s.C_o/s.Income_o;
s.c = s.C/s.GDP; s.c_o = s.C_o_ratio/s.GDP; s.c_y = s.C_y_ratio/s.GDP;

% firms & production
s.inv = s.I/s.GDP; s.net_profit = (s.Profit-s.Lump)/s.GDP;

% labour market
s.labinc = s.Labinc_y/s.GDP;

% fiscal, savings
s.gb = s.GB/s.GDP; s.pb = s.PB/s.GDP; 
s.exp = s.Ex/s.GDP; s.rev = s.Rev/s.GDP; s.lump = s.Lump/s.GDP;
s.b_pen = s.B_pen/s.GDP; 
s.b_o = 1/(1+s.share)*s.B_o/s.GDP; s.b_y = s.share/(1+s.share)*s.B_y/s.GDP;
s.Lump_GDP = s.Lump/s.GDP;

end