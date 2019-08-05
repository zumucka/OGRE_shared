function [] = report_data(s, Tarr, varnames, labels, filename, sname,tmax,xlsfilename)

% xls data
for i=1:numel(varnames)
   s0.(varnames{i}) = s.(varnames{i})(1:tmax)';
end
tbl = struct2table(s0);
writetable(tbl,xlsfilename);

% report selected data
n = length(varnames); 
Tarr = sort(Tarr);
tn = length(Tarr);

fid = fopen(filename,'w');
fprintf(fid,'scenario: \t%s\n',sname);
f = cell(1,tn); f(:) = {'%d\t'};
strarr = strcat('%s:\t',strjoin(f),'\n');
fprintf(fid,strarr,'100*vars/times',Tarr);

f = cell(1,tn); f(:) = {'%2.2f\t'};
strarr = strcat('%s:\t',strjoin(f),'\n');
for i = 1:n
    x = s.(varnames{i})(Tarr);
    fprintf(fid,strarr,labels{i},100*x);
end

fclose(fid);

end

            