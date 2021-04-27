function [x,y] = data_genertor(m,s,N)
% data_genertor 产生两类二维数据集合
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input
% m->均值
% s->方差参数，用作于计算协方差S=s*I
% N->总数据个数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output
% x->数据
% y->x中列向量对应的类
    S=s*eye(2);
    
    [~,c]=size(m);
    x=zeros(2,c*N);
    y=ones(1,c*N);
    for ii = 1:c
        % 生成类数值
       x(:,(ii-1)*N+1:ii*N)=mvnrnd(m(:,ii)',S,N)' ;
        
    end
        % 生成对应class
    y(:,floor(c*N/2)+1:c*N)=-1;
end

