function [filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final,ERGAS_Final, SAM_Final, iter, Time_s]     =  NRR_Denoising_Test  (filename, Sigma)

randn ('seed',0);

time0                              =               clock;

fn                                 =               [filename, '.mat'];

load (fn);

 

Ori_Image                          =               im2double(NRD);

[M, N, kk]                         =               size (Ori_Image);

nSig                               =               Sigma/255;

noiselevel                         =               nSig*ones(1,kk);      % for case 1


for i       =       1 : kk
    
Ori_Image_noise(:,:,i)             =                Ori_Image(:,:,i)  + noiselevel(i)*randn(M,N);

end

 
    
Par   = Parset_NRR(255*mean(noiselevel), kk);



[output_image, iter]  = NRR_DeNoising( Ori_Image_noise*255, Ori_Image*255, Par);  %NGmeet denoisng function 

     


Time_s                             =                (etime(clock,time0));

 
 

[PSNR_all]     =       evaluate1(Ori_Image*255,output_image);


[PSNR_Final, SSIM_Final, FSIM_Final, ERGAS_Final, SAM_Final] = MSIQA(Ori_Image*255, output_image);




 if Sigma==10
     
     
     for j = 1:kk
         
       psnr_e =  csnr (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
       
       ssim_e =  cal_ssim (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
       
       fsim_e =  FeatureSIM (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255);      
 
       Final_denoisng= strcat(filename,'_NRR','_sigma_',num2str(Sigma),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8((output_image(:,:,j))),strcat('./10_Result/',Final_denoisng));
     end
     
     Final_denoisng_2= strcat(filename,'_NRR','_sigma_',num2str(Sigma),'.xls');
     
     
   xlswrite(Final_denoisng_2,PSNR_all)
% 
% 
 elseif Sigma==20
% 
     for j = 1:kk
%         
       psnr_e =  csnr (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       ssim_e =  cal_ssim (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       fsim_e =  FeatureSIM (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255);      
% 
       Final_denoisng= strcat(filename,'_NRR','_sigma_',num2str(Sigma),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8((output_image(:,:,j))),strcat('./20_Result/',Final_denoisng));
     end
% 
% 
     Final_denoisng_2= strcat(filename,'_NRR','_sigma_',num2str(Sigma),'.xls');
     
     
   xlswrite(Final_denoisng_2,PSNR_all)
 elseif Sigma==30
%     
     for j = 1:kk
%         
       psnr_e =  csnr (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       ssim_e =  cal_ssim (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       fsim_e =  FeatureSIM (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255);      
% 
       Final_denoisng= strcat(filename,'_NRR','_sigma_',num2str(Sigma),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
% 
       imwrite(uint8((output_image(:,:,j))),strcat('./30_Result/',Final_denoisng));
     end
% 

     Final_denoisng_2= strcat(filename,'_NRR','_sigma_',num2str(Sigma),'.xls');
     
     
   xlswrite(Final_denoisng_2,PSNR_all)
% 
 elseif Sigma==40
%     
     for j = 1:kk
%         
       psnr_e =  csnr (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       ssim_e =  cal_ssim (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       fsim_e =  FeatureSIM (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255);      
% 
       Final_denoisng= strcat(filename,'_NRR','_sigma_',num2str(Sigma),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
% 
       imwrite(uint8((output_image(:,:,j))),strcat('./40_Result/',Final_denoisng));
     end
% 
% 

     Final_denoisng_2= strcat(filename,'_NRR','_sigma_',num2str(Sigma),'.xls');
     
     
   xlswrite(Final_denoisng_2,PSNR_all)
 elseif Sigma==50
%     
     for j = 1:kk
%         
       psnr_e =  csnr (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       ssim_e =  cal_ssim (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       fsim_e =  FeatureSIM (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255);      
% 
       Final_denoisng= strcat(filename,'_NRR','_sigma_',num2str(Sigma),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
% 
       imwrite(uint8((output_image(:,:,j))),strcat('./50_Result/',Final_denoisng));
     end
% 
% 


     Final_denoisng_2= strcat(filename,'_NRR','_sigma_',num2str(Sigma),'.xls');
     
     
   xlswrite(Final_denoisng_2,PSNR_all)
 elseif Sigma==75
%     
     for j = 1:kk
%         
      psnr_e =  csnr (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       ssim_e =  cal_ssim (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       fsim_e =  FeatureSIM (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255);      
% 
       Final_denoisng= strcat(filename,'_NRR','_sigma_',num2str(Sigma),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
% 
       imwrite(uint8((output_image(:,:,j))),strcat('./75_Result/',Final_denoisng));
     end
% 
% 

     Final_denoisng_2= strcat(filename,'_NRR','_sigma_',num2str(Sigma),'.xls');
     
     
   xlswrite(Final_denoisng_2,PSNR_all)
 else
%     
     for j = 1:kk
%         
       psnr_e =  csnr (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       ssim_e =  cal_ssim (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       fsim_e =  FeatureSIM (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255);      
% 
       Final_denoisng= strcat(filename,'_NRR','_sigma_',num2str(Sigma),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
% 
       imwrite(uint8((output_image(:,:,j))),strcat('./100_Result/',Final_denoisng));
     end
     
     
          Final_denoisng_2= strcat(filename,'_NRR','_sigma_',num2str(Sigma),'.xls');
     
     
   xlswrite(Final_denoisng_2,PSNR_all)
% 
 end
%}

end

