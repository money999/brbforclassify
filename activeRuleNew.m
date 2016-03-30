function [ B, BA ] = activeRuleNew( ratt, indata )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

prA = ratt.prA;
rule = ratt.rule;
RNum = size(rule,2);
BNum = size(rule(1).B, 2);
preN = size(prA, 2);%ǰ�����Ը���
preNE = RNum;%%������������ǵ���ǰ�����Ժ�ѡֵ����

if size(indata,2)~=preN
    error('�����������ֵ��ǰ�����Ը�����ƥ��');
end

matchDegrees = zeros(RNum,preN);

for i = 1:preN
    l = find(prA(i).a<=indata(i), 1, 'last');
    e = find(prA(i).a>=indata(i), 1, 'first');
    if isempty(l)||isempty(e)
        error('ƥ��Խ��')
    end
    
    if l == e
        matchDegrees(l,i) = 1;
    else
        matchDegrees(l,i) = (indata(i) - prA(i).a(l)) / (prA(i).a(e) - prA(i).a(l));
        matchDegrees(e,i) = (prA(i).a(e) - indata(i)) / (prA(i).a(e) - prA(i).a(l));
    end
end

ruleWeight = sum(matchDegrees,2);%tmpact��������
%actrule(mai, 2) = 0;%��һ�д漤�����ı�ţ��ڶ��д漤��Ȩ��wk

%%%chang leilei��table4���ݰ�����������ʽд���˲ŵó���final rule weights
%%%����û��ǰ������Ȩ��
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

