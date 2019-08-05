function [] = report_data_all(s,T,varnames,varlabels,snames,filename)

fid = fopen(filename,'w');
n = length(snames);
f = cell(1,n); f(:) = {'%s\t'};
strarr = strcat('%s:\t',strjoin(f),'\n');
fprintf(fid,strarr,'vars/times',snames{:});
m = length(varnames);

for i = 1:m
    fprintf(fid,'%s:',varlabels{i});
    for j = 1:n
       x = 100*s{j}.(varnames{i})(T);
       fprintf(fid,'\t%2.2f',x);
    end
    fprintf(fid,'\n');    
end

fclose(fid);

end