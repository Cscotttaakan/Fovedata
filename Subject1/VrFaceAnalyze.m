close all
clear

A=csv2struct('AdamCompiled1.csv'); % Adam



face1Ind=(A.distance==1&A.reaction_time>150000&A.reaction_time<400000);
face2Ind=(A.distance==2&A.reaction_time>150000&A.reaction_time<400000);
face3Ind=(A.distance==3&A.reaction_time>150000&A.reaction_time<400000);




interstims=400:1000;
for i=1:length(interstims)
    var=100;
    normf1=1/sum(exp(-1/var*((A.InterStim(face1Ind)/1000-interstims(i)).^2)));
   avef1(i)= normf1*sum(A.reaction_time(face1Ind)/1000.*exp(-1/var*((A.InterStim(face1Ind)/1000-interstims(i))).^2));

   normf2=1/sum(exp(-1/var*((A.InterStim(face2Ind)/1000-interstims(i)).^2)));
   avef2(i)= normf2*sum(A.reaction_time(face2Ind)/1000.*exp(-1/var*((A.InterStim(face2Ind)/1000-interstims(i))).^2));
     
   normf3=1/sum(exp(-1/var*((A.InterStim(face3Ind)/1000-interstims(i)).^2)));
   avef3(i)= normf3*sum(A.reaction_time(face3Ind)/1000.*exp(-1/var*((A.InterStim(face3Ind)/1000-interstims(i))).^2));
   
end
figure(1)
hold on
scatter(A.InterStim(face1Ind)/1000,A.reaction_time(face1Ind)/1000,'b');
scatter(A.InterStim(face2Ind)/1000,A.reaction_time(face2Ind)/1000,'r');
scatter(A.InterStim(face3Ind)/1000,A.reaction_time(face3Ind)/1000,'g');
plot(interstims,avef1,'b')
plot(interstims,avef2,'r')
plot(interstims,avef3,'g')
legend( 'Face 1','Face 2', 'Face 3')
title('Gaussian averaged reaction_time vs. Interstim for 3D Face')
xlabel('Interstim time(ms)')
ylabel('reaction time(ms)')
xlim([400 1000])



figure(2)
hold on
plot(interstims,avef1)
plot(interstims,avef2)
plot(interstims,avef3, 'g')
legend( 'Face 1','Face 2', 'Face 3')
title('Gaussian averaged reaction_time vs. Interstim for 3D Face')
xlabel('Interstim time(ms)')
ylabel('reaction time(ms)')

% figure(21)
% hold on
% plot(interstims,avef1, 'b')
% plot(interstims,avef2, 'r')
% legend( 'Face 1','Face 2')
% title('Gaussian averaged reaction_time vs. Interstim for 3D Face')
% xlabel('Interstim time(ms)')
% ylabel('reaction time(ms)')
% 
% figure(22)
% hold on
% plot(interstims,avef1, 'b')
% plot(interstims,avef3, 'g')
% legend( 'Face 1', 'Face 3')
% title('Gaussian averaged reaction_time vs. Interstim for 3D Face')
% xlabel('Interstim time(ms)')
% ylabel('reaction time(ms)')
% 
% figure(23)
% hold on
% plot(interstims,avef2, 'r')
% plot(interstims,avef3, 'g')
% legend('Face 2', 'Face 3')
% title('Gaussian averaged reaction_time vs. Interstim for 3D Face')
% xlabel('Interstim time(ms)')
% ylabel('reaction time(ms)')

% figure(3)
% hold on
f=1000/length(interstims).*(0:(length(interstims)-1)/2);

fFace1=fft(detrend(avef1));
PyyFace1=fFace1.*conj(fFace1)/length(interstims);
% plot(f,log10(PyyFace1(1:251)))

fFace2=fft(detrend(avef2));
PyyFace2=fFace2.*conj(fFace2)/length(interstims);
% plot(f,log10(PyyFace2(1:251)))

fFace3=fft(detrend(avef3));
PyyFace3=fFace3.*conj(fFace3)/length(interstims);

% xlim([2,50])
% ylabel('log power')
% xlabel('frequency (Hz)')
% legend('50 cm Face','100 cm Face')
% title('FFT Power Spectrum')




% figure(4)
n=1;
interstims_cut=interstims(n:end);
avef1_cut=avef1(n:end);
avef2_cut=avef2(n:end);
avef3_cut=avef3(n:end);

hold on
f_cut=1000/length(interstims_cut).*(0:(length(interstims_cut)-1)/2);

fFace1_cut=fft(detrend(avef1_cut));
PyyFace1_cut=fFace1_cut.*conj(fFace1_cut)/length(interstims_cut);
% plot(f_cut,log10(PyyFace1_cut(1:151)))

fFace2_cut=fft(detrend(avef2_cut));
PyyFace2_cut=fFace2_cut.*conj(fFace2_cut)/length(interstims_cut);
% plot(f_cut,log10(PyyFace2_cut(1:151)))

fFace3_cut=fft(detrend(avef3_cut));
PyyFace3_cut=fFace3_cut.*conj(fFace3_cut)/length(interstims_cut);


% xlim([1,50])
% ylabel('log power')
% xlabel('frequency (Hz)')
%legend( 'Face 1','Face 2', 'Face 3')

% title('FFT Power Spectrum  (interstims (500-800)')

figure(5)
hold on
plot(f_cut,(PyyFace1_cut(1:length(f_cut))))
plot(f_cut,(PyyFace2_cut(1:length(f_cut))))
plot(f_cut,(PyyFace3_cut(1:length(f_cut))),'g')

xlim([1,70])
ylabel('power')
xlabel('frequency (Hz)')
legend( 'Face 1','Face 2', 'Face 3')
title('FFT Power Spectrum ');


figure(6)
hold on
plot(f_cut,(PyyFace1_cut(1:length(f_cut))))
plot(f_cut,(PyyFace2_cut(1:length(f_cut))))
plot(f_cut,(PyyFace3_cut(1:length(f_cut))),'g')

xlim([1,30])
ylabel('power')
xlabel('frequency (Hz)')
legend( 'Face 1','Face 2', 'Face 3')
title('FFT Power Spectrum ');


