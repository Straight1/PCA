%�����k�ǽ�ά��  ����kά
function pca(k)
%ORL���ɷַ���

%����ͼ��ĸߺͿ����ǽ���Readfaces�б���ֵ
global imgRow;
global imgCol;

nPerson=40;
nFacesPerPerson=5;
display("������������...")
[imgRow,imgCol,FaceContainer,faceLabel]=ReadFaces(nFacesPerPerson,nPerson);
display(".......................................");


nFaces=size(FaceContainer,1);
display('PCA ��ά........');
%LowDimFaces��200*20�ľ���ÿһ�д���һ�����ɷ�������40�ˣ�ÿ��5�ţ���ÿ����20��ά����
%w�Ƿ���任����10304*20�ľ���
[LowDimFaces,W]=fastPCA(FaceContainer,k);  %���ɷַ���
%visualize_pc(w);  %��ʾ���ɷ���
save("Mat/LowDimFaces.mat",'LowDimFaces');
display("�������")



















































