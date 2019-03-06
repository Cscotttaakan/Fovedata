function y= ScattPlot(rt,ot,title )

[column_size, row_size]=size(ot);


a1=1;
a2=1;
a3=1;
a4=1;
a5=1;
a6=1;
a7=1;
a8=1;
a9=1;
a10=1;
a11=1;
a12=1;
a13=1;
a14=1;
a15=1;
a16=1;
a17=1;
a18=1;
a19=1;




for j= 1:+1:column_size
    if(ot(j,1)<.325)&&(ot(j,1)>=.3)
        max325(a1,1)=rt(j,1);
        a1=a1+1;
    elseif(ot(j,1)<.350)&&(ot(j,1)>=.325)
        max350(a2,1)=rt(j,1);
        a2=a2+1;
    elseif(ot(j,1)<.375)&&(ot(j,1)>=.350)
        max375(a3,1)=rt(j,1);
        a3=a3+1;
    elseif(ot(j,1)<.400)&&(ot(j,1)>=.375)
        max400(a4,1)=rt(j,1);
        a4=a4+1;
    elseif(ot(j,1)<.425)&&(ot(j,1)>=.400)
        max425(a5,1)=rt(j,1);
        a5=a5+1;
    elseif(ot(j,1)<.450)&&(ot(j,1)>=.425)
        max450(a6,1)=rt(j,1);
        a6=a6+1;
    elseif(ot(j,1)<.475)&&(ot(j,1)>=.450)
        max475(a7,1)=rt(j,1);
        a7=a7+1;
        elseif(ot(j,1)<.500)&&(ot(j,1)>=.475)
        max500(a7,1)=rt(j,1);
        a7=a7+1;
        elseif(ot(j,1)<.525)&&(ot(j,1)>=.500)
        max525(a8,1)=rt(j,1);
        a8=a8+1;
        elseif(ot(j,1)<.550)&&(ot(j,1)>=.525)
        max550(a9,1)=rt(j,1);
        a9=a9+1;
        elseif(ot(j,1)<.575)&&(ot(j,1)>=.550)
        max575(a10,1)=rt(j,1);
        a10=a10+1;
        elseif(ot(j,1)<.600)&&(ot(j,1)>=.575)
        max600(a11,1)=rt(j,1);
        a11=a11+1;
        elseif(ot(j,1)<.625)&&(ot(j,1)>=.600)
        max625(a12,1)=rt(j,1);
        a12=a12+1;
        elseif(ot(j,1)<.650)&&(ot(j,1)>=.625)
        max650(a13,1)=rt(j,1);
        a13=a13+1;
        elseif(ot(j,1)<.675)&&(ot(j,1)>=.650)
        max675(a14,1)=rt(j,1);
        max675(a14,2)=ot(j,1);
        a14=a14+1;
        elseif(ot(j,1)<.700)&&(ot(j,1)>=.675)
        max700(a15,1)=rt(j,1);
        a15=a15+1;
        elseif(ot(j,1)<.725)&&(ot(j,1)>=.700)
        max725(a16,1)=rt(j,1);
        a16=a16+1;
        elseif(ot(j,1)<.750)&&(ot(j,1)>=.725)
        max750(a17,1)=rt(j,1);
        a17=a17+1;
        elseif(ot(j,1)<.775)&&(ot(j,1)>=.750)
        max775(a18,1)=rt(j,1);
        a18=a18+1;
        elseif(ot(j,1)<.800)&&(ot(j,1)>=.775)
        max800(a19,1)=rt(j,1);
        a19=a19+1;
    end    
    
end

check(:,1)=max675(:,1);

newrt(1,1)=mean(max325);
newrt(2,1)=mean(max350);
newrt(3,1)=mean(max375);
newrt(4,1)=mean(max400);
newrt(5,1)=mean(max425);
newrt(6,1)=mean(max450);
newrt(7,1)=mean(max475);
newrt(8,1)=mean(max500);
newrt(9,1)=mean(max525);
newrt(10,1)=mean(max550);
newrt(11,1)=mean(max575);
newrt(12,1)=mean(max600);
newrt(13,1)=mean(max625);
newrt(14,1)=mean(max650);
newrt(15,1)=mean(check);
newrt(16,1)=mean(max700);
newrt(17,1)=mean(max725);
newrt(18,1)=mean(max750);
newrt(19,1)=mean(max775);
newrt(20,1)=mean(max800);

k=.3125;

for j=1:+1:20
    newot(j,1)=k;
    k=k+.025;
end

y=max675;

figure;
scatter(newot,newrt);
title(title)
xlabel('Cue-Time Interval')
ylabel('Reaction Time')