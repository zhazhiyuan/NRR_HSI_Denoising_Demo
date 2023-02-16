

function  X  =   NRR_CORE( A, B, c1, nSig)


[S, A0, D]            =                svd(full(A),'econ');   

[m, ~]                =                size (A0);

[~, B0, ~]            =                svd(full(B),'econ'); 
 
 s0                   =                A0 -    B0;

 s0                   =                mean (s0.^2,2);
 
 s0                   =                max  (0, s0-nSig^2);
        
 lam                  =                repmat(((c1*sqrt(2)*nSig^2)./(sqrt(s0) + eps)),[1,m]);
 
Alpha                 =                soft (A0-B0, lam)+ B0;
 
X                     =                S*Alpha*D';

return;