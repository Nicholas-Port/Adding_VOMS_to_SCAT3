% Create a grand summary data structure




% Feb 2020  - Fix this for the new data strcuture which imports multiple
% baseline and multiple injuries


%calc_voms_total

clear grp grp_p

for i = 1: 5
   grp(i).n  = 0;
end


for s = 1:length(sub)
   
   if sub(s).base_inj_ok == 1
      
      for in2 = 1:sub(s).n_good_inj
           
         in = sub(s).n_good_list(in2); %Grab the injury for this pass of in2
         
         % This needs to be an injury we want to use
         
         if strcmp(sub(s).inj(in).tp(3).VOMSDONE,'Yes') == 1 && sub(s).inj(in).tp(3).sc.ok == 1 && ...
            ~isnan(sub(s).inj(in).tp(3).voms_total)
            
            grp(2).n = grp(2).n + 1;
            grp(2).voms(       grp(2).n) = sub(s).inj(in).tp(3).voms_total; %24 hour
            grp(2).bess(       grp(2).n) = sub(s).inj(in).tp(3).b.BESS_tot;
            grp(2).sac(        grp(2).n) = sub(s).inj(in).tp(3).sa.SAC_tot;
            grp(2).ss(         grp(2).n) = sub(s).inj(in).tp(3).sc.sym_sev_score;
            grp(2).ss_nausea(  grp(2).n) = sub(s).inj(in).tp(3).sc.nausea;
            grp(2).ss_fog(     grp(2).n) = sub(s).inj(in).tp(3).sc.fog;
            grp(2).ss_dizzy(   grp(2).n) = sub(s).inj(in).tp(3).sc.dizz;
            grp(2).ss_headache(grp(2).n) = sub(s).inj(in).tp(3).sc.ha;
            grp(2).rtp(        grp(2).n) = sub(s).inj(in).time_tortp_days;
            
            for v = 1:8
               grp(2).v(v).dizzy(   grp(2).n) = sub(s).inj(in).tp(3).v(v).dizzy;
               grp(2).v(v).fog(     grp(2).n) = sub(s).inj(in).tp(3).v(v).fog;
               grp(2).v(v).headache(grp(2).n) = sub(s).inj(in).tp(3).v(v).headache;
               grp(2).v(v).nausea(  grp(2).n) = sub(s).inj(in).tp(3).v(v).nausea;
               grp(2).v(v).total(   grp(2).n) = sub(s).inj(in).tp(3).v(v).total;
            end
            
            temp_ok = 1;
            
            %keyboard
            
            
         elseif strcmp(sub(s).inj(in).tp(2).VOMSDONE,'Yes') == 1 && sub(s).inj(in).tp(2).sc.ok == 1 && ...
            ~isnan(sub(s).inj(in).tp(2).voms_total)
            
            grp(2).n  = grp(2).n + 1;
            grp(2).voms(       grp(2).n) = sub(s).inj(in).tp(2).voms_total; % 6 hr
            grp(2).bess(       grp(2).n) = sub(s).inj(in).tp(2).b.BESS_tot;
            grp(2).sac(        grp(2).n) = sub(s).inj(in).tp(2).sa.SAC_tot;
            grp(2).ss(         grp(2).n) = sub(s).inj(in).tp(2).sc.sym_sev_score;
            grp(2).ss_nausea(  grp(2).n) = sub(s).inj(in).tp(2).sc.nausea;
            grp(2).ss_fog(     grp(2).n) = sub(s).inj(in).tp(2).sc.fog;
            grp(2).ss_dizzy(   grp(2).n) = sub(s).inj(in).tp(2).sc.dizz;
            grp(2).ss_headache(grp(2).n) = sub(s).inj(in).tp(2).sc.ha;
            grp(2).rtp(        grp(2).n) = sub(s).inj(in).time_tortp_days;

            for v = 1:8
               grp(2).v(v).dizzy(   grp(2).n) = sub(s).inj(in).tp(2).v(v).dizzy;
               grp(2).v(v).fog(     grp(2).n) = sub(s).inj(in).tp(2).v(v).fog;
               grp(2).v(v).headache(grp(2).n) = sub(s).inj(in).tp(2).v(v).headache;
               grp(2).v(v).nausea(  grp(2).n) = sub(s).inj(in).tp(2).v(v).nausea;
               grp(2).v(v).total(   grp(2).n) = sub(s).inj(in).tp(2).v(v).total;
            end
            
            temp_ok = 1;
            
         else    
            temp_ok = 0;
            
         end
         
         
         if temp_ok == 1
            b = sub(s).voms_base;
            
            % What is below needs to be a baseline
            grp(1).n = grp(1).n + 1;
            grp(1).voms(        grp(1).n) = sub(s).base(b).voms_total;
            grp(1).bess(        grp(1).n) = sub(s).base(b).b.BESS_tot;
            grp(1).sac(         grp(1).n) = sub(s).base(b).sa.SAC_tot;
            grp(1).ss(          grp(1).n) = sub(s).base(b).sc.sym_sev_score;
            grp(1).ss_nausea(   grp(1).n) = sub(s).base(b).sc.nausea;
            grp(1).ss_fog(      grp(1).n) = sub(s).base(b).sc.fog;
            grp(1).ss_dizzy(    grp(1).n) = sub(s).base(b).sc.dizz;
            grp(1).ss_headache( grp(1).n) = sub(s).base(b).sc.ha;
            
            for v = 1:8
               grp(1).v(v).dizzy(   grp(1).n) = sub(s).base(b).v(v).dizzy;
               grp(1).v(v).fog(     grp(1).n) = sub(s).base(b).v(v).fog;
               grp(1).v(v).headache(grp(1).n) = sub(s).base(b).v(v).headache;
               grp(1).v(v).nausea(  grp(1).n) = sub(s).base(b).v(v).nausea;
               grp(1).v(v).total(   grp(1).n) = sub(s).base(b).v(v).total;
            end
            
         end %temp_ok
         
      end %in2
      
   end %base_inj_ok == 1
   
end %sub


grp_p = grp;



%{
for g = 1:5
   grp(g).v_headache = [];
   grp(g).v_dizzy = [];
   grp(g).v_fog = [];
   grp(g).v_nausea = [];
   for v = 1:8
      grp(g).v_headache = horzcat(grp(g).v_headache, grp(g).v(v).headache);
      grp(g).v_dizzy    = horzcat(grp(g).v_dizzy,    grp(g).v(v).dizzy   );
      grp(g).v_fog      = horzcat(grp(g).v_fog,      grp(g).v(v).fog     );
      grp(g).v_nausea   = horzcat(grp(g).v_nausea,   grp(g).v(v).nausea  );
   end
end

%}


%{

clear i s v

%%%%%%%%%%%%%%%%%
%
% Create another structured variable with paired data only, not just
% grouped data
%
%%%%%%%%%%%%%%%%%

 grp_p(1).n  = 0;
 grp_p(2).n  = 0;


 for s = 1:length(sub)
    

       
       
       if ( sub(s).tp(1).ok && sub(s).tp(3).ok) || ...
             ( sub(s).tp(1).ok && sub(s).tp(2).ok )%Pre-season
          
          
          
          grp_p(1).n = grp_p(1).n + 1;
          grp_p(1).voms(        grp_p(1).n) = sub(s).tp(1).voms_total;
          grp_p(1).bess(        grp_p(1).n) = sub(s).tp(1).b.BESS_tot;
          grp_p(1).sac(         grp_p(1).n) = sub(s).tp(1).sa.SAC_tot;
          grp_p(1).ss(          grp_p(1).n) = sub(s).tp(1).sc.sym_sev_score;
          grp_p(1).ss_nausea(   grp_p(1).n) = sub(s).tp(1).sc.nausea;
          grp_p(1).ss_fog(      grp_p(1).n) = sub(s).tp(1).sc.fog;
          grp_p(1).ss_dizzy(    grp_p(1).n) = sub(s).tp(1).sc.dizz;
          grp_p(1).ss_headache( grp_p(1).n) = sub(s).tp(1).sc.ha;
          
          for v = 1:8
             grp_p(1).v(v).dizzy(   grp_p(1).n) = sub(s).tp(1).v(v).dizzy;
             grp_p(1).v(v).fog(     grp_p(1).n) = sub(s).tp(1).v(v).fog;
             grp_p(1).v(v).headache(grp_p(1).n) = sub(s).tp(1).v(v).headache;
             grp_p(1).v(v).nausea(  grp_p(1).n) = sub(s).tp(1).v(v).nausea;
             grp_p(1).v(v).total(   grp_p(1).n) = sub(s).tp(1).v(v).total;
             
          end
          
          
          % Count things for paper #1
          grp_p(1).age(          grp_p(1).n ) =sub(s).age; %age
          grp_p(1).prev_concuss( grp_p(1).n ) =sub(s).preconcussion ; %age
          
          % Count only females, 1.  The rest are males
          if sub(s).sex == 1
             grp_p(1).sex( grp_p(1).n ) = 1;
          else
             grp_p(1).sex( grp_p(1).n ) = 0;
             
          end
          
          % LOC
          if isempty( sub(s).loc{1} )
             grp_p(1).loc( grp_p(1).n) = 0;
          elseif strcmp( sub(s).loc{1}, 'No')
             grp_p(1).loc( grp_p(1).n) = 0;
          elseif strcmp( sub(s).loc{1}, 'Yes')
             grp_p(1).loc( grp_p(1).n) = 1;           
          end    
 
          % PTA
          if isempty( sub(s).pta{1} )
             grp_p(1).pta( grp_p(1).n) = 0;
          elseif strcmp( sub(s).pta{1}, 'No')
             grp_p(1).pta( grp_p(1).n) = 0;
          elseif strcmp( sub(s).pta{1}, 'Yes')
             grp_p(1).pta( grp_p(1).n) = 1;           
          end    

          % RGA
          if isempty( sub(s).rga{1} )
             grp_p(1).rga( grp_p(1).n) = 0;
          elseif strcmp( sub(s).rga{1}, 'No')
             grp_p(1).rga( grp_p(1).n) = 0;
          elseif strcmp( sub(s).rga{1}, 'Yes')
             grp_p(1).rga( grp_p(1).n) = 1;           
          end    

          % CTMRI 
          if isempty( sub(s).ctmripositive{1} )
             grp_p(1).ctmripositive( grp_p(1).n) = 0;
          elseif strcmp( sub(s).ctmripositive{1}, 'No')
             grp_p(1).ctmripositive( grp_p(1).n) = 0;
          elseif strcmp( sub(s).ctmripositive{1}, 'Yes')
             grp_p(1).ctmripositive( grp_p(1).n) = 1;    
             disp('Postive CT MRI findings')
             disp(['     ' sub(s).ctmrifindings ]);
          end    
          
          
          % NOMIGHA - Migraine history
          if isempty( sub(s).nonmigha{1} )
             grp_p(1).nonmigha( grp_p(1).n) = 0;
          elseif strcmp( sub(s).nonmigha{1}, 'No')
             grp_p(1).nonmigha( grp_p(1).n) = 0;
          elseif strcmp( sub(s).nonmigha{1}, 'Yes')
             grp_p(1).nonmigha( grp_p(1).n) = 1;           
          end    

          % ADDADHD
          if isempty( sub(s).addadhd{1} )
             grp_p(1).addadhd( grp_p(1).n) = 0;
          elseif strcmp( sub(s).addadhd{1}, 'No')
             grp_p(1).addadhd( grp_p(1).n) = 0;
          elseif strcmp( sub(s).addadhd{1}, 'Yes')
             grp_p(1).addadhd( grp_p(1).n) = 1;           
          end    

          
          
          grp_p(1).sub_id(         grp_p(1).n) = sub(s).id;
          grp_p(1).baselineevalid( grp_p(1).n) = sub(s).baselineevalid;
          
          %grp_p(1).nomigha(        grp_p(1).n) = sub(s).nonmigha;
          %grp_p(1).addadhd(        grp_p(1).n) = sub(s).addadhd      

          
          %grp_p(1).pta(            grp_p(1).n) = sub(s).pta;
          %grp_p(1).rga(            grp_p(1).n) = sub(s).rga;
          %grp_p(1).ctmripositive(  grp_p(1).n) = sub(s).ctmripositive;
          
          %keyboard
          
       end %tp(1) ok
       
       if sub(s).tp(1).ok && sub(s).tp(3).ok % 24hr
          grp_p(2).n = grp_p(2).n + 1;
          grp_p(2).voms(       grp_p(2).n) = sub(s).tp(3).voms_total;
          grp_p(2).bess(       grp_p(2).n) = sub(s).tp(3).b.BESS_tot;
          grp_p(2).sac(        grp_p(2).n) = sub(s).tp(3).sa.SAC_tot;
          grp_p(2).ss(         grp_p(2).n) = sub(s).tp(3).sc.sym_sev_score;
          grp_p(2).ss_nausea(  grp_p(2).n) = sub(s).tp(3).sc.nausea;
          grp_p(2).ss_fog(     grp_p(2).n) = sub(s).tp(3).sc.fog;
          grp_p(2).ss_dizzy(   grp_p(2).n) = sub(s).tp(3).sc.dizz;
          grp_p(2).ss_headache(grp_p(2).n) = sub(s).tp(3).sc.ha;
          grp_p(2).injury_id(  grp_p(2).n) = sub(s).tp(3).injury_id;
          
          for v = 1:8
             grp_p(2).v(v).dizzy(   grp_p(2).n) = sub(s).tp(3).v(v).dizzy;
             grp_p(2).v(v).fog(     grp_p(2).n) = sub(s).tp(3).v(v).fog;
             grp_p(2).v(v).headache(grp_p(2).n) = sub(s).tp(3).v(v).headache;
             grp_p(2).v(v).nausea(  grp_p(2).n) = sub(s).tp(3).v(v).nausea;
             grp_p(2).v(v).total(   grp_p(2).n) = sub(s).tp(3).v(v).total;
          end %v
          
       elseif sub(s).tp(1).ok && sub(s).tp(2).ok % tp(2)= 6 hr /post injury
          grp_p(2).n = grp_p(2).n + 1;
          grp_p(2).voms(       grp_p(2).n) = sub(s).tp(2).voms_total;
          grp_p(2).bess(       grp_p(2).n) = sub(s).tp(2).b.BESS_tot;
          grp_p(2).sac(        grp_p(2).n) = sub(s).tp(2).sa.SAC_tot;
          grp_p(2).ss(         grp_p(2).n) = sub(s).tp(2).sc.sym_sev_score;
          grp_p(2).ss_nausea(  grp_p(2).n) = sub(s).tp(2).sc.nausea;
          grp_p(2).ss_fog(     grp_p(2).n) = sub(s).tp(2).sc.fog;
          grp_p(2).ss_dizzy(   grp_p(2).n) = sub(s).tp(2).sc.dizz;
          grp_p(2).ss_headache(grp_p(2).n) = sub(s).tp(2).sc.ha;
          grp_p(2).injury_id(  grp_p(2).n) = sub(s).tp(2).injury_id;

          for v = 1:8
             grp_p(2).v(v).dizzy(   grp_p(2).n) = sub(s).tp(2).v(v).dizzy;
             grp_p(2).v(v).fog(     grp_p(2).n) = sub(s).tp(2).v(v).fog;
             grp_p(2).v(v).headache(grp_p(2).n) = sub(s).tp(2).v(v).headache;
             grp_p(2).v(v).nausea(  grp_p(2).n) = sub(s).tp(2).v(v).nausea;
             grp_p(2).v(v).total(   grp_p(2).n) = sub(s).tp(2).v(v).total;
          end
          
       end %tp(2) OR tp(3) ok
       
       %{
%    if sub(s).tp(4).ok  %Asymptomatic
%       grp_p(3).n = grp_p(3).n + 1;
%       grp_p(3).voms( grp_p(3).n) = sub(s).tp(4).voms_total;
%       grp_p(3).bess( grp_p(3).n) = sub(s).tp(4).b.BESS_tot;
%       grp_p(3).sac(  grp_p(3).n) = sub(s).tp(4).sa.SAC_tot;
%       grp_p(3).ss(   grp_p(3).n) = sub(s).tp(4).sc.sym_sev_score;
%       grp_p(3).ss_nausea(  grp_p(3).n) = sub(s).tp(4).sc.nausea;
%       grp_p(3).ss_fog(     grp_p(3).n) = sub(s).tp(4).sc.fog;
%       grp_p(3).ss_dizzy(   grp_p(3).n) = sub(s).tp(4).sc.dizz;
%       grp_p(3).ss_headache(grp_p(3).n) = sub(s).tp(4).sc.ha;
%
%       for v = 1:8
%          grp_p(3).v(v).dizzy(   grp_p(3).n) = sub(s).tp(4).v(v).dizzy;
%          grp_p(3).v(v).fog(     grp_p(3).n) = sub(s).tp(4).v(v).fog;
%          grp_p(3).v(v).headache(grp_p(3).n) = sub(s).tp(4).v(v).headache;
%          grp_p(3).v(v).nausea(  grp_p(3).n) = sub(s).tp(4).v(v).nausea;
%       end
%
%    end %tp(4) ok
%
%    if sub(s).tp(5).ok  % Unrestricted
%       grp_p(4).n = grp(4).n + 1;
%       grp_p(4).voms( grp_p(4).n) = sub(s).tp(5).voms_total;
%       grp_p(4).bess( grp_p(4).n) = sub(s).tp(5).b.BESS_tot;
%       grp_p(4).sac(  grp_p(4).n) = sub(s).tp(5).sa.SAC_tot;
%       grp_p(4).ss(   grp_p(4).n) = sub(s).tp(5).sc.sym_sev_score;
%       grp_p(4).ss_nausea(  grp_p(4).n) = sub(s).tp(5).sc.nausea;
%       grp_p(4).ss_fog(     grp_p(4).n) = sub(s).tp(5).sc.fog;
%       grp_p(4).ss_dizzy(   grp_p(4).n) = sub(s).tp(5).sc.dizz;
%       grp_p(4).ss_headache(grp_p(4).n) = sub(s).tp(5).sc.ha;
%
%       for v = 1:8
%          grp_p(4).v(v).dizzy(   grp_p(4).n) = sub(s).tp(5).v(v).dizzy;
%          grp_p(4).v(v).fog(     grp_p(4).n) = sub(s).tp(5).v(v).fog;
%          grp_p(4).v(v).headache(grp_p(4).n) = sub(s).tp(5).v(v).headache;
%          grp_p(4).v(v).nausea(  grp_p(4).n) = sub(s).tp(5).v(v).nausea;
%       end
%
%    end %tp(5) ok
%
%    if sub(s).tp(6).ok  % 6 Month
%       grp_p(5).n = grp_p(5).n + 1;
%       grp_p(5).voms( grp_p(5).n) = sub(s).tp(6).voms_total;
%       grp_p(5).bess( grp_p(5).n) = sub(s).tp(6).b.BESS_tot;
%       grp_p(5).sac(  grp_p(5).n) = sub(s).tp(6).sa.SAC_tot;
%       grp_p(5).ss(   grp_p(5).n) = sub(s).tp(6).sc.sym_sev_score;
%       grp_p(5).ss_nausea(  grp_p(5).n) = sub(s).tp(6).sc.nausea;
%       grp_p(5).ss_fog(     grp_p(5).n) = sub(s).tp(6).sc.fog;
%       grp_p(5).ss_dizzy(   grp_p(5).n) = sub(s).tp(6).sc.dizz;
%       grp_p(5).ss_headache(grp_p(5).n) = sub(s).tp(6).sc.ha;
%
%       for v = 1:8
%          grp_p(5).v(v).dizzy(   grp_p(5).n) = sub(s).tp(6).v(v).dizzy;
%          grp_p(5).v(v).fog(     grp_p(5).n) = sub(s).tp(6).v(v).fog;
%          grp_p(5).v(v).headache(grp_p(5).n) = sub(s).tp(6).v(v).headache;
%          grp_p(5).v(v).nausea(  grp_p(5).n) = sub(s).tp(6).v(v).nausea;
%       end
%
%    end %tp(6) ok
       %}
       
       
    %else
    %   disp([ num2str(sub(s).id) ' - ' sub(s).modsevtbi{1} ' = ' sub(s).brainsurgery{1} ])
    %   keyboard
    %end %No TBI or Brainsurgery
    
    
    
 end %sub

clear i s v

%}









% fini





