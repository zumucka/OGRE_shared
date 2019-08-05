function [] = plot_data(s,T,varnames,labels)

n = length(varnames);
% z = zeros(T,1);

for i = 1:n
    varname = varnames{i};
    j = mod(i-1,4);
    if mod(i-1,4)==0
        figure;
    end
    subplot(2,2,j+1);
    plot(s.(varname)(1:T),'linewidth',1.5);hold on;
    % plot(z,'k','linewidth',1);
    title(strrep(labels{i},'_','\_'));
    xlabel('time');
    grid on;
end    

end