% Figure 3 - code is coming from voms_machine_figure3 and
% voms_machine_figure4  - the figure need to broken apart from the
% analysis.  The SVM code takes 4.8 hours to run on my home 8-core new iMAC


% 8-23-90
% Making changes to answering the review's questions.  Review says the
% figures are hard to see - so making color versions
%


var_list_X2={ 'Symp Score', 'SAC', 'BESS','VOMS'};
var_list_Y2={ 'VOMS','BESS','SAC','Symp Score'  };

new_black = CYAN;   % [0  0   0];
new_grey  = ORANGE; % [.5 .5 .5];


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

set(gca,'xticklabel',var_list_X2);
set(gca,'yticklabel',var_list_Y2);


% Draw the line
plot([.9 3.65],[3.65 1.0],'k:','LineWidth',1);

max_x=[ 4 3 2 1];
x = 1;
y = 1;


i = 0;

while x <= 4
   while y <= max_x(x)

      i = i + 1;
      disp([ '( ' num2str(x) ',' num2str(y) ' ): ' num2str(i) ]);
    
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

text( 5.0 + 0.00, 2.7  + 1.80, '\bfSymp Score');
text( 5.0 + 0.40, 2.7  + 1.40, 'Actual (%)'                   );
text( 5.0 + 0.40, 2.7  + 1.10, 'Yes'                          );
text( 5.0 + 1.20, 2.7  + 1.10, 'No'                           );
text( 5.0 + 0.40, 2.7  + 0.60, num2str(d(4).C_percent(1,1)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text( 5.0 + 1.20, 2.7  + 0.60, num2str(d(4).C_percent(1,2)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text( 5.0 + 0.40, 2.7  + 0.15, num2str(d(4).C_percent(2,1)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text( 5.0 + 1.20, 2.7  + 0.15, num2str(d(4).C_percent(2,2)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text( 5.0 + 0.00, 2.7  + 0.60, 'Yes');
text( 5.0 + 0.00, 2.7  + 0.15, 'No');
text( 5.0 - 0.30, 2.7  + 0.00, 'Predicted (%)','Rotation',90);

plot([5.37 6.60 ], [3.5  3.5],'k-','LineWidth',1); %Horz
plot([5.37 5.37 ], [2.4  3.5],'k-','LineWidth',1); %Vert


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

text(-.2,4.8,'\bf4A)','FontSize',14 )




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

set(gca,'xticklabel',{'Symp Score', 'SAC', 'BESS','VOMS', 'AUC'});
set(gca,'yticklabel',{'', '', '', '', ''});

title('AUC Comparisons: Triple & All Four Tests')

plot([.5 5],[.5 .5],'k:','LineWidth',1);


% Row 4
text(1,4, '\bfX','FontSize',14 );
text(2,4, '\bfX','FontSize',14 );
text(3,4, '\bfX','FontSize',14 );
text(4,4, '',    'FontSize',14 );
ht_i(1) = text(5,4, num2str(d(11).mean_auc,'%4.3f'),'FontSize',12,'Color',BLACK);

%keyboard

% Row 3
text(1,3, '\bfX','FontSize',14  );
text(2,3, '\bfX','FontSize',14  );
text(3,3, ''                    );
text(4,3, '\bfX','FontSize',14  );
ht_i(2) =text(5,3, num2str(d(12).mean_auc,'%4.3f'),'FontSize',12);

% Row 2
text(1,2, '\bfX', 'FontSize',14  );
text(2,2, '',     'FontSize',14  );
text(3,2, '\bfX', 'FontSize',14  );
text(4,2, '\bfX', 'FontSize',14  );
ht_i(3) =text(5,2, num2str(d(13).mean_auc,'%4.3f'),'FontSize',12);

% Row 1
text(1,1, '',     'FontSize',14  );
text(2,1, '\bfX', 'FontSize',14  );
text(3,1, '\bfX', 'FontSize',14  );
text(4,1, '\bfX', 'FontSize',14  );
ht_i(4) =text(5,1, num2str(d(14).mean_auc,'%4.3f'),'FontSize',12);

% Bold the highest
set(ht_i(mac_3i),'FontSize',14,'FontWeight','bold')


% Row 0
text(1,0, '\bfX', 'FontSize',14  );
text(2,0, '\bfX', 'FontSize',14  );
text(3,0, '\bfX', 'FontSize',14  );
text(4,0, '\bfX', 'FontSize',14  );
text(5,0, num2str(d(15).mean_auc,'%4.3f'),'FontSize',14,'FontWeight','bold','Color',BLACK);

text(-.15,4.7,'\bf4B)','FontSize',14 )




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
plot([0.2 0.3],[0.12 0.12],'-','LineWidth',2,'Color', CYAN   );
plot([0.2 0.3],[0.05 0.05],'-','LineWidth',2,'Color', ORANGE );
%plot([0.2 0.3],[0.05 0.05],':','LineWidth',4,'Color',[.5 .5 .5 ]);
text(0.32, 0.12,'Symp Score, SAC & BESS',      'FontSize',9,'Color',CYAN   );
text(0.32, 0.05,'Symp Score, SAC, BESS & VOMS','FontSize',9,'Color',ORANGE );

% AUC text
text(0.01, 0.99,['\bfAUC = ' num2str(d(11).mean_auc,'%4.3f')], 'FontSize',12,'Color', CYAN    );
text(0.01, 0.92,['\bfAUC = ' num2str(d(15).mean_auc,'%4.3f')], 'FontSize',12,'Color', ORANGE  );


% Tables

plot(d(11).X, d(11).Y,'-','LineWidth',2,'Color', CYAN    );
plot(d(15).X, d(15).Y,'-','LineWidth',2,'Color', ORANGE  );
%plot(d(15).X, d(15).Y,':','LineWidth',4,'Color', [.5 .5 .5]  );

text(1.2+0.00, 0.5+ 0.61, '\bfSymp Score, SAC', 'Color',CYAN);
text(1.2+0.00, 0.5+ 0.54, '\bf& BESS','Color',CYAN);
text(1.2+0.20, 0.5+ 0.47, 'Actual (%)'                   );
text(1.2+0.20, 0.5+ 0.40, 'Yes'                          );
text(1.2+0.40, 0.5+ 0.40, 'No'                           );
text(1.2+0.20, 0.5+ 0.30, num2str(d(11).C_percent(1,1)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text(1.2+0.40, 0.5+ 0.30, num2str(d(11).C_percent(1,2)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text(1.2+0.20, 0.5+ 0.15, num2str(d(11).C_percent(2,1)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text(1.2+0.40, 0.5+ 0.15, num2str(d(11).C_percent(2,2)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text(1.2+0.09, 0.5+ 0.30, 'Yes');
text(1.2+0.09, 0.5+ 0.15, 'No');
text(1.2+0.05, 0.5+ 0.10, 'Predicted (%)','Rotation',90);
plot([1.2+0.186 1.2+0.500], [0.5+0.35 0.5+0.35],'k-','LineWidth',1); %Horz
plot([1.2+0.189 1.2+0.189], [0.5+0.10 0.5+0.35],'k-','LineWidth',1); %Vert

text(1.2+0.00, -.3 + 0.64, '\bfSymp Score, SAC,','Color',ORANGE );
text(1.2+0.00, -.3 + 0.55, '\bfBESS & VOMS','Color',ORANGE );
text(1.2+0.20, -.3 + 0.47, 'Actual (%)');
text(1.2+0.20, -.3 + 0.40, 'Yes');
text(1.2+0.40, -.3 + 0.40, 'No');
text(1.2+0.20, -.3 + 0.30, num2str(d(15).C_percent(1,1)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text(1.2+0.40, -.3 + 0.30, num2str(d(15).C_percent(1,2)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text(1.2+0.20, -.3 + 0.15, num2str(d(15).C_percent(2,1)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text(1.2+0.40, -.3 + 0.15, num2str(d(15).C_percent(2,2)*100,'%2.0f'),'FontSize',16,'Color',BLACK );
text(1.2+0.09, -.3 + 0.30, 'Yes');
text(1.2+0.09, -.3 + 0.15, 'No');
text(1.2+0.05, -.3 + 0.10, 'Predicted (%)','Rotation',90);

plot([1.383 1.700], [ 0.073  0.073],'k-','LineWidth',1); %Horz
plot([1.383 1.383], [-0.200  0.073],'k-','LineWidth',1); %Vert

text(-.25,1.05,'\bf4C)','FontSize',14 )

text(1.9,-.25,'Ferris et al Fig. 4');

%AUC's histogram

h_axes3=axes; 
nlp_axes_prep2(h_axes3,2);
hold on
set(gca,'Position',   [2.8 1.6 1.6 1.2]           );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                     );
set(gca,'FontSize',   8                           );
set(gca,'FontWeight', 'Normal'                    );
set(gca, 'xlim',      [0.6  1]                    );
%set(gca, 'ylim',      [ 0.0  1]                    );
%set(gca, 'xtick',     0:.25:1                      );
%set(gca, 'ytick',     0:.25:1                      );
%set(gca, 'clipping',  'off'                        );
set(gca, 'LineWidth', 2                            );

clear auc1 auc2
for i= 1:length( d(11).d )
   auc1(i)  = d(11).d(i).AUC;
   auc2(i)  = d(15).d(i).AUC;
end


h1 = nlp_hist_stair2(auc1,.6,1,0.004,-0.0001 );
h2 = nlp_hist_stair2(auc2,.6,1,0.004, 0.0001 );

set(h1,'Color', CYAN,  'LineWidth',1);
set(h2,'Color', ORANGE,'LineWidth',1);


[H,P,CI,STATS] = ttest2(auc1, auc2);

%text(0.3,40,['T-test P = ' num2str(P,'%4.3f')])


title(['AUCs: t-test p = ' num2str(P,'%4.3f')]);
xlabel('');
ylabel('');
