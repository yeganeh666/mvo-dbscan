function outs = MVO_DBSCAN(prob,params)


%% select optimum params for improved dbscan clustering algorithm using MVO 
GlobalBest = MVO(prob,params);

%% clustering data using improved_dbscan
x = GlobalBest.Position;
[~,outs] = prob.CostFunction(x);
outs.GlobalBest = GlobalBest;
end

