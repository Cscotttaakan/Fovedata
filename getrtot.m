function [rt,ot] = getrtot(A, d)

[column_sizeA, row_sizeA]=size(A.trial__);

B=struct('trial_',[],'time1',[],'InterStim',[],'reaction_time',[]);
j=1;

if(d~=0)
for i =1:+1:column_sizeA
    
    if A.distance{i}==d
        B.trial__(j)=A.trial__(i);
        B.reaction_time{j}=A.reaction_time{i};
        B.time1(j)=A.time1(i);
        B.InterStim{j}=A.InterStim{i};
        j=j+1;
    end
end
end

rt=B.reaction_time;
ot=B.InterStim;

rt = cell2mat(rt);
ot = cell2mat(ot);

rt=rt.';
ot=ot.';

j=1; 
[column_size, row_size]=size(rt);


for i= 1:+1:column_size
   if(rt(i,1)/1000000>.1) && (rt(i,1)/1000000<.30)
      newrt(j,1)=rt(i,1)/1000000;
      newot(j,1)=ot(i,1)/1000000;
      j=j+1;
  end
end

ot=newot;
rt=newrt;
end

