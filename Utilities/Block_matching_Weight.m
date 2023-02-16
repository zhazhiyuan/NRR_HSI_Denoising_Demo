function  [Init_Index, Weight_Index]  =  Block_matching_Weight(X, Par,Neighbor_arr,Num_arr, SelfIndex_arr)
% X is 25*38416 = 5*5 * 38416
%Neighbor_arr is 3600*2704  第1个目标块里面所选择的相似块 961个
%Num_arr 1*2704 %第一个目标块中装961个相似块
%SelfIndex_arr is 1*2704  %每个目标块的位置

L         =   length(Num_arr);
% L is 2704
Init_Index     =  zeros(Par.patnum,L);
Weight_Index   =  zeros(Par.patnum,L);
% Init_Index is 140*2704

for  i  =  1 : L
    Patch = X(:,SelfIndex_arr(i)); % 25*1 目标块位置给出的块
    Neighbors = X(:,Neighbor_arr(1:Num_arr(i),i));    
    % Neighbors is 25*961 该目标块所对应的相似块个数
    Dist = sum((repmat(Patch,1,size(Neighbors,2))-Neighbors).^2);   
    % Dist计算相似块与目标块之间的距离
    [val, index] = sort(Dist);% 距离排序
    % index is 1*961
    Init_Index(:,i)=Neighbor_arr(index(1:Par.patnum),i);
    %第一个目标块所找到140个相似块位置
    
 %Computing Weighting
    Dist(index(1))      =   Dist(index(2));    
    wei                 =   exp( -Dist(index(1:Par.patnum))./Par.h );    
    wei                 =   wei./(sum(wei)+eps);    
    Weight_Index(:,i)   =   wei;
    
end
