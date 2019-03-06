function histgraph( rt,string)
%HISTGRAPH Summary of this function goes here
%   Detailed explanation goes here

figure;
histfit(rt,10)
title(string)
xlabel('Time (s)')
ylabel('Occurrence')
fitdist(rt,'Normal')
xlim([0 .35])
end