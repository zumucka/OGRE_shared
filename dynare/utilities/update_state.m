function [s] = update_state(s0,varargin)

p = inputParser;
addOptional(p, 'vars', {}, @iscell);
addOptional(p, 'exo', '', @ischar);
addOptional(p, 'endo', '', @ischar);
addOptional(p, 'values', [], @isnumeric);
addOptional(p, 'delta', true, @islogical);
p.KeepUnmatched = true;
parse(p,varargin{:});

s = s0;

values = p.Results.values;
delta = p.Results.delta; 
vars = p.Results.vars;

if ~isempty(vars)
    n = length(vars);
    for i=1:n
        if delta
            s.(vars{i}) = s.(vars{i})+values(i);
        else
            s.(vars{i}) = values(i);
        end
    end
    values = values(n+1:end);
end

exo = p.Results.exo;
endo = p.Results.endo;

if ~isempty(exo)    
    if strcmp('share',exo)
        if delta
            share0 = s.prob_ret/(s.prob_die-s.prob_ret+s.fert);
            share = share0+values;
        else
            share = values;
        end
        if strcmp('prob_ret',endo)
            s.prob_ret = share*(s.prob_die+s.fert)/(1+share);
        elseif strcmp('prob_die',endo)
            s.prob_die = s.prob_ret*(1+1/share)-s.fert;
        else
            s.fert = s.prob_ret*(1+1/share)-s.prob_die;
        end
    end
end