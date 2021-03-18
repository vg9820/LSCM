function [x,y]=LSCM(v,f,constraint)
% v����������
% f���ڽӹ�ϵ
% constraint: �̶��㣬����Ϊ2������
%[x,y],��ά���������

nv = size(v,1);
%�洢��������
M = localcordinate(v,f);

%����ֿ飬 MpΪ�̶�������Ӧ���У�MfΪ�ƶ�������Ӧ����
Ap = constraint;
Af = setdiff(1:nv,Ap);
Mp = M(:,Ap);
Mf = M(:,Af);
Up = [0;0+1*i];

%�����ά�ƶ�������
A = Mf'*Mf;
b = -Mf'*Mp*Up;
Uf = A\b;

%���������U��
U = zeros(nv,1);
U(Ap) = Up;
U(Af) = Uf;

%���㱣������
E = (Mf*Uf+Mp*Up)'*(Mf*Uf+Mp*Up);
fprintf('The conformal energy is %f\n',E)

%���ز��������
x = real(U);
y = imag(U);

end

