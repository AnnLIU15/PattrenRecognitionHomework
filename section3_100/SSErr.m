function w=SSErr(X,y)
% 误差平方和分类器
%%%%%%%%%%%%%%%
% input
% X->二维向量
% y->从属类
%%%%%%%%%%%%%%%
% output
% w->估计向量
    w=(X*X')\(X*y');
end