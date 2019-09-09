create or replace package pck_kdr_audit as

    procedure record_audit_generate_triggers(
        i_tblnm         in varchar2 default null
    );

    procedure record_audit_create_trigger(
        i_table_name   in varchar2,
        i_dml_type     in varchar2
    );

    procedure generate_audit_columns;
end pck_kdr_audit;
/