%% Max||Ax||  與  ||A||  的關係
%% Q1 : Max|| Ax || = norm(A) ?
NA = norm( A ) ; 
SMax = sqrt( Max );
sigma = svd (A) ;

[SMax , NA , sigma(1)]  % sigma(1) = norm( A ) = sqrt( Max )

%% Q2 : eigvetor(A'*A) 與 x 之關係 ?

[AV , AD] = eig( A'*A ) ;

AV
AD
[MinV' , MaxV']

% 線性轉換後求得 Max||Ax|| , Min||Ax|| 
% 下再找到 x 向量極值點與 A'A 之特徵向量相同
% 即表示 線性轉換 A'A 之特徵向量與 Ax 之線性轉換後 norm 極值有關

% 且由 Q1 得知 Max||Ax||等於最大奇異值,同時等於||A||

