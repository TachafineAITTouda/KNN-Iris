clear all;
load fisheriris;
x=meas(:,3:4);
whos
y=species;gscatter(x(:,1),x(:,2),y);

newpoint=[5.5 2; 2.5 1.5; 5 1.45];
line(newpoint(:,1),newpoint(:,2),'color','k','marker','x','linewidth',4,'linestyle','none');
[id,d]=knnsearch(x,newpoint,'k',3);
line(x(id,1),x(id,2),'color',[.5 .5 1],'marker','o','linewidth',2,'linestyle','none');
% xlim([0 1.75]);
% ylim([0 0.75]);
mldminko=fitcknn(x,y,'NumNeighbors',3,'distance','minkowski');
mldcity=fitcknn(x,y,'NumNeighbors',5,'distance','cityblock');
mldceuc=fitcknn(x,y,'NumNeighbors',7);
% label=predict(mld,newpoint)
tabulate(y(id(1,:)))
tabulate(y(id(2,:)))

labelmin=predict(mldminko,newpoint)
labecity=predict(mldcity,newpoint)
labeleuc=predict(mldceuc,newpoint)
resubLoss(mldminko)
resubLoss(mldcity)
resubLoss(mldceuc)