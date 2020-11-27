function [imgRow,imgCol,FaceContainer,faceLabel]=ReadFaces(nFacesPerPerson,nPerson,bTest)
   if  nargin==0
       nFacesPerPerson=5;%某人的图片标号 这里只用了前5张
       nPerson=40;%人标号
       bTest=0;%此变量表示是否测试booltest
   elseif nargin<3
       bTest=0;
   end
   
   %先加载一个图片来计算尺寸
   img=imread('ORL/s1_1.bmp');
   [imgRow,imgCol]=size(img);
   
   FaceContainer = zeros(nPerson*nFacesPerPerson,imgRow*imgCol);%存储特征向量的矩阵  
   faceLabel=zeros(nPerson*nFacesPerPerson,1); %标签
   
   %之前的代表都是先初始化需要使用的变量
   
   %根据文件名读取图片并将其压缩为一行imgRow*imgCol列的向量，存储进FaceContainer中
   for i=1 : nPerson 
       %文件名 s(人标号)_(图序号).bmp
       %人标号=i
       %图序号=j(1~5)
       for j=1 : nFacesPerPerson
         strpath=strcat('ORL/','s',num2str(i),'_',num2str(j),'.bmp');
         %这里要用num2str(double)  不能直接用i,j  也不能直接用char()强制类型转换
         img=imread(strpath);%读取训练集图片
         FaceContainer((i-1)*nFacesPerPerson+j,:)=img(:);
         faceLabel((i-1)*nFacesPerPerson+j)=i;  
       end %j  
   end %i
   
   save('Mat/FaceMat.mat','FaceContainer');   %将矩阵存储进mat
   
   
   