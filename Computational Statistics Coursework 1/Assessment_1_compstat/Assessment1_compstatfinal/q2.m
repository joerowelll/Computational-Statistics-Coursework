%q2.m
%a)
cancer=csvread('cancer.csv');
%Tumor perimeter and malignancy values repsctively
tumorP=cancer(:,1);
malignant=cancer(:,2);
figure
%plotting values and labelling
boxplot(tumorP,malignant,'Labels',{'Benign','Malignant'});
xlabel('Diagnosis');
ylabel('Tumor perimeters');
title('Tumor perimeter, malignancy relationship');
grid on
%mean tumor perimeter is shown by red line on boxplots.
%b)
%this gives the number of test positives and test negatives.
bigtumor=length(tumorP(tumorP>=90)); %test postiive
smalltumor=length(tumorP(tumorP<=90)); %test negative
TP= length(find(malignant(tumorP>=90)==1));
TN=length(find(malignant(tumorP<=90)==0));
FP=length(find(malignant(tumorP<=90)==1));
FN=length(find(malignant(tumorP>=90)==0));

%this calls the function used in class and gives values 
%for se and sp
[Se Sp]   =  calcSeSp( TP, FP, FN, TN );
fprintf('The sensitivity value is, %d\n, The Specificity value is %d\n',Se, Sp);
%The sensitivity is the positive detection rate,
%whilst the specoficity is the negative detection rate.
%this test gives 0.79 se and 0.92 sp. Overall a good
%test as it is close to the ground truth.


