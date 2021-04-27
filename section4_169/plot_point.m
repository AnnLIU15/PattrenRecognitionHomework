function plot_point(X,y,m,figure_num,max_figure,str,sub_num,axi)
% 画出各类均值的点与各类的点
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input
% X->二维点
% y->对应点的从属类
% m->各类的均值
% figure_num->第几张图
% max_figure->大于1的时候开启子图
% str->子图title（图名） 全图title在函数外使用sgtitle(str)
% sub_num->可选 第几张子图
% axi->可选 限制坐标轴
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output
% figure(1)
    if(nargin<7)
        sub_num=1;
    end
    if(nargin<8)
        axi=10;
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
        figure(figure_num)
        if max_figure>1
            subplot(2,ceil(max_figure/2),sub_num)
        end
        hold on
        grid on
        xlabel('x')
        ylabel('y')
        title(str)
        axis([-axi,axi,-axi,axi])
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