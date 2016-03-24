function y = match_fmin_fun(par, pdis, vdis, cdis ,x )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
%[Be,BeA] = activeRuleNew(ratt, x0(i,:));

% detmp = Aeq * x;
% if detmp ~= beq
%     disp(detmp);
% end

ratt = x2ratt(x, par);
pNum = size(pdis, 1);


% m1 = zeros(pNum, pNum);
% m0 = zeros(pNum, pNum);
% mA = zeros(pNum, pNum);
% for i = 1:pNum
%      for j = 1:pNum
%          xin = [pdis(i,j) vdis(i,j) cdis(i,j)];
%          [Be,BeA] = activeRuleNew(ratt, xin);
%          m0(i,j) = Be(1);
%          m1(i,j) = Be(2);
%          mA(i,j) = BeA;
%      end
% end
% result = goalBRB( m1, m0, mA );
% at = size(result,1) - sum(diag(result));
% y = at / pNum;


yd = 0;
for i = 1:pNum
    xin = [pdis(i,i) vdis(i,i) cdis(i,i)];
    [Be,BeA] = activeRuleNew(ratt, xin);
    yd = yd + sum(Be .* [ratt.u]);
end

% yk = 0;
% for i = 1:(pNum/2)
%     if i == pNum - i + 1
%         xin = [pdis(i,pNum-i+2) vdis(i,pNum-i+2) cdis(i,pNum-i+2)];
%         [Be,BeA] = activeRuleNew(ratt, xin);
%         yk = yk + sum(Be .* [ratt.u]);
%     else
%         xin = [pdis(i,pNum-i+1) vdis(i,pNum-i+1) cdis(i,pNum-i+1)];
%         [Be,BeA] = activeRuleNew(ratt, xin);
%         yk = yk + sum(Be .* [ratt.u]);
%     end
% end
% y = yk - yd;
y = -yd;
y = y/(pNum);
end

