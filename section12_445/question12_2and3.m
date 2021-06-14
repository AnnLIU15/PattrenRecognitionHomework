clc
clear
% 数据点x1~x8
x1=[2;5];x2=[8;4];x3=[7;3];x4=[2;2];
x5=[1;4];x6=[7;2];x7=[3;3];x8=[2;3];
% 数据向量
X=[x1,x2,x3,x4,x5,x6,x7,x8];
% 最高迭代次数
q=5;
% 排序
order=[ 1,5,8,4,7,3,6,2;
        5,8,1,4,7,2,3,6;
        1,4,5,7,8,2,3,6;
        1,8,4,7,5,2,3,6];
% 阈值theta
theta=[sqrt(2)+1e-3,2.5,3];
% 选择
sel=[1,2,3,4,3,4;1,1,2,2,3,3];

for ii=1:6
   order_ii=order(sel(1,ii),:);
   theta_ii=theta(sel(2,ii));
   % 绘制logger
   fprintf('(%s)\n',char(96+ii));
   fprintf('order: [%d %d %d %d %d %d %d %d]\t',order_ii);
   fprintf('theta: %.4f\n',theta_ii);
   % 获取聚类结果
   [bel0,m0]=mbsas_f(X,theta_ii,q,order_ii);
   [bel1,m1]=bsas_f(X,theta_ii,q,order_ii);
   fig_num=figure(ii);
   % 只保存不显示
   set(gcf,'visible','off')
   set(gcf,'position',[100,100,1200,500]); 
   % mbsas结果
   subplot(1,2,1)
   color_=['r.';'g.';'b.';'y.'];
   hold on
   for jj =1:size(X,2)
       % 按照bel分类给与点特定颜色
       plot(X(1,jj),X(2,jj),color_(bel0(jj),:),'LineWidth',2)
       text(X(1,jj),X(2,jj),['x',num2str(jj-1)]);
   end
   for jj= 1:size(m0,2)
       % 画出类的中心位置
       plot(m0(1,jj),m0(2,jj),'ko','LineWidth',2) 
   end
   title(['P445 12.2(',char(96+ii), ') MBSAS数据向量图'])
   axis([-2,10,-2,10])
   grid on
   hold off
   subplot(1,2,2)
   hold on
   % 同理bsas聚类效果
   for jj =1:size(X,2)
       % 按照类上颜色
       plot(X(1,jj),X(2,jj),color_(bel1(jj)+1,:),'LineWidth',2)
       text(X(1,jj),X(2,jj),['x',num2str(jj-1)]);
   end
   for jj= 1:size(m1,2)
       % 画出中心点
       plot(m1(1,jj),m1(2,jj),'ko','LineWidth',2) 
   end
   title(['P445 12.2(',char(96+ii), ') BSAS数据向量图'])
   axis([-2,10,-2,10])
   grid on
   hold off
   string_=['order:[',num2str(order_ii),']  theta: ',num2str(theta_ii)];
   sgtitle(string_)
   saveas(fig_num,['P445_12_2and3_(',char(96+ii),')'],'jpg')
   delete(fig_num)
end