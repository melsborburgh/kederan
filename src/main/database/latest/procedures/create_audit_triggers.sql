create or replace procedure create_audit_triggers(i_table_name in varchar2)
as
        v_statement             varchar2(32767);                            -- SQL statement
        gc_ind_4                varchar2(4)        := '    ';
        gc_ind_8                varchar2(8)        := '        ';
        kdr_audit_rt            kdr_audit%rowtype;
        v_primary_key_col_name  varchar2(100);

        cursor c_col is
        select  column_name, decode(instr(data_type,'('),0,data_type,substr(data_type,1,instr(data_type,'(')-1)) as data_type
        from    user_tab_columns
        where   table_name = i_table_name
        and     column_name not like 'AUDIT%'
        order by column_id;
begin
        begin
            select      cc.column_name
            into        v_primary_key_col_name
            from        user_constraints c,
                        user_cons_columns cc
            where       cc.table_name       = i_table_name
            and         cc.table_name       = c.table_name
            and         cc.constraint_name  = c.constraint_name
            and         cc.owner            = c.owner
            and         c.constraint_type   = 'P'
            fetch first 1 row only;
        exception
            when no_data_found then
                v_primary_key_col_name := 'ERROR';
        end;

        -- Trigger header
        v_statement := 'create or replace trigger ' || lower(i_table_name) || '_aiudr' || chr(10);
        v_statement := v_statement || 'after INSERT or DELETE or UPDATE on ' || i_table_name || chr(10);
        v_statement := v_statement || 'for each row ' || chr(10);
        v_statement := v_statement || 'declare' || chr(10);
        v_statement := v_statement || gc_ind_4 || 'kdr_audit_rt            kdr_audit%rowtype; ' || chr(10);

        -- Trigger body
        v_statement := v_statement || 'begin' || chr(10);
        v_statement := v_statement || gc_ind_4 || 'kdr_audit_rt.audit_table  := ''' || i_table_name || ''';' || chr(10);
        v_statement := v_statement || gc_ind_4 || 'kdr_audit_rt.audit_key    := :new.' || v_primary_key_col_name || ';' || chr(10);
        v_statement := v_statement || gc_ind_4 || 'kdr_audit_rt.audit_user   := coalesce(v(''APP_USER''),sys_context( ''userenv'', ''os_user'' ));' || chr(10);
        v_statement := v_statement || gc_ind_4 || 'kdr_audit_rt.audit_date   := localtimestamp;' || chr(10);

        v_statement := v_statement || chr(10)  || gc_ind_4 || '-- ******************************** UPDATING ********************************' || chr(10);
        v_statement := v_statement || gc_ind_4 || 'if updating then' || chr(10);
        v_statement := v_statement || gc_ind_4 || 'kdr_audit_rt.audit_type   := ''UPDATE'';' || chr(10);

            for r_col in c_col loop
                -- Initialization of audit rowtype
                kdr_audit_rt.audit_table := r_col.column_name;

                -- Column and value fields
                case
                when r_col.data_type in ('CHAR', 'VARCHAR2', 'VARCHAR', 'NCHAR', 'NVARCHAR2', 'RAW') then
                    v_statement := v_statement || gc_ind_4 || 'if DBMS_CRYPTO.HASH (UTL_I18N.STRING_TO_RAW (coalesce(:OLD.' || r_col.column_name || ',''null''), ''AL32UTF8''), DBMS_CRYPTO.HASH_MD5)' || chr(10);
                    v_statement := v_statement || gc_ind_8 || gc_ind_4 || '!= DBMS_CRYPTO.HASH (UTL_I18N.STRING_TO_RAW (coalesce(:NEW.' || r_col.column_name || ',''null''), ''AL32UTF8''), DBMS_CRYPTO.HASH_MD5) then'|| chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_rt.audit_column    := ''' || r_col.column_name || ''';' || chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_rt.audit_old_value := :old.'|| r_col.column_name || ';' || chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_rt.audit_new_value := :new.'|| r_col.column_name || ';' || chr(10);
                    v_statement := v_statement || chr(10)  ||  gc_ind_8 || '-- Insert audit record in KDR_AUDIT' || chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_api.create_row(kdr_audit_rt);' || chr(10);
                    v_statement := v_statement || gc_ind_4 || 'end if;' || chr(10) || chr(10);

                when r_col.data_type in ('NUMBER', 'BINARY_DOUBLE', 'BINARY_FLOAT') then
                    v_statement := v_statement || gc_ind_4 || 'if DBMS_CRYPTO.HASH (UTL_I18N.STRING_TO_RAW (coalesce(to_char(:OLD.' || r_col.column_name || '),''null''), ''AL32UTF8''), DBMS_CRYPTO.HASH_MD5)' || chr(10);
                    v_statement := v_statement || gc_ind_8 || gc_ind_4 || '!= DBMS_CRYPTO.HASH (UTL_I18N.STRING_TO_RAW (coalesce(to_char(:NEW.' || r_col.column_name || '),''null''), ''AL32UTF8''), DBMS_CRYPTO.HASH_MD5) then'|| chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_rt.audit_column    := ''' || r_col.column_name || ''';' || chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_rt.audit_old_value := to_char(:old.'|| r_col.column_name || ');' || chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_rt.audit_new_value := to_char(:new.'|| r_col.column_name || ');' || chr(10);
                    v_statement := v_statement || chr(10)  ||  gc_ind_8 || '-- Insert audit record in KDR_AUDIT' || chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_api.create_row(kdr_audit_rt);' || chr(10);
                    v_statement := v_statement || gc_ind_4 || 'end if;' || chr(10) || chr(10);

                when r_col.data_type in ('DATE','TIMESTAMP') then
                    v_statement := v_statement || gc_ind_4 || 'if DBMS_CRYPTO.HASH (UTL_I18N.STRING_TO_RAW (coalesce(to_char(:OLD.' || r_col.column_name || '),''null''), ''AL32UTF8''), DBMS_CRYPTO.HASH_MD5)' || chr(10);
                    v_statement := v_statement || gc_ind_8 || gc_ind_4 || '!= DBMS_CRYPTO.HASH (UTL_I18N.STRING_TO_RAW (coalesce(to_char(:NEW.' || r_col.column_name || '),''null''), ''AL32UTF8''), DBMS_CRYPTO.HASH_MD5) then'|| chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_rt.audit_column    := ''' || r_col.column_name || ''';' || chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_rt.audit_old_value := to_char(:old.'|| r_col.column_name || ',''Day DD-MM-YYYY HH24:MM'');' || chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_rt.audit_new_value := to_char(:new.'|| r_col.column_name || ',''Day DD-MM-YYYY HH24:MM'');' || chr(10);
                    v_statement := v_statement || chr(10)  ||  gc_ind_8 || '-- Insert audit record in KDR_AUDIT' || chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_api.create_row(kdr_audit_rt);' || chr(10);
                    v_statement := v_statement || gc_ind_4 || 'end if;' || chr(10) || chr(10);

                when r_col.data_type in ('CLOB', 'NCLOB', 'LONG', 'LONG RAW') then
                    v_statement := v_statement || gc_ind_4 || 'if DBMS_CRYPTO.HASH (coalesce(:OLD.' || r_col.column_name || ',''null''), DBMS_CRYPTO.HASH_MD5)' || chr(10);
                    v_statement := v_statement || gc_ind_8 || gc_ind_4 || '!= DBMS_CRYPTO.HASH (coalesce(:NEW.' || r_col.column_name || ',''null''), DBMS_CRYPTO.HASH_MD5) then'|| chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_rt.audit_column    := ''' || r_col.column_name || ''';' || chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_rt.audit_old_value := to_char(:old.'|| r_col.column_name || ');' || chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_rt.audit_new_value := to_char(:new.'|| r_col.column_name || ');' || chr(10);
                    v_statement := v_statement || chr(10)  ||  gc_ind_8 || '-- Insert audit record in KDR_AUDIT' || chr(10);
                    v_statement := v_statement || gc_ind_8 || 'kdr_audit_api.create_row(kdr_audit_rt);' || chr(10);
                    v_statement := v_statement || gc_ind_4 || 'end if;' || chr(10) || chr(10);

--                when r_col.data_type in ('BLOB') then
--                    v_statement := v_statement || gc_ind_4 || v_audit_package || '.audit_blob(''' || r_col.column_name || ''', :OLD.' ||
--                                   r_col.column_name || ', :NEW.' || r_col.column_name || ');'  || chr(10);
                else
                    -- No audit on unsupported data types
                    v_statement := v_statement || gc_ind_4 || '-- No audit on "' || r_col.column_name || '" because of unsupported data type "' || r_col.data_type || '".' || chr(10);
                end case;
            end loop;

            v_statement := v_statement || gc_ind_4 || 'end if;' || chr(10);
            v_statement := v_statement || 'end;' || chr(10);
            v_statement := v_statement || '/' || chr(10);

            dbms_output.put_line(v_statement);
end;
/