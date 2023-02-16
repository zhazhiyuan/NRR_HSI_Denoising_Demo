function  [Init_Index, Weight_Index]  =  Block_matching_Weight(X, Par,Neighbor_arr,Num_arr, SelfIndex_arr)
% X is 25*38416 = 5*5 * 38416
%Neighbor_arr is 3600*2704  ��1��Ŀ���������ѡ������ƿ� 961��
%Num_arr 1*2704 %��һ��Ŀ�����װ961�����ƿ�
%SelfIndex_arr is 1*2704  %ÿ��Ŀ����λ��

L         =   length(Num_arr);
% L is 2704
Init_Index     =  zeros(Par.patnum,L);
Weight_Index   =  zeros(Par.patnum,L);
% Init_Index is 140*2704

for  i  =  1 : L
    Patch = X(:,SelfIndex_arr(i)); % 25*1 Ŀ���λ�ø����Ŀ�
    Neighbors = X(:,Neighbor_arr(1:Num_arr(i),i));    
    % Neighbors is 25*961 ��Ŀ�������Ӧ�����ƿ����
    Dist = sum((repmat(Patch,1,size(Neighbors,2))-Neighbors).^2);   
    % Dist�������ƿ���Ŀ���֮��ľ���
    [val, index] = sort(Dist);% ��������
    % index is 1*961
    Init_Index(:,i)=Neighbor_arr(index(1:Par.patnum),i);
    %��һ��Ŀ������ҵ�140�����ƿ�λ��
    
 %Computing Weighting
    Dist(index(1))      =   Dist(index(2));    
    wei                 =   exp( -Dist(index(1:Par.patnum))./Par.h );    
    wei                 =   wei./(sum(wei)+eps);    
    Weight_Index(:,i)   =   wei;
    
end
