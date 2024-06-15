function inits  = initialization_artificial_rep(data,AlgName)

X = data.X; % points
y = data.y; %labels
K = data.k; % number of clusters
dataName = data.dataName;

%% select an optimum value for eps(E)
% simMeasure = 'euclidean';
% minPts = data.k;
% X = data.X;
% distMat = pdist2(X,X,simMeasure);
% distMat = sort(distMat,2);
% h = figure;
% k_dist = sort(distMat(:,minPts),'descend');
% plot(k_dist);
% xlabel('Points(samples) sorted by distance')
% ylabel([num2str(minPts),'-NN distance']);
% E_lb = min(k_dist);
% E_ub = max(k_dist);


if strcmp(dataName,'Aggregation')
    E_lb = 0.5;
    E_ub = 2.5;
    
    minPts_lb = 7;
    minPts_ub = 7;
    
end
if strcmp(dataName,'Compound')
    E_lb = 0.5;
    E_ub = 5;
    
    minPts_lb = 6;
    minPts_ub = 6;
    
end
if strcmp(dataName,'R15')
    E_lb = 0.2;
    E_ub = 1;
    
    minPts_lb = 15;
    minPts_ub = 15;
    
end
if strcmp(dataName,'spiral')
    E_lb = 0.1;
    E_ub = 2;
    
    minPts_lb = 3;
    minPts_ub = 5;
    
end



if strcmp(AlgName,'MVO-DBSCAN')||strcmp(AlgName,'IMVO1-DBSCAN')||strcmp(AlgName,'IMVO2-DBSCAN')
    
    prob.nVar= 2;   % Number of Decision Variables
    prob.VarMin= [E_lb, minPts_lb];  % Lower Bound of Variables
    prob.VarMax=[E_ub, minPts_ub]; %Upper Bound of Variables
    
    prob.CostFunction=@(solution) CostFun1(solution,X',y); % Cost Function
%     prob.CostFunction=@(solution) CostFun2(solution,X',K); % Cost Function
    
    % MVO Parameters
    params.MaxIt=20;	           % Maximum Number of Iterations
    params.nPop=50;	               % Population Size
    params.dispFlag=1;             % display results each iteration flag
    
    inits.prob = prob;
    inits.params = params;
end



if strcmp(AlgName,'DBSCAN')
    
    if strcmp(dataName,'Aggregation')
        inits.E = 1.3;
        inits.minPts = 7;
    end
    if strcmp(dataName,'Compound')
        inits.E = 1.8;
        inits.minPts = 6;
    end
    if strcmp(dataName,'R15')
        inits.E = 0.4;
        inits.minPts = 15;
    end
    if strcmp(dataName,'spiral')
        inits.E = 2;
        inits.minPts = 5;
    end    
          
end


end

