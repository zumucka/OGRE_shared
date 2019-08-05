function [s] = calculate_shock(x,rho)

s = x;
n = length(x)-1;
for i=1:n
    s(i) = x(i+1)-rho*x(i)-(1-rho)*x(1);
end
s(end) = [];

end

