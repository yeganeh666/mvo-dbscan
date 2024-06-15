function outs = IMVO1_DBSCAN(prob,params)


%% select optimum params for improved dbscan clustering algorithm using IMVO1 
GlobalBest = IMVO1(prob,params);

%% clustering data using improved_dbscan
x = GlobalBest.Position;
[~,outs] = prob.CostFunction(x);
outs.GlobalBest = GlobalBest;
end

