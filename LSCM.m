function [x,y]=LSCM(v,f,constraint)
% v：顶点坐标
% f：邻接关系
% constraint: 固定点，长度为2的数组
%[x,y],二维参数化结果

nv = size(v,1);
%存储顶点坐标
M = localcordinate(v,f);

%矩阵分块， Mp为固定点所对应的列，Mf为移动点所对应的列
Ap = constraint;
Af = setdiff(1:nv,Ap);
Mp = M(:,Ap);
Mf = M(:,Af);
Up = [0;0+1*i];

%计算二维移动点坐标
A = Mf'*Mf;
b = -Mf'*Mp*Up;
Uf = A\b;

%结果保存在U中
U = zeros(nv,1);
U(Ap) = Up;
U(Af) = Uf;

%计算保角能量
E = (Mf*Uf+Mp*Up)'*(Mf*Uf+Mp*Up);
fprintf('The conformal energy is %f\n',E)

%返回参数化结果
x = real(U);
y = imag(U);

end

