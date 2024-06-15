function h = PlotClusteringResults(X,ClusInd)
h = figure;

clusNames = unique(ClusInd);

k = length(clusNames);

Colors = hsv(k);

for j=1:k
    Xj = X(ClusInd==clusNames(j),:);
    if clusNames(j) == 0 %noise
        plot(Xj(:,1),Xj(:,2),'O','LineWidth',1,'Color',Colors(j,:));
        hold on;
    else
        plot(Xj(:,1),Xj(:,2),'x','LineWidth',1,'Color',Colors(j,:));
        hold on;
    end
end

hold off;
grid on;

end