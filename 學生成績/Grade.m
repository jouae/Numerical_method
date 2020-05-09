%% Select the N-th test (1 to 5)
N = 1 ; 

%% Sort the data
for j = 1 : 5
    eval(['B',int2str(j),' = A',int2str(j),''';']);
    eval(['B',int2str(j),'=sort(B',int2str(j),',2);']);
end

%% Graph the N-test Subject Grade in class 
clf
for k = 1 : 6
    
    eval(['data1 = B',int2str(N),'(',int2str(k),',:);']);      %# Sample data set 1
    eval(['data2 = sum(B',int2str(N),'(',int2str(k),',:))/28;']);         %# Sample data set 2
    eval(['subplot( 6,1,',int2str(k),' );plot(data1,0,''ko'',''MarkerSize'',10);']);hold on   %# Plot data set 1
    eval(['subplot( 6,1,',int2str(k),' );plot(data2,0,''r*'',''MarkerSize'',10);']);hold on   %# Plot data set 2
    xlim([0 100]);
    set(gca,'ytick',[])
end

%% Graph the N-test Students' Grade
figure ;
eval(['stem(A',int2str(N),');']);
xlabel('�ǥ͸��X');
ylabel(['��',int2str(N),'���U�즨�Z']);
title('�ǥͦU�즨�Z����')

%% SVD
for i = 1:5
    eval(['[U',int2str(i),',S',int2str(i),',V',int2str(i),']','= svd(A',int2str(i),');']);
    eval(['U',int2str(i),'= -U',int2str(i),';']);
    eval(['V',int2str(i),'= -V',int2str(i),';']);
end

%% Rank(1) matrix M
eval(['sigma = diag(S',int2str(N),') ;']);
tau = cumsum( sigma.^2 ) / sum ( sigma.^2 ) ;      
figure;
plot ( tau( 1 : 6 ), '.' );
title('���ѫ�Rank(n)����l���Z��v')

eval(['U',int2str(N),'A = sum(U',int2str(N),'(:,1))/28 ;']); % average ability

figure;
eval(['subplot( 2,1,1 ) ,plot( U',int2str(N),'( : ,1 ),''.'');']);hold on
eval(['subplot( 2,1,1 ) ,plot( [1,28],[U',int2str(N),'A,U',int2str(N),'A] ,''-'');']);
xlabel('�ǥͭӤH��O');
eval(['subplot( 2,1,2 ) ,plot( V',int2str(N),'( : ,1 ),''.'');']);hold off
xlabel('�U�즨�Z�v��');

eval(['Z = V',int2str(N),''';']);
eval(['M',int2str(N),'=U',int2str(N),'(:,1)*sigma(1)*Z(1,:);']);

%% Deviation about rank(1) matrix M
% Standard Deviation Of Students' Grade over 20
% 4th student
eval(['A',int2str(N),'(4,:);']);
eval(['M',int2str(N),'(4,:);']);

eval(['plot (A',int2str(N),'(4,:),''bo'');']); hold on
eval(['plot (M',int2str(N),'(4,:),''r*'');']); hold off
legend('�ǥͭ�l���Z','Rank(1)Grade');  
