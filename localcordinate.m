function M = localcordinate(v,f)
%计算局部坐标系
nf = size(f,1);
nv = size(v,1);

index = 1:nf;
pt1 = v(f(index,1),:);
pt2 = v(f(index,2),:);
pt3 = v(f(index,3),:);
e1 = pt2 - pt1;
e2 = pt3 - pt1;

%计算局部平面的法向
f_n = cross(e1,e2);
f_n_norm = sum(abs(f_n).^2,2).^(1/2);
f_n = f_n./f_n_norm;

%创造局部单位正交基
x_ = e1./sum(abs(e1).^2,2).^(1/2);
y_ = cross(f_n,x_);

%生成对应坐标
x1 = 0.0;
y1 = 0.0;
x2 = sum(abs(e1).^2,2).^(1/2);
y2 = 0.0;
x3 = dot(e2,x_,2);
y3 = dot(e2,y_,2);

%有向面积
dT = sqrt((x1 .* y2 - y1 .* x2) + (x2 .* y3 - y2 .* x3) + (x3 .* y1 - y3 .* x1));

%生成稀疏矩阵三元组
I = reshape([index;index;index],3*nf,1);
J = reshape(f',3*nf,1);
K = reshape([(x3 - x2)./dT+i*(y3 - y2)./dT, (x1 - x3)./dT+i*(y1 - y3)./dT, (x2 - x1)./dT+i*(y2 - y1)./dT]',3*nf,1);

M = sparse(I,J,K,nf,nv);

end



