



[ ratt, par] =test1_initRuleGivenData();
indata = [5 2.1 5 2];
[ B, BA ] = activeRuleNew( ratt, indata );

% x0 = ratt2x(ratt, par);
% [A,b,Aeq,beq,lb,ub] = genConstraint(ratt, x0, par);
% x0 = x0';
% lb = lb';
% ub = ub';
% [adis] = gen_straight_match_source();