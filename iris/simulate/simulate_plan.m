function [sim] = simulate_plan(mod,per,endolist,exopaths,infull,antic)

if infull
    db = sstatedb(mod,1:per);
else
    db = zerodb(mod,1:per);
end
exolist = fieldnames(exopaths);
for i=1:numel(exolist)
    db.(exolist{i})(1:per) = exopaths.(exolist{i});
end
sp = plan(mod,1:per);
sp = endogenise(sp,endolist,1:per);
sp = exogenise(sp,exolist,1:per);

sim = simulate(mod,db,1:per,'plan',sp,'anticipate',antic,'deviation',~infull);

end