% function [l,e] = test2(a, x)
% l = find(a<=x, 1, 'last');
% e = find(a>=x, 1, 'first');

clear
load('8图0度仅共生5特征.mat')
fname = {'D55','D56','D65','D68','D76','D78','D94','D95'};
vname = {'Contrast','Correlation','Energy','Entropy','Homogeneity'};

anss = zeros(1,16);
% for ttt = 1:16
ttt = 2;
xin = zeros(8*ttt,5);
xN = 0;
for i = 1:length(fname)
    for k = 1:ttt
        xN = xN + 1;
        for j = 1:length(vname)
            xin(xN,j) = newFeature.(fname{i}).(vname{j})(k);
        end
    end
end

load hald
ing = xin;
[coeef, score, latent, tsquare] = princomp(ing);
per = cumsum(latent)./sum(latent);



% anss(ttt) = per(1);
% end


% a=[1 2 3];
% b=[1 2 3 4];
% c=[1 2 3 4 5];
% for i = 1:3
%     for j = 1:4
%         for k = 1:5
%             [a(i) b(j) c(k)]
%         end
%     end
% end










