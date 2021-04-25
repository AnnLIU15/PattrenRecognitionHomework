function w=perce(X,y,w_ini)
% 感知算法
%%%%%%%%%%%%%%%
% input
% X->二维向量
% y->从属类
% w_ini->初始化估计向量参数
%%%%%%%%%%%%%%%
% output
% w->估计向量
    [l,N]=size(X);
    maxIter=1e4;
    rho=0.05;
    w=w_ini;
    iter=0;
    misClass=N;
    while((misClass>0)&&(iter<maxIter))
        iter=iter+1;
        misClass=0;
        gradi=zeros(l,1);%计算梯度
        for ii=1:N
            if((X(:,ii)'*w)*y(ii)<0)
                misClass=misClass+1;
                gradi=gradi+rho*(-y(ii)*X(:,ii));
            end
        end
        w=w-rho*gradi;
    end
end