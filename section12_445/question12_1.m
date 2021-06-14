clc
clear
% 数据点x1~x8
x1=[2;5];x2=[8;4];x3=[7;3];x4=[2;2];
x5=[1;4];x6=[7;2];x7=[3;3];x8=[2;3];
% 数据向量
X=[x1,x2,x3,x4,x5,x6,x7,x8];
% 不显示图像，直接保存
set(gcf,'visible','off')
% 描绘散点图
scatter(X(1,:),X(2,:))
title('P445 12.1 数据向量图')
axis([-2,10,-2,10])
hold on
grid on
for ii=1:max(size(X,2))
    % 增加文本，显示x1~x8的位置
    c = ['x',num2str(ii-1)];
    text(X(1,ii),X(2,ii),c);
end