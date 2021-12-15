%q1.m
load('exam_performance_part_one.mat');
load('exam_performance_part_one.mat', 'G1');
load('exam_performance_part_one.mat', 'G2');
load('exam_performance_part_one.mat', 'G3');
load('exam_performance_part_one.mat', 'G4');
load('exam_performance_part_one.mat', 'G5');
%a) The data collected for this study is multivariate.
%b)There are 5 groups in the initial study data (i.e ...
%0-20%,20-40%,41-60%,61-80%,81-100%);
%c)
figure
subplot (2,3,1);
histogram(G1);
title('Group 1, 0-20% income bracket');
xlabel('Frequency');
ylabel('Grade');
subplot(2,3,2);
histogram(G2);
title('Group 2, 21-40% income bracket');
xlabel('Frequency');
ylabel('Grade');
subplot(2,3,3);
histogram(G3);
title('Group 3, 41-60% income bracket');
xlabel('Frequency');
ylabel('Grade');
subplot(2,3,4);
histogram(G4);
title('Group 4, 61-80% income bracket');
xlabel('Frequency');
ylabel('Grade');
subplot(2,3,5);
histogram(G5);
title('Group 5, 81-100% income bracket');
xlabel('Frequency');
ylabel('Grade');

%d)
avpercentages=mean([G1,G2,G3,G4,G5]);
populationav=mean(avpercentages);

[p]=anova1(avpercentages);

%e) 
load('exam_performance_part_two.mat', 'Air_hi');
load('exam_performance_part_two.mat', 'Air_low');
load('exam_performance_part_two.mat', 'Att_good');
load('exam_performance_part_two.mat', 'Att_poor');
load('exam_performance_part_two.mat', 'Diet_good');
load('exam_performance_part_two.mat', 'Diet_poor');
load('exam_performance_part_two.mat', 'Income_hi');
load('exam_performance_part_two.mat', 'Income_low');
load('exam_performance_part_two.mat', 'Literacy_good');
load('exam_performance_part_two.mat', 'Literacy_poor');
%check if each dataset is normally distributed
figure 
subplot (3,4,1);
histogram(Air_hi)
title('High air quality');
subplot (3,4,2);
histogram(Air_low);
title('Low air quality');
subplot (3,4,3);
histogram(Att_good)
title('Good attendance');
subplot (3,4,4);
histogram(Att_poor)
title('Poor attendance');
subplot (3,4,5);
histogram(Diet_good)
title('Good diet');
subplot (3,4,6);
histogram(Diet_poor)
title('Poor Diet');
subplot (3,4,7);
histogram(Income_hi)
title('High income');
subplot (3,4,8);
histogram(Income_low)
title('Low income');
subplot (3,4,9);
histogram(Literacy_good)
title('Literacy good');
subplot (3,4,10);
histogram(Literacy_poor)
title('Literacy poor');
%data is normally distributed.
[hl,pl]=ttest([Air_hi,Air_low,Att_good,Att_poor,Diet_good,Diet_poor,Income_hi,Income_low,Literacy_good,Literacy_poor],populationav,'Alpha',0.05,'tail','left');
[hr,pr]=ttest([Air_hi,Air_low,Att_good,Att_poor,Diet_good,Diet_poor,Income_hi,Income_low,Literacy_good,Literacy_poor],populationav,'Alpha',0.05,'tail','right');
%Good attendance and good diet have an h value of 1, these correlate with
%good grades and the population mean, the p values for these are also very
%low, therefore it is unlikely that the correlation is random. A 95%
%confidence was used with a left tailed ttest.
%low income negatively affects grades as shown in left tailed ttest.
%good attendance and good diet postively affect grade percentages as found
%in the right tailed ttest.






