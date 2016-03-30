function [ B, BA ] = activeRuleNew( ratt, indata )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

prA = ratt.prA;
rule = ratt.rule;
RNum = size(rule,2);
BNum = size(rule(1).B, 2);
preN = size(prA, 2);%前提属性个数
preNE = RNum;%%这里规则数就是等于前提属性候选值个数

if size(indata,2)~=preN
    error('激活规则输入值与前提属性个数不匹配');
end

matchDegrees = zeros(RNum,preN);

for i = 1:preN
    l = find(prA(i).a<=indata(i), 1, 'last');
    e = find(prA(i).a>=indata(i), 1, 'first');
    if isempty(l)||isempty(e)
        error('匹配越界')
    end
    
    if l == e
        matchDegrees(l,i) = 1;
    else
        matchDegrees(l,i) = (indata(i) - prA(i).a(l)) / (prA(i).a(e) - prA(i).a(l));
        matchDegrees(e,i) = (prA(i).a(e) - indata(i)) / (prA(i).a(e) - prA(i).a(l));
    end
end

ruleWeight = sum(matchDegrees,2);%tmpact是列向量
%actrule(mai, 2) = 0;%第一列存激活规则的编号，第二列存激活权重wk

%%%chang leilei的table4数据把下面两个公式写反了才得出来final rule weights
%%%而且没有前提属性权重
%ruleWeight = ruleWeight/sum(ruleWeight);
ruleWeight = [rule.wR]' .* ruleWeight;
ruleWeight = ruleWeight/sum(ruleWeight);

m = zeros(RNum, BNum);
mw = zeros(RNum, 1);
mu = zeros(RNum, 1);

for i = 1:RNum
    m(i,:) = ruleWeight(i) .* rule(i).B;
    mw(i,:) = ruleWeight(i) .* ( 1 - sum(rule(i).B) );
    mu(i,:) = 1 - ruleWeight(i);
end

c = zeros(1, BNum);
cu = prod(mu);
cw = prod(mu + mw) - cu;


for i = 1:BNum
    c(i) = prod(m(:,i) + mu + mw) - (cu + cw);
end

k1 = sum(c) + cu + cw;
c = c ./ k1;
cw = cw /k1;
cu = cu / k1;

B = c ./ ( 1 - cu );
BA = cw / ( 1 - cu );
end


% function [l,e] = interval(array, x)
% num  = size(array);
% min = max(array);
% max = min(array);
% for i = 1:num
%     if(array(i)>=)
% end
% end

