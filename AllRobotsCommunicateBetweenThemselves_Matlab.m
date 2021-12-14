clear
clc

%Conditions initiales
I=[-4;8;-3;-4;3;-1;6;3;2;-5;3;7];

%State space representation
B=zeros(12,1);
C=eye(12);
D=zeros(12,1);
E=eye(12);

%Matrice cas simple
A1=[-5,0,1,0,1,0,1,0,1,0,1,0
    0,-5,0,1,0,1,0,1,0,1,0,1
    1,0,-5,0,1,0,1,0,1,0,1,0
    0,1,0,-5,0,1,0,1,0,1,0,1
    1,0,1,0,-5,0,1,0,1,0,1,0
    0,1,0,1,0,-5,0,1,0,1,0,1
    1,0,1,0,1,0,-5,0,1,0,1,0
    0,1,0,1,0,1,0,-5,0,1,0,1
    1,0,1,0,1,0,1,0,-5,0,1,0
    0,1,0,1,0,1,0,1,0,-5,0,1
    1,0,1,0,1,0,1,0,1,0,-5,0
    0,1,0,1,0,1,0,1,0,1,0,-5];

%Test gain identique pour tous les controlleurs
k0=3;
A2=A_same_gains(k0);

%Simulation et évolutions des coordonnées au cours du temps
% simu1 = sim('Project1_Simulink',2);
% v1=simu1.ScopeData.signals.values;
% x1=v1(:,1);
% y1=v1(:,2);
% x2=v1(:,3);
% y2=v1(:,4);
% x3=v1(:,5);
% y3=v1(:,6);
% x4=v1(:,7);
% y4=v1(:,8);
% x5=v1(:,9);
% y5=v1(:,10);
% x6=v1(:,11);
% y6=v1(:,12);
%figure(1)
%plot(x1,y1,'b+-',x2,y2,'g+-',x3,y3,'r+-',x4,y4,'c+-',x5,y5,'m+-',x6,y6,'k+-')

%Boucle évolution temps de convergence
eps = 0.1;
k_max = 5;
t = zeros(1,k_max);
k = 1:1:k_max;
for n = k
    A_n = A_same_gains(n);
    simu_n = sim('Project1_Simulink',2);
    v_n = simu_n.ScopeData.signals.values;
    time_n = transpose(simu_n.ScopeData.time);
    L_n = length(time_n);
    for m = 1:1:L_n
        if  (v_n(L_n,1)-v_n(m,1))/v_n(L_n,1)<eps
            break
        end
    end
    t(n) = time_n(m);
end
figure(2)
plot(k,t,'b+--')

function matrix = A_same_gains(k)
  matrix=[-5*k,0,k,0,k,0,k,0,k,0,k,0
    0,-5*k,0,k,0,k,0,k,0,k,0,k
    k,0,-5*k,0,k,0,k,0,k,0,k,0
    0,k,0,-5*k,0,k,0,k,0,k,0,k
    k,0,k,0,-5*k,0,k,0,k,0,k,0
    0,k,0,k,0,-5*k,0,k,0,k,0,k
    k,0,k,0,k,0,-5*k,0,k,0,k,0
    0,k,0,k,0,k,0,-5*k,0,k,0,k
    k,0,k,0,k,0,k,0,-5*k,0,k,0
    0,k,0,k,0,k,0,k,0,-5*k,0,k
    k,0,k,0,k,0,k,0,k,0,-5*k,0
    0,k,0,k,0,k,0,k,0,k,0,-5*k];
end


