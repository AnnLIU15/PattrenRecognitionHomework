clc
clear
x1=[2;5];x2=[8;4];x3=[7;3];x4=[2;2];
x5=[1;4];x6=[7;2];x7=[3;3];x8=[2;3];
X=[x1,x2,x3,x4,x5,x6,x7,x8];
set(gcf,'visible','off')
scatter(X(1,:),X(2,:))
title('P445 12.1 数据向量图')
axis([-2,10,-2,10])
hold on
grid on
for ii=1:max(size(X,2))
    c = ['x',num2str(ii-1)];
    text(X(1,ii),X(2,ii),c);
end