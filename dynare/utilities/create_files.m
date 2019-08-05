function [] = create_files(var_list, value_list)

global scenario pension_system ref_per use_ref sim_per

generate_file('OGRE_header','scenario',scenario,'pension',pension_system');
s_ini = process_file('setparam/init_state_default.mod');
s_dyn = process_file('setparam/initialize_parameters_deep.mod')+...
    process_file('setparam/initialize_parameters_dynamic.mod');

if scenario<=2
    s_term = update_state(s_ini,'exo','share','endo',var_list{scenario+1},...
        'value',value_list(scenario+1),'delta',true);
    % shkvals = ar(s_ini.(var_list{scenario+1}), s_term.(var_list{scenario+1}),...
    %     s_dyn.(strcat('rho_',var_list{scenario+1})),sim_per);
    % x = shkvals;
    % x = s_term.(var_list{scenario+1})+zeros(sim_per+1,1);x(1) = s_ini.(var_list{scenario+1});
    x = 0.6*(s_term.(var_list{scenario+1})-s_ini.(var_list{scenario+1}))+zeros(sim_per,1);
    shkvals = x;
    shkfilename = strcat('setparam/shk_data_',num2str(scenario),'.mat');
    save(shkfilename,'x');
    generate_file('OGRE_shocks','per_init',1,'per_term',sim_per,...
        'values',shkvals,'shkname',strcat('shk_',var_list{scenario+1}),'shkfilename','');
else
    s_term = update_state(s_ini,'vars',{var_list{scenario+1}},...
        'value',value_list(scenario+1),'delta',true);  
    shkvals = ar(s_ini.(var_list{scenario+1}), s_term.(var_list{scenario+1}),...
        s_dyn.(strcat('rho_',var_list{scenario+1})),1);
    generate_file('OGRE_shocks','per_init',1,'per_term',ref_per,...
        'values',shkvals,'shkname',strcat('shk_',var_list{scenario+1}),'shkfilename','');
end

generate_file('OGRE_setup_sim','use_ref',use_ref');
term_filename = strcat('setparam/term_state_',num2str(scenario),'.mod');
generate_file('OGRE_terminal_state','data',s_term,'filename',term_filename);

generate_file('OGRE_simulate','sim_per',sim_per);

end

