function y = fmin_fun(par, newFeature ,x )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

fname = {'D55','D56','D65','D68','D76','D78','D94','D95'};
vname = {'Contrast','Correlation','Energy','Entropy','Homogeneity'};
trainN = 4;%�Ƕ�����ͼƬ��ȥѵ��


ratt = x2ratt(x, par);

xin = zeros(1,5);
yd = 0;
 
for i = 1:length(fname)
    for k = 1:trainN
        
        for j = 1:length(vname)
            xin(j) = newFeature.(fname{i}).(vname{j})(k);
        end
        
        [Be, BeA] = activeRuleNew(ratt, xin);
        
        Be(i) = 1 - Be(i);
        yd = yd + Be(i);
        
    end
end

 y = yd / (length(fname) * trainN);


% yd = 0;
% for i = 1:pNum
%     xin = [pdis(i,i) vdis(i,i) cdis(i,i)];
%     [Be,BeA] = activeRuleNew(ratt, xin);
%     yd = yd + sum(Be .* [ratt.u]);
% end

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
% y = -yd;
% y = y/(pNum);
end

