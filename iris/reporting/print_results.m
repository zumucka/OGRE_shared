function [] = print_results(varargin)

p = inputParser;
addOptional(p, 'data', [], @isnumeric);
addOptional(p, 'label', '', @ischar);
addOptional(p, 'vars', {}, @iscell);
addOptional(p, 'opt', {}, @iscell);
addOptional(p, 'filename', 'results/report.txt', @ischar);
p.KeepUnmatched = true;
parse(p,varargin{:});

filename = p.Results.filename;
label = p.Results.label;
data = p.Results.data;
vars = p.Results.vars;
opt = p.Results.opt;

[M,N] = size(data);
fid = fopen(filename, 'w');
fprintf(fid,'Pension system: %s\n\n', label);
fprintf('Pension system: %s\n\n', label);

L = zeros(M,1);
for i=1:M
    L(i) = length(vars{i});
end
Lmax = max(L);
for i=1:M
    vars{i}(L(i)+1:Lmax) = ' ';
end

f = cell(1,N); f(:) = {'%d\t\t'};
v = 'Scenario index';
v(length(v)+1:Lmax) = ' '; v(Lmax+1:Lmax+3) = ':\t';
strarr = strcat(v,strjoin(f),'\n');
fprintf(fid,strarr, 1:N);
fprintf(strarr, 1:N);

f = cell(1,N); f(:) = {'%2.4f\t'};
strarr = strcat('%s:\t',strjoin(f),'\n');
for i = 1:M
    fprintf(fid,strarr,vars{i},data(i,:));
    fprintf(strarr,vars{i},data(i,:));
end

fprintf(fid,'\nLegend\n');
fprintf('\nLegend\n');
for i = 1:N
    fprintf(fid,'%d = %s\n',i,opt{i});
    fprintf('%d = %s\n',i,opt{i});
end

fclose(fid);

end