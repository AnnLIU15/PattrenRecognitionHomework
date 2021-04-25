clc
clear
%均值
m=[1  12  16;
   1  8   1];
%协方差
S=zeros(2,2,3);
for ii=1:3
   S(:,:,ii)=[4 0; 0 4]; 
end
P=[0.333,0.333,0.334];
%这里要使用1000故取[0.333,0.333,0.334]做到平分
N=1000;
[X,y] = generate_gauss_classes(m,S,P,N);
plot_data(X,y,m,'P59 2.2');
%求出他们的贝叶斯分类
bayes_classes= bayes_classifier(m,S,P,X);
%求出他们的欧几里得分类
euclidean_classes = euclidean_classifier(m,X);
%求出他们的mahalanobis分类
mahalanobis_classes = mahalanobis_classifier(m,S,X);
%显示出距离
disp('原有距离')
disp(y)
disp('贝叶斯分类')
disp(bayes_classes)
disp('欧几里得距离')
disp(euclidean_classes)
disp('mahalanobis距离')
disp(mahalanobis_classes)

%显示出分类错误率
disp('bayes_classes error:')
disp(sum(y~=bayes_classes)/N)
disp('euclidean_classes error:')
disp(sum(y~=euclidean_classes)/N)
disp('mahalanobis_classes error:')
disp(sum(y~=mahalanobis_classes)/N)
