function [v] = set_value_term(name,delta)

load 'results/workspace_ini.mat' 'oo_' 'M_'
v = oo_.steady_state(strcmp(name,cellstr(M_.endo_names)))+delta*oo_.steady_state(strcmp('GDP',cellstr(M_.endo_names)));

end
