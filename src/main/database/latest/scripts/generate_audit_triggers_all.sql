set feedback off
set serveroutput on
spool off
/
begin
    -- Generate audit triggers
    for rec in (select table_name from user_tables where table_name like 'KDR%') loop
        pck_kdr_audit.record_audit_generate_triggers(rec.table_name);
    end loop;
end;
/
spool "C:\Users\mbrb\Dropbox\Larp\Kederan\plot_db\kederan\src\main\database\latest\generate_audit_triggers_all_script.sql"
/
spool off
set feedback on
/
@"C:\Users\mbrb\Dropbox\Larp\Kederan\plot_db\kederan\src\main\database\latest\generate_audit_triggers_all_script.sql";
/
exec pck_kdr_audit.generate_audit_columns;
/
exec dbms_utility.compile_schema(schema => user, compile_all => false);
/