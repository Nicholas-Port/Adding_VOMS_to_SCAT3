function [trainedClassifier, validationAccuracy,X1, Y1, AUC1, C, C_percent, valid_mat] = classify_3inputs_B(trainingData,predictorNames)
% [trainedClassifier, validationAccuracy] = trainClassifier(trainingData)
% returns a trained classifier and its accuracy. This code recreates the
% classification model trained in Classification Learner app. Use the
% generated code to automate training the same model with new data, or to
% learn how to programmatically train models.
%
%  Input:
%      trainingData: a table containing the same predictor and response
%       columns as imported into the app.
%
%  Output:
%      trainedClassifier: a struct containing the trained classifier. The
%       struct contains various fields with information about the trained
%       classifier.
%
%      trainedClassifier.predictFcn: a function to make predictions on new
%       data.
%
%      validationAccuracy: a double containing the accuracy in percent. In
%       the app, the History list displays this overall accuracy score for
%       each model.
%
% Use the code to train the model with new data. To retrain your
% classifier, call the function from the command line with your original
% data or new data as the input argument trainingData.
%
% For example, to retrain a classifier trained with the original data set
% T, enter:
%   [trainedClassifier, validationAccuracy] = trainClassifier(T)
%
% To make predictions with the returned 'trainedClassifier' on new data T2,
% use
%   yfit = trainedClassifier.predictFcn(T2)
%
% T2 must be a table containing at least the same predictor columns as used
% during training. For details, enter:
%   trainedClassifier.HowToPredict

% Auto-generated by MATLAB on 15-Aug-2019 10:13:14


% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
inputTable = trainingData;

%predictorNames = {'VOMS', 'Symp_Score', 'SAC'};%Send the predictorName to classify_3

predictors = inputTable(:, predictorNames);
response = inputTable.Concussion;
isCategoricalPredictor = [false, false, false];

% Train a classifier
% This code specifies all the classifier options and trains the classifier.
template = templateTree(...
   'MaxNumSplits', 20);
classificationEnsemble = fitcensemble(...
   predictors, ...
   response, ...
   'Method', 'AdaBoostM1', ...
   'NumLearningCycles', 30, ...
   'Learners', template, ...
   'LearnRate', 0.1, ...
   'ClassNames', [0; 1]);

% Create the result struct with predict function
predictorExtractionFcn = @(t) t(:, predictorNames);
ensemblePredictFcn = @(x) predict(classificationEnsemble, x);
trainedClassifier.predictFcn = @(x) ensemblePredictFcn(predictorExtractionFcn(x));

% Add additional fields to the result struct
trainedClassifier.RequiredVariables = predictorNames; % {'SAC', 'Symp_Score', 'VOMS'};
trainedClassifier.ClassificationEnsemble = classificationEnsemble;
trainedClassifier.About = 'This struct is a trained model exported from Classification Learner R2019a.';
trainedClassifier.HowToPredict = sprintf('To make predictions on a new table, T, use: \n  yfit = c.predictFcn(T) \nreplacing ''c'' with the name of the variable that is this struct, e.g. ''trainedModel''. \n \nThe table, T, must contain the variables returned by: \n  c.RequiredVariables \nVariable formats (e.g. matrix/vector, datatype) must match the original training data. \nAdditional variables are ignored. \n \nFor more information, see <a href="matlab:helpview(fullfile(docroot, ''stats'', ''stats.map''), ''appclassification_exportmodeltoworkspace'')">How to predict using an exported model</a>.');

% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
inputTable = trainingData;
predictorNames = predictorNames; % {'VOMS', 'Symp_Score', 'SAC'};
predictors = inputTable(:, predictorNames);
response = inputTable.Concussion;
isCategoricalPredictor = [false, false, false];

% Set up holdout validation
cvp = cvpartition(response, 'Holdout', 0.25);
trainingPredictors = predictors(cvp.training, :);
trainingResponse = response(cvp.training, :);
trainingIsCategoricalPredictor = isCategoricalPredictor;

% Train a classifier
% This code specifies all the classifier options and trains the classifier.
template = templateTree(...
   'MaxNumSplits', 20);
classificationEnsemble = fitcensemble(...
   trainingPredictors, ...
   trainingResponse, ...
   'Method', 'AdaBoostM1', ...
   'NumLearningCycles', 30, ...
   'Learners', template, ...
   'LearnRate', 0.1, ...
   'ClassNames', [0; 1]);

% Create the result struct with predict function
ensemblePredictFcn = @(x) predict(classificationEnsemble, x);
validationPredictFcn = @(x) ensemblePredictFcn(x);

% Add additional fields to the result struct


% Compute validation predictions
validationPredictors = predictors(cvp.test, :);
validationResponse = response(cvp.test, :);
[validationPredictions, validationScores] = validationPredictFcn(validationPredictors);

% Compute validation accuracy
correctPredictions = (validationPredictions == validationResponse);
isMissing = isnan(validationResponse);
correctPredictions = correctPredictions(~isMissing);
validationAccuracy = sum(correctPredictions)/length(correctPredictions);



% AUC stuff
[X1,Y1,~,AUC1]=perfcurve(validationResponse,validationScores(:,2), 1 );

% Confusion Matrix
C= confusionmat(validationResponse,validationPredictions);
for r = 1:2
   C_percent(r,1:2)=C(r,1:2) / sum( C(r,1:2) );
end

% Nov 1 2019
%
% valid_mat is being returned to the other functions
%
% - validationPredcitors - This table is the X Y inputs to the validation stage of the model, 
% - validationPredictions - are the model's opinion of concussed YES OR NO
% - correctPredictions - was the model correct ?
valid_mat = [ table2array(validationPredictors) validationPredictions correctPredictions];
%keyboard







%fini
