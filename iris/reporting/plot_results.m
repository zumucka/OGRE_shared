function [] = plot_results(varargin)

p = inputParser;
addOptional(p, 'data', {}, @iscell);
addOptional(p, 'init', {}, @iscell);
addOptional(p, 'term', {}, @iscell);
addOptional(p, 'label', '', @ischar);
addOptional(p, 'vars', {}, @iscell);
addOptional(p, 'opt', {}, @iscell);
addOptional(p, 'legend', {}, @iscell);
addOptional(p, 'tmax', [], @isnumeric);
p.KeepUnmatched = true;
parse(p,varargin{:});

data = p.Results.data;%cellarray of struct
tit = p.Results.label;
vars = p.Results.vars;%M
leg = p.Results.legend;
l = {};
init = p.Results.init;
term = p.Results.term;
tmax = p.Results.tmax;

N = length(data);
M = length(vars);
for i=1:M
    k = mod(i-1,4)+1;
    if k==1
        figure('Name',tit);
    end
    subplot(2,2,k);
    for j=1:N
        x = data{j}.(vars{i});
        if i==1 && j== 1 && isempty(tmax)
            tmax = length(x);
        end
        x0 = x(1);
        if max(abs(x-x0))<1e-4
            x = x0+0*x;
        end
        x = 100*x(1:tmax);
        pp = plot(x,'linewidth',1);hold on; 
        if ~isempty(term)
            x1 = term{j}.(vars{i});            
            stem(tmax,x1,'Color',pp.Color); hold on;
        end           
        if ~isempty(init)
            x0 = init{j}.(vars{i});
            stem(1,x0,'k'); hold on;
        end          
    end
    grid on;
    if k==4 && ~isempty(leg)
        legend(leg);
    end
    title(strrep(vars{i},'_','\_'));
end

end