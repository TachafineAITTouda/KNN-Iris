clear all;
% load the iris Dataset in memory, use Matlab 2015 or higher 
load fisheriris;

x=meas(:,3:4);
y=species;

whos

% plot all metrics of our Dataset
gscatter(x(:,1),x(:,2),y);

% new values to test
newpoint=[5.5 2; 2.5 1.5; 5 1.45];

[id,d]=knnsearch(x,newpoint,'k',3);

line(newpoint(:,1),newpoint(:,2),'color','k','marker','x','linewidth',4,'linestyle','none');

line(x(id,1),x(id,2),'color',[.5 .5 1],'marker','o','linewidth',2,'linestyle','none');

% trying results variating the number of neighbors to consider
mldminko=fitcknn(x,y,'NumNeighbors',3,'distance','minkowski');
mldcity=fitcknn(x,y,'NumNeighbors',5,'distance','cityblock');
mldceuc=fitcknn(x,y,'NumNeighbors',7);

tabulate(y(id(1,:)))
tabulate(y(id(2,:)))

%predict the new point with each Model 

labelmin=predict(mldminko,newpoint)
labecity=predict(mldcity,newpoint)
labeleuc=predict(mldceuc,newpoint)

resubLoss(mldminko)
resubLoss(mldcity)
resubLoss(mldceuc)