%
% April 2019
%
% Parse T3, to create a data structure we want
%

clear sub 
%clear num_base num_base2


% Key
% Column - Function
% 9   - Which TimePoint ('Base' '24' 'Asmp' 'Unrestrict' '6Mo' )
% 10  - TimePoint Index (1-13)
% 481 - Voms Done
% 488 - VOMS Baseline Dizzy
% 489 - VOMS Baseline Fog
% 490 - VOMS Baseline Heachache
% 491 - VOMS Baseline Nausea


% Inits
sub = [];
s   = 0;


% Initialize sub
for s = 1:3021 
   sub(s).n_injury   = 0;
   sub(s).n_baseline = 0;
   for i = 1:5
      sub(s).inj(i).n_good_tp  = 0;
      for tp = 1:13
         sub(s).inj(i).tp(tp).voms = 0;        
      end
   end
end
clear s i


subjectid_list      = []; %T3{i,2};
baselineevalid_list = []; %T3{i,5};
injuryid_list       = []; %T3{i,7};
   

sub_i    = 0;
base_i   = 0;
injury_i = 0;
s        = 0;

for i = 1:size(T3,1)
   
   temp_subjectid      = T3{i,2};
   temp_baselineevalid = T3{i,5};
   temp_injuryid       = T3{i,7};
   
   

   if isempty( find( subjectid_list == temp_subjectid ) ) % if empty = new subject - first baseline
          
      s = s + 1;
      sub(s).id = T3{i,2};    
      sub(s).injuryid = [];                              %initialze for later
      
      % Remember the subjectid
      sub_i = sub_i + 1;
      subjectid_list(sub_i) = T3{i,2};

     % For this new subject, is it a baseline or postinjury
      if T3{i,10} == 1           
         % Baseline 
         
         if isempty( find( baselineevalid_list == temp_baselineevalid ) ) %Is this a first baseline
            
            % New baseline
            sub(s).n_baseline = 1;
            sub(s).baselineevalid(1) = T3{i,5};
            
            % Store in the new baseline list
            base_i = base_i + 1;
            baselineevalid_list(base_i) = T3{i,5};
            
            % Store Stuff
            sub(s).base(sub(s).n_baseline).name     = T3{i,  9};
            sub(s).base(sub(s).n_baseline).VOMSDONE = T3{i,481};
            
            if strcmp(sub(s).base(sub(s).n_baseline).VOMSDONE,'Yes')
               
               sub(s).base(sub(s).n_baseline).voms = 1;             
               [ sub(s).base(sub(s).n_baseline).v,  ...
                 sub(s).base(sub(s).n_baseline).b,  ...
                 sub(s).base(sub(s).n_baseline).sa, ...
                 sub(s).base(sub(s).n_baseline).sc ] = parse_T3_v3(T3,i);              
               
            else
               sub(s).base(sub(s).n_baseline).voms = 0;
            end

            
         else
            % This is a repeat baseline
            keyboard
         end


      else 
         
         % Non Baseline
         if isempty( find( injuryid_list == temp_injuryid ) ) %Is this a first injury
            
            % New baseline
            sub(s).n_injury = 1;
            sub(s).injuryid(1) = T3{i,7};
            
            % Store in the new baseline list
            injury_i = injury_i + 1;
            injuryid_list(injury_i) = T3{i,7};
            
            tp = T3{i,10}; % find out the time point and store stuff
            sub(s).inj(sub(s).n_injury).tp(tp).name      = T3{i,  9};
            sub(s).inj(sub(s).n_injury).tp(tp).VOMSDONE  = T3{i,481};
            sub(s).inj(sub(s).n_injury).n_good_tp = sub(s).inj(sub(s).n_injury).n_good_tp + 1;
            
            if strcmp(sub(s).inj(sub(s).n_injury).tp(tp).VOMSDONE,'Yes')
               
               sub(s).inj(sub(s).n_injury).tp(tp).voms = 1;            
               [ sub(s).inj(sub(s).n_injury).tp(tp).v,  ...
                 sub(s).inj(sub(s).n_injury).tp(tp).b,  ...
                 sub(s).inj(sub(s).n_injury).tp(tp).sa, ...
                 sub(s).inj(sub(s).n_injury).tp(tp).sc ] = parse_T3_v3(T3,i); 
               
            else
               sub(s).inj(sub(s).n_injury).tp(tp).voms = 0;
            end

            
         else
            % This is a repeat injury
            keyboard;
         end
         
      end

      
      
   else  % NOT a new subject
      
      s = find( subjectid_list == temp_subjectid );
      
      % For this old subject, is it a baseline or postinjury
      if T3{i,10} == 1           
         % Baseline 
         
         if isempty( find( baselineevalid_list == temp_baselineevalid ) ) %Is this the first baseline
            
            % New baseline
            sub(s).n_baseline = sub(s).n_baseline + 1;
            sub(s).baselineevalid( sub(s).n_baseline ) = T3{i,5};
            
            % Store in the new baseline list
            base_i = base_i + 1;
            baselineevalid_list(base_i) = T3{i,5};
            
            % Store stuff
            sub(s).base(sub(s).n_baseline).name     = T3{i,  9};
            sub(s).base(sub(s).n_baseline).VOMSDONE = T3{i,481};
            
            if strcmp(sub(s).base(sub(s).n_baseline).VOMSDONE,'Yes')
               
               sub(s).base(sub(s).n_baseline).voms = 1;
               [ sub(s).base(sub(s).n_baseline).v,  ...
                 sub(s).base(sub(s).n_baseline).b,  ...
                 sub(s).base(sub(s).n_baseline).sa, ...
                 sub(s).base(sub(s).n_baseline).sc ] = parse_T3_v3(T3,i); 

            else
               sub(s).base(sub(s).n_baseline).voms = 0;
            end
            
         else
            % This is a repeat baseline
            keyboard
         end


      else 
         
         % Non Baseline
         if isempty( find( sub(s).injuryid == temp_injuryid ) ) %Is this a new injury at any timepoint
            
            % New injury
            sub(s).n_injury = sub(s).n_injury + 1;
            sub(s).injuryid(sub(s).n_injury) = T3{i,7};
            
            % Store in the new injury list
            injury_i = injury_i + 1;
            injuryid_list(injury_i) = T3{i,7};
            
            tp = T3{i,10}; % find out the time point and store stuff
            sub(s).inj(sub(s).n_injury).tp(tp).name      = T3{i,  9};
            sub(s).inj(sub(s).n_injury).tp(tp).VOMSDONE  = T3{i,481};
            sub(s).inj(sub(s).n_injury).n_good_tp = sub(s).inj(sub(s).n_injury).n_good_tp + 1;
            
            if strcmp(sub(s).inj(sub(s).n_injury).tp(tp).VOMSDONE,'Yes')
               
               sub(s).inj(sub(s).n_injury).tp(tp).voms = 1;
               [ sub(s).inj(sub(s).n_injury).tp(tp).v,  ...
                 sub(s).inj(sub(s).n_injury).tp(tp).b,  ...
                 sub(s).inj(sub(s).n_injury).tp(tp).sa, ...
                 sub(s).inj(sub(s).n_injury).tp(tp).sc ] = parse_T3_v3(T3,i); 

            else
               sub(s).inj(sub(s).n_injury).tp(tp).voms = 0;
            end

         else
            % This is a repeat injury at any time_point
            tp = T3{i,10}; % find out the time point and store stuff
            sub(s).inj(sub(s).n_injury).n_good_tp = sub(s).inj(sub(s).n_injury).n_good_tp + 1;
            sub(s).inj(sub(s).n_injury).tp(tp).name      = T3{i,  9};
            sub(s).inj(sub(s).n_injury).tp(tp).VOMSDONE  = T3{i,481};
            
            if strcmp(sub(s).inj(sub(s).n_injury).tp(tp).VOMSDONE,'Yes')
               
               sub(s).inj(sub(s).n_injury).tp(tp).voms = 1;
               [ sub(s).inj(sub(s).n_injury).tp(tp).v,  ...
                 sub(s).inj(sub(s).n_injury).tp(tp).b,  ...
                 sub(s).inj(sub(s).n_injury).tp(tp).sa, ...
                 sub(s).inj(sub(s).n_injury).tp(tp).sc ] = parse_T3_v3(T3,i); 

            else
               sub(s).inj(sub(s).n_injury).tp(tp).voms = 0;
            end

         end
         
      end

      
   end % if new or not new subject
   
end %for i



% Count the number of people with one valid VOMS baseline
vc = 0;
for s = 1:length(sub)
   for b = 1:length(sub(s).base)
      if sub(s).base(b).voms == 1
         vc = vc + 1;        
         break
      end
   end
end


%keyboard



%{
for i = 1:size(T3,1)
   
   if strcmp( T3{i,9}{1},'Base' ) && strcmp( T3{i,481}{1},'Yes' ) % BASE & VOMS
      
      
      temp_subjectid     = T3{i,2};
      temp_baselinevalid = T3{i,5};
      
      % We have a baseline & VOMS, now figure out if its new
      if isempty( find( subid_list == temp_subjectid ) ) % if empty = new subject - first baseline
         
         s = s + 1;
         subid_list(s)           = temp_subjectid;
         baselinevalidit_list(s) = temp_baselinevalid;
         
         sub(s).id                = T3{i,2};
         sub(s).injuryid          = [];
         sub(s).n_injury          = 0;
         
         sub(s).baselineevalid(1) = T3{i,5};
         sub(s).n_baselines       = 1;            
         
         [ sub(s).base(1).v, ...
           sub(s).base(1).b, ...
           sub(s).base(1).sa, ...
           sub(s).base(1).sc ] = parse_T3_v2(T3,i); 
         
      elseif ~isempty( find( subid_list == temp_subjectid )) % If true, this subject is in the list
                           
         if ~(sub(s).baselineevalid == temp_baselinevalid) %make sure the base_line_valid ID's do not match           
            sub(s).n_baselines        = sub(s).n_baselines + 1;
            bn                        = sub(s).n_baselines;
            sub(s).baselineevalid(bn) = T3{i,5};
            
            [ sub(s).base(bn).v, ...
               sub(s).base(bn).b, ...
               sub(s).base(bn).sa, ...
               sub(s).base(bn).sc ] = parse_T3_v2(T3,i); 
         end
         
     
      end
   
   end % ~strcmp %Base & VOMD
 
end %for i

clear tmp_subjectid tmp_injuryid

clear fubar3
fubar3 = 0;

% Do a seperate pass search for the 'PostInj' time point
for i = 1:size(T3,1)
  
   if strcmp( T3{i,9}{1},'PostInj' ) && strcmp( T3{i,481}{1},'Yes' )
      
      fubar3 = fubar3 + 1;
            
      temp_subjectid = T3{i,2};
      temp_injuryid  = T3{i,7};
      
      
      s2 = find(subid_list == temp_subjectid );
            
      if isempty(s2) % For the subject with no baselines
         s2 = length(sub) + 1;
         sub(s2).n_injury = 0;
      end
      
      
      if isempty( find( sub(s2).injuryid == temp_injuryid ) ) % New injuryid
      
         sub(s2).n_injury     = sub(s2).n_injury + 1;
         ni                   = sub(s2).n_injury;
         sub(s2).injuryid(ni) = temp_injuryid;
         
         [ sub(s2).inj(ni).tp(1).v,   ...
            sub(s2).inj(ni).tp(1).b,  ...
            sub(s2).inj(ni).tp(1).sa, ...
            sub(s2).inj(ni).tp(1).sc ] = parse_T3_v2(T3,i); %Baseline
      
      else
         keyboard
      end
   end % ~strcmp POSTINJ and VOMS
   
   
   
   
end
%}

%{
   if strcmp( T3{i,9}{1},'24' ) && strcmp( T3{i,481}{1},'Yes' ) && ...
         T3{i,2} == prev_id
      
      [ sub(s).tp(3).v, ...
         sub(s).tp(3).b, ...
         sub(s).tp(3).sa, ...
         sub(s).tp(3).sc ] = parse_T3_v2(T3,i); %24
      
      sub(s).tp(3).ok        = 1;
      sub(s).tp(3).injury_id = T3{i,7};

      if s == 14
         keyboard
      end
      
   end % ~strcmp
   
   if strcmp( T3{i,9}{1},'Asymp' ) && strcmp( T3{i,481}{1},'Yes' ) && ...
         T3{i,2} == prev_id
      
      [ sub(s).tp(4).v, ...
         sub(s).tp(4).b, ...
         sub(s).tp(4).sa, ...
         sub(s).tp(4).sc ] = parse_T3_v2(T3,i); %Asymp
      
      sub(s).tp(4).ok        = 1;
      sub(s).tp(4).injury_id = T3{i,7};

   end % ~strcmp
   
   if strcmp( T3{i,9}{1},'Unrestrict' ) && strcmp( T3{i,481}{1},'Yes' ) && ...
         T3{i,2} == prev_id
      
      [ sub(s).tp(5).v, ...
         sub(s).tp(5).b, ...
         sub(s).tp(5).sa, ...
         sub(s).tp(5).sc ] = parse_T3_v2(T3,i); %Unrestrit
      
      sub(s).tp(5).ok        = 1;
      sub(s).tp(5).injury_id = T3{i,7};
    
   end % ~strcmp
   
   if strcmp( T3{i,9}{1},'6Mo' ) && strcmp( T3{i,481}{1},'Yes' ) && ...
         T3{i,2} == prev_id
      
      [ sub(s).tp(6).v, ...
         sub(s).tp(6).b, ...
         sub(s).tp(6).sa, ...
         sub(s).tp(6).sc ] = parse_T3_v2(T3,i); %6Mo
      
      sub(s).tp(6).ok        = 1;
      sub(s).tp(6).injury_id = T3{i,7}; %6Mo

   end % ~strcmp
   
   
  %}




%{

%
% Count some stuff
%
ni1 = 0;
ni2 = 0;
ni3 = 0;
ni4 = 0;
ni5 = 0;
for s = 1:length(sub)
   
   disp([sub(s).n_injury length(sub(s).injuryid) ])
   
   if sub(s).n_injury == 1
      ni1 = ni1 + 1;
   elseif sub(s).n_injury == 2
      ni2 = ni2 + 1;
   elseif sub(s).n_injury == 3
      ni3 = ni3 + 1;
   elseif sub(s).n_injury == 4
      ni4 = ni4 + 1;
   elseif sub(s).n_injury == 5
      ni5 = ni5 + 1;
   end
end

disp(' Number of single, double, tripple, and quad injuries')
disp([ni1 ni2 ni3 ni4 ni5])
disp([' Total injuries = ' num2str(ni1+ni2+ni3+ni4+ni5) ]);


%}

%{
%
% Count some stuff
%
n1 = 0;
n2 = 0;
n3 = 0;
n4 = 0;
n5 = 0;
for s = 1:length(sub)
   if sub(s).n_baselines == 1
      n1 = n1 + 1;
   elseif sub(s).n_baselines == 2
      n2 = n2 + 1;
   elseif sub(s).n_baselines == 3
      n3 = n3 + 1;
   elseif sub(s).n_baselines == 4
      n4 = n4 + 1;
   elseif sub(s).n_baselines == 5
      n5 = n5 + 1;
   end
end

disp(' Number of single, double, tripple, and quad baselines')
disp([n1 n2 n3 n4 n5])
disp([' Total baselines = ' num2str(n1+n2+n3+n4+n5) ]);
%}















% Fini