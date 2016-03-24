function [ ratt, par ] =  orig_initRuleGivenData( )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

preN = 3;%前提属性个数
preNE = [5 5 5];%每个前提属性候选值个数
rNum = preNE(1);%规则数
BNum = 2;%等级评价数量

prAwFlag = true;%前提属性权重是否参与训练
prAFlag = true;%前提属性候选值是否参与训练
uFlag = false;%期望值是否参与训练

gB = zeros(rNum, BNum) ;%每条规则的beta，行数是规则编号，矩阵大小为rNum * BNum
gwR = zeros(1, rNum);%规则权重，矩阵大小为1*rNum
gu = zeros(1, BNum);%期望值，矩阵大小为1*BNum
gPraW = zeros(1, preN);%前提属性权重，矩阵大小为1*preN
gPraA = cell(1,preN);%前提属性候选值采用细胞矩阵，每个元存储候选值数组，矩阵大小为1*preN



gB = [
0.451857877987499   0.548142122012501
   0.797616391793018   0.202383608206982
   0.332450304185678   0.667549695814322
   0.905815908633726   0.094184091366274
   0.614423785996316   0.385576214003684
    ];

gwR = ones(1,5);

gu = [0 1];
gPraW = [1.0000  1.0000 1.0];
gPraA = {[0 4.5 5 6 9],[0 1.5 2 2.5 3],[0 0.5 0.6 0.7 1]};

if (size(gB,1) ~= rNum || size(gB,2) ~= BNum)
    error('置信度矩阵gB出错');
end

if size(gwR, 2) ~= rNum;
    error('规则权重gwR出错');
end

if size(gu, 2) ~= BNum;
    error('期望gu出错');
end

if size(gPraW, 2) ~= preN;
    error('前提属性权重gPraW出错');
end

for i = 1:preN
    if (size(gPraA{i},2) ~= preNE(i))
        error('前提属性候选值gPreN出错');
    end
end

ratt.u = gu;
prA(preN).a = [];
prA(preN).w = 0;
for i = 1:preN
    prA(i).a = gPraA{i};
    prA(i).w = gPraW(i);
end

rule(rNum).wR = 0;
rule(rNum).B = [];
for i = 1:rNum
    rule(i).B = gB(i,:);
    rule(i).wR = gwR(i);
end

ratt.prA = prA;
ratt.rule = rule;

par.preNE = preNE;
par.BNum = BNum;
par.prA = prA;
par.prAFlag = prAFlag;
par.uFlag = uFlag;
par.prAwFlag= prAwFlag;
par.u = gu;

