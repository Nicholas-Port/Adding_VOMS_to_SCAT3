% This is newer descriptive figure 
% the voms descriptives_vX series dont' work.  Since the machine learning
% is being run from the fubar tables. I'm going to create a new descriptive
% figure from the same data



% 8-23-20  
% Version 6 was the version sent for the first review
% Version 6b is the version with color added back in response to the
% reviewers
%

% To switch to the paired data copy fubar2 onto fubar8
fubar8=fubar2; % This is the same as voms_machine_figure

new_black = GREEN;   % [0  0   0];
new_grey  = MAGENTA; % [.5 .5 .5];

new_thin  = 2;
new_thick = 4;

% Use Fubar8, at the moment
i1 = find(fubar8.Concussion == 0);
i2 = find(fubar8.Concussion == 1);

h_fig = figure; 
nlp_fig_prep2(h_fig,'Portrait',2);

%%%%%%%%%%%%%%%%%%%%% Symptom Score

h_axes1=axes; 
nlp_axes_prep2(h_axes1,2);
hold on
set(gca,'Position',   [1.5  7.1 5.0 2.50]          );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   12                           );
set(gca,'FontWeight', 'Normal'                     );
set(gca, 'xlim',      [-1 80]                      );
set(gca, 'ylim',      [0 225]                      );
%set(gca, 'xtick',     1:4                         );
%set(gca, 'ytick',     1:4                         );
set(gca, 'LineWidth', 2                            );
xlabel('SCAT3 Symptom Score');
ylabel('Number of Athletes' );
%title('Symptom Score');

h1 = nlp_hist_stair2 (fubar8.Symp_Score(i1), 0,100, 2, 0);
h2 = nlp_hist_stair2 (fubar8.Symp_Score(i2), 0,100, 2, 0);
%h3 = nlp_hist_stair2 (fubar8.Symp_Score(i2), 0,100, 2, 0);
set(h1,'LineStyle','-', 'Color',new_black,  'LineWidth',  new_thin);
set(h2,'LineStyle','-', 'Color',new_grey,   'LineWidth',  new_thin);        
%set(h3,'LineStyle',':', 'Color',new_grey,   'LineWidth',  new_thick);

%Key
plot([55 65],[210 210],'-', 'LineWidth',new_thin, 'Color', new_black );
plot([55 65],[195 195],'-', 'LineWidth',new_thin, 'Color', new_grey  );
%plot([55 65],[195 195],':', 'LineWidth',new_thick,'Color', new_grey  );
text(66,210, 'Preseason',       'Color',new_black );
text(66,195, 'Acute Concussion','Color',new_grey  );

% Tables
text(10,210,[ 'Preseason Mean (SD): ' num2str(nanmean(fubar8.Symp_Score(i1)),'%4.2f') ' (' num2str(nanstd(fubar8.Symp_Score(i1)),'%4.2f') ')' ],'Color', new_black );
text(10,195,[ 'Acute Mean (SD): '     num2str(nanmean(fubar8.Symp_Score(i2)),'%4.2f') ' (' num2str(nanstd(fubar8.Symp_Score(i2)),'%4.2f') ')' ],'Color', new_grey  );

% Stats
[H,P,KSSTAT] = kstest2(fubar8.Symp_Score(i2), fubar8.Symp_Score(i1)          );
d = computeCohen_d(    fubar8.Symp_Score(i2), fubar8.Symp_Score(i1), 'paired');
text(10,150,['\bfKS-Test \itp\rm = ' num2str(P,'%3.4f') ] );
text(10,130,['\bfEffect Size \itd\rm = ' num2str(d,'%3.2f') ] );
text(65,30,['\bf n = ' num2str(length(i2))])  

text(-8,240,'\bf2A)','FontSize',14 )


clear d H P KSSTAT



%%%%%%%%%%%%%%%%%%%%% SAC

h_axes2=axes; 
nlp_axes_prep2(h_axes2,2);
hold on
set(gca,'Position',   [1.5  4.0 2.0 2.25]         );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   12                           );
set(gca,'FontWeight', 'Normal'                     );
set(gca, 'xlim',      [12 32]                      );
set(gca, 'ylim',      [0  100]                     );
%set(gca, 'xtick',     1:4                         );
%set(gca, 'ytick',     1:4                         );
set(gca, 'LineWidth', 2                            );
xlabel('SAC Score');
ylabel('Number of Athletes' );
%title('SAC Score');

h1 = nlp_hist_stair2 (fubar8.SAC(i1),0,32,1, -0.1);
h2 = nlp_hist_stair2 (fubar8.SAC(i2),0,32,1,  0.1);
%h3 = nlp_hist_stair2 (fubar8.SAC(i2),0,32,1,  0.1);
set(h1, 'LineStyle','-', 'Color',new_black,'LineWidth',  new_thin  );
set(h2, 'LineStyle','-', 'Color',new_grey, 'LineWidth',  new_thin  );
%set(h3, 'Linestyle',':', 'Color',new_grey, 'LineWidth',  new_thick );

% Tables
text(13,96,[ num2str(nanmean(fubar8.SAC(i1)),'%4.2f') ' (' num2str(nanstd(fubar8.SAC(i1)),'%4.2f') ')' ],'Color',new_black );
text(13,88,[ num2str(nanmean(fubar8.SAC(i2)),'%4.2f') ' (' num2str(nanstd(fubar8.SAC(i2)),'%4.2f') ')' ],'Color',new_grey  );

% Stats
[H,P,KSSTAT] = kstest2(fubar8.SAC(i2), fubar8.SAC(i1)          );
d = computeCohen_d(    fubar8.SAC(i1), fubar8.SAC(i2), 'paired');
text(13,60,['\bf\itp\rm = ' num2str(P,'%3.4f') ] );
text(13,52,['\bf\itd\rm = ' num2str(d,'%3.2f') ] );
   
text(7,110,'\bf2B)','FontSize',14 )

clear d H P KSSTAT



%%%%%%%%%%%%%%%%%%%%% BESS

h_axes2=axes; 
nlp_axes_prep2(h_axes2,2);
hold on
set(gca,'Position',   [3.8  4.0 2.75 2.25]         );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   12                           );
set(gca,'FontWeight', 'Normal'                     );
set(gca, 'xlim',      [0  33]                      );
set(gca, 'ylim',      [0  42]                      );
%set(gca, 'xtick',     1:4                         );
%set(gca, 'ytick',     1:4                         );
set(gca, 'LineWidth', 2                            );
xlabel('BESS Score');
ylabel('');
%title('BESS Score');

h1 = nlp_hist_stair2 (fubar8.BESS(i1),1,38,1, -0.1);
h2 = nlp_hist_stair2 (fubar8.BESS(i2),1,38,1,  0.1);
%h3 = nlp_hist_stair2 (fubar8.BESS(i2),1,38,1,  0.1);
set(h1,'LineStyle','-','Color',new_black,'LineWidth',  new_thin );
set(h2,'LineStyle','-','Color',new_grey, 'LineWidth',  new_thin );
%set(h3,'LineStyle',':','Color',new_grey, 'LineWidth',  new_thick);

% Tables
text(23,40,[ num2str(nanmean(fubar8.BESS(i1)),'%4.2f') ' (' num2str(nanstd(fubar8.BESS(i1)),'%4.2f') ')' ],'Color',new_black );
text(23,37,[ num2str(nanmean(fubar8.BESS(i2)),'%4.2f') ' (' num2str(nanstd(fubar8.BESS(i2)),'%4.2f') ')' ],'Color',new_grey  );

% Stats
[H,P,KSSTAT] = kstest2(fubar8.BESS(i2), fubar8.BESS(i1)          );
d = computeCohen_d(    fubar8.BESS(i2), fubar8.BESS(i1), 'paired');
text(23,25,['\bf\itp\rm = ' num2str(P,'%3.4f') ] );
text(23,22,['\bf\itd\rm = ' num2str(d,'%3.2f') ] );
   
text(-4,46,'\bf2C)','FontSize',14 )

clear d H P KSSTAT


%%%%%%%%%%%%%%%%%%%%% VOMS

h_axes2=axes; 
nlp_axes_prep2(h_axes2,2);
hold on
set(gca,'Position',   [1.5  1.0 5.0 2.25]        );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                    );
set(gca,'FontSize',   12                         );
set(gca,'FontWeight', 'Normal'                   );
set(gca, 'xlim',      [-1 200]                   );
set(gca, 'ylim',      [0  46]                    );
%set(gca, 'xtick',     1:4                       );
%set(gca, 'ytick',     1:4                       );
set(gca, 'LineWidth', 2                            );
xlabel('Total VOMS Score');
ylabel('Number of Athletes' );

%title('VOMS Score');

h1 = nlp_hist_stair2 (fubar8.VOMS(i1),1,300,5, -0.1);
h2 = nlp_hist_stair2 (fubar8.VOMS(i2),1,300,5,  0.1);
%h3 = nlp_hist_stair2 (fubar8.VOMS(i2),1,300,5,  0.1);
set(h1, 'LineStyle','-', 'Color',new_black,'LineWidth',  new_thin  );
set(h2, 'LineStyle','-', 'Color',new_grey, 'LineWidth',  new_thin  );
%set(h3, 'LineStyle',':', 'Color',new_grey, 'LineWidth',  new_thick );


% Tables
text(150,35,[ num2str(nanmean(fubar8.VOMS(i1)),'%4.2f') ' (' num2str(nanstd(fubar8.VOMS(i1)),'%4.2f') ')' ],'Color',new_black );
text(150,32,[ num2str(nanmean(fubar8.VOMS(i2)),'%4.2f') ' (' num2str(nanstd(fubar8.VOMS(i2)),'%4.2f') ')' ],'Color',new_grey  );

% Stats
[H,P,KSSTAT] = kstest2(fubar8.VOMS(i2), fubar8.VOMS(i1)          );
d = computeCohen_d(    fubar8.VOMS(i2), fubar8.VOMS(i1), 'paired');
text(150,25,['\bf\itp\rm = ' num2str(P,'%3.4f') ] );
text(150,22,['\bf\itd\rm = ' num2str(d,'%3.2f') ] );

text(-22,48,'\bf2D)','FontSize',14 )
text(200, -13, 'Fig. 2 Ferris et al');

clear d H P KSSTAT



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Correlation Figure
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  Shape
%
% ss
% sac
% bess
% Voms
%      ss   sac  bess voms


h_fig3 = figure; 
nlp_fig_prep2(h_fig3,'Portrait',2);


w3 = 1.8;
h3 = 1.8;

lt = [1.0 3.0 5.0 1.0 3.0 1.0];
bt = [1.5 1.5 1.5 3.6 3.6 5.7];



clear x1 y1 x2 y2 ii1 ii2 r1 p1 r2 p2
h_axes1a=axes; 
nlp_axes_prep2(h_axes1a,2);
hold on
set(gca,'Position',   [lt(1)  bt(1) w3 h3]         );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   12                           );
set(gca, 'xlim',      [-5 100]                     );
set(gca, 'ylim',      [-7 200]                     );
set(gca, 'LineWidth', 2                            );
xlabel('Symp Score');
ylabel('VOMS' );

x1 = fubar8.Symp_Score(i1);
x2 = fubar8.Symp_Score(i2);
y1 = fubar8.VOMS(i1);
y2 = fubar8.VOMS(i2);
ii1 = find(~isnan(x1)==1 & ~isnan(y1)==1);
ii2 = find(~isnan(x2)==1 & ~isnan(y2)==1);
[r1,p1] = corr(x1(ii1),y1(ii1),'type','Spearman');
[r2,p2] = corr(x2(ii2),y2(ii2),'type','Spearman');
text(0, 195,['\bf\itr_s\rm = ' num2str(r1,'%3.2f')],'Color',GREEN );
text(0, 180,['\bf\itp\rm = ' num2str(p1,'%4.3f')],'Color',GREEN );
text(70, 25,['\bf\itr_s\rm = ' num2str(r2,'%3.2f')],'Color',MAGENTA );
text(70, 10,['\bf\itp\rm = ' num2str(p2,'%4.3f')],'Color',MAGENTA );

scatter(x1(ii1)+(rand(length(ii1),1)/1),y1(ii1)+(rand(length(ii1),1)/1),'s','SizeData',10,'CData',GREEN,  'MarkerEdgeAlpha',0.5);
scatter(x2(ii2)+(rand(length(ii2),1)/1),y2(ii2)+(rand(length(ii2),1)/1),'o','SizeData',10,'CData',MAGENTA,'MarkerEdgeAlpha',0.5);





clear x1 y1 x2 y2 ii1 ii2 r1 p1 r2 p2
h_axes2a=axes; nlp_axes_prep2(h_axes2a,2);
hold on
set(gca,'Position',   [lt(2)  bt(2) w3 h3]         );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   12                           );
set(gca, 'XLim',      [14  31]                     );
set(gca, 'YLim',      [-7 200]                     );
set(gca, 'YTick',     [0 50 100 150 200]           );
set(gca, 'YTickLabel',{}                           );
set(gca, 'LineWidth', 2                            );
xlabel('SAC');
%ylabel('Voms' );

x1 = fubar8.SAC(i1);
x2 = fubar8.SAC(i2);
y1 = fubar8.VOMS(i1);
y2 = fubar8.VOMS(i2);
ii1 = find(~isnan(x1)==1 & ~isnan(y1)==1);
ii2 = find(~isnan(x2)==1 & ~isnan(y2)==1);
[r1,p1] = corr(x1(ii1),y1(ii1),'type','Spearman');
[r2,p2] = corr(x2(ii2),y2(ii2),'type','Spearman');
text(14.5, 195-(19*0),['\bf\itr_s\rm = ' num2str(r1,'%3.2f')],'Color',GREEN );
text(14.5, 195-(19*1),['\bf\itp\rm = ' num2str(p1,'%4.3f')],'Color',GREEN );
text(14.5, 195-(19*2),['\bf\itr_s\rm = ' num2str(r2,'%3.2f')],'Color',MAGENTA );
text(14.5, 195-(19*3),['\bf\itp\rm = ' num2str(p2,'%4.3f')],'Color',MAGENTA );

scatter(x1(ii1)+(rand(length(ii1),1)/1),y1(ii1)+(rand(length(ii1),1)/1),'s','SizeData',10,'CData',GREEN,  'MarkerEdgeAlpha',0.5);
scatter(x2(ii2)+(rand(length(ii2),1)/1),y2(ii2)+(rand(length(ii2),1)/1),'o','SizeData',10,'CData',MAGENTA,'MarkerEdgeAlpha',0.5);




clear x1 y1 x2 y2 ii1 ii2 r1 p1 r2 p2
h_axes2a=axes; nlp_axes_prep2(h_axes2a,2);
hold on
set(gca,'Position',   [lt(3)  bt(3) w3 h3]         );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   12                           );
set(gca, 'XLim',      [-2  50]                     );
set(gca, 'YLim',      [-7 200]                     );
set(gca, 'YTick',     [0 50 100 150 200]           );
set(gca, 'YTickLabel',{}                           );
set(gca, 'LineWidth', 2                            );
xlabel('BESS');
%ylabel('Voms' );

%x = fubar8.BESS(i2);
%y = fubar8.VOMS(i2);

x1 = fubar8.BESS(i1);
x2 = fubar8.BESS(i2);
y1 = fubar8.VOMS(i1);
y2 = fubar8.VOMS(i2);
ii1 = find(~isnan(x1)==1 & ~isnan(y1)==1);
ii2 = find(~isnan(x2)==1 & ~isnan(y2)==1);
[r1,p1] = corr(x1(ii1),y1(ii1),'type','Spearman');
[r2,p2] = corr(x2(ii2),y2(ii2),'type','Spearman');
text(35, 195-(19*0),['\bf\itr_s\rm = ' num2str(r1,'%3.2f')],'Color',GREEN );
text(35, 195-(19*1),['\bf\itp\rm = ' num2str(p1,'%4.3f')],'Color',GREEN );
text(35, 195-(19*2),['\bf\itr_s\rm = ' num2str(r2,'%3.2f')],'Color',MAGENTA );
text(35, 195-(19*3),['\bf\itp\rm = ' num2str(p2,'%4.3f')],'Color',MAGENTA );

scatter(x1(ii1)+(rand(length(ii1),1)/1),y1(ii1)+(rand(length(ii1),1)/1),'s','SizeData',10,'CData',GREEN,  'MarkerEdgeAlpha',0.5);
scatter(x2(ii2)+(rand(length(ii2),1)/1),y2(ii2)+(rand(length(ii2),1)/1),'o','SizeData',10,'CData',MAGENTA,'MarkerEdgeAlpha',0.5);

text(50, -70, 'Fig. 3 Ferris et al')

clear x1 y1 x2 y2 ii1 ii2 r1 p1 r2 p2
h_axes2a=axes; nlp_axes_prep2(h_axes2a,2);
hold on
set(gca,'Position',   [lt(4)  bt(4) w3 h3]         );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   12                           );
set(gca, 'xlim',      [-5 105]                     );
set(gca, 'ylim',      [-2 50]                      );
set(gca, 'XTick',     [0 50 100]                   );
set(gca, 'XTickLabel',{}                           );
set(gca, 'LineWidth', 2                            );
%xlabel('Symptom Score' );
ylabel('BESS');


x1 = fubar8.Symp_Score(i1);
x2 = fubar8.Symp_Score(i2);
y1 = fubar8.BESS(i1);
y2 = fubar8.BESS(i2);
ii1 = find(~isnan(x1)==1 & ~isnan(y1)==1);
ii2 = find(~isnan(x2)==1 & ~isnan(y2)==1);
[r1,p1] = corr(x1(ii1),y1(ii1),'type','Spearman');
[r2,p2] = corr(x2(ii2),y2(ii2),'type','Spearman');
text(4,  48,['\bf\itr_s\rm = ' num2str(r1,'%3.2f')],'Color',GREEN );
text(4,  43,['\bf\itp\rm = ' num2str(p1,'%4.3f')],'Color',GREEN );
text(51, 48,['\bf\itr_s\rm = ' num2str(r2,'%3.2f')],'Color',MAGENTA );
text(51, 43,['\bf\itp\rm = ' num2str(p2,'%4.3f')],'Color',MAGENTA );

scatter(x1(ii1)+(rand(length(ii1),1)/1),y1(ii1)+(rand(length(ii1),1)/1),'s','SizeData',10,'CData',GREEN,  'MarkerEdgeAlpha',0.5);
scatter(x2(ii2)+(rand(length(ii2),1)/1),y2(ii2)+(rand(length(ii2),1)/1),'o','SizeData',10,'CData',MAGENTA,'MarkerEdgeAlpha',0.5);




clear x1 y1 x2 y2 ii1 ii2 r1 p1 r2 p2
h_axes2a=axes; nlp_axes_prep2(h_axes2a,2);
hold on
set(gca,'Position',   [lt(5)  bt(5) w3 h3]         );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   12                           );
set(gca, 'xlim',      [14  31]                     );
set(gca, 'ylim',      [-2  50]                     );
set(gca, 'XTick',     [15 20 25 30]                );
set(gca, 'YTick',     [0 10 20 30 40 50]           );
set(gca, 'XTickLabel',{}                           );
set(gca, 'YTickLabel',{}                           );
set(gca, 'LineWidth', 2                            );
%xlabel('SAC' );
%ylabel('BESS');


x1 = fubar8.SAC(i1);
x2 = fubar8.SAC(i2);
y1 = fubar8.BESS(i1);
y2 = fubar8.BESS(i2);
ii1 = find(~isnan(x1)==1 & ~isnan(y1)==1);
ii2 = find(~isnan(x2)==1 & ~isnan(y2)==1);
[r1,p1] = corr(x1(ii1),y1(ii1),'type','Spearman');
[r2,p2] = corr(x2(ii2),y2(ii2),'type','Spearman');
text(14.5, 48,['\bf\itr_s\rm = ' num2str(r1,'%3.2f')],'Color',GREEN );
text(14.5, 43,['\bf\itp\rm = ' num2str(p1,'%4.3f')],'Color',GREEN );
text(21,   48,['\bf\itr_s\rm = ' num2str(r2,'%3.2f')],'Color',MAGENTA );
text(21,   43,['\bf\itp\rm = ' num2str(p2,'%4.3f')],'Color',MAGENTA );

scatter(x1(ii1)+(rand(length(ii1),1)/1),y1(ii1)+(rand(length(ii1),1)/1),'s','SizeData',10,'CData',GREEN,  'MarkerEdgeAlpha',0.5);
scatter(x2(ii2)+(rand(length(ii2),1)/1),y2(ii2)+(rand(length(ii2),1)/1),'o','SizeData',10,'CData',MAGENTA,'MarkerEdgeAlpha',0.5);


clear x1 y1 x2 y2 ii1 ii2 r1 p1 r2 p2
h_axes2a=axes; nlp_axes_prep2(h_axes2a,2);
hold on
set(gca,'Position',   [lt(6)  bt(6) w3 h3]         );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   12                           );
set(gca, 'XLim',      [-4 102]                     );
set(gca, 'YLim',      [14 31]                      );
set(gca, 'XTick',     [0 50 100]                   );
set(gca, 'XTickLabel',{}                           );
set(gca, 'LineWidth', 2                            );
%xlabel('Symptom Score' );
ylabel('SAC');

y1 = fubar8.SAC(i1);
y2 = fubar8.SAC(i2);
x1 = fubar8.Symp_Score(i1);
x2 = fubar8.Symp_Score(i2);
ii1 = find(~isnan(x1)==1 & ~isnan(y1)==1);
ii2 = find(~isnan(x2)==1 & ~isnan(y2)==1);
[r1,p1] = corr(x1(ii1),y1(ii1),'type','Spearman');
[r2,p2] = corr(x2(ii2),y2(ii2),'type','Spearman');
text(20,16.5,['\bf\itr_s\rm = ' num2str(r1,'%3.2f')],'Color',GREEN   );
text(20,15.0,['\bf\itp\rm = ' num2str(p1,'%4.3f')],'Color',GREEN );

text(70,16.5,['\bf\itr_s\rm = ' num2str(r2,'%3.2f')],'Color',MAGENTA   );
text(70,15.0,['\bf\itp\rm = ' num2str(p2,'%4.3f')],'Color',MAGENTA );

scatter(x1(ii1)+(rand(length(ii1),1)*1),y1(ii1)+(rand(length(ii1),1)/1),'s','SizeData',10,'CData',GREEN,  'MarkerEdgeAlpha',0.5);
scatter(x2(ii2)+(rand(length(ii2),1)*1),y2(ii2)+(rand(length(ii2),1)/1),'o','SizeData',10,'CData',MAGENTA,'MarkerEdgeAlpha',0.5);

plot(99, 20.0,'s','MarkerSize',10,'Color',GREEN   );
plot(99, 18.5,'o','MarkerSize',10,'Color',MAGENTA );
text(105,20.0,'Preseason','Color',GREEN   );
text(105,18.5,'Acute Concussion',     'Color',MAGENTA );

text(100,28,['n = ' num2str(length(x1)) ],'FontSize',10);










% Fini

