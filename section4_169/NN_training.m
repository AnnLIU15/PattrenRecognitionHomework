function [net] = NN_training(x,y,k,code,iter,par_vec)
% NN_TRAINING 标准BP算法(Error Back Propagation错误反向传播算法)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input
% X->二维点
% y->对应点的从属类
% k->第一层节点数
% code->训练方法 标准、动量、自适应
% iter->迭代次数
% par_vec->参数向量包括[lr(学习率),mc(动量参数),lr_inc(ri),lr_dec(rc),max_perf_inc(c)]
% 标准BP的时候后四位为0 动量BP后三位为0 自适应第二位为0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output
% net->反向传播网络的网络图
    rng(0) % 设置seed rng使用非负整数 seed 为随机数生成器提供种子，以使 rand、randi 和 randn 生成可预测的数字序列。
    % 控制条件
    % 网络列表
    methods_list={'traingd';'traingdm';'traingda'};
    % 将训练结果输出数据限制在训练集范围之内
    % limit=[min(x(:,1)) max(x(:,1));min(x(:,2)) max(x(:,2))];
    % 神经网络的定义
    % net=newff(limit,[k 1],{'tansig','tansig'},methods_list{code,1});
    % 用旧版newff会有Warnning，故改用新版
    net=newff(x,y,k,{'tansig','tansig'},methods_list{code,1});
    % 神经网络的初始化
    net=init(net);
    % 参数设置
    net.trainParam.epochs=iter;
    net.trainParam.lr=par_vec(1);
    if(2==code)
        net.trainParam.mc=par_vec(2);
    elseif(3==code)
        net.trainParam.lr_inc=par_vec(3);
        net.trainParam.lr_dec=par_vec(4);
        net.trainParam.max_perf_inc=par_vec(5);
    end
    % 神经网络训练
    net=train(net,x,y);
    % 训练过程中会画出MSE曲线
end

