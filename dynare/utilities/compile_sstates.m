function [] = compile_sstates(s0,s1,varnames,labels,filename,sname)

n = length(varnames);

fid = fopen(filename,'w');
fprintf(fid,'scenario:\t%s\n',sname);

for i=1:n
    x0 = s0.(varnames{i});
    x1 = s1.(varnames{i});
    fprintf(fid,'%s:\t%2.4f\t%2.4f\n',labels{i},x0,x1);
end

fclose(fid);

end