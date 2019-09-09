create or replace package body pck_kdr_audit as

    -- Global constants
    gc_scope_prefix                 constant varchar2(31)   := lower($$plsql_unit) || '.';
    gc_audit_trigger_suffix         constant varchar2(200)  := '_AUDIT';
    gc_audit_table_suffix           constant varchar2(200)  := '_AUDIT';
    gc_ind_4                        constant varchar2(4)    := lpad(' ',4);     -- Indentation 4 spaces

    procedure record_audit_generate_triggers(
        i_tblnm         in varchar2 default null
    )
    is
        -- Cursors
        cursor      c_tables is
        select      table_name
        from        user_tables a
        where       table_name not like 'LOGGER\_%' escape '\'
        and         table_name not like 'DATABASECHANGELOG%'
        and         table_name not like 'DRDUMMY_CC%'
        and         table_name like 'KDR%'
        and         table_name = nvl(i_tblnm, table_name)
        order by    table_name asc;

    begin
        for r_tables in c_tables loop
            record_audit_create_trigger(r_tables.table_name, 'INSERT');
            record_audit_create_trigger(r_tables.table_name, 'UPDATE');
        end loop;
    exception
        when others then
            raise;
    end record_audit_generate_triggers;

    /*
    * Create trigger for record audit
    *
    *
    * @example  pck_kdr_audit.record_audit_create_trigger(
    *           i_table_name => 'DRXXXXX_CC',
    *           i_dml_type   => 'INSERT');
    *
    * @author   Mels
    * @created  09-09-2019
    * @param    i_table_name       Source table name for which you want to create an audit trigger.
    * @param    i_dml_type         Type of DML Statement (INSERT, UPDATE, DELETE).
    */
    procedure record_audit_create_trigger(
        i_table_name   in varchar2,
        i_dml_type     in varchar2
    )
    is
        v_statement         varchar2(4000);                            -- SQL statement
        v_audit_trigger     varchar2(200);                              -- Name of audit trigger

        -- Pragma exceptions
        compilation_errors EXCEPTION;
        PRAGMA EXCEPTION_INIT(compilation_errors, -24344);
    begin
        -- Initialize
        case i_dml_type
        when 'INSERT' then
            v_audit_trigger  := i_table_name || '_bir' || gc_audit_trigger_suffix;
        when 'UPDATE' then
            v_audit_trigger  := i_table_name || '_bur' || gc_audit_trigger_suffix;
        when 'DELETE' then
            v_audit_trigger  := i_table_name || '_bdr' || gc_audit_trigger_suffix;
        end case;

        -- Trigger header
        v_statement := 'create or replace trigger ' || v_audit_trigger || chr(10);
        v_statement := v_statement || 'before ' || i_dml_type || ' on ' || i_table_name || chr(10);
        v_statement := v_statement || 'for each row ' || chr(10);
        v_statement := v_statement  || '-- Generated on '|| to_char(sysdate,'DD-MM-YYYY HH24:MI:SS') || chr(10);

        -- Trigger body
        v_statement := v_statement || 'begin' || chr(10);

        case i_dml_type
        when 'INSERT' then
            v_statement := v_statement || gc_ind_4 || ':new.audit_creation_date := localtimestamp;' || chr(10);
            v_statement := v_statement || gc_ind_4 || ':new.audit_creation_user := fnc_get_audit_user;' || chr(10);
            v_statement := v_statement || gc_ind_4 || ':new.audit_creation_source := sys_context(''userenv'',''module'');' || chr(10);
        when 'UPDATE' then
            v_statement := v_statement || gc_ind_4 || ':new.audit_mutation_date := localtimestamp;' || chr(10);
            v_statement := v_statement || gc_ind_4 || ':new.audit_mutation_user := fnc_get_audit_user;' || chr(10);
            v_statement := v_statement || gc_ind_4 || ':new.audit_mutation_source := sys_context(''userenv'',''module'');' || chr(10);
        when 'DELETE' then
            -- No action needed for record audit on delete
            null;
        end case;

        v_statement := v_statement || 'end;' || chr(10);

        dbms_output.put_line(v_statement || '/' || chr(10));
        -- execute immediate v_statement;

        /*
        -- Create audit trigger
        if i_dml_type != 'DELETE' then
            -- Record audit only on insert or update
            begin
                null;
                execute immediate v_statement;
            end;
        end if;
        */
    exception
        when others then
            raise;
    end record_audit_create_trigger;

    /*
    * Generate the audit columns for all Kederan tables where they are not already there.
    *
    *
    * @example  pck_kdr_audit.generate_audit_columns;
    *
    * @author   Mels
    * @created  09-09-2019
    */
    procedure generate_audit_columns
    is
        cursor c_tables (i_column_name in varchar2) is
            select  tb.table_name
            from    user_tables tb
            where   tb.table_name like 'KDR%'
            and     tb.table_name not in(
                        select  tc.table_name
                        from    user_tab_cols tc
                        where   lower(tc.column_name) = i_column_name
                    );
    begin
        for rec in c_tables ('audit_creation_date') loop
            dbms_output.put_line('alter table ' || rec.table_name ||' add audit_creation_date date');
            execute immediate ('alter table ' || rec.table_name ||' add audit_creation_date date');
            execute immediate ('alter table ' || rec.table_name ||' modify audit_creation_date invisible');
        end loop;

        for rec in c_tables ('audit_creation_user') loop
            dbms_output.put_line('alter table ' || rec.table_name ||' add audit_creation_user varchar2(1000)');
            execute immediate ('alter table ' || rec.table_name ||' add audit_creation_user varchar2(1000) default on null localtimestamp');
            execute immediate ('alter table ' || rec.table_name ||' modify audit_creation_user invisible');
        end loop;

        for rec in c_tables ('audit_creation_source') loop
            dbms_output.put_line('alter table ' || rec.table_name ||' add audit_creation_source varchar2(1000)');
            execute immediate ('alter table ' || rec.table_name ||' add audit_creation_source varchar2(1000)');
            execute immediate ('alter table ' || rec.table_name ||' modify audit_creation_source invisible');
        end loop;

        for rec in c_tables ('audit_mutation_date') loop
            dbms_output.put_line('alter table ' || rec.table_name ||' add audit_mutation_date date');
            execute immediate ('alter table ' || rec.table_name ||' add audit_mutation_date date');
            execute immediate ('alter table ' || rec.table_name ||' modify audit_mutation_date invisible');
        end loop;

        for rec in c_tables ('audit_mutation_user') loop
            dbms_output.put_line('alter table ' || rec.table_name ||' add audit_mutation_user varchar2(1000)');
            execute immediate ('alter table ' || rec.table_name ||' add audit_mutation_user varchar2(1000) default on null localtimestamp');
            execute immediate ('alter table ' || rec.table_name ||' modify audit_mutation_user invisible');
        end loop;

        for rec in c_tables ('audit_mutation_source') loop
            dbms_output.put_line('alter table ' || rec.table_name ||' add audit_mutation_source varchar2(1000)');
            execute immediate ('alter table ' || rec.table_name ||' add audit_mutation_source varchar2(1000)');
            execute immediate ('alter table ' || rec.table_name ||' modify audit_mutation_source invisible');
        end loop;
    end generate_audit_columns;

end pck_kdr_audit;
/