function z = bayes_classifier(m,S,P,X)
% 贝叶斯分类器
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input
% X->二维点
% y->对应点的从属类
% m->各类的均值
% P->各类的概率分布
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output
% z->分类结果
    [~,c]=size(m);
    [~,N]=size(X);
    t=zeros(1,c);
    z=zeros(1,N);
    for ii=1:N
        for jj=1:c
            t(jj)=P(jj)* comp_gauss_dens_val(m(:,jj),S(:,:,jj),X(:,ii));
        end
        % 分类
        [~,z(ii)]=max(t);
    end