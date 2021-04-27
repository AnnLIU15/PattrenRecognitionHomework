clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng(0)
% 均值向量
m=[-5 5 5 -5;
   5 -5 5 -5];
s=2;
N=100;
% 数据集1 训练集
[x1,y1] = data_genertor(m,s,N);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng(10)
% 数据集2 测试集
[x2,y2] = data_genertor(m,s,N);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=15;% 第一层节点15
code=1;% 选标准BP
iter=1e3;% 1000次迭代
lr=[0.01,2,4];% 学习率
mc=1e-3;% 动量
for ii=1:size(lr,2)
    par_vec=[lr(ii) mc 0 0 0 0];
    net = NN_training(x1,y1,k,code,iter,par_vec);
    pe = NN_evaluation(net,x2,y2);
    fprintf('第%d次训练网络 lr=%.2f 错误率pe=%.4f\n',ii,lr(ii),pe)
    limits=[-10 10 -10 10 0.2 0.2];
    plot_dec_region(net,limits,m,ii)
    % 按键继续
    pause
end
