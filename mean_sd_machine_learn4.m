function [ mean_auc, sd_auc, X, Y, C_percent, d] = mean_sd_machine_learn4(trainingData,predictorNames, n_inputs)
% Call classify_1inputs a bunch of times
%   We need to estimate how stable the machine learning is, so let's do it
%   a bunch of times and then find the mean and SD of the AUC

DEBUG = 0;

parfor i = 1:5000
%parfor i = 1:5000
   
   switch n_inputs
      case 1
         [model, accuracy, d(i).x, d(i).y, d(i).AUC, d(i).C, d(i).C_percent, d(i).valid_mat] = classify_1inputs_B(trainingData,predictorNames);        
      case 2
         [model, accuracy, d(i).x, d(i).y, d(i).AUC, d(i).C, d(i).C_percent, d(i).valid_mat] = classify_2inputs_B(trainingData,predictorNames);
      case 3
         [model, accuracy, d(i).x, d(i).y, d(i).AUC, d(i).C, d(i).C_percent, d(i).valid_mat] = classify_3inputs_B(trainingData,predictorNames);
      case 4
         [model, accuracy, d(i).x, d(i).y, d(i).AUC, d(i).C, d(i).C_percent, d(i).valid_mat] = classify_4inputs_B(trainingData,predictorNames);
   end
   
   
end %i

for i = 1:length(d)
   AUC(i) = d(i).AUC;
end


% Build up all the X's
if DEBUG
   figure
   hold on
   title(predictorNames,'interpreter','none')
end

% Interpolate each ROC so we create a mean of all the machine learning runs
% this is done because th ROC's are different lengths

x2 = (0: 0.01 : 1.0)';

for i = 1:length(d)

%{
   disp('-----------')
   disp('-----------')
   disp('-----------')
   [ d(i).x d(i).y ]
   disp('Diff')
   [ diff(d(i).x) diff(d(i).y) ]
%}
   
   d(i).x2 = x2;
   x_fu = d(i).x+(rand(1,length(d(i).x))'/100000); %add a tiny random number because interp1 doesn't allow repeat numbers
   x_fu(1)   = 0;
   x_fu(end) = 1;
   y_fu = d(i).y;
   d(i).y2 = interp1(x_fu, y_fu, x2,'linear');
   
   if DEBUG
      plot(d(i).x, d(i).y, 'b.');
      plot(d(i).x2,d(i).y2,'-' );
   end
   
end


% Build up an array so we can take the mean
for i = 1:length(d)
   X(:,i)=d(i).x2;
   Y(:,i)=d(i).y2;
end
X = mean(X,2);
Y = mean(Y,2);

if DEBUG
   plot( X,Y,'r-','LineWidth',2);
end



mean_auc = mean(AUC);
sd_auc   = std(AUC);


% Find the fit closest to the mean - NO LONGER USED
% d_auc = AUC-mean_auc;
% [~, n]=min(abs(d_auc));
%X = d(n).X;
%Y = d(n).Y;


% Average the conusion matrix
for i = 1:length(d)
   for j = 1:2
      for k = 1:2
         tC(j,k).d(i) = d(i).C_percent(j,k);
      end %l
   end %j
end %i


C_percent(1,1) = mean( tC(1,1).d);
C_percent(1,2) = mean( tC(1,2).d);
C_percent(2,1) = mean( tC(2,1).d);
C_percent(2,2) = mean( tC(2,2).d);

%C_percent = d(n).C_percent;




%keyboard;




end



























% fini
