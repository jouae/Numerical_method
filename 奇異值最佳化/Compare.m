%% Max||Ax||  �P  ||A||  �����Y
%% Q1 : Max|| Ax || = norm(A) ?
NA = norm( A ) ; 
SMax = sqrt( Max );
sigma = svd (A) ;

[SMax , NA , sigma(1)]  % sigma(1) = norm( A ) = sqrt( Max )

%% Q2 : eigvetor(A'*A) �P x �����Y ?

[AV , AD] = eig( A'*A ) ;

AV
AD
[MinV' , MaxV']

% �u���ഫ��D�o Max||Ax|| , Min||Ax|| 
% �U�A��� x �V�q�����I�P A'A ���S�x�V�q�ۦP
% �Y��� �u���ഫ A'A ���S�x�V�q�P Ax ���u���ഫ�� norm ���Ȧ���

% �B�� Q1 �o�� Max||Ax||����̤j�_����,�P�ɵ���||A||

