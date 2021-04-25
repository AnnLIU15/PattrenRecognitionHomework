clc
clear
rng(0)%与randn('seed',0)一致
m=[-5  5;
   0  0];
%协方差
S=zeros(2,2,2);
for ii=1:2
   S(:,:,ii)=eye(2); 
end
P=[0.5,0.5];
N=400;
[X,y] = generate_gauss_classes(m,S,P,N);%生成高斯类
X(3,:)=1;                               %增加一维
ty1=y;                                  %画图用
y=-(-1).^y;                             %转为1 -1
w_ini=[100  1      -1       1;          %多个线初始值
       1    1       1       -250;
       0    100     1      1  ];
for ii = 1:size(w_ini,2)                %多次比较
    disp('#############################################')
    disp(['第' num2str(ii) '次计算'])
    fprintf('初始化向量w_ini=[%.04f,%.04f,%.04f],',w_ini(:,ii)')
    fprintf('即初始化曲线: %.04fx+%.04fy+%.04f=0\n',(w_ini(:,ii)'))
    str=sprintf('fig%d 初始化曲线: %.04fx+%.04fy+%.04f=0\n',ii,w_ini(:,ii)');
    wPerce1=perce(X,y,w_ini(:,ii));
    wSSErr1=SSErr(X,y);
    wLMSalg1= LMSalg(X,y,w_ini(:,ii));
    fprintf('感知器算法误差(%.04fx+%.04fy+%.04f=0):',(wPerce1'))
    fprintf('\n总体: %.04f A类: %.04f B类: %.04f\n',...
        sum(sign(wPerce1'*X)~=y)/N,...
        sum(sign(wPerce1'*X(:,1:N/2))~=y(:,1:N/2))/N*2,...
        sum(sign(wPerce1'*X(:,N/2+1:N))~=y(:,N/2+1:N))/N*2)
    fprintf('误差平方和算法误差(%.04fx+%.04fy+%.04f=0):',(wSSErr1'))
    fprintf('\n总体: %.04f A类: %.04f B类: %.04f\n',...
        sum(sign(wSSErr1'*X)~=y)/N,...
        sum(sign(wSSErr1'*X(:,1:N/2))~=y(:,1:N/2))/N*2,...
        sum(sign(wSSErr1'*X(:,N/2+1:N))~=y(:,N/2+1:N))/N*2)
    fprintf('LMS算法误差 (%.04fx+%.04fy+%.04f=0):',(wLMSalg1'))
    fprintf('\n总体: %.04f A类: %.04f B类: %.04f\n',...
        sum(sign(wLMSalg1'*X)~=y)/N,...
        sum(sign(wLMSalg1'*X(:,1:N/2))~=y(:,1:N/2))/N*2,...
        sum(sign(wLMSalg1'*X(:,N/2+1:N))~=y(:,N/2+1:N))/N*2)
    disp('#############################################')
    plotTotal(X,ty1,[wPerce1,wSSErr1,wLMSalg1],ii,str)
    axis([-10,10,-10,10])
end
