function [imgRow,imgCol,FaceContainer,faceLabel]=ReadFaces(nFacesPerPerson,nPerson,bTest)
   if  nargin==0
       nFacesPerPerson=5;%ĳ�˵�ͼƬ��� ����ֻ����ǰ5��
       nPerson=40;%�˱��
       bTest=0;%�˱�����ʾ�Ƿ����booltest
   elseif nargin<3
       bTest=0;
   end
   
   %�ȼ���һ��ͼƬ������ߴ�
   img=imread('ORL/s1_1.bmp');
   [imgRow,imgCol]=size(img);
   
   FaceContainer = zeros(nPerson*nFacesPerPerson,imgRow*imgCol);%�洢���������ľ���  
   faceLabel=zeros(nPerson*nFacesPerPerson,1); %��ǩ
   
   %֮ǰ�Ĵ������ȳ�ʼ����Ҫʹ�õı���
   
   %�����ļ�����ȡͼƬ������ѹ��Ϊһ��imgRow*imgCol�е��������洢��FaceContainer��
   for i=1 : nPerson 
       %�ļ��� s(�˱��)_(ͼ���).bmp
       %�˱��=i
       %ͼ���=j(1~5)
       for j=1 : nFacesPerPerson
         strpath=strcat('ORL/','s',num2str(i),'_',num2str(j),'.bmp');
         %����Ҫ��num2str(double)  ����ֱ����i,j  Ҳ����ֱ����char()ǿ������ת��
         img=imread(strpath);%��ȡѵ����ͼƬ
         FaceContainer((i-1)*nFacesPerPerson+j,:)=img(:);
         faceLabel((i-1)*nFacesPerPerson+j)=i;  
       end %j  
   end %i
   
   save('Mat/FaceMat.mat','FaceContainer');   %������洢��mat
   
   
   