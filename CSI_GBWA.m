% �õ����˲�+�ֿ��Ȩ����ȡԴ������������ָ��
% ��Ȩ˵�������������Jessica�ŶӵĿ�Դ�ɹ��޸Ķ�����
% http://dde.binghamton.edu/download/camera_fingerprint/
% ������ԭ������ע���ĵİ�ȨҪ�󣬲���Ӧ��ԭ���ס�
% ��˴���������������������� 
% Le-bing Zhang, Fei Peng, Min Long, 'Identifing source camera using guided image estimation and block weighted average��, JVCIR, doi:http://dx.doi.org/10.1016/j.jvcir.2016.12.013

% 
clc,clear,
% ��NCC������Ƭָ�ƺ����ָ�Ƽ�������
load Sample/Fingerprint_Canon_Ixus55_1024_refGIF.mat;
Fingerprint_Canon_Ixus55 = Fingerprint;

[Mf,Nf] = size(Fingerprint);

%%%%%%%%%%%%%%%%%%%%%%%%%
Flist = dir('Sample\*.jpg');
for i = 1:4
    i,
%%%
imx = ['Sample\',Flist(i).name];
Ix = imread(imx);
[M,N,tree] = size(Ix);
Ix = Ix((floor(M/2)-(Mf/2)+1:floor(M/2)+(Mf/2)),(floor(N/2)-(Nf/2)+1:floor(N/2)+(Nf/2)),:);
 %%%
 Noisex = NoiseExtractFromImage_GIF(Ix);
 Noisex = WienerInDFT(Noisex,std2(Noisex));
 %%%
 C(i) = COR(Noisex,Fingerprint_Canon_Ixus55);
end

