% Create the TABLE 1 for the paper

n_sub_baseline = 0;

% Find the subjects with at least one complete baseline w/ VOMS
% Mark it

for s = 1:length(sub)
   
   sub(s).voms_base   = 0;                  % Store no voms baseline yet
   sub(s).base_inj_ok = 0;                  % default is base & inj are not useable.
   
   % Exclusions
   if ~strcmp(sub(s).modsevtbi,          'Yes') && ...
      ~strcmp(sub(s).brainsurgery,       'Yes') && ...
      ~strcmp(sub(s).vestibulardisorder, 'Yes')
      
      
      
      if sub(s).n_baseline > 0
         for b = 1:sub(s).n_baseline
            if sub(s).base(b).voms == 1 && sub(s).base(b).sc.ok == 1 && ~isnan(sub(s).base(b).voms_total)
               n_sub_baseline = n_sub_baseline + 1;
               sub(s).voms_base   = b;            % Store which baseline to use
               sub(s).base_inj_ok = 1;            % Base is good, still have to figure out inj
               
               break
            end
         end % b
      end
      
   end %exclusions
   
end % s

% Save 
% tp #2 = 'PostInjury' - 6 hours
% tp #3 = '24'         - 24 hours


fubar      = 0;
fubar_list = [];
% Note tp = 3  is '24' hour, tp=2 is 6 hour or 'Postinj;
for s = 1:length(sub)
   
   if sub(s).base_inj_ok == 1
      
      
      % Exclusions
      %if ~strcmp(sub(s).modsevtbi,          'Yes') && ...
      %   ~strcmp(sub(s).brainsurgery,       'Yes') && ...
      %   ~strcmp(sub(s).vestibulardisorder, 'Yes')
      
      
      % Number of injuries
      sub(s).n_good_inj  = 0;
      sub(s).n_good_list = [];
      temp_ok = 0;
      
      if sub(s).n_injury >= 1 && sub(s).voms_base > 0
         for in = 1:sub(s).n_injury
            if strcmp( sub(s).inj(in).tp(3).VOMSDONE,'Yes') && sub(s).inj(in).tp(3).sc.ok == 1 && ...
                  ~isnan(sub(s).inj(in).tp(3).voms_total)
               
               % Good 24 Hour
               fubar                = fubar + 1;
               fubar_list(fubar,1)  = sub(s).id;
               fubar_list(fubar,2)  = sub(s).injuryid(in);
               temp_ok = 1;
               %sub(s).base_inj_ok   = 1;
               sub(s).n_good_inj    = sub(s).n_good_inj + 1;
               sub(s).n_good_list(sub(s).n_good_inj) = in;
               
            elseif strcmp( sub(s).inj(in).tp(2).VOMSDONE,'Yes') && sub(s).inj(in).tp(2).sc.ok == 1 && ...
                  ~isnan(sub(s).inj(in).tp(2).voms_total)
               fubar                = fubar + 1;
               fubar_list(fubar,1)  = sub(s).id;
               fubar_list(fubar,2)  = sub(s).injuryid(in);
               temp_ok = 1;
               %sub(s).base_inj_ok   = 1;
               sub(s).n_good_inj    = sub(s).n_good_inj + 1;
               sub(s).n_good_list(sub(s).n_good_inj) = in;
            end
         end %for %in
         
      end
            
      
      if temp_ok == 1
         sub(s).base_inj_ok = 1;
      else
         sub(s).base_inj_ok = 0;
      end %if temp oik
      
      
   end %exclusion
   
end %for s


% Count the number of unqiue athletes with a valid injury
fubar2 = 0;
fubar2_list = [];

for s = 1:length(sub)
   if sub(s).base_inj_ok == 1
      fubar2 = fubar2 + 1;
      fubar2_list(fubar2) = sub(s).id;
   end
end











% fini








%