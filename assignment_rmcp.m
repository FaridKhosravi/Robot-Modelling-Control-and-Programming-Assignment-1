clear all
%parameters defination

L(1) = Link([  0      0        0       0       0], 'modified');
L(2) = Link([  0      0.2435   0      -pi/2    0], 'modified');
L(3) = Link([  0     -0.0934   1.2518  0       0], 'modified');
L(4) = Link([  0      1.2331  -0.0203  pi/2    0], 'modified');
L(5) = Link([  0      0        0      -pi/2    0], 'modified');
L(6) = Link([  0      0        0       pi/2    0], 'modified');

six_link = SerialLink(L,'name','six link');

six_link.fkine([0 0 0 0 0 0])

six_link.tool=transl([0.03,0,0.135])

six_link.plot([0 0 0 0 0 0])
%% directing the manipulator to the first point[-1,0.3,1.6]
p1=transl([1,-0.3,1.6])

hold on
trplot(p1,'frame','P','color','b')

Qp1=six_link.ikunc(p1,[0.01,0.01,0.01,0.01,0.01,0.01])
six_link.fkine(Qp1)
six_link.teach(Qp1)
six_link.plot(Qp1)

%% directing the manipulator to the 2nd point[1.6,-0.7,0.8]
p2=transl([1.6,-0.7,0.8])*troty(pi/2)

hold on
trplot(p2,'frame','P','color','r')
Qp2=six_link.ikunc(p2,[0.1,0.1,0.1,0.1,0.1,0.1])
six_link.teach(Qp2)
six_link.plot(Qp2)
