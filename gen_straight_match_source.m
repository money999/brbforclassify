function [adis] = gen_straight_match_source()
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

pp = [0 1 2 3 4 5 6 8];  %8
vv = [0 0.3 0.7 1 1.8 2.4];%6
cc = [0 0.3 0.4 0.5 0.6 0.7 1];%7%这里0.6写成了0.4

adis = zeros(336,3);
ntt = 1;
for i = 1:8
    for j = 1:6
        for k = 1:7
            adis(ntt, :) = [pp(i) vv(j) cc(k)];
            ntt = ntt + 1;
        end
    end
end


end





