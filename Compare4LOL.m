close all
clear all

path_Results = '.\Results_LOL\';
% path_low = 'E:\BaiduNetdiskDownload\LOLdataset\eval15\low\';
% path_high = 'E:\BaiduNetdiskDownload\LOLdataset\eval15\high\';

path_low = 'D:\BaiduNetdiskDownload\LOL_v2\Test\Low/';
path_high = 'D:/BaiduNetdiskDownload/LOL_v2/Test/Normal/';

dirOutput=dir(fullfile(path_low,'*.png'));
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
%     Img_L = im2double(imread(strcat(path_low,name))); 
%     Img_H = im2double(imread(strcat(path_high,name))); 
    
    Img_L = im2double(imread(strcat(path_low,'low',name(end-8:end)))); 
    Img_H = im2double(imread(strcat(path_high,'normal',name(end-8:end)))); 
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
    PSNR(i,:) = [psnr(Img_HE,Img_H),psnr(Img_BBHE,Img_H),psnr(Img_DSIHE,Img_H),psnr(Img_MMBEBHE,Img_H),psnr(Img_RMSHE,Img_H),psnr(Img_RSIHE,Img_H)];
    PSNR_CI(i,:) = [psnr(Img_HE_CI,Img_H),psnr(Img_BBHE_CI,Img_H),psnr(Img_DSIHE_CI,Img_H),psnr(Img_MMBEBHE_CI,Img_H),psnr(Img_RMSHE_CI,Img_H),psnr(Img_RSIHE_CI,Img_H)];
    Entr(i,:) = [entropy(Img_L),entropy(Img_HE),entropy(Img_BBHE),entropy(Img_DSIHE),entropy(Img_MMBEBHE),entropy(Img_RMSHE),entropy(Img_RSIHE)];
    Entr_CI(i,:)=[entropy(Img_H),entropy(Img_HE_CI),entropy(Img_BBHE_CI),entropy(Img_DSIHE_CI),entropy(Img_MMBEBHE_CI),entropy(Img_RMSHE_CI),entropy(Img_RSIHE_CI)];
    SSIM(i,:) = [ssim(Img_HE,Img_H),ssim(Img_BBHE,Img_H),ssim(Img_DSIHE,Img_H),ssim(Img_MMBEBHE,Img_H),ssim(Img_RMSHE,Img_H),ssim(Img_RSIHE,Img_H)];
    SSIM_CI(i,:) = [ssim(Img_HE_CI,Img_H),ssim(Img_BBHE_CI,Img_H),ssim(Img_DSIHE_CI,Img_H),ssim(Img_MMBEBHE_CI,Img_H),ssim(Img_RMSHE_CI,Img_H),ssim(Img_RSIHE_CI,Img_H)];
    AMBE(i,:) = [cal_ambe(Img_HE,Img_H),cal_ambe(Img_BBHE,Img_H),cal_ambe(Img_DSIHE,Img_H),cal_ambe(Img_MMBEBHE,Img_H),cal_ambe(Img_RMSHE,Img_H),cal_ambe(Img_RSIHE,Img_H)];
    AMBE_CI(i,:) = [cal_ambe(Img_HE_CI,Img_H),cal_ambe(Img_BBHE_CI,Img_H),cal_ambe(Img_DSIHE_CI,Img_H),cal_ambe(Img_MMBEBHE_CI,Img_H),cal_ambe(Img_RMSHE_CI,Img_H),cal_ambe(Img_RSIHE_CI,Img_H)];

    NIQE(i,:) = [niqe(Img_L),niqe(Img_HE),niqe(Img_BBHE),niqe(Img_DSIHE),niqe(Img_MMBEBHE),niqe(Img_RMSHE),niqe(Img_RSIHE)];
    NIQE_CI(i,:)=[niqe(Img_H),niqe(Img_HE_CI),niqe(Img_BBHE_CI),niqe(Img_DSIHE_CI),niqe(Img_MMBEBHE_CI),niqe(Img_RMSHE_CI),niqe(Img_RSIHE_CI)];
    
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