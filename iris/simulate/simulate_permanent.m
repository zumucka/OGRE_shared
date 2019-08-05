function [sim,sim0] = simulate_permanent(mod_init,mod_term,per,endolist,exopaths,antic)

db = sstatedb(mod_init,1:per);

exolist = fieldnames(exopaths);
for i=1:numel(exolist)
    db.(exolist{i})(1:per) = exopaths.(exolist{i});
end
sp = plan(mod_term,1:per);
sp = endogenise(sp,endolist,1:per);
sp = exogenise(sp,exolist,1:per);

sim = simulate(mod_term,db,1:per,'plan',sp,'anticipate',antic,'deviation',false);

sim0 = dbminuscontrol(mod_term, sim, db);

end