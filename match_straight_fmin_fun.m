function y = match_straight_fmin_fun(par, adis ,x )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
ratt = x2ratt(x, par);
pNum = size(adis, 1);


yd = 0;
for i = 1:pNum
    xin = adis(i,:);
    [Be,BeA] = activeRuleNew(ratt, xin);
    
    if isnan(Be(1))
        disp(1111);
    end
    
    if isnan(Be(1))
        disp(2222);
    end
    
    if (adis(i,3) >= 0.51)
        yd = yd + abs(1 - Be(1)) + abs(Be(2) - 0);
        continue;
    end
    
    if isnan(yd)
        disp(1);
    end
    
    if (adis(i,2) > 1)
        tv0 = (adis(i,2) - 1) / 14 * 5 + 0.5;
        tv1 = 1 - tv0;
        yd = yd + abs(tv0 - Be(1)) + abs(tv1 - Be(2));
    end
    
    if isnan(yd)
        disp(2);
    end
    
    if (adis(i,1) < 1.2)
        yd = yd + abs(0 - Be(1)) + abs(Be(2) - 1);
    else
        tp0 = (adis(i,1) - 1.2) / 34 * 5;
        tp1 = 1 - tp0;
        yd = yd + abs(tp0 - Be(1)) + abs(tp1 - Be(2));
    end
end

if isnan(yd)
    disp(3);
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
y = yd;
y = y/(pNum);
end

