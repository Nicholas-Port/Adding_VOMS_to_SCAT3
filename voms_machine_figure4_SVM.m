% This section of code will call the automatic machine learning functions
% Then we'll make the figure

var_list_X={ 'Symp_Score', 'SAC', 'BESS','VOMS'};
var_list_Y={ 'VOMS','BESS','SAC','Symp_Score'  };


max_x=[ 4 3 2 1];
x = 1;
y = 1;

single_max = 0;
sm_x = 0;
sm_y = 0;
double_max = 0;
dm_x = 0;
dm_y = 0;


% To switch to the paired data copy fubar2 onto fubar8
fubar8=fubar2;

%keyboard

i = 0;
disp('1-way & 2-way comparisons')
while x <= 4
   while y <= max_x(x)
      
      i = i + 1;
      disp([ '( ' num2str(x) ',' num2str(y) ' ): ' num2str(i) ]);
      d(i).x = x;
      d(i).y = y;
      
       if  x == 1 && y == 4
          [d(i).mean_auc, d(i).sd_auc, d(i).X, d(i).Y, d(i).C_percent, d(i).d] = mean_sd_machine_learn4_SVM(fubar8,var_list_X(x),1);
          d(i).X_VAR = var_list_X(x);
          if d(i).mean_auc > single_max 
             single_max = d(i).mean_auc;
             sm_x = x;
             sm_y = y;
          end
       elseif x == 2 && y == 3
          [d(i).mean_auc, d(i).sd_auc, d(i).X, d(i).Y, d(i).C_percent, d(i).d] = mean_sd_machine_learn4_SVM(fubar8,var_list_X(x),1);
          d(i).X_VAR = var_list_X(x);
          if d(i).mean_auc > single_max 
             single_max = d(i).mean_auc;
             sm_x = x;
             sm_y = y;
          end
       elseif x == 3 && y == 2
          [d(i).mean_auc, d(i).sd_auc, d(i).X, d(i).Y, d(i).C_percent, d(i).d] = mean_sd_machine_learn4_SVM(fubar8,var_list_X(x),1);
          d(i).X_VAR = var_list_X(x);
          if d(i).mean_auc > single_max 
             single_max = d(i).mean_auc;
             sm_x = x;
             sm_y = y;
          end
       elseif x == 4 && y == 1
          [d(i).mean_auc, d(i).sd_auc, d(i).X, d(i).Y, d(i).C_percent, d(i).d] = mean_sd_machine_learn4_SVM(fubar8,var_list_X(x),1);
          d(i).X_VAR = var_list_X(x);
           if d(i).mean_auc > single_max 
             single_max = d(i).mean_auc;
             sm_x = x;
             sm_y = y;
          end
       else
         keyboard
          [d(i).mean_auc, d(i).sd_auc, d(i).X, d(i).Y, d(i).C_percent, d(i).d] = mean_sd_machine_learn4_SVM(fubar8,[var_list_X(x) var_list_Y(y)],2 );
          d(i).X_VAR = var_list_X(x);
          d(i).Y_VAR = var_list_Y(y);
          if d(i).mean_auc > double_max 
             double_max = d(i).mean_auc;
             dm_x = x;
             dm_y = y;
          end
          
          
       end
       
       % Debug
       %if x == 1 && y == 4  % i == 4
       %   keyboard
       %end
      
      %ht(x,y)=text(x-0.2, y, [ num2str(mean_auc,'%4.3f') ],'FontSize',12);
    
      y = y + 1;
      
   end %col
   x = x + 1;
   y = 1;
end %row

% 3-way comparisons
disp('3-way comparisons');
[d(11).mean_auc, d(11).sd_auc, d(11).X, d(11).Y, d(11).C_percent, d(11).d] = mean_sd_machine_learn4_SVM(fubar8,{'Symp_Score', 'SAC',  'BESS'},3);
[d(12).mean_auc, d(12).sd_auc, d(12).X, d(12).Y, d(12).C_percent, d(12).d] = mean_sd_machine_learn4_SVM(fubar8,{'Symp_Score', 'SAC',  'VOMS'},3);
[d(13).mean_auc, d(13).sd_auc, d(13).X, d(13).Y, d(13).C_percent, d(13).d] = mean_sd_machine_learn4_SVM(fubar8,{'Symp_Score', 'BESS', 'VOMS'},3);
[d(14).mean_auc, d(14).sd_auc, d(14).X, d(14).Y, d(14).C_percent, d(14).d] = mean_sd_machine_learn4_SVM(fubar8,{'SAC',        'BESS', 'VOMS'},3);

% Find the largest of the 3 way comparisons
max_3 = 0;
for j = 1:4   % inside d(x) we are looking at 11-14
   if d(j+10).mean_auc > max_3
      mac_3i = j;
      max_3 = d(j+10).mean_auc;
   end
end


% 4 way model
disp('4-way comparison');
[d(15).mean_auc, d(15).sd_auc, d(15).X, d(15).Y, d(15).C_percent, d(15).d] = mean_sd_machine_learn4_SVM(fubar8,{'Symp_Score','SAC', 'BESS', 'VOMS'},4);



% 
% % New figure of validation results
% 
% 
% clear x y 
% 
% figure
% hold on
% set(gca,'xlim',[-5 200]);
% set(gca,'ylim',[-5 200]);
% xlabel('SCAT3 Symptom Scores')
% ylabel('Total VOMS Score')
% for d2 = 1:length(d(15).d)
%    
%    for i = 1:length(d(15).d(d2).valid_mat(:,1));
%       x = d(15).d(d2).valid_mat(i,1) + rand(1,1)/10;
%       y = d(15).d(d2).valid_mat(i,4)+ rand(1,1)/10;
%       if d(15).d(d2).valid_mat(i,5) == 0
%          hp = scatter(x,y,'b','MarkerEdgeAlpha',.4);
%       else
%          hp = scatter(x,y,'r','MarkerEdgeAlpha',.4);         
%       end
%       
%    end %i
% end
% 
% 


%
% Broken code
% a find method doesn't work because we have two many subjects with the
% same discrete scores, eg. ss = 0, sac = 30, bess = 4
%      f8 = table2array(fubar8) % concuss - voms- ss - sac - bess
%       x = d(11).d(d2).valid_mat(i,1); %ss
%       b = d(11).d(d2).valid_mat(i,2); %sac
%       c = d(11).d(d2).valid_mat(i,3); %bess
% find(f8(:,3)==0 & f8(:,4)==b & f8(:,5)==c )
% %%




%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Create the figure
%
%%%%%%%%%%%%%%%%%%%%%%%%%


%var_list_X{1}



h_fig = figure; 
nlp_fig_prep2(h_fig,'Portrait',2);


h_axes1=axes; 
nlp_axes_prep2(h_axes1,2);
hold on
set(gca,'Position',   [1.5  7.4 2.50 1.75]         );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   12                           );
set(gca,'FontWeight', 'Normal'                     );
set(gca, 'xlim',      [0.5 4.2]                    );
set(gca, 'ylim',      [0.5 4.2]                    );
set(gca, 'xtick',     1:4                          );
set(gca, 'ytick',     1:4                          );
set(gca, 'TickLabelInterpreter', 'none'            );
set(gca, 'clipping',  'off'                        );
set(gca, 'LineWidth', 2                            );

set(gca,'xticklabel',var_list_X);
set(gca,'yticklabel',var_list_Y);


% Draw the line
plot([.9 3.65],[3.65 1.0],'k:','LineWidth',1);

max_x=[ 4 3 2 1];
x = 1;
y = 1;


i = 0;

while x <= 4
   while y <= max_x(x)

      i = i + 1;
      %disp([ '( ' num2str(x) ',' num2str(y) ' ): ' num2str(i) ]);
    
      ht(x,y)=text(x-0.2, y, [ num2str(d(i).mean_auc,'%4.3f') ],'FontSize',12);
    
      y = y + 1;
      
   end %col
   x = x + 1;
   y = 1;
end %row

set(ht(sm_x,sm_y),'FontWeight','bold','FontSize',14);
set(ht(dm_x,dm_y),'FontWeight','bold','FontSize',14);

text(1.1, 4.9, '\bfAUC Comparisons:',       'FontSize',12);
text(1, 4.5, '\bfSingle and Paired Tests','FontSize',12);

% Two by Two table

text( 5.0 + 0.00, 2.5  + 1.80, '\bfSymp Score');
text( 5.0 + 0.40, 2.5  + 1.40, 'Actual (%)'                   );
text( 5.0 + 0.40, 2.5  + 1.10, 'Yes'                          );
text( 5.0 + 1.20, 2.5  + 1.10, 'No'                           );
text( 5.0 + 0.40, 2.5  + 0.60, num2str(d(4).C_percent(1,1)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text( 5.0 + 1.20, 2.5  + 0.60, num2str(d(4).C_percent(1,2)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text( 5.0 + 0.40, 2.5  + 0.15, num2str(d(4).C_percent(2,1)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text( 5.0 + 1.20, 2.5  + 0.15, num2str(d(4).C_percent(2,2)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text( 5.0 + 0.00, 2.5  + 0.60, 'Yes');
text( 5.0 + 0.00, 2.5  + 0.15, 'No');
text( 5.0 - 0.30, 2.5  + 0.00, 'Predicted (%)','Rotation',90);

plot([5.37 6.60 ], [3.4  3.4],'k-','LineWidth',1); %Horz
plot([5.37 5.37 ], [2.4  3.4],'k-','LineWidth',1); %Vert


% Two by Two table

text( 5.0 + 0.00, 0.0  + 1.80, '\bfSymp Score & VOMS');
text( 5.0 + 0.40, 0.0  + 1.40, 'Actual (%)'                   );
text( 5.0 + 0.40, 0.0  + 1.10, 'Yes'                          );
text( 5.0 + 1.20, 0.0  + 1.10, 'No'                           );
text( 5.0 + 0.40, 0.0  + 0.60, num2str(d(1).C_percent(1,1)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text( 5.0 + 1.20, 0.0  + 0.60, num2str(d(1).C_percent(1,2)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text( 5.0 + 0.40, 0.0  + 0.15, num2str(d(1).C_percent(2,1)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text( 5.0 + 1.20, 0.0  + 0.15, num2str(d(1).C_percent(2,2)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text( 5.0 + 0.00, 0.0  + 0.60, 'Yes');
text( 5.0 + 0.00, 0.0  + 0.15, 'No');
text( 5.0 - 0.30, 0.0  + 0.00, 'Predicted (%)','Rotation',90);

plot([5.37 6.60 ], [0.9    0.9], 'k-','LineWidth',1); %Horz
plot([5.37 5.37 ], [-0.1   0.9], 'k-','LineWidth',1); %Vert



%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%

h_axes1=axes; 
nlp_axes_prep2(h_axes1,2);
hold on
set(gca,'Position',   [1.5  4.5 4.0 2.0]           );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   12                           );
set(gca,'FontWeight', 'Normal'                     );
set(gca, 'xlim',      [0.5 5.2]                    );
set(gca, 'ylim',      [-0.5 4.2]                   );
set(gca, 'xtick',     1:5                          );
set(gca, 'ytick',     0:4                          );
set(gca, 'TickLabelInterpreter', 'none'            );
set(gca, 'LineWidth', 2                            );

set(gca,'xticklabel',{'Symp_Score', 'SAC', 'BESS','VOMS', 'AUC'});
set(gca,'yticklabel',{'', '', '', '', ''});

title('AUC Comparisons: Triple & All Four Tests')

plot([.5 5],[.5 .5],'k:','LineWidth',1);


% Row 4
text(1,4, '\bfX','FontSize',14 );
text(2,4, '\bfX','FontSize',14 );
text(3,4, '\bfX','FontSize',14 );
text(4,4, '',    'FontSize',14 );
ht_i(4) = text(5,4, num2str(d(11).mean_auc,'%4.3f'),'FontSize',12,'Color',ORANGE);

%keyboard

% Row 3
text(1,3, '\bfX','FontSize',14  );
text(2,3, '\bfX','FontSize',14  );
text(3,3, ''                    );
text(4,3, '\bfX','FontSize',14  );
ht_i(3) =text(5,3, num2str(d(12).mean_auc,'%4.3f'),'FontSize',12);

% Row 2
text(1,2, '\bfX', 'FontSize',14  );
text(2,2, '',     'FontSize',14  );
text(3,2, '\bfX', 'FontSize',14  );
text(4,2, '\bfX', 'FontSize',14  );
ht_i(2) =text(5,2, num2str(d(13).mean_auc,'%4.3f'),'FontSize',12);

% Row 1
text(1,1, '',     'FontSize',14  );
text(2,1, '\bfX', 'FontSize',14  );
text(3,1, '\bfX', 'FontSize',14  );
text(4,1, '\bfX', 'FontSize',14  );
ht_i(1) =text(5,1, num2str(d(14).mean_auc,'%4.3f'),'FontSize',12);

% Bold the highest
set(ht_i(mac_3i),'FontSize',14,'FontWeight','bold')


% Row 0
text(1,0, '\bfX', 'FontSize',14  );
text(2,0, '\bfX', 'FontSize',14  );
text(3,0, '\bfX', 'FontSize',14  );
text(4,0, '\bfX', 'FontSize',14  );
text(5,0, num2str(d(15).mean_auc,'%4.3f'),'FontSize',14,'FontWeight','bold','Color',CYAN);




%%%%%%%%%%%%%%%%%%

h_axes3=axes; 
nlp_axes_prep2(h_axes3,2);
hold on
set(gca,'Position',   [1.5  1.0 2.5 2.5]           );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   12                           );
set(gca,'FontWeight', 'Normal'                     );
set(gca, 'xlim',      [-0.02  1]                   );
set(gca, 'ylim',      [ 0.0  1]                    );
set(gca, 'xtick',     0:.25:1                      );
set(gca, 'ytick',     0:.25:1                      );
set(gca, 'clipping',  'off'                        );
set(gca, 'LineWidth', 2                            );

title('ROC Curves');
xlabel('False Positive Rate');
ylabel('True Positive Rate' );

plot([0 1],[0 1],'k:');

%Key
plot([0.2 0.3],[0.12 0.12],'-','LineWidth',2,'Color',ORANGE);
plot([0.2 0.3],[0.05 0.05],'-','LineWidth',2,'Color',CYAN);
text(0.32, 0.12,'Symp Score, SAC & BESS',      'FontSize',9,'Color',ORANGE);
text(0.32, 0.05,'Symp Score, SAC, BESS & VOMS','FontSize',9,'Color',CYAN  );

% AUC text
text(0.58, 0.35,['AUC = ' num2str(d(11).mean_auc,'%4.3f')], 'FontSize',12,'Color',ORANGE);
text(0.58, 0.25,['AUC = ' num2str(d(15).mean_auc,'%4.3f')], 'FontSize',12,'Color',CYAN  );


% Tables

plot(d(11).X, d(11).Y,'-','LineWidth',2,'Color', ORANGE );
plot(d(15).X, d(15).Y,'-','LineWidth',2,'Color', CYAN   );

text(1+0.00, 0.5+ 0.55, '\bfSymp Score, SAC & BESS');
text(1+0.20, 0.5+ 0.47, 'Actual (%)'                   );
text(1+0.20, 0.5+ 0.40, 'Yes'                          );
text(1+0.40, 0.5+ 0.40, 'No'                           );
text(1+0.20, 0.5+ 0.30, num2str(d(11).C_percent(1,1)*100,'%2.0f'),'FontSize',16,'Color',ORANGE );
text(1+0.40, 0.5+ 0.30, num2str(d(11).C_percent(1,2)*100,'%2.0f'),'FontSize',16,'Color',ORANGE );
text(1+0.20, 0.5+ 0.15, num2str(d(11).C_percent(2,1)*100,'%2.0f'),'FontSize',16,'Color',ORANGE );
text(1+0.40, 0.5+ 0.15, num2str(d(11).C_percent(2,2)*100,'%2.0f'),'FontSize',16,'Color',ORANGE );
text(1+0.09, 0.5+ 0.30, 'Yes');
text(1+0.09, 0.5+ 0.15, 'No');
text(1+0.05, 0.5+ 0.10, 'Predicted (%)','Rotation',90);
plot([1+0.186 1+0.500], [0.5+0.35 0.5+0.35],'k-','LineWidth',1); %Horz
plot([1+0.189 1+0.189], [0.5+0.10 0.5+0.35],'k-','LineWidth',1); %Vert


text(1+0.00, 0.55, '\bfSymp Score, SAC, BESS & VOMS');
text(1+0.20, 0.47, 'Actual (%)');
text(1+0.20, 0.40, 'Yes');
text(1+0.40, 0.40, 'No');
text(1+0.20, 0.30, num2str(d(15).C_percent(1,1)*100,'%2.0f'),'FontSize',16,'Color',CYAN );
text(1+0.40, 0.30, num2str(d(15).C_percent(1,2)*100,'%2.0f'),'FontSize',16,'Color',CYAN );
text(1+0.20, 0.15, num2str(d(15).C_percent(2,1)*100,'%2.0f'),'FontSize',16,'Color',CYAN );
text(1+0.40, 0.15, num2str(d(15).C_percent(2,2)*100,'%2.0f'),'FontSize',16,'Color',CYAN );
text(1+0.09, 0.30, 'Yes');
text(1+0.09, 0.15, 'No');
text(1+0.05, 0.10, 'Predicted (%)','Rotation',90);

plot([1+0.186 1+0.500], [0.0+0.35 0.0+0.35],'k-','LineWidth',1); %Horz
plot([1+0.189 1+0.189], [0.0+0.10 0.0+0.35],'k-','LineWidth',1); %Vert



















% fini