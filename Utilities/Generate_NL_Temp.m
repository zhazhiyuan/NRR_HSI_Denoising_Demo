function [NL_Temp_i]       =     Generate_NL_Temp (Temp_i, Weight_Index_i)

[m,n]                      =        size(Temp_i); % 200*140
% m is 200 n is 140

NL_Temp_i                  =       zeros  (size(Temp_i));

% NL_Temp_i is 200*140

for  j = 1:n
    
    a = [1:1:n];
    
    a(j) = [];
    
    Temp_i_new        =      Temp_i(:,a);
  
    Weight            =      Weight_Index_i(:,a); 
    
    NL_Temp_i(:,j)    =      sum(Weight.*Temp_i_new, 2); 
    
    clear a;
    
end


end

