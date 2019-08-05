function [] = report_results(s,varnames,xlsfilename,tmax,datafilename)

for i=1:numel(varnames)
   s0.(varnames{i}) = s.(varnames{i})(1:tmax)';
end
tbl = struct2table(s0);
writetable(tbl,xlsfilename);

save(datafilename,'s');

end
