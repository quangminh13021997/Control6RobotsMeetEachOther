clear
clc
close

%Conditions initiales
x1 = -4;
y1 = 8;
I=[x1;y1;-3;-4;3;-1;6;3;2;-5;3;7];

%State space representation
B=eye(12);
C=eye(12);
D=zeros(12,12);
E=eye(12);

%Matrice A
k0=1;
k1=1;
k2=1;
A=A_kk(k0,k1,k2);

%Simulation et évolutions des coordonnées au cours du temps
simu1 = sim('Project1_part4_Simulink',10);
v1=simu1.ScopeData.signals.values;
X=simu1.x_Scope{1}.Values.Data(1,:);
Y=simu1.y_Scope{1}.Values.Data(1,:);
x1=v1(:,1);
y1=v1(:,2);
x2=v1(:,3);
y2=v1(:,4);
x3=v1(:,5);
y3=v1(:,6);
x4=v1(:,7);
y4=v1(:,8);
x5=v1(:,9);
y5=v1(:,10);
x6=v1(:,11);
y6=v1(:,12);
figure(1)
plot(x1,y1,'b+-',x2,y2,'g+-',x3,y3,'r+-',x4,y4,'c+-',x5,y5,'m+-',x6,y6,'k+-')
hold on
plot(X,Y,'r+-')


function matrix = A_kk(k,k1,k2)
  matrix=[-k1,0,0,0,0,0,0,0,0,0,0,0
    0,-k2,0,0,0,0,0,0,0,0,0,0
    k,0,-k,0,0,0,0,0,0,0,0,0
    0,k,0,-k,0,0,0,0,0,0,0,0
    k,0,0,0,-k,0,0,0,0,0,0,0
    0,k,0,0,0,-k,0,0,0,0,0,0
    k,0,0,0,0,0,-k,0,0,0,0,0
    0,k,0,0,0,0,0,-k,0,0,0,0
    k,0,0,0,0,0,0,0,-k,0,0,0
    0,k,0,0,0,0,0,0,0,-k,0,0
    k,0,0,0,0,0,0,0,0,0,-k,0
    0,k,0,0,0,0,0,0,0,0,0,-k];
end