% Examine ROC Curves for a difference

clear auc1 auc2
for i= 1:length( d(11).d )
   auc1(i)  = d(11).d(i).AUC;
   auc2(i)  = d(15).d(i).AUC;
end


figure

hold on
set(gca,'xlim',[0 1])


h1 = nlp_hist_stair2(auc1,0,1,0.01,-0.001 );
h2 = nlp_hist_stair2(auc2,0,1,0.01, 0.001 );

set(h1,'Color',RED, 'LineWidth',2);
set(h2,'Color',BLUE,'LineWidth',2);


[H,P,CI,STATS] = ttest2(auc1, auc2);

text(0.3,40,['T-test P = ' num2str(P,'%4.3f')])

