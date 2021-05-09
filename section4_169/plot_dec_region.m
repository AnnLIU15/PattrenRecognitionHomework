function  plot_dec_region( net,limits,m,fignum)

axis([limits(1),limits(2),limits(3),limits(4)])
[x1,x2] = meshgrid(limits(1):limits(6):limits(2),limits(3):limits(6):limits(4));
hold on;
% Get the output class assignment from the neural network
X=[reshape(x1,1,numel(x1));reshape(x2,1,numel(x2))];
output = sim(net,X);
output = sign(output);
figure(fignum)
hold on
grid on
xlabel('x')
ylabel('y')
title(num2str(fignum))
axis(limits(1:4))
for ii=1:size(X,2)
    %»­µã
    if output(ii)>=0
        k='g.';
    else
        k='y.';
    end
    plot(X(1,ii),X(2,ii),k)
end

plot(m(1,1),m(2,1),'r-pentagram','markersize',10);
plot(m(1,2),m(2,2),'r-pentagram','markersize',10);

% Plot the Gaussian means for class 2
plot(m(1,3),m(2,3),'bo','markersize',10);
plot(m(1,4),m(2,4),'bo','markersize',10);

end

