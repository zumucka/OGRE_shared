function [ini] = sstate_ini(pension_type)

ini = struct;

if pension_type == pension.PAYG
    ini.r = 0.05;
    ini.prob_h = 0.5;    
else
    ini.r = 0.05;
    ini.prob_h = 0.3;
end

end

