function plot_data(X,y,m,str)
% 画出各类均值的点与各类的点
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input
% X->二维点
% y->对应点的从属类
% m->各类的均值
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output
% figure(1)
    if (nargin<3)
        str = 'P59 2.2图';
    end
    %求出有多少个数据
    
    [~,N]=size(X);
    %求出有多少个类
    [l,c]=size(m);
    % 只适合二维点，不满足则返回
    if(l~=2)
        fprintf('NO PLOT CAN BE GENERATED\n');
        return
    else
        pale =['r.';'g.';'b.';'y.';'m.';'c.'];
        figure(1)
        hold on
        grid on
        xlabel('x')
        ylabel('y')
        title(str)
        for ii=1:N
            %画点
            plot(X(1,ii),X(2,ii),pale(y(1,ii),:))
        end
        for ii=1:c
            %画均值
            plot(m(1,ii),m(2,ii),'k+')
        end
    end
end