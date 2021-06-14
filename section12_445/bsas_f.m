function [bel,m]=bsas_f(x,theta,q,order)
% MBSAS算法
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUT
% x     ===> 数据
% theta ===> 阈值
% q     ===> 迭代次数
% order ===> 排序
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OUTPUT
% bel   ===> 所属类类别
% m     ===> 类中心
    [l,N]=size(x);
    % 给x重排序
    if length(order)==N                 % 满足条件的时候排序，不满足跳过
       x1=zeros(l,N);                   % 预分配空间
       for ii =1:N
          x1(:,ii)=x(:,order(ii));      % 重排序
       end
       x=x1;
       clear x1;
    end
    % 确定簇
    n_clust=1;                          % 第i个簇
    bel=zeros(1,N);
    bel(1)=n_clust;
    m=x(:,1);
    for ii = 2:N
       [m1,m2]=size(m);
       % 确定最近簇，并结合
       [s1,s2]=min(sqrt(sum((m-x(:,ii)*ones(1,m2)).^2)));
       if (s1>theta)&&(n_clust<q)
           n_clust=n_clust+1;
           bel(ii)=n_clust;
           m=[m x(:,ii)];
           bel(ii)=s2;
           m(:,s2)=((sum(bel==s2)-1)*m(:,s2)+x(:,ii))/sum(bel==s2);
       end
    end
end