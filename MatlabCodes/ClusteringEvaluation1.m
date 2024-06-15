function [Accuracy,err] = ClusteringEvaluation1(clus,label)
classes = unique(label);
for i = 1:length(classes)
    
    c = classes(i);
    I1 = label==c;
    
    temp = clus(I1);
    a = tabulate(temp);
    [~,ind] = max(a(:,2));
    I2 = clus == a(ind,1);
    
    yi = zeros(size(label));
    yi(I1) = 1;  % true label for i class
    yi_hat = zeros(size(label));
    yi_hat(I2) = 1; % predic label for i class
    
    [SE(i,1)] = SumOfError(yi,yi_hat);
    
end
err = sum(SE)/length(label);
Accuracy = (1 - err)*100;

end

function se = SumOfError(y,y_pred)
se = sum(abs(y - y_pred));
end

