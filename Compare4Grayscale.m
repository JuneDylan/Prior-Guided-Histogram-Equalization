close all
clear all

path_Results = '.\Results_Grayscale\';
path_low = '.\Methods_HE\Input-Images\';
path_HEC = '.\Results_Grayscale\results_HECIg\';

dirOutput=dir(fullfile(path_HEC,'*.jpg'));
Len = length(dirOutput);
PSNR = zeros(Len,6);
SSIM = zeros(Len,6);
AMBE = zeros(Len,6);
NIQE = zeros(Len,7);
Entr = zeros(Len,7);
PSNR_CI = zeros(Len,6);
SSIM_CI = zeros(Len,6);
AMBE_CI = zeros(Len,6);
Entr_CI = zeros(Len,7);
NIQE_CI = zeros(Len,7);

for i = 1:Len
    name = dirOutput(i).name;
    Img_L = im2double(imread(strcat(path_low,name))); 
    %%
    name_he = strcat(path_Results,'HE\',name);
    Img_HE =  im2double(imread(name_he)); 
    name_he = strcat(path_Results,'HE_CI\',name);
    Img_HE_CI =  im2double(imread(name_he)); 
    
    name_he = strcat(path_Results,'BBHE\',name);
    Img_BBHE =  im2double(imread(name_he)); 
    name_he = strcat(path_Results,'BBHE_CI\',name);
    Img_BBHE_CI =  im2double(imread(name_he)); 
    
    name_he = strcat(path_Results,'DSIHE\',name);
    Img_DSIHE =  im2double(imread(name_he)); 
    name_he = strcat(path_Results,'DSIHE_CI\',name);
    Img_DSIHE_CI =  im2double(imread(name_he)); 
    
    name_he = strcat(path_Results,'MMBEBHE\',name);
    Img_MMBEBHE =  im2double(imread(name_he)); 
    name_he = strcat(path_Results,'MMBEBHE_CI\',name);
    Img_MMBEBHE_CI =  im2double(imread(name_he)); 
    
    name_he = strcat(path_Results,'RMSHE\',name);
    Img_RMSHE =  im2double(imread(name_he)); 
    name_he = strcat(path_Results,'RMSHE_CI\',name);
    Img_RMSHE_CI =  im2double(imread(name_he)); 
    
    name_he = strcat(path_Results,'RSIHE\',name);
    Img_RSIHE =  im2double(imread(name_he)); 
    name_he = strcat(path_Results,'RSIHE_CI\',name);
    Img_RSIHE_CI =  im2double(imread(name_he)); 
    
    %%
    PSNR(i,:) = [psnr(Img_HE,Img_L),psnr(Img_BBHE,Img_L),psnr(Img_DSIHE,Img_L),psnr(Img_MMBEBHE,Img_L),psnr(Img_RMSHE,Img_L),psnr(Img_RSIHE,Img_L)];
    PSNR_CI(i,:) = [psnr(Img_HE_CI,Img_L),psnr(Img_BBHE_CI,Img_L),psnr(Img_DSIHE_CI,Img_L),psnr(Img_MMBEBHE_CI,Img_L),psnr(Img_RMSHE_CI,Img_L),psnr(Img_RSIHE_CI,Img_L)];
    Entr(i,:) = [entropy(Img_L),entropy(Img_HE),entropy(Img_BBHE),entropy(Img_DSIHE),entropy(Img_MMBEBHE),entropy(Img_RMSHE),entropy(Img_RSIHE)];
    Entr_CI(i,:)=[entropy(Img_L),entropy(Img_HE_CI),entropy(Img_BBHE_CI),entropy(Img_DSIHE_CI),entropy(Img_MMBEBHE_CI),entropy(Img_RMSHE_CI),entropy(Img_RSIHE_CI)];
    SSIM(i,:) = [ssim(Img_HE,Img_L),ssim(Img_BBHE,Img_L),ssim(Img_DSIHE,Img_L),ssim(Img_MMBEBHE,Img_L),ssim(Img_RMSHE,Img_L),ssim(Img_RSIHE,Img_L)];
    SSIM_CI(i,:) = [ssim(Img_HE_CI,Img_L),ssim(Img_BBHE_CI,Img_L),ssim(Img_DSIHE_CI,Img_L),ssim(Img_MMBEBHE_CI,Img_L),ssim(Img_RMSHE_CI,Img_L),ssim(Img_RSIHE_CI,Img_L)];
    AMBE(i,:) = [cal_ambe(Img_HE,Img_L),cal_ambe(Img_BBHE,Img_L),cal_ambe(Img_DSIHE,Img_L),cal_ambe(Img_MMBEBHE,Img_L),cal_ambe(Img_RMSHE,Img_L),cal_ambe(Img_RSIHE,Img_L)];
    AMBE_CI(i,:) = [cal_ambe(Img_HE_CI,Img_L),cal_ambe(Img_BBHE_CI,Img_L),cal_ambe(Img_DSIHE_CI,Img_L),cal_ambe(Img_MMBEBHE_CI,Img_L),cal_ambe(Img_RMSHE_CI,Img_L),cal_ambe(Img_RSIHE_CI,Img_L)];

    NIQE(i,:) = [niqe(Img_L),niqe(Img_HE),niqe(Img_BBHE),niqe(Img_DSIHE),niqe(Img_MMBEBHE),niqe(Img_RMSHE),niqe(Img_RSIHE)];
    NIQE_CI(i,:)=[niqe(Img_L),niqe(Img_HE_CI),niqe(Img_BBHE_CI),niqe(Img_DSIHE_CI),niqe(Img_MMBEBHE_CI),niqe(Img_RMSHE_CI),niqe(Img_RSIHE_CI)];
    
end

m_PSNR = mean(PSNR)
m_SSIM = mean(SSIM)
m_Entr = mean(Entr)
AMBE = 255.*AMBE;
m_AMBE = mean(AMBE)
m_NIQE = mean(NIQE)

m_PSNR_CI = mean(PSNR_CI)
m_SSIM_CI = mean(SSIM_CI)
m_Entr_CI = mean(Entr_CI)
AMBE_CI = 255.*AMBE_CI;
m_AMBE_CI = mean(AMBE_CI)
m_NIQE_CI = mean(NIQE_CI)