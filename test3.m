
clear;

load('8图0度仅共生5特征.mat');
[ ratt, par] =orig_initRuleGivenData();
x0 = ratt2x(ratt, par);
[A,b,Aeq,beq,lb,ub] = genConstraint(ratt, x0, par);
x0 = x0';
lb = lb';
ub = ub';

options = optimset('Algorithm', 'active-set', 'Display' , 'Iter' , 'MaxFunEvals'...
    , 20000*length(x0) , 'MaxIter', 10000 , 'TolFun' , 1e-6 , 'TolX' , 1e-6 , 'TolCon', 1e-6);
[x,fval,flag] = fmincon(@(x) fmin_fun(par, newFeature, x ) ...
    ,x0, A, b, Aeq, beq, lb, ub,[],options);

rattNew = x2ratt(x, par);

fname = {'D55','D56','D65','D68','D76','D78','D94','D95'};
vname = {'Contrast','Correlation','Energy','Entropy','Homogeneity'};
trainN = 4;%那多少张图片拿去训练
xin = zeros(1,5);
res = zeros(1,8);

for i = 1:length(fname)
    for k = 1:trainN
        
        for j = 1:length(vname)
            xin(j) = newFeature.(fname{i}).(vname{j})(k);
        end
        
        [Be, BeA] = activeRuleNew(rattNew, xin);
        
        [v,l] = max(Be);
        if l ~= k
            res(k) = res(k) + 1;
        end
        
    end
end


% indata = [5 0.7 0.05 4 0.6];
% [ B, BA ] = activeRuleNew( ratt, indata );
% tmp = rand(5,8);
% for i = 1:size(tmp,1)
%     tmp(i,:) = tmp(i,:)/sum(tmp(i,:));
% end
