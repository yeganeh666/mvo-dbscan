
clc
clear
close all

dataStorage = 'Datasets\';
resultPath ='results\';
if ~exist(resultPath,'dir')
    mkdir(resultPath);
end

DataReposity = {'artificial'};

Algorithms ={'MVO-DBSCAN','IMVO1-DBSCAN','IMVO2-DBSCAN','DBSCAN'};
MaxRun = 1;

for rep = 1:length(DataReposity)
    rep
    dataPath = [dataStorage,DataReposity{rep},'\'];
    
    pathInfo = dir([dataPath,'*.txt']);
    
    for ii = 1:length(pathInfo)
        temp = strsplit(pathInfo(ii).name,'.');
        dataNames{ii} = temp{1};
    end
    
    for i = 1:length(dataNames)
        dataName = dataNames{i};
        data = LoadDataset(dataPath,DataReposity{rep},dataName);
        data.dataName = dataName;
        
        for j = 1:length(Algorithms)
            AlgName = Algorithms{j}
            inits  = initialization(DataReposity{rep},data,AlgName);
            
            for run = 1:MaxRun
                
                if strcmp(AlgName,'MVO-DBSCAN')
                    
                    % execute clustering method on the problem
                    out = MVO_DBSCAN(inits.prob,inits.params);
                    clus = out.ptsC;
                    C = out.C;
                    Nc = out.Nc;
                    
                end
                
                if strcmp(AlgName,'IMVO1-DBSCAN')
                    
                    % execute clustering method on the problem
                    out = IMVO1_DBSCAN(inits.prob,inits.params);
                    clus = out.ptsC;
                    C = out.C;
                    Nc = out.Nc;
                    
                end
                
                if strcmp(AlgName,'IMVO2-DBSCAN')
                    
                    % execute clustering method on the problem
                    out = IMVO2_DBSCAN(inits.prob,inits.params);
                    clus = out.ptsC;
                    C = out.C;
                    Nc = out.Nc;
                    
                end
                
                if strcmp(AlgName,'DBSCAN')
                    
                    % execute clustering method on the problem
                    X = data.X; % points
                    [ptsC,C,Nc,Pvisit] = dbscan(X', inits.E, inits.minPts);
                    clus = ptsC;
                    
                end
                
                %% save results
                savePath = [resultPath,DataReposity{rep},'\',AlgName,'\'];
                if ~exist(savePath,'dir')
                    mkdir(savePath);
                end
                
                if run == 1
                    if  size(data.X,2) == 2
                        h = PlotClusteringResults(data.X,clus);
                        print(h,[savePath,dataName],'-djpeg','-r300')
                        close(h);
                    end
                    if strcmp(AlgName,'DBSCAN')
                        save([savePath,dataName,'_outs'],'clus','C','Nc');
                    else
                        GlobalBest = out.GlobalBest;
                        save([savePath,dataName,'_outs'],'clus','C','Nc','GlobalBest');
                    end
                    
                end
                
                %%  Evaluation
                [results{i}.MeanAccuracy(run,j),results{i}.err(run,j)] = ...
                    ClusteringEvaluation1(clus,data.y);
                [results{i}.F_measure(run,j)] =  ClusteringEvaluation2(clus,data.y);
                
            end
        end
        results{i}.dataName = dataName;
        
    end
    save([resultPath,DataReposity{rep},'\','results'],'results');
    % bar plot
    resultName = 'results';
    barPlots([resultPath,DataReposity{rep},'\'],resultName,dataNames,Algorithms);
    clear results dataNames
end
