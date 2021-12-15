function [Se Sp]   =  calcSeSp( TP, FP, FN, TN );
%usage:
% [Se Sp] = SeSp( TP, FP, FN, TN )
%Input data provides summary of test performance:
% TP - number of true positives
% FP - number of false positives
% FN - number of false negatives
% TN - number of true negatives
% output is:
% Se - Sensitivity
% Sp - Specificity

Se = TP/(TP+FN);
Sp = TN/(TN+FP);
end
