close;
clear;
clc;

%��ȡ����
[v, f, ~, ~]=readObj('camelhead.obj');
%ָ������pin points
constraint = [5,30];
[x,y] = LSCM(v,f,constraint);

%plot
drawmesh(f, [x, y])
