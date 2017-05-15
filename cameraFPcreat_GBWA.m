% ��Ȩ˵�������������Jessica�ŶӵĿ�Դ�ɹ��޸Ķ�����
% http://dde.binghamton.edu/download/camera_fingerprint/
% ������ԭ������ע���ĵİ�ȨҪ�󣬲���Ӧ��ԭ���ס�
% ��˴���������������������� 
% Le-bing Zhang, Fei Peng, Min Long, 'Identifing source camera using guided image estimation and block weighted average��, JVCIR, doi:http://dx.doi.org/10.1016/j.jvcir.2016.12.013
%

clear,clc,
% �������ָ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FileList = dir('�����ͼ���λ���滻\*.jpg');  
for Fi = 1:25
    imx = strcat('�����ͼ���λ���滻\',FileList(Fi).name);
    Images(Fi).name = imx;
end
RP = getFingerprint_BWA2016(Images);
RP = rgb2gray1(RP);
Fingerprint = WienerInDFT(RP,std2(RP));
save Sample/Fingerprint_Canon_Ixus55_1024_refGIF.mat Fingerprint;

