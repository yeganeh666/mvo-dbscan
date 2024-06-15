function outs = IMVO2_DBSCAN(prob,params)


%% select optimum params for improved dbscan clustering algorithm using IMVO2 
GlobalBest = IMVO2(prob,params);

%% clustering data using improved_dbscan
x = GlobalBest.Position;
[~,outs] = prob.CostFunction(x);
outs.GlobalBest = GlobalBest;
end

