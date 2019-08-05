function [] = plot_data_all(s,T,varnames,labels,types)

n = length(varnames);
z = zeros(T,1);
m = length(s);

for i = 1:n
    varname = varnames{i};
    j = mod(i-1,4);
    if mod(i-1,4)==0
        figure;
    end
    subplot(2,2,j+1);
    for k = 1:m
        plot(100*s{k}.(varname)(1:T),'linewidth',1.5);hold on;
    end
    plot(z,'k','linewidth',1);
    legend(types);
    title(labels{i});
    xlabel('time');
    grid on;
end    

end