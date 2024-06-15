function F_measure_overall = ClusteringEvaluation2(clus,label)
uniq_label = unique(label);
uniq_clus = unique(clus);
uniq_clus(uniq_clus==0) = []; %noise

n = length(label);
n_true_cluster = length(uniq_label);
n_cluster = length(uniq_clus);
F_measure_overall = 0;
b = 1;
for i = 1:n_true_cluster
    I1 = label == uniq_label(i);
    ni = sum(I1);
    
    for j = 1:n_cluster
        I2 = clus == uniq_clus(j);
        
        nij = sum(I1&I2);
        nj = sum(I2);
        
        p(i,j) = nij/nj;
        r(i,j) = nij/ni;
        
        F(i,j) = ((b^2+1)*p(i,j)*r(i,j))/((b^2*p(i,j)+r(i,j))+eps);
        
    end
    
    F_measure_overall = F_measure_overall + (ni/n)*max(F(i,:));
end

end