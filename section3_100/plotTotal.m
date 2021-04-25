function  plotTotal(X,y,w,figNum,str)
%PLOTTOTAL 画P100 3.1图
%   此处显示详细说明
    if (nargin<5)
        str = ['fig' num2str(figNum)];
    end
    pale =['m-';'c-';'k-'];
    figure(figNum)
    axis([-10 10 -10 10])
    hold on
    grid on
    xlabel('x')
    ylabel('y')
    title(str)
    lgd=zeros(1,3);%给线端赋予legend
    palePoint =['r.';'g.';'b.';'y.';'m.';'c.'];
    for ii=1:size(X,2)
        plot(X(1,ii),X(2,ii),palePoint(y(1,ii),:)); %画点
    end
    for ii=1:size(w,2)
        x=linspace(-10,10);
        y=-[w(1,ii) w(3,ii)]/(w(2,ii)+1e-15)*[x;ones(1,size(x,2))];
        lgd(ii)=plot(x,y,pale(ii,:));
    end
    legend(lgd,'Perce' ,'SSErr', 'LMSalg')
    %求出有多少个类
    % 只适合二维点，不满足则返回
end

