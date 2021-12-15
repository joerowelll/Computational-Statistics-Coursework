%q1.m
%a)GCS is a discrete value
%Hospital stay length is a continous data.
%survival value is a categorical value, as it is categorised
%with either a 1 for living or a 0 for deceased.
%b)
load('GCS.mat', 'gcs');
load('GCS.mat', 'stay');
load('GCS.mat', 'survived');
subplot (3,1,1)
histogram(gcs);
xlabel('GCS');
title('Histogram of GCS values, All patients');
subplot(3,1,2);
histogram(gcs(survived==1));
xlabel('GCS');
title('Histogram of GCS values, surviving patients');
subplot (3,1,3);
histogram(gcs(survived==0));
xlabel('GCS');
title('Histogram of GCS values, deceased patients');
%c)
%gcs survived and deceased values respectively
gcs_S= gcs(survived==1);
gcs_D=gcs(survived==0);
%hospital stay survived and deceased values respectively.
hosp_stay_s= stay(survived==1);
hosp_stay_d=stay(survived==0);
figure
plot(gcs_S,hosp_stay_s,'*m',gcs_D, hosp_stay_d,'*k');
xlabel('GCS value');
ylabel('Hospital stay length (days)');
title('Hospital stay, GCS value relationship');
legend('Surviving', 'Deceased');

d)



