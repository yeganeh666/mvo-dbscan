function D = LoadDataset(dataPath,Reposity,dataName)

if ~exist([dataPath,dataName,'.mat'],'file')
    
    % --- load data ----
    data = importdata([dataPath,dataName,'.txt']);
    X = data(:,1:end-1);
    y = data(:,end);

    D.X = X;
    D.y = y;
    D.k = length(unique(y)); % default number of clusters
    
    save([dataPath,dataName,'.mat'],'D');
else
    load([dataPath,dataName,'.mat']);
end
end

