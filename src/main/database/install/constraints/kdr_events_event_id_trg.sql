create or replace trigger kdr_events_event_id_trg  
   before insert on kdr_events
   for each row 
begin  
   if inserting then 
      if :NEW.event_id is null then 
         select kdr_event_id_seq.nextval into :NEW.event_id from dual; 
      end if; 
   end if; 
end;