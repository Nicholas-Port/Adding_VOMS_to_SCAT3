% Calucalte VOMS totals
for s = 1:length(sub)
   
   %if sub(s).base_inj_ok == 1
      
      for b = 1: sub(s).n_baseline
         
         if sub(s).base(b).voms == 1 %&& sub(s).base(b).sc.ok == 1
            
            for v = 1:length(sub(s).base(b).v)
               sub(s).base(b).v(v).total = ...
                  sub(s).base(b).v(v).dizzy + ...
                  sub(s).base(b).v(v).fog + ...
                  sub(s).base(b).v(v).headache + ...
                  sub(s).base(b).v(v).nausea;
            end %v
            
            if ~isempty(sub(s).base(b).v)
               sub(s).base(b).voms_total = ...
                  sub(s).base(b).v(2).total + ...
                  sub(s).base(b).v(3).total + ...
                  sub(s).base(b).v(4).total + ...
                  sub(s).base(b).v(5).total + ...
                  sub(s).base(b).v(6).total + ...
                  sub(s).base(b).v(7).total + ...
                  sub(s).base(b).v(8).total;
            end
         end %voms and SCAT3 ok
         
      end %for b
   %end % base_inj_ok == 1
   
   
   
   for in = 1:sub(s).n_injury
      
      for t = 1:length( sub(s).inj(in).tp)
         
         if strcmp(sub(s).inj(in).tp(t).VOMSDONE,'Yes') == 1
            

            
            for v = 1:length(sub(s).inj(in).tp(t).v)
               sub(s).inj(in).tp(t).v(v).total = ...
                  sub(s).inj(in).tp(t).v(v).dizzy + ...
                  sub(s).inj(in).tp(t).v(v).fog + ...
                  sub(s).inj(in).tp(t).v(v).headache + ...
                  sub(s).inj(in).tp(t).v(v).nausea;
            end %v
            
            if ~isempty(sub(s).inj(in).tp(t).v)
               sub(s).inj(in).tp(t).voms_total = ...
                  sub(s).inj(in).tp(t).v(2).total + ...
                  sub(s).inj(in).tp(t).v(3).total + ...
                  sub(s).inj(in).tp(t).v(4).total + ...
                  sub(s).inj(in).tp(t).v(5).total + ...
                  sub(s).inj(in).tp(t).v(6).total + ...
                  sub(s).inj(in).tp(t).v(7).total + ...
                  sub(s).inj(in).tp(t).v(8).total;
            end       
   
            
         end %VOMSDONE
      end %tp
   end %in
   
   
end %s


% Now that we have voms total, go back through the data and change
% sub(s).base_inj_ok if voms total is NAN
%{
for s = 1:length(sub)
   
   %if sub(s).base_inj_ok == 1
      
      
      if sub(s).n_baseline > 0
         
         for b = 1:sub(s).n_baseline
            if sub(s).base(b).voms == 1 && sub(s).base(b).sc.ok == 1 && ~isnan(sub(s).base(b).voms_total)
               sub(s).voms_base = b;            % Store which baseline to use
               break
            %elseif sub(s).base(b).voms == 1 && sub(s).base(b).sc.ok == 1 &&isnan(sub(s).base(b).voms_total)
            %   keyboard
            %else
            %   keyboard
            %   %sub(s).base_inj_ok = 0;
            
            end
         end % b
      end
      
      
      
      
      b = sub(s).voms_base;
      
      if isnan( sub(s).base(b).voms_total )
         sub(s).base_inj_ok = 0;
      end
      

      
   %end %base_inj_ok == 1
   
end %s

clear b n_in

%}





%
% fini
%






