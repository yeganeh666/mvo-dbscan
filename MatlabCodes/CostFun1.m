function [cost,outs] = CostFun1(x,P,y)
% based on " A New DBSCAN Parameters Determination Method Based on Improved MVO"

% x = [E, minPts]

E = x(1);
minPts = round(x(2));

[ptsC,ptsClusters,N_clusters,Pvisit] = dbscan(P, E, minPts);
outs.C = ptsClusters;
outs.ptsC = ptsC;
outs.Nc = N_clusters;
outs.Pvisit = Pvisit;

[~,err] = ClusteringEvaluation1(ptsC,y);

f = err; % objective 

if N_clusters>0
    cost = f;
else
    cost = inf;
end
end
