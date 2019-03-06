function fitgraphs(rt,ot)


t=300:1000;
t=t';
var=100;



for j=1:+1:701
    
    norm=1/sum(exp(-1/var*(t(j)-ot*1000).^2));
    newrt(j)=norm*sum(rt.*exp(-1/var*(t(j)-ot*1000).^2));
   
    
end
detrendnewrt=detrend(newrt);

figure;
plot(t/1000,newrt,'LineWidth',4)
hold on
scatter(ot,rt)
title('Weighted Gaussian Average and Scatter Plot')
xlabel('Cue-Time Interval (s)')
ylabel('Reaction Time (s)')
xlim([.3 1])
%xticks([.3 .35 .4 .45 .5 .55 .6 .65 .7 .75 .8 .85 .9 .95 1])
%xticklabels({'.30','','.40','','.50','','.60','','.70','','.80','','.90','','1'})

figure;
plot(t/1000,detrendnewrt,'LineWidth',4)
title('Weighted Gaussian Average with Detrended Data')
xlabel('Cue-Time Interval (s)')
ylabel('Reaction Time (s)')
xlim([.3 1])
%xticks([.3 .35 .4 .45 .5 .55 .6 .65 .7 .75 .8 .85 .9 .95 1])
%xticklabels({'.30','','.40','','.50','','.60','','.70','','.80','','.90','','1'})

figure;
plot(t/1000,newrt,'LineWidth',4)
title('Weighted Gaussian Average')
xlabel('Cue-Time Interval (s)')
ylabel('Reaction Time (s)')
xlim([.3 1])
%xticks([.3 .35 .4 .45 .5 .55 .6 .65 .7 .75 .8 .85 .9 .95 1])
%xticklabels({'.30','','.40','','.50','','.60','','.70','','.80','','.90','','1'})

Y=fft(newrt,701);
Pyy=Y.*conj(Y)/701;
f=1000/701*(0:127);
figure;
plot(f,Pyy(1:128))
xlim([2 30]);
title('Power spectral density')
xlabel('Frequency (HZ)')

Y=fft(detrendnewrt,701);
Pyy=Y.*conj(Y)/701;
f=1000/701*(0:127);
figure;
plot(f,Pyy(1:128))
xlim([2 25]);
title('Power spectral density w/ Detrended Data')
xlabel('Frequency (HZ)')


