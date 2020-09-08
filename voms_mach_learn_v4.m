% voms_mach_learn_v4


% This is our scratch pad for machine learning


% Let's make a table

clear fubar, clear fubar3, clear stat1, clear stat2

v = [];

%Paired Data
fubar(1:grp_p(1).n,1) = zeros(grp_p(1).n,1);
fubar(1:grp_p(1).n,2) = grp_p(1).voms;
fubar(1:grp_p(1).n,3) = grp_p(1).ss;
fubar(1:grp_p(1).n,4) = grp_p(1).sac;
fubar(1:grp_p(1).n,5) = grp_p(1).bess;

n2 = grp_p(1).n + 1;
fubar(n2:grp_p(2).n+n2-1, 1) = ones(grp_p(2).n,1);
fubar(n2:grp_p(2).n+n2-1, 2) = grp_p(2).voms;
fubar(n2:grp_p(2).n+n2-1, 3) = grp_p(2).ss;
fubar(n2:grp_p(2).n+n2-1, 4) = grp_p(2).sac;
fubar(n2:grp_p(2).n+n2-1, 5) = grp_p(2).bess;

fubar2 = array2table(fubar,'VariableNames',{'Concussion' 'VOMS' 'Symp_Score' 'SAC' 'BESS'} );
stat1  = grpstats(fubar2, 'Concussion', {'mean','std'}, 'DataVars', {'VOMS', 'Symp_Score', 'SAC', 'BESS'});

fubar3(1:grp_p(1).n,1) = zeros(grp_p(1).n,1);
for v = 1:8
    fubar3(1:grp_p(1).n,2) = grp_p(1).v(v).dizzy;
    fubar3(1:grp_p(1).n,3) = grp_p(1).v(v).fog;
    fubar3(1:grp_p(1).n,4) = grp_p(1).v(v).headache;
    fubar3(1:grp_p(1).n,5) = grp_p(1).v(v).nausea;
    fubar3(1:grp_p(1).n,6) = grp_p(1).v(v).total;
end

fubar3(1:grp_p(1).n,6) = grp_p(1).ss_dizzy;
fubar3(1:grp_p(1).n,7) = grp_p(1).ss_fog;
fubar3(1:grp_p(1).n,8) = grp_p(1).ss_headache;
fubar3(1:grp_p(1).n,9) = grp_p(1).ss_nausea;


n2 = grp_p(1).n + 1;
fubar3(n2:grp_p(2).n+n2-1, 1) = ones(grp_p(2).n,1);
for v = 1:8
    fubar3(n2:grp_p(2).n+n2-1, 2) = grp_p(2).v(v).dizzy;
    fubar3(n2:grp_p(2).n+n2-1, 3) = grp_p(2).v(v).fog;
    fubar3(n2:grp_p(2).n+n2-1, 4) = grp_p(2).v(v).headache;
    fubar3(n2:grp_p(2).n+n2-1, 5) = grp_p(2).v(v).nausea;
    fubar3(n2:grp_p(2).n+n2-1, 6) = grp_p(2).v(v).total;
end

fubar3(n2:grp_p(2).n+n2-1, 6) = grp_p(2).ss_dizzy;
fubar3(n2:grp_p(2).n+n2-1, 7) = grp_p(2).ss_fog;
fubar3(n2:grp_p(2).n+n2-1, 8) = grp_p(2).ss_headache;
fubar3(n2:grp_p(2).n+n2-1, 9) = grp_p(2).ss_nausea;

fubar4 = array2table(fubar3,'VariableNames',{'Concussion' 'vDiz' 'vFog' 'vHA' 'vNaus' 'ssDiz' 'ssFog' 'ssHA' 'ssNaus'});
stat2 = grpstats(fubar4, 'Concussion', {'mean','std'}, 'DataVars', {'vDiz' 'vFog' 'vHA' 'vNaus' 'ssDiz' 'ssFog' 'ssHA' 'ssNaus'});

%VOMS Eye-movement table
fubar5(1:grp_p(1).n,1) = zeros(grp_p(1).n,1);
fubar5(1:grp_p(1).n,2) = grp_p(1).v(1).total;
fubar5(1:grp_p(1).n,3) = grp_p(1).v(5).total;
fubar5(1:grp_p(1).n,4) = grp_p(1).v(3).total;
fubar5(1:grp_p(1).n,5) = grp_p(1).v(4).total;
fubar5(1:grp_p(1).n,6) = grp_p(1).v(2).total;
fubar5(1:grp_p(1).n,7) = grp_p(1).v(7).total;
fubar5(1:grp_p(1).n,8) = grp_p(1).v(8).total;
fubar5(1:grp_p(1).n,9) = grp_p(1).v(6).total;

n2 = grp_p(1).n + 1;
fubar5(n2:grp_p(2).n+n2-1, 1) = ones(grp_p(2).n,1);
fubar5(n2:grp_p(2).n+n2-1, 2) = grp_p(2).v(1).total;
fubar5(n2:grp_p(2).n+n2-1, 3) = grp_p(2).v(5).total;
fubar5(n2:grp_p(2).n+n2-1, 4) = grp_p(2).v(3).total;
fubar5(n2:grp_p(2).n+n2-1, 5) = grp_p(2).v(4).total;
fubar5(n2:grp_p(2).n+n2-1, 6) = grp_p(2).v(2).total;
fubar5(n2:grp_p(2).n+n2-1, 7) = grp_p(2).v(7).total;
fubar5(n2:grp_p(2).n+n2-1, 8) = grp_p(2).v(8).total;
fubar5(n2:grp_p(2).n+n2-1, 9) = grp_p(2).v(6).total;

fubar6 = array2table(fubar5,'VariableNames',{'Concussion' 'Baseline' 'Sm_Purs' 'Sac_Horiz' 'Sac_Vert' 'Conv' 'VOR_H' 'VOR_V' 'Vis_Mot'} );
stat3  = grpstats(fubar6, 'Concussion', {'mean','std'}, 'DataVars', {'Baseline' 'Sm_Purs' 'Sac_Horiz' 'Sac_Vert' 'Conv' 'VOR_H' 'VOR_V' 'Vis_Mot'});


%VOMS SYMPTOMS TOTALS
grp_p(1).dizzy    = fubar3(1:grp_p(1).n,3);
grp_p(1).fog      = fubar3(1:grp_p(1).n,3);
grp_p(1).headache = fubar3(1:grp_p(1).n,4);
grp_p(1).nausea   = fubar3(1:grp_p(1).n,5);

grp_p(2).dizzy    = fubar3(n2:grp_p(2).n+n2-1, 2);
grp_p(2).fog      = fubar3(n2:grp_p(2).n+n2-1, 3);
grp_p(2).headache = fubar3(n2:grp_p(2).n+n2-1, 4);
grp_p(2).nausea   = fubar3(n2:grp_p(2).n+n2-1, 5);

% VOMS EYE MOVEMENT TOTALS
grp_p(1).bline  = fubar5(1:grp_p(1).n,2);
grp_p(1).spur   = fubar5(1:grp_p(1).n,3);
grp_p(1).sach   = fubar5(1:grp_p(1).n,4);
grp_p(1).sacv   = fubar5(1:grp_p(1).n,5);
grp_p(1).conv   = fubar5(1:grp_p(1).n,6);
grp_p(1).vorh   = fubar5(1:grp_p(1).n,7);
grp_p(1).vorv   = fubar5(1:grp_p(1).n,8);
grp_p(1).vmot   = fubar5(1:grp_p(1).n,9);

grp_p(2).bline  = fubar5(1:grp_p(1).n,2);
grp_p(2).spur   = fubar5(1:grp_p(1).n,3);
grp_p(2).sach   = fubar5(1:grp_p(1).n,4);
grp_p(2).sacv   = fubar5(1:grp_p(1).n,5);
grp_p(2).conv   = fubar5(1:grp_p(1).n,6);
grp_p(2).vorh   = fubar5(1:grp_p(1).n,7);
grp_p(2).vorv   = fubar5(1:grp_p(1).n,8);
grp_p(2).vmot   = fubar5(1:grp_p(1).n,9);


% %%%%%%%%%%%%%%%%%
%
%%UNPAIRED DATA
%
%%%%%%%%%%%%%%%%%%%%
fubar7(1:grp(1).n,1) = zeros(grp(1).n,1);
fubar7(1:grp(1).n,2) = grp(1).voms;
fubar7(1:grp(1).n,3) = grp(1).ss;
fubar7(1:grp(1).n,4) = grp(1).sac;
fubar7(1:grp(1).n,5) = grp(1).bess;

n2 = grp(1).n + 1;
fubar7(n2:grp(2).n+n2-1, 1) = ones(grp(2).n,1);
fubar7(n2:grp(2).n+n2-1, 2) = grp(2).voms;
fubar7(n2:grp(2).n+n2-1, 3) = grp(2).ss;
fubar7(n2:grp(2).n+n2-1, 4) = grp(2).sac;
fubar7(n2:grp(2).n+n2-1, 5) = grp(2).bess;

fubar8 = array2table(fubar7,'VariableNames',{'Concussion' 'VOMS' 'Symp_Score' 'SAC' 'BESS'} );
stat4  = grpstats(fubar8, 'Concussion', {'mean','std'}, 'DataVars', {'VOMS', 'Symp_Score', 'SAC', 'BESS'});

fubar9(1:grp(1).n,1) = zeros(grp(1).n,1);
for v = 1:8
    fubar9(1:grp(1).n,2) = grp(1).v(v).dizzy;
    fubar9(1:grp(1).n,3) = grp(1).v(v).fog;
    fubar9(1:grp(1).n,4) = grp(1).v(v).headache;
    fubar9(1:grp(1).n,5) = grp(1).v(v).nausea;
    fubar9(1:grp(1).n,6) = grp(1).v(v).total;
end

fubar9(1:grp(1).n,6) = grp(1).ss_dizzy;
fubar9(1:grp(1).n,7) = grp(1).ss_fog;
fubar9(1:grp(1).n,8) = grp(1).ss_headache;
fubar3(1:grp(1).n,9) = grp(1).ss_nausea;


n2 = grp(1).n + 1;
fubar9(n2:grp(2).n+n2-1, 1) = ones(grp(2).n,1);
for v = 1:8
    fubar9(n2:grp(2).n+n2-1, 2) = grp(2).v(v).dizzy;
    fubar9(n2:grp(2).n+n2-1, 3) = grp(2).v(v).fog;
    fubar9(n2:grp(2).n+n2-1, 4) = grp(2).v(v).headache;
    fubar9(n2:grp(2).n+n2-1, 5) = grp(2).v(v).nausea;
    fubar9(n2:grp(2).n+n2-1, 6) = grp(2).v(v).total;
end

fubar9(n2:grp(2).n+n2-1, 6) = grp(2).ss_dizzy;
fubar9(n2:grp(2).n+n2-1, 7) = grp(2).ss_fog;
fubar9(n2:grp(2).n+n2-1, 8) = grp(2).ss_headache;
fubar9(n2:grp(2).n+n2-1, 9) = grp(2).ss_nausea;

fubar10 = array2table(fubar9,'VariableNames',{'Concussion' 'vDiz' 'vFog' 'vHA' 'vNaus' 'ssDiz' 'ssFog' 'ssHA' 'ssNaus'});
stat5 = grpstats(fubar10, 'Concussion', {'mean','std'}, 'DataVars', {'vDiz' 'vFog' 'vHA' 'vNaus' 'ssDiz' 'ssFog' 'ssHA' 'ssNaus'});

%VOMS Eye-Movement Table
fubar11(1:grp(1).n,1) = zeros(grp(1).n,1);
fubar11(1:grp(1).n,2) = grp(1).v(1).total;
fubar11(1:grp(1).n,3) = grp(1).v(5).total;
fubar11(1:grp(1).n,4) = grp(1).v(3).total;
fubar11(1:grp(1).n,5) = grp(1).v(4).total;
fubar11(1:grp(1).n,6) = grp(1).v(2).total;
fubar11(1:grp(1).n,7) = grp(1).v(7).total;
fubar11(1:grp(1).n,8) = grp(1).v(8).total;
fubar11(1:grp(1).n,9) = grp(1).v(6).total;

n2 = grp(1).n + 1;
fubar11(n2:grp(2).n+n2-1, 1) = ones(grp(2).n,1);
fubar11(n2:grp(2).n+n2-1, 2) = grp(2).v(1).total;
fubar11(n2:grp(2).n+n2-1, 3) = grp(2).v(5).total;
fubar11(n2:grp(2).n+n2-1, 4) = grp(2).v(3).total;
fubar11(n2:grp(2).n+n2-1, 5) = grp(2).v(4).total;
fubar11(n2:grp(2).n+n2-1, 6) = grp(2).v(2).total;
fubar11(n2:grp(2).n+n2-1, 7) = grp(2).v(7).total;
fubar11(n2:grp(2).n+n2-1, 8) = grp(2).v(8).total;
fubar11(n2:grp(2).n+n2-1, 9) = grp(2).v(6).total;

fubar12 = array2table(fubar11,'VariableNames',{'Concussion' 'Baseline' 'Sm_Purs' 'Sac_Horiz' 'Sac_Vert' 'Conv' 'VOR_H' 'VOR_V' 'Vis_Mot'} );
stat6  = grpstats(fubar12, 'Concussion', {'mean','std'}, 'DataVars', {'Baseline' 'Sm_Purs' 'Sac_Horiz' 'Sac_Vert' 'Conv' 'VOR_H' 'VOR_V' 'Vis_Mot'});

%VOMS SYMPTOMS TOTALS
grp(1).dizzy    = fubar9(1:grp(1).n,3);
grp(1).fog      = fubar9(1:grp(1).n,3);
grp(1).headache = fubar9(1:grp(1).n,4);
grp(1).nausea   = fubar9(1:grp(1).n,5);

grp(2).dizzy    = fubar9(n2:grp(2).n+n2-1, 2);
grp(2).fog      = fubar9(n2:grp(2).n+n2-1, 3);
grp(2).headache = fubar9(n2:grp(2).n+n2-1, 4);
grp(2).nausea   = fubar9(n2:grp(2).n+n2-1, 5);

%VOMS EYE MOVEMENT TOTALS
grp(1).bline  = fubar11(1:grp(1).n,2);
grp(1).spur   = fubar11(1:grp(1).n,3);
grp(1).sach   = fubar11(1:grp(1).n,4);
grp(1).sacv   = fubar11(1:grp(1).n,5);
grp(1).conv   = fubar11(1:grp(1).n,6);
grp(1).vorh   = fubar11(1:grp(1).n,7);
grp(1).vorv   = fubar11(1:grp(1).n,8);
grp(1).vmot   = fubar11(1:grp(1).n,9);

grp(2).bline  = fubar11(1:grp(1).n,2);
grp(2).spur   = fubar11(1:grp(1).n,3);
grp(2).sach   = fubar11(1:grp(1).n,4);
grp(2).sacv   = fubar11(1:grp(1).n,5);
grp(2).conv   = fubar11(1:grp(1).n,6);
grp(2).vorh   = fubar11(1:grp(1).n,7);
grp(2).vorv   = fubar11(1:grp(1).n,8);
grp(2).vmot   = fubar11(1:grp(1).n,9);


