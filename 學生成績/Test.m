for i = 1:5
    eval(['[U',int2str(i),',S',int2str(i),',V',int2str(i),']','= svd(A',int2str(i),');']);
    eval(['U',int2str(i),'= -U',int2str(i),';']);
    eval(['V',int2str(i),'= -V',int2str(i),';']);
end

k = 1 ;  % ����Ѽ�,�� k ���Ҹ�

eval(['U',int2str(k),'A = sum(U',int2str(k),'(:,1))/28 ;']); % ��O����

figure;
eval(['subplot( 2,1,1 ) ,plot( U',int2str(k),'( : ,1 ),''.'');']);hold on
eval(['subplot( 2,1,1 ) ,plot( [1,28],[U',int2str(k),'A,U',int2str(k),'A] ,''-'');']);
xlabel('�ǥͭӤH��O');
eval(['subplot( 2,1,2 ) ,plot( V',int2str(k),'( : ,1 ),''.'');']);
xlabel('�U�즨�Z�v��');
hold off

eval(['Aver= mean(A',int2str(k),');']);
