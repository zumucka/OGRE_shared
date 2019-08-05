function [sim] = simulate_simple_shock(mod,per,shkname,shksize,infull,antic,pre)

if infull
    db = sstatedb(mod,1-pre:per);
else
    db = zerodb(mod,1-pre:per);
end
db.(shkname)(1) = shksize;
simplan = plan(mod,1:per);
sim = simulate(mod,db,1-pre:per,'Anticipate',antic,'Plan',simplan,'Deviations',~infull);

end

