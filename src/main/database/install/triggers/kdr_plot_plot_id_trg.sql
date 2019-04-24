create or replace trigger kdr_plot_plot_id_trg  
   before insert on KDR_PLOT
   for each row 
begin  
   if inserting then 
      if :NEW.PLOT_ID is null then 
         select KDR_PLOT_ID_SEQ.nextval into :NEW."PLOT_ID" from dual; 
      end if; 
   end if; 
end;