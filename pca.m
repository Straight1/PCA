%这里的k是降维数  降至k维
function pca(k)
%ORL主成分分析

%定义图像的高和宽，他们将在Readfaces中被赋值
global imgRow;
global imgCol;

nPerson=40;
nFacesPerPerson=5;
display("输入人脸数据...")
[imgRow,imgCol,FaceContainer,faceLabel]=ReadFaces(nFacesPerPerson,nPerson);
display(".......................................");


nFaces=size(FaceContainer,1);
display('PCA 降维........');
%LowDimFaces是200*20的矩阵，每一行代表一张主成分脸（共40人，每人5张），每个脸20个维特征
%w是分离变换矩阵，10304*20的矩阵
[LowDimFaces,W]=fastPCA(FaceContainer,k);  %主成分分析
%visualize_pc(w);  %显示主成分脸
save("Mat/LowDimFaces.mat",'LowDimFaces');
display("计算结束")



















































