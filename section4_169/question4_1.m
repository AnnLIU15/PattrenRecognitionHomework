clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng(0)
% 均值向量
m=[-5 5 5 -5;
   5 -5 5 -5];
s=2;
N=100;
% 数据集1
[x1,y1] = data_genertor(m,s,N);
plot_point(x1,(y1+1)/2+1,m,1,4,'(a) 本次data_genertor设置rng(0)   s=2   N=100',1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng(10)
% 数据集2
[x2,y2] = data_genertor(m,s,N);
plot_point(x2,(y2+1)/2+1,m,1,4,'(b) 本次data_genertor设置rng(10)   s=2   N=100',2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng(0)
s=5;
% 数据集3
[x3,y3] = data_genertor(m,s,N);
plot_point(x3,(y3+1)/2+1,m,1,4,'(c1) 本次data_genertor设置rng(0)   s=5   N=100',3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng(10)
% 数据集4
[x4,y4] = data_genertor(m,s,N);
plot_point(x4,(y4+1)/2+1,m,1,4,'(c2) 本次data_genertor设置rng(10)   s=5   N=100',4)
figure(1)
sgtitle('P167 4.1')
