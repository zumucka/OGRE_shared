function [sim] = simulate_multiple_shocks_cond(mod,per,shks,conds,infull,antic)

if infull
    db = sstatedb(mod,1:per);
else
    db = zerodb(mod,1:per);
end
shklist = fieldnames(shks);
for i=1:numel(shklist)
    db.(shklist{i})(1) = shks.(shklist{i});
end
condlist = fieldnames(conds);
for i=1:numel(condlist)
    db.(condlist{i})(1) = conds.(condlist{i});
end

simplan = plan(mod,1:per);
sim = simulate(mod,db,1:per,'Anticipate',antic,'Plan',simplan,'Deviations',~infull);

end