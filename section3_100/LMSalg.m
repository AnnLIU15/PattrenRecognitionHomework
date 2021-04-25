function w= LMSalg(X,y,w_ini)
% LMS算法
%%%%%%%%%%%%%%%
% input
% X->二维向量
% y->从属类
% w_ini->初始化估计向量参数
%%%%%%%%%%%%%%%
% output
% w->估计向量
    [~,N]=size(X);
    rho=0.1;
    w=w_ini;
    for ii=1:N
        w=w+(rho/ii)*(y(ii)-X(:,ii)'*w)*X(:,ii); 
    end
end