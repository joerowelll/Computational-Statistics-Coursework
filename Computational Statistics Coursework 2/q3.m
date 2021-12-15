%q3.m
load('tumour_volumes.mat');
load('tumour_volumes.mat', 'volume_after_proton');
load('tumour_volumes.mat', 'volume_after_radio');
load('tumour_volumes.mat', 'volume_before_proton');
load('tumour_volumes.mat', 'volume_before_radio');
%Find if data distribution is normal, use histograms.
figure
subplot(2,2,1);
histogram(volume_after_proton);
xlabel('Frequency');
ylabel('Volume');
title('Tumor volume after proton therapy');
subplot(2,2,2);
histogram(volume_after_radio);
xlabel('Frequency');
ylabel('Volume');
title('Tumor volume after radiotherapy');
subplot(2,2,3);
histogram(volume_before_proton);
xlabel('Frequency');
ylabel('Volume');
title('Tumor volume before proton therapy');
subplot(2,2,4);
histogram(volume_before_radio);
xlabel('Frequency');
ylabel('Volume');
title('Tumor volume before radio therapy');

%Tumor volue after radiotherapy and tumor volume before proton therapy show
%slight positive skew. Skew test required.
%This calculates skew in tumor sizes after proton therapy tretament
afterprotonav=mean(volume_after_proton);
afterprotonmed=median(sort(volume_after_proton));
afterprotonstd=std(volume_after_proton);
afterprotonskew= (3*(afterprotonav-afterprotonmed))/afterprotonstd;
%This calculates skew in tumor sizes before proton therapy tretament
%(below)
befprotonav=mean(volume_before_proton);
befprotonmed=median(sort(volume_before_proton));
befprotonstd=std(volume_before_proton);
befprotonskew= (3*(befprotonav-befprotonmed))/befprotonstd;
%This calculates skew in tumor size before radiotherapy(below);
befradioav=mean(volume_before_radio);
befradiomed=median(sort(volume_before_radio));
befradiostd=std(volume_before_radio);
befradioskew= (3*(befradioav-befradiomed))/befradiostd;
%This calculates skew in tumor size after radiotherpay (below)
afradioav=mean(volume_after_radio);
afradiomed=median(sort(volume_after_radio));
afradiostd=std(volume_after_radio);
afradioskew= (3*(afradioav-afradiomed))/afradiostd;

fprintf('Skews are %d %d %d %d , after proton therapy,\n before proton therapy, before radiotherapy and after radiotherapy respectively',afterprotonskew,befprotonskew,befradioskew,afradioskew);
%Choose a non parametric test as some data is skewed. paired data.
[hp,pp]=ttest(volume_before_proton,volume_after_proton,'Alpha',0.05,'tail','left');
[hr,pr]=ttest(volume_before_radio, volume_after_radio,'Alpha',0.05,'tail','left');
%Left tailed to find decrease at 95% confidence.Neither therapy shows
%correlation in decrease, both show high probability that the correlation
%is random as both pp and pr are high. hp and hr are 0.


%b) Concerns in this experiment inlcude that this may not be the only care
%or treatment that the individuals are getting. Furthermore, small chabges
%in tumor size are not weighted as heavily, even though the tumor couldve
%been small to begin with.Also small dataset so answer not conclusive.
%Dataset too small to take conclusions.



