close;
clear;
clc;

%读取网格
[v, f, ~, ~]=readObj('camelhead.obj');
%指定两个pin points
constraint = [5,30];
[x,y] = LSCM(v,f,constraint);

%plot
drawmesh(f, [x, y])
