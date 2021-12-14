clear
clc

%Conditions initiales
I=[-4;8;-3;-4;3;-1;6;3;2;-5;3;7];

%State space representation
B=zeros(12,1);
C=eye(12);
D=zeros(12,1);
E=eye(12);

%Test gain identique pour tous les controlleurs
k0=1;
A_c=A_consensus(k0);
A_lead=A_leader(k0);

%Simulation et évolutions des coordonnées au cours du temps
simu1 = sim('Project1_Simulink',15);
v1=simu1.ScopeData.signals.values;
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


function matrix = A_consensus(k)
  matrix=[-k,0,0,0,0,0,0,0,0,0,k,0
    0,-k,0,0,0,0,0,0,0,0,0,k
    k,0,-k,0,0,0,0,0,0,0,0,0
    0,k,0,-k,0,0,0,0,0,0,0,0
    0,0,k,0,-k,0,0,0,0,0,0,0
    0,0,0,k,0,-k,0,0,0,0,0,0
    0,0,0,0,k,0,-k,0,0,0,0,0
    0,0,0,0,0,k,0,-k,0,0,0,0
    0,0,0,0,0,0,k,0,-k,0,0,0
    0,0,0,0,0,0,0,k,0,-k,0,0
    0,0,0,0,0,0,0,0,k,0,-k,0
    0,0,0,0,0,0,0,0,0,k,0,-k];
end

function matrix = A_leader(k)
  matrix=[-k,0,0,0,0,0,0,0,0,0,0,0
    0,-k,0,0,0,0,0,0,0,0,0,0
    k,0,-k,0,0,0,0,0,0,0,0,0
    0,k,0,-k,0,0,0,0,0,0,0,0
    0,0,k,0,-k,0,0,0,0,0,0,0
    0,0,0,k,0,-k,0,0,0,0,0,0
    0,0,0,0,k,0,-k,0,0,0,0,0
    0,0,0,0,0,k,0,-k,0,0,0,0
    0,0,0,0,0,0,k,0,-k,0,0,0
    0,0,0,0,0,0,0,k,0,-k,0,0
    0,0,0,0,0,0,0,0,k,0,-k,0
    0,0,0,0,0,0,0,0,0,k,0,-k];
end