function  [par]=Parset_NRR(nSig, band)
 
par.nSig         =   nSig;                                
par.SearchWin    =   30;                                 
 par.step         =   4;                                       % stepsize

 
 
if band<=50
    
if nSig<=10.1
    par.patsize       =   5;
    par.patnum        =   150;                  
    par.Iter          =   7;
    par.lamada        =   1.4;%0.54;
    par.k_subspace    =   9;%8;
    par.c1            =   0.5*sqrt(2);%5*sqrt(2);                         
    par. h            =   20;
elseif nSig <= 20.1
    par.patsize       =   5;
    par.patnum        =   150;
    par.Iter          =   7;
    par.lamada        =   1.2;%0.56; 
    par.k_subspace    =   7;%6;
    par.c1            =   1*sqrt(2);%5*sqrt(2);                         
    par. h            =   20;    
elseif nSig <= 30.1
    par.patsize       =   5;
    par.patnum        =   150;
    par.Iter          =   7;
    par.lamada        =   1.3;%0.56; 
    par.k_subspace    =   7;%6;
    par.c1            =   0.4*sqrt(2);%5*sqrt(2);                         
    par. h            =   20;    
elseif nSig <= 40.1
    par.patsize       =   5;
    par.patnum        =   150;
    par.Iter          =   7;
    par.lamada        =   1.1;%0.56; 
    par.k_subspace    =   7;%5;
    par.c1            =   0.9*sqrt(2);%5*sqrt(2);                         
    par. h            =   20;   
elseif nSig <= 50.1
    par.patsize       =   5;
    par.patnum        =   150;
    par.Iter          =   8;
    par.lamada        =   1.3;%0.56; 
    par.k_subspace    =   5;%5;
    par.c1            =   0.4*sqrt(2);%5*sqrt(2);                         
    par. h            =   20;    
elseif nSig <= 75.1
    par.patsize       =   5;
    par.patnum        =   200;
    par.Iter          =   9;
    par.lamada        =   1;%0.58; 
    par.k_subspace    = 4;%4;
    par.c1            =   0.8*sqrt(2);%5*sqrt(2);                         
    par. h            =   20;    
else
    par.patsize       =   5;
    par.patnum        =   200;
    par.Iter          =   11;
    par.lamada        =   1;%0.58; 
    par.k_subspace    = 4;%4;
    par.c1            =   0.8*sqrt(2);%5*sqrt(2);                         
    par. h            =   20;    
end


%%%%%%%%%%%%%%%%%%
elseif band<=100
    
    if nSig<=10.1
    par.patsize       =   5;
    par.patnum        =   150;      
    par.Iter          =   5;
    par.lamada        =   1.4;%0.54;
    par.k_subspace    =   5;%6;
    par.c1            =   0.9*sqrt(2);%5*sqrt(2);                         
    par. h            =   40;    
elseif nSig <= 20.1
    par.patsize       =   5;
    par.patnum        =   150;
    par.Iter          =   4;
    par.lamada        =   1.4; 
    par.k_subspace     = 4;%6;
    par.c1            =   0.9*sqrt(2);%5*sqrt(2);                         
    par. h            =   30;    
elseif nSig <= 30.1
    par.patsize       =   5;
    par.patnum        =   150;
    par.Iter          =   4;
    par.lamada        =   1.3; 
    par.k_subspace    = 4;%6;
    par.c1            =   1*sqrt(2);%5*sqrt(2);                         
    par. h            =   20;    
elseif nSig <= 40.1
    par.patsize       =   5;
    par.patnum        =   150;
    par.Iter          =   5;
    par.lamada        =   1.3;%0.58; 
    par.k_subspace    =  3;%5;
    par.c1            =   0.9*sqrt(2);%5*sqrt(2);                         
    par. h            =   20;   
elseif nSig <= 50.1
    par.patsize       =   5;
    par.patnum        =   150;
    par.Iter          =   5;
    par.lamada        =   1.3;%0.58; 
    par.k_subspace    =  3;%5;
    par.c1            =   0.6*sqrt(2);%5*sqrt(2);                         
    par. h            =   40;    
elseif nSig <= 75.1
    par.patsize       =   5;
    par.patnum        =   200;
    par.Iter          =   3;
    par.lamada        =   1.6;%0.58; 
    par.k_subspace    =   3;%4;
    par.c1            =   0.7*sqrt(2);%5*sqrt(2);                         
    par. h            =   40;    
else
    par.patsize       =   5;
    par.patnum        =   200;
    par.Iter          =   3;
    par.lamada        =   1.6;%0.58; 
    par.k_subspace    =   3;%4;
    par.c1            =   0.7*sqrt(2);%5*sqrt(2);                         
    par. h            =   40;    
    end
    
    
  %%%%%%%%%%%%%%%%%%  
elseif band<=250
        
    %par.c1          =  8*sqrt(2);        
    if nSig<=10.1
    par.patsize       =   5;
    par.patnum        =   150;      
    par.Iter          =   7;
    par.lamada        =   1.5;%0.54;
    par.k_subspace    =   11;%5;
    par.c1            =   0.7*sqrt(2);%5*sqrt(2);                         
    par. h            =   40;    
elseif nSig <= 20.1
    par.patsize       =   5;
    par.patnum        =   150;
    par.Iter          =   7;
    par.lamada        =  1.2;% 0.56; 
    par.k_subspace    =   8;%6;
    par.c1            =   1.3*sqrt(2);%5*sqrt(2);                         
    par. h            =   30;    
elseif nSig <= 30.1
    par.patsize       =   5;
    par.patnum        =   150;
    par.Iter          =   5;
    par.lamada        =  1.3;% 0.56; 
    par.k_subspace    =   7;%6;
    par.c1            =   1.2*sqrt(2);%5*sqrt(2);                         
    par. h            =   30;    
elseif nSig <= 40.1
    par.patsize       =   5;
    par.patnum        =   150;
    par.Iter          =   5;
    par.lamada        =  1.2;% 0.58; 
    par.k_subspace    = 5;%5;
    par.c1            =   1.5*sqrt(2);%5*sqrt(2);                         
    par. h            =   40;    
elseif nSig <= 50.1
    par.patsize       =   5;
    par.patnum        =   150;
    par.Iter          =   4;
    par.lamada        =  1.4;% 0.58; 
    par.k_subspace    = 5;%5;
    par.c1            =   1.1*sqrt(2);%5*sqrt(2);                         
    par. h            =   40;    
elseif nSig <= 75.1
    par.patsize       =   5;
    par.patnum        =   200;
    par.Iter          =   3;
    par.lamada        =  1.6;% 0.58; 
    par.k_subspace    = 5;%4;
    par.c1            =   1.1*sqrt(2);%5*sqrt(2);                         
    par. h            =   40;    
else
    par.patsize       =   5;
    par.patnum        =   200;
    par.Iter          =   3;
    par.lamada        =  1.6;% 0.58; 
    par.k_subspace    = 4;%4;
    par.c1            =   1.1*sqrt(2);%5*sqrt(2);                         
    par. h            =   30;    
    end
    
end
   

