function  [Neighbor_arr, Num_arr, SelfIndex_arr]  =  NeighborIndex(im, par)
% This Function Precompute the all the patch indexes in the Searching window
% -Neighbor_arr is the array of neighbor patch indexes for each keypatch
% -Num_arr is array of the effective neighbor patch numbers for each keypatch
% -SelfIndex_arr is the index of keypatches in the total patch index array 
SW      	=   par.SearchWin;
% SW is 30
s           =   par.step;
% s is 4
TempR       =   size(im,1)-par.patsize+1;
% TempR is 200-5+1 = 196
TempC       =   size(im,2)-par.patsize+1;
% TempC is 200-5+1 = 196
R_GridIdx	=   [1:s:TempR];
% R_GridIdx  1*49
R_GridIdx	=   [R_GridIdx R_GridIdx(end)+1:TempR];
% R_GridIdx  1*52
C_GridIdx	=   [1:s:TempC];
C_GridIdx	=   [C_GridIdx C_GridIdx(end)+1:TempC];
% G_GridIdx  1*52

Idx         =   (1:TempR*TempC);
% Idx is 1*38416
Idx         =   reshape(Idx, TempR, TempC);
% Idx is 196*196
R_GridH     =   length(R_GridIdx);   
%R_GridH is 52
C_GridW     =   length(C_GridIdx); 
%C_GridW is 52

Neighbor_arr    =   int32(zeros(4*SW*SW,R_GridH*C_GridW));
%Neighbor_arr is 3600*2704
Num_arr         =   int32(zeros(1,R_GridH*C_GridW));
% Num_arr is 1*2704
SelfIndex_arr   =   int32(zeros(1,R_GridH*C_GridW));
% SelfIndex_arr is 1*2704
for  i  =  1 : R_GridH
    for  j  =  1 : C_GridW    
        OffsetR     =   R_GridIdx(i); %OffsetR ＝ 1
        OffsetC     =   C_GridIdx(j); %OffsetC ＝ 1
        
        Offset1  	=  (OffsetC-1)*TempR + OffsetR;
        %Offset1 ＝ 1
        Offset2   	=  (j-1)*R_GridH + i;
        %Offset2＝ 1
                
        top         =   max( OffsetR-SW, 1 ); %top is 1
        button      =   min( OffsetR+SW, TempR ); %button is 31       
        left        =   max( OffsetC-SW, 1 ); % left is 1
        right       =   min( OffsetC+SW, TempC );% right is 31     
        
        NL_Idx     =   Idx(top:button, left:right);
        %NL_Idx is 31*31
        NL_Idx     =   NL_Idx(:);
        %NL_Idx is 961*1
        Num_arr(Offset2)  =  length(NL_Idx);
        %Num_arr 1*2704 %第一个目标块中装961个相似块
        Neighbor_arr(1:Num_arr(Offset2),Offset2)  =  NL_Idx;   
        %Neighbor_arr is 3600*2704  
        %第1个目标块里面所选择的相似块 961个
        SelfIndex_arr(Offset2) = Offset1;
        %SelfIndex_arr is 1*2704  %每个目标块的位置
    end
end