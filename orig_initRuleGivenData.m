function [ ratt, par ] =  orig_initRuleGivenData( )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

preN = 5;%ǰ�����Ը���
preNE = [8 8 8 8 8];%ÿ��ǰ�����Ժ�ѡֵ����
rNum = 8; %par�л��Ǽ�һ��rule����Ȼ����preNE����rule num��ͬ������20160328
BNum = 8;%�ȼ���������

prAwFlag = false;%ǰ������Ȩ���Ƿ����ѵ��
prAFlag = true;%ǰ�����Ժ�ѡֵ�Ƿ����ѵ��
uFlag = false;%����ֵ�Ƿ����ѵ��

gB = zeros(rNum, BNum) ;%ÿ�������beta�������ǹ����ţ������СΪrNum * BNum
gwR = zeros(1, rNum);%����Ȩ�أ������СΪ1*rNum
gu = zeros(1, BNum);%����ֵ�������СΪ1*BNum
gPraW = zeros(1, preN);%ǰ������Ȩ�أ������СΪ1*preN
gPraA = cell(1,preN);%ǰ�����Ժ�ѡֵ����ϸ������ÿ��Ԫ�洢��ѡֵ���飬�����СΪ1*preN


% %%%�ֶ�����%%%
% gB = [
% 
%     ];

%%%�Զ�����%%%���õ�����ÿ������С��0.5��û���������ĸо�
gB = rand(rNum,BNum);
for i = 1:rNum
    gB(i,:) = gB(i,:)/sum(gB(i,:));
end


gwR = ones(1,rNum);

gu = rand(1,BNum);
gPraW = [1.0000  1.0000 1.0  2 3];
gPraA = {[0.7 1 2 4 5 7 8 9.5],[0.5 0.55 0.6 0.65 0.7 0.75 0.8 0.98],[0.018 0.025 0.035 0.04 0.045 0.065 0.075 0.098],[3 3.2 3.4 3.7 3.9 4 4.2 4.5],[0.47 0.52 0.56 0.6 0.66 0.72 0.77 0.81]};

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
par.rNum = rNum;

