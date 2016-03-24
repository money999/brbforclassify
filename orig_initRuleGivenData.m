function [ ratt, par ] =  orig_initRuleGivenData( )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

preN = 3;%ǰ�����Ը���
preNE = [5 5 5];%ÿ��ǰ�����Ժ�ѡֵ����
rNum = preNE(1);%������
BNum = 2;%�ȼ���������

prAwFlag = true;%ǰ������Ȩ���Ƿ����ѵ��
prAFlag = true;%ǰ�����Ժ�ѡֵ�Ƿ����ѵ��
uFlag = false;%����ֵ�Ƿ����ѵ��

gB = zeros(rNum, BNum) ;%ÿ�������beta�������ǹ����ţ������СΪrNum * BNum
gwR = zeros(1, rNum);%����Ȩ�أ������СΪ1*rNum
gu = zeros(1, BNum);%����ֵ�������СΪ1*BNum
gPraW = zeros(1, preN);%ǰ������Ȩ�أ������СΪ1*preN
gPraA = cell(1,preN);%ǰ�����Ժ�ѡֵ����ϸ������ÿ��Ԫ�洢��ѡֵ���飬�����СΪ1*preN



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
    error('���ŶȾ���gB����');
end

if size(gwR, 2) ~= rNum;
    error('����Ȩ��gwR����');
end

if size(gu, 2) ~= BNum;
    error('����gu����');
end

if size(gPraW, 2) ~= preN;
    error('ǰ������Ȩ��gPraW����');
end

for i = 1:preN
    if (size(gPraA{i},2) ~= preNE(i))
        error('ǰ�����Ժ�ѡֵgPreN����');
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
