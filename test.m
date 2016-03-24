

[ ratt, par] =orig_initRuleGivenData();
x0 = ratt2x(ratt, par);
[A,b,Aeq,beq,lb,ub] = genConstraint(ratt, x0, par);
x0 = x0';
lb = lb';
ub = ub';
[adis] = gen_straight_match_source();

% options = optimset('Algorithm', 'active-set', 'Display' , 'Iter' , 'MaxFunEvals'...
%     , 20000*length(x0) , 'MaxIter', 10000 , 'TolFun' , 1e-6 , 'TolX' , 1e-6 , 'TolCon', 1e-6);
% [x,fval,flag] = fmincon(@(x) match_straight_fmin_fun(par, adis, x ) ...
%     ,x0, A, b, [], [], lb, ub,[],options);
% rattNew = x2ratt(x, par);
% 
% disp('dddd');
% 
% yp = zeros(1,16);
% for yi = 1:16
%     at = 0;
%     pNum = yi * 5;
%     for yj = 1:30
%         [sp, sv, sc, p1, v1, c1, p2, v2, c2] = gen_match_source(pNum, 5, 2*pi, 0.5, 0.8);
%         pdis = pdist2(p1, p2);
%         vdis = pdist2(v1, v2);
%         c1tm1 = normpdf(c1, -1,2)./(normpdf(c1, -1,2) + normpdf(c1, 1,2));%注意点除根据文章所给公式计算bpa
%         c1tm2 = 1-c1tm1;
%         c2tm1 = normpdf(c2, -1,2)./(normpdf(c2, -1,2) + normpdf(c2, 1,2));
%         c2tm2 = 1-c2tm1;
%         cdis = c1tm1*c2tm2' + c1tm2*c2tm1';
%         
%         m1 = zeros(pNum, pNum);
%         m0 = zeros(pNum, pNum);
%         mA = zeros(pNum, pNum);
%         for i = 1:pNum
%             for j = 1:pNum
%                 xin = [pdis(i,j) vdis(i,j) cdis(i,j)];
%                 [Be,BeA] = activeRuleNew(rattNew, xin);
%                 m0(i,j) = Be(1);
%                 m1(i,j) = Be(2);
%                 mA(i,j) = BeA;
%             end
%         end
%         result = goalBRB( m1, m0, mA );
%          dim = size(result,1) * 0.8;
%          result = result((1:dim),(1:dim));
%         at = at + size(result,1) - sum(diag(result));
%     end
%     yp(yi) = at / 30 / (pNum * 0.8);
%     yp(yi) = 1 - yp(yi);
% end
% 
% plot(5:5:80, yp, 'k');


 