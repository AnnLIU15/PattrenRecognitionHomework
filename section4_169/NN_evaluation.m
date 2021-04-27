function pe = NN_evaluation(net,x,y)
%NN_EVALUATION 评估BP网络性能
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input
% X->二维点
% y->对应点的从属类
% net->反向传播网络的网络图
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output
% pe->错误率
    y1=sim(net,x);%将x输入网络，得到网络输出y1
    pe=sum(y.*y1<0)/length(y);%输出结果以符号判别类，算出错误率
end

