create or replace function replace_audit_text (
        i_audit_text in varchar2,
        i_table_name in varchar2,
        i_audit_type in varchar2
)
return varchar2
is
    r_audit_text varchar2(4000);
begin
    case i_table_name
        when 'KDR_CHAR_SKILLS' then

        with x as (
            select      replace(replace(i_audit_text, '#&#SKILL_LEVEL_ID#&#','Vaardigheid '),'#&#CHAR_ID#&#','personage ') replaced_string
            from        dual
        )
        , y as
        (
            select      substr(replaced_string,instr(replaced_string,'¦',1,1)+1, instr(replaced_string,'¦',1,2)-instr(replaced_string,'¦',1,1)-1) skill_level_id,
                        substr(replaced_string,instr(replaced_string,'¦',1,3)+1, instr(replaced_string,'¦',1,4)-instr(replaced_string,'¦',1,3)-1) char_id
            from        x
        )
        , skill_data as
        (
            select  '"' || sl.skill_name || '" op niveau ' || sl.level_id skill_level_desc
            from    y,
                    KDR_SKILLS_PER_LEVEL sl
            where   to_char(y.skill_level_id) = sl.skill_level_id
        )
        , char_data as
        (
            select  '"' || ch.char_name || '"' char_name_desc
            from    y,
                    kdr_characters ch
            where   to_char(y.char_id) = ch.char_id
        )
        select      REGEXP_replace(REGEXP_replace(replaced_string,'¦[0-9]*¦',skill_level_desc,1,1),'¦[0-9]*¦',char_name_desc,1,1)
        into        r_audit_text
        from        skill_data, char_data, x, y;
    end case;

    return r_audit_text;
end;
/