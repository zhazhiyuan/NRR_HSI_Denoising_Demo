function  [E_Img, iter] = NRR_DeNoising( N_Img, O_Img, Par )


delta =2;
E_Img            = N_Img;    

% Estimated Image
[Height, Width, Band]  = size(E_Img);  

N = Height*Width; % N is 40000

TotalPatNum      = (Height-Par.patsize+1)*(Width-Par.patsize+1);         % Total Patch Number in the image
% TotalPatNum is 38416

Average          = mean(N_Img,3);                      % Calculate the average band for fast spatial non-local searching
% Average is 200*200

[Neighbor_arr, Num_arr, Self_arr] =	NeighborIndex(Average, Par);   



for iter = 1 : Par.Iter 

   k_subspace = Par.k_subspace+delta*(iter-1);
   %k_subspace is 5
   Y = reshape(E_Img, N, Band)';

   [E,~,~]= svd(Y,'econ');
   % E is 80*80
   
  if k_subspace< Band
 
  E                                    =                               E(:,1:k_subspace);
 else
     
  k_subspace    = Band;
  E                                    =                               E(:,1:k_subspace);  
  
 end  
   
 %   E=E(:,1:k_subspace);
    % E is 80*5

    E_Img = reshape((E'*Y)', Height,Width, k_subspace);

    N_Img1 = reshape((E'*reshape(N_Img, N, Band)')', Height,Width, k_subspace); %%% add change N_Img1 as N_Img 
    % N_Img1 is 200*200*5
    Band1=k_subspace; % Band1 is 5


    Average             =   mean(E_Img,3); %200*200
    [CurPat, Mat, Sigma_arr]	=	Cub2Patch( E_Img, N_Img1, Average, Par );

    if (mod(iter-1,2)==0)
        Par.patnum = Par.patnum - 10;                                          % Lower Noise level, less NL patches
        [NL_mat, Weight_Index]  =  Block_matching_Weight(Mat, Par, Neighbor_arr, Num_arr, Self_arr);  % Caculate Non-local similar patches for each

        
        if(iter==1)
            Sigma_arr = Par.nSig * ones(size(Sigma_arr))*sqrt(k_subspace/Band);                      % First Iteration use the input noise parameter
        end
    end
    
    
    EPat = zeros(size(CurPat));
    W    = zeros(size(CurPat));
    Temp = cell(length(Self_arr),1);
    NL_Temp = cell(length(Self_arr),1);
    E_Temp = cell(length(Self_arr),1);

    
     for i = 1:length(Self_arr)
      Temp{i}          =      CurPat(:, NL_mat(1:Par.patnum,i));  % 200*140
      
      Weight{i}           =      repmat(Weight_Index(:, i)',size(Temp{i}, 1), 1);      

     end   
    
     parfor i = 1:length(Self_arr)
     NL_Temp{i}       =     Generate_NL_Temp (Temp{i}, Weight{i});
     
     E_Temp{i}        =     NLTRPatEstimation_NRR(Temp{i},NL_Temp{i}, Par, Sigma_arr(Self_arr(i))); 
     end   
    
     for  i      =  1 : length(Self_arr)                         
     EPat(:,NL_mat(1:Par.patnum,i))  = EPat(:,NL_mat(1:Par.patnum,i)) + E_Temp{i};      
     W(:,NL_mat(1:Par.patnum,i))     = W(:,NL_mat(1:Par.patnum,i)) + ones(size(CurPat,1),size(NL_mat(1:Par.patnum,i),1));
     end   
    
  
    [Spa_Img, Spa_Wei]   =  Patch2Cub( EPat, W, Par.patsize, Height, Width, Band1 );       % Patch to Cubic
    E_Img = Spa_Img./Spa_Wei;
 
    E_Img = reshape(reshape(E_Img, Height*Width, k_subspace)*E',Height,Width, Band);
 
    
[PSNR_iter]                          =                                    evaluate_1(O_Img/255,E_Img/255,Height,Width);

PSNR_iter                            =                                    mean(PSNR_iter);

 
    fprintf( 'Iter = %2.3f, PSNR = %2.2f, NoiseLevel = %2.3f\n', iter, PSNR_iter, sum(Sigma_arr)/TotalPatNum);
    
    if iter<Par.Iter
    E_Img = 0.1*N_Img+0.9*E_Img;
    else
    end
 
    
    
end
end

