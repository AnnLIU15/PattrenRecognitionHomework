function [X,y] = generate_gauss_classes(m,S,P,N)
% 二维高斯序列产生器
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input
% N->序列总个数
% y->对应点的从属类
% m->各类的均值
% P->各类的概率分布
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output
% x->类点
% y->类
    [~,c] = size(m);
    X=zeros(2,sum(P*N));
    y=zeros(1,sum(P*N));
    index=1;
    for jj=1:c
        totalnum=fix(P(jj)*N);
        t = mvnrnd(m(:,jj),S(:,:,jj),totalnum);
        X(:,index:index+totalnum-1)=t';
        y(:,index:index+totalnum-1)=ones(1,fix(P(jj)*N))*jj;
        index=index+totalnum;
    end