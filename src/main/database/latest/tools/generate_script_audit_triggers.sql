set feedback on
clear screen
begin
    for rec in (
            select  table_name
            from    user_tables
            where   table_name like 'KDR%'
            and     table_name not in ('KDR_AUDIT','KDR_DAYS','KDR_WEEKS','KDR_MONTHS','KDR_YEARS')
            ) loop
        dbms_output.put_line('-- ' || rec.table_name);
        CREATE_AUDIT_TRIGGERS(rec.table_name);
    end loop;
end;
/