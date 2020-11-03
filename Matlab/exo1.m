clear all;
%the exercice contains a random dataset that for a system with two
%parameters x1,x2 and the class that takes one of two values 0 or 1


% our dataset 
x=[
    1 3;
    1 7;
    2 6;
    3 4;
    4 2;
    5 3;
    5 6;
    6 5;
    7 3
];
%their classes
y= [0 0 1 0 1 0 1 1 1];
%plot all points in our system
gscatter(x(:,1),x(:,2),y);
%the model using 3 neighbors
mdl = fitcknn(x,y,'NumNeighbors',5); 
%a new value to test
newpoint=[4 4;3 5];
%predict the classof the new value
label =predict(mdl,newpoint)
%find the nearest 3 points in the dataset to the new value
[id,d]=knnsearch(x,newpoint,'k',5);

line(newpoint(:,1),newpoint(:,2),'color','k','marker','x','linewidth',4,'linestyle','none');
line(x(id,1),x(id,2),'color',[.5 .5 1],'marker','o','linewidth',2,'linestyle','none');
