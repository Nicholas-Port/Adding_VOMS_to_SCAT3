% Process T2 to pull out the LOC and PTA data

disp('Read table 2');
T2 = readtable('../DATA/CARE1_Injuries_10JAN2019_data_ran_07FEB2019.csv'               );


% Pull out the Sud Id's from T2
sub_id    = T2{:,3};
injury_id = T2{:,5};
 



% Hostpital = 64

% 
for s = 1:length(sub)
   
      row = find(sub_id == sub(s).id);
      
      for r = 1:length(row)
         sub(s).sub_id2(r)                = sub_id(   row(r));
         sub(s).injury_id2(r)             = injury_id(row(r));
         
         sub(s).sex2(r)                          = T2{row(r),9  };
         sub(s).sport2(r)                        = T2{row(r),10 };
         sub(s).inj(r).injsituation              = T2{row(r),11 };
         sub(s).inj(r).days_reportedlate         = T2{row(r),19 };
         sub(s).inj(r).reportinjuryimmed         = T2{row(r),50 };
         sub(s).inj(r).reportinjurydata          = T2{row(r),51 };
         sub(s).inj(r).reportinjuryimmedtime     = T2{row(r),52 };
         
         
         
         sub(s).inj(r).motorimpairment           = T2{row(r),55 };
         sub(s).inj(r).hospitaltransportrequired = T2{row(r),64 };
         sub(s).inj(r).ctmri                     = T2{row(r),65 };
         sub(s).inj(r).ctmripositive             = T2{row(r),66 };
         sub(s).inj(r).ctmrifindings             = T2{row(r),67 };
         
         sub(s).inj(r).delaysx                   = T2{row(r),86};
         sub(s).inj(r).rtasamday                 = T2{row(r),87};
         sub(s).inj(r).altmentalstatus           = T2{row(r),88};
         sub(s).inj(r).loc                       = T2{row(r),89};
         
         sub(s).inj(r).pta                       = T2{row(r),96};
         sub(s).inj(r).rga                       = T2{row(r),97};
         
         sub(s).inj(r).time_toasympt_days        = T2{row(r),652};
         sub(s).inj(r).time_tortp_days           = T2{row(r),657};
         
         %RTP should be column 652

         
      end %row
      
end
   

clear T2