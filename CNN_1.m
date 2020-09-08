% CNN work


clear rtp cnn_input
j = 0;
for i = 1:length(grp_p(2).rtp)
   if ~isnan(grp(2).rtp(i)) && ~isnan(grp(2).bess(i))
      j = j + 1;
      cnn_input(j,1)=grp_p(2).voms(i);
      cnn_input(j,2)=grp_p(2).ss(  i);
      cnn_input(j,3)=grp_p(2).bess(i);
      cnn_input(j,4)=grp_p(2).sac( i);
      cnn_input(j,5)=grp(2).rtp(   i);
      if grp(2).rtp(i) < 24
         cnn_input(j,6) = 0;
         %rtp(i) = 1
      else
         cnn_input(j,6) = 1;
         %rtp(i) = 2;
   end
end
   
end

%cnn_input = [grp_p(2).voms' grp_p(2).ss' grp_p(2).bess' grp_p(2).sac' grp_p(2).rtp' rtp']

cnn2_in  = cnn_input(:,1:4);
cnn2_out = cnn_input(:,6);


%%

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
%set(gca, 'xlim',      [-1 80]                      );
%set(gca, 'ylim',      [0 225]                      );
%set(gca, 'xtick',     1:4                         );
%set(gca, 'ytick',     1:4                         );
set(gca, 'LineWidth', 2                            );
xlabel('RTP (days) ');
ylabel('Number of Athletes' );
%title('Symptom Score');

h1 = nlp_hist_stair2 (grp_p(2).rtp, 0,250, 2, 0);
set(h1,'Color',CYAN,'LineWidth',2)
%h2 = nlp_hist_stair2 (log10(grp_p(2).rtp), 0, 3, .1, 0);
%set(h2,'Color',CYAN,'LineWidth',2)