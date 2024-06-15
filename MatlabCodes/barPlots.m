function [] = barPlots(resultPath,resultName,dataNames,Algorithms)
temp = load([resultPath,resultName]);
Outs = temp.results;
idx1 = find(ismember(Algorithms, 'DBSCAN'));
% idx2 = find(ismember(Algorithms, 'HOA-DBSCAN'));
for i = 1:length(dataNames)
    Out = Outs{i};
    F_measure = mean(Out.F_measure,1);
    MeanAccuracy = mean(Out.MeanAccuracy,1);
    err = mean(Out.err,1);
    
    saveName = [resultPath,dataNames{i}];
    mBar(saveName,Algorithms,F_measure,'F-measure');
    mBar(saveName,Algorithms,MeanAccuracy,'Accuracy');
    mBar(saveName,Algorithms,err,'error');
    save([saveName,'_barPlotsValus'],'F_measure','MeanAccuracy','err');
    close all
    
end
end


function [] = mBar(resultPath,Algorithms,dataMat,yLabelVal)
m = length(dataMat);
colors=[0 0 1
    0 1 0
    1 0 0];
Alg_n = length(Algorithms);
if Alg_n>3
    colors = hsv(Alg_n);
end

h=figure;
width=0.2;
x = 0.1;
XLim=[0 x+m*width+x];
YLim=[0 max(dataMat(:))+0.1];

axes;
set(gca,'XLim',XLim,'YLim',YLim)
set(gca,'xtick',[])
ylabel(yLabelVal);

for alg=1:m
    height=dataMat(alg);
    hold on
    h2=rectangle('Position',[x 0 width height],'FaceColor',colors(alg,:));
    x=x+width;
    p(1,alg)=plot(nan,nan,'s','markeredgecolor',get(h2,'edgecolor'),...
        'markerfacecolor',get(h2,'facecolor'));
end
legend(p,upper(Algorithms),'Location','northeastoutside')
plotName = yLabelVal;
print(h,[resultPath,'_',plotName],'-djpeg')
end
