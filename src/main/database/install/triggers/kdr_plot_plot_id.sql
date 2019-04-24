create or replace trigger "KDR_PLOT_PLOT_ID" before
    insert or update on "KDR_PLOT"
    for each row
begin
    if inserting then 
        if :new.plot_id is null then
            select kdr_plot_id_seq.nextval
            into :new.plot_id
            from dual;
        end if;
    end if;    
end;
/