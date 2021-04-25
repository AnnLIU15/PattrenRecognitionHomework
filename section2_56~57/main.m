clc
clear
%总点数
N=20;
%类概率
P=[0.1 0.2 0.3 0.15 0.1 0.15];
%均值
m=[-1,-4,0,-10,6,-16;
    -3,6,0,1,-10,-7];
%协方差
S=zeros(2,2,6);
for ii=1:6
    X = diag(rand(2,1));
    U = orth(rand(2,2));
    S(:,:,ii)=U' * X * U;
end
%生成特定二维随机数
[X,y] = generate_gauss_classes(m,S,P,N);
%画出这些点，并且观察其与均值点近似程度
plot_data(X,y,m);
%求出他们的贝叶斯分类
bayes_classes= bayes_classifier(m,S,P,X);
%求出他们的欧几里得分类
euclidean_classes = euclidean_classifier(m,X);
%求出他们的mahalanobis分类
mahalanobis_classes = mahalanobis_classifier(m,S,X);
disp('原始类:')
disp(y)
disp('bayes_classes:')
disp(bayes_classes)
disp('euclidean_classes:')
disp(euclidean_classes)
disp('mahalanobis_classes:')
disp(mahalanobis_classes)
