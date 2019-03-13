function fitgraphs(A)

[column_sizeA, row_sizeA]=size(A.trial__);
B=struct('trial_',[],'time1',[],'InterStim',[],'reaction_time',[]);
C=struct('trial_',[],'time1',[],'InterStim',[],'reaction_time',[]);
D=struct('trial_',[],'time1',[],'InterStim',[],'reaction_time',[]);

jb=1;
jc=1;
jd=1;

for i =1:+1:column_sizeA
    
    if A.distance{i}==1
        B.trial__(jb)=A.trial__(i);
        B.reaction_time{jb}=A.reaction_time{i};
        B.time1(jb)=A.time1(i);
        B.InterStim{jb}=A.InterStim{i};
        jb=jb+1;
    elseif A.distance{i}==2
        C.trial__(jc)=A.trial__(i);
        C.reaction_time{jc}=A.reaction_time{i};
        C.time1(jc)=A.time1(i);
        C.InterStim{jc}=A.InterStim{i};
        jc=jc+1;
    elseif A.distance{i}==3
        D.trial__(jd)=A.trial__(i);
        D.reaction_time{jd}=A.reaction_time{i};
        D.time1(jd)=A.time1(i);
        D.InterStim{jd}=A.InterStim{i};
        jd=jd+1;
    end
end


rt1=B.reaction_time;
interstim1=B.InterStim;
rt2=C.reaction_time;
interstim2=C.InterStim;
rt3=D.reaction_time;
interstim3=D.InterStim;

rt1 = cell2mat(rt1);
interstim1= cell2mat(interstim1);
rt2 = cell2mat(rt2);
interstim2= cell2mat(interstim2);
rt3 = cell2mat(rt3);
interstim3= cell2mat(interstim3);

rt1=rt1.';
interstim1=interstim1.';
rt2=rt2.';
interstim2=interstim2.';
rt3=rt3.';
interstim3=interstim3.';

jb=1;
jc=1;
jd=1;

[column_size1, row_size1]=size(rt1);
[column_size2, row_size2]=size(rt2);
[column_size3, row_size3]=size(rt3);


for i= 1:+1:column_size1
   if(rt1(i,1)/1000000>.15) && (rt1(i,1)/1000000<.30)
      newrt1(jb,1)=rt1(i,1)/1000000;
      newot1(jb,1)=interstim1(i,1)/1000000;
      jb=jb+1;
  end
end
for i= 1:+1:column_size2
   if(rt2(i,1)/1000000>.15) && (rt2(i,1)/1000000<.30)
      newrt2(jc,1)=rt2(i,1)/1000000;
      newot2(jc,1)=interstim2(i,1)/1000000;
      jc=jc+1;
  end
end
for i= 1:+1:column_size3
   if(rt3(i,1)/1000000>.15) && (rt3(i,1)/1000000<.30)
      newrt3(jd,1)=rt3(i,1)/1000000;
      newot3(jd,1)=interstim3(i,1)/1000000;
      jd=jd+1;
  end
end

rt1=newrt1;
interstim1=newot1;
rt2=newrt2;
interstim2=newot2;
rt3=newrt3;
interstim3=newot3;


t=400:1000;
t=t';
var=400;



for j=1:length(t)
    
    norm1=1/sum(exp(-1/var*(t(j)-interstim1*1000).^2));
    avert1(j)=norm1*sum(rt1.*exp(-1/var*(t(j)-interstim1*1000).^2));
    
    norm2=1/sum(exp(-1/var*(t(j)-interstim2*1000).^2));
    avert2(j)=norm2*sum(rt2.*exp(-1/var*(t(j)-interstim2*1000).^2));
    
    norm3=1/sum(exp(-1/var*(t(j)-interstim3*1000).^2));
    avert3(j)=norm3*sum(rt3.*exp(-1/var*(t(j)-interstim3*1000).^2));
    
end

detrendrt1=detrend(avert1);
detrendrt2=detrend(avert2);
detrendrt3=detrend(avert3);



figure;
scatter(interstim1,rt1, 36, 'b')
title('Weighted Gaussian Average and Scatter Plot')
xlabel('Cue-Time Interval (s)')
ylabel('Reaction Time (s)')
xlim([.4 1])
hold on
scatter(interstim2,rt2, 36, 'r')
scatter(interstim3,rt3, 36, 'k')
%xticks([.3 .35 .4 .45 .5 .55 .6 .65 .7 .75 .8 .85 .9 .95 1])
%xticklabels({'.30','','.40','','.50','','.60','','.70','','.80','','.90','','1'})
plot(t/1000,avert1,'LineWidth',3, 'color','b')
plot(t/1000,avert2,'LineWidth',3, 'color','r')
plot(t/1000,avert3,'LineWidth',3,'color','k')
legend('1 meter','2 meter','3 meter')
hold off


figure;
plot(t/1000,detrendrt1,'LineWidth',4)
title('Detrend Weighted Gaussian Average')
xlabel('Cue-Time Interval (s)')
ylabel('Reaction Time (s)')
xlim([.4 1])
hold on
%xticks([.3 .35 .4 .45 .5 .55 .6 .65 .7 .75 .8 .85 .9 .95 1])
%xticklabels({'.30','','.40','','.50','','.60','','.70','','.80','','.90','','1'})
plot(t/1000,detrendrt2,'LineWidth',4)
plot(t/1000,detrendrt3,'LineWidth',4)
legend('1 meter','2 meter','3 meter')
hold off

Y1=fft(detrendrt1,601);
Pyy1=Y1.*conj(Y1)/601;
f=1000/601*(0:127);
Y2=fft(detrendrt2,601);
Pyy2=Y2.*conj(Y2)/601;
Y3=fft(detrendrt3,601);
Pyy3=Y3.*conj(Y3)/601;

figure;
plot(f,Pyy1(1:128),'LineWidth',4)
xlim([4 25]);
title('Power spectral density')
xlabel('Frequency (HZ)')
hold on
plot(f,Pyy2(1:128),'LineWidth',4)
plot(f,Pyy3(1:128),'LineWidth',4)
legend('1 meter','2 meter','3 meter')
hold off

xdist=[1;2;3];
RtMat=[detrendrt1;detrendrt2;detrendrt3];

figure;
pcolor(t/1000,xdist,RtMat)
shading interp
title('raw Heat Map')
xlabel('Interstim Time (s)')
ylabel('Depth (m)')

colormap(jet)


frequencies=2:1:25;
for i=1:length(frequencies)
    fig=figure(10);
   [b,a] = butter(3,[frequencies(i)*0.8/(1000/2) (frequencies(i)*1.2)/(1000/2)]');
   
   movFiltmin1=filtfilt(b,a,detrendrt1);
   movFiltmin2=filtfilt(b,a,detrendrt2);
   movFiltmin3=filtfilt(b,a,detrendrt3);
   
   movFiltMap=[movFiltmin1;movFiltmin2;movFiltmin3];

    pcolor(t/1000,xdist,movFiltMap)
    shading interp
    xlabel('time(s)')
    ylabel('Depth')
    title(strcat('Heat Map: f=',num2str(frequencies(i)),'Hz'))
    colormap(jet)

   
   F(i)=getframe(gcf);
   
end
 writerObj = VideoWriter('HEAT_MAP_FOURIER_DECOMP.avi');
 writerObj.FrameRate =1;
 open(writerObj);

for i=1:length(F)
    % convert the image to a frame
    frame = F(i) ;    
    writeVideo(writerObj, frame);
end
% close the writer object
close(writerObj);

end

