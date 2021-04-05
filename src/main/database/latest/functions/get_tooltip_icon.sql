create or replace function get_tooltip_icon
(
    i_table_name    in varchar2,
    i_column_name   in varchar2,
    i_pk_column     in varchar2,
    i_reference     in varchar2
)
return varchar2 as
    v_query         varchar2(32000);
    v_description   varchar2(32000);
begin
    v_query := 'select ' || i_column_name || ' from ' || i_table_name || ' where ' || i_pk_column || ' = ''' || i_reference || '''';
    execute immediate v_query INTO v_description;
    -- dbms_output.put_line(v_query);
    -- return v_query;

    return ' <span class="fa fa-question-circle" aria-hidden="true" title="' || v_description || '">' || '' || '</span>';
end;
/