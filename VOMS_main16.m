% 
% VOMS_main analysis program
%

dbstop if error

%COLORS
RED       = [0.90 0.00 0.15 ];
MAGENTA   = [0.80 0.00 0.80 ];
ORANGE    = [1.00 0.50 0.00 ];
YELLOW    = [1.00 0.68 0.26 ];
GREEN     = [0.09 0.45 0.27 ];
CYAN      = [0.28 0.82 0.80 ];
BLUE      = [0.00 0.00 1.00 ];
BLACK     = [0.00 0.00 0.05 ];
GREY      = [0.46 0.44 0.42 ];
D_RED     = [0.63 0.07 0.18 ];
D_MAGENTA = [0.55 0.00 0.55 ];
D_ORANGE  = [1.00 0.30 0.10 ];
D_YELLOW  = [0.72 0.53 0.04 ];
D_GREEN   = [0.09 0.27 0.23 ];
D_BLUE    = [0.00 0.20 0.60 ];
D_CYAN    = [0.00 0.55 0.55 ];


USE_BIG_DATA = 1;
USE_ALL_DATA = 1;

if USE_ALL_DATA
   load('all_data_ada');
else
   
   id_nums = [];
   
   if ~USE_BIG_DATA
      
      read_tables
      
      parse_tables5g
      
      load('demographics')
      
      
      % Note to self - T4, I beleive, is T1, but only the first 426 columns
      
      sub_id = T4{:,3};
      
      for s = 1:length(sub)
         row = find(sub_id == sub(s).id);
         
         if ~isempty(row)
            if strcmp( T4{row(1),11},'F')
               sub(s).sex = 1;
            else
               sub(s).sex = 2;
            end
            sub(s).race               = T4{ row(1), 12  };
            sub(s).ethnicity          = T4{ row(1), 13  };
            sub(s).age                = T4{ row(1), 18  };
            sub(s).preconcussion      = T4{ row(1), 187 };
            sub(s).balancedisorder    = T4{ row(1), 307 };
            sub(s).vestibulardisorder = T4{ row(1), 308 };
            sub(s).vertigo            = T4{ row(1), 309 };
            sub(s).motionsickness     = T4{ row(1), 310 };
            sub(s).addadhd            = T4{ row(1), 326 };
            sub(s).modsevtbi          = T4{ row(1), 331 };
            sub(s).visprob            = T4{ row(1), 333 };
            sub(s).brainsurgery       = T4{ row(1), 332 };
            sub(s).nonmigha           = T4{ row(1), 341 };
            
         end % ~isempty
         
         %disp(sub(s).sex);
         
      end
      
      % Works to hear with the new format.
      
      quick_T2_data_extraction2
      
      % Save voms_big_data2
      %keyboard
      %save voms_big_data4 sub
      
      
   else
      load('voms_big_data5');
   end
   
   calc_voms_total
   
   table1_ver1
      
   
   
   % Create two data structures grp and grp_p
   % grp is unpaired data all 5 time points
   
   % grp_p is the paired data only preseason and post-season
   %create_timepoints_v9; % This branch makes the data structure for the rest of the VOMS paper
   
   create_timepoints_v9_CNN;  % This branch in the code makes the Convultional Neural Network Structure
   
   
   
   

   
   
   % Do some machine learning
   voms_mach_learn_v4;
   
   
   
   
   %keyboard
   
   % Plot the descriptives using the same data as the machine learning
   new_descriptives_figure6b
   
   % Do the machine learning figure
   tic
   voms_machine_figure4_SVM   %or voms_machine_figure3
   toc
   compare_auc
   
   
   
   % Debugging aginst Lyndsey data
   
   
   CNN_1
   
   
end  % ALL_DATA  - All DATA contains the 1000 reps of the SVM

fig3_v2



%
%machine_checker















% fini


