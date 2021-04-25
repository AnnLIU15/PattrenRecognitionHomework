function z= euclidean_classifier(m,X)
% 欧几里得分类器
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input
% X->二维点
% m->各类的均值
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output
% z->分类结果
    [~,c]=size(m);
    [~,N]=size(X);
    t=zeros(1,c);
    z=zeros(1,N);
    for ii=1:N
        for jj=1:c
            t(jj)=sqrt((X(:,ii)-m(:,jj))'*(X(:,ii)-m(:,jj)));
        end
        [~,z(ii)]=min(t);
    end
end