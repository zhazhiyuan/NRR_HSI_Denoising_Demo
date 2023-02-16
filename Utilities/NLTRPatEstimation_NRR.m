function [ E_Temp] = NLTRPatEstimation_NRR( Temp, NL_Temp, Par, Sigma)

            c1 = Par. c1;

  
            E_Temp            =   NRR_CORE( Temp, NL_Temp, c1, Sigma) ;
            
 
end

