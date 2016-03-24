function [l,e] = test2(a, x)
l = find(a<=x, 1, 'last');
e = find(a>=x, 1, 'first');

