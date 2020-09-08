%
% April 2019
%
% Read Tables and then parse into the structures we want
%

DO_FULL_DATA = 0; % Analyze all tables ?

DO_RE_READ = 0;  %If using the full data set, do you want to reread the raw files ?


if DO_FULL_DATA
   
   
   if DO_RE_READ
      
      %
      % Read in data files
      %
      
      disp('Read table 1');
      T1 = readtable('../DATA/CARE1_Baselines_10JAN2019_data_ran_07FEB2019.csv'              );
      
      disp('Read table 2');
      T2 = readtable('../DATA/CARE1_Injuries_10JAN2019_data_ran_07FEB2019.csv'               );
      
      disp('Read table 3');
      T3 = readtable('../DATA/CARE1_postinjury_assessments_10JAN2019_data_ran_07FEB2019.csv' );
      
      disp('Finished');
      
      save voms_tables.mat -v7.3 T1 T2 T3
      
      
   else
      
      tic
      load([DIR 'voms_tables']);
      %load(['voms_tables']);
      toc
      
   end
   
   
   keyboard
   
else
   
load('voms_table_t3');

end



% Count the number of unique concussions in the full dta
fubar = T3{:,7};
disp('Unique concussions');
disp( size( unique(fubar(~isnan(fubar))) )   );

% keyboard