format short e
%% Generate Unit circle
Num = 10^(5) ;
% linspace divide into (Num) interval
a = linspace (0 , 2*pi , Num);

x = cos(a);
y = sin(a);

%% A transpose unit circle
A = rand(2);

Ax = A(1,1) * x + A(1,2) * y;
Ay = A(2,1) * x + A(2,2) * y;

%% Norm of Ax and A
Max = 0;
Min = 100;
for i = 1 : Num

    n = ( 2*pi / Num ) * i;

    q = cos(n);
    w = sin(n);

    q2 = A(1,1) * q + A(1,2) * w;
    w2 = A(2,1) * q + A(2,2) * w;

    Nv = ( q2 )*( q2 )' + ( w2 )*( w2 )' ;

    % �����̤j
    if(Nv > Max)
        Max = Nv ; % �̤j||Ax||^2

        MaxX = cos(n);
        MaxY = sin(n);
        MaxV = [MaxX MaxY];

        AMaxX = A(1,1) * MaxX + A(1,2) * MaxY; % �u���ഫ�� x �I�y��
        AMaxY = A(2,1) * MaxX + A(2,2) * MaxY; % �u���ഫ�� y �I�y��

        AMaxV = [AMaxX AMaxY];
    end

    % �O���̤p
    if(Nv < Min )
        Min = Nv ;

        MinX = cos(n);
        MinY = sin(n);
        MinV = [MinX MinY];

        AMinX = A(1,1) * MinX + A(1,2) * MinY;
        AMinY = A(2,1) * MinX + A(2,2) * MinY;

        AMinV = [AMinX AMinY];
    end


end

%% print the graphic
orin = 0;

plot(x , y , Ax , Ay , '.'); hold on
plot(MaxX , MaxY , '*');
plot(MinX , MinY , '*');
plot(AMaxX , AMaxY , '*');
plot(AMinX , AMinY , '*');

quiver(orin, orin , MinX , MinY ,1 ,'color',[0 0 1]);
quiver(orin, orin , MaxX , MaxY ,1 ,'color',[0 1 0]);
quiver(orin, orin , AMinX , AMinY , 1,'color',[0 0 1])
quiver(orin, orin , AMaxX , AMaxY , 1 ,'color',[0 1 0]); hold off

axis equal
grid on
