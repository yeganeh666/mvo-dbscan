function [cost,outs] = CostFun2(x,P,k)
% based on " Application of the novel harmony search optimization algorithm for
%DBSCAN clustering"

% x = [E, minPts]

E = x(1);
minPts = round(x(2));

[ptsC,ptsClusters,N_clusters,Pvisit] = dbscan(P, E, minPts);
outs.C = ptsClusters;
outs.ptsC = ptsC;
outs.Nc = N_clusters;
outs.Pvisit = Pvisit;


f1 = abs(N_clusters-k)/k; % objective 1

n_noises = sum(ptsC==0);
f2 = n_noises/length(ptsC); % objective 2


c = [0.5,0.5];
if N_clusters>0
    cost = c(1)*f1 + c(2)*f2;
else
    cost = inf;
end
end
