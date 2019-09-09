create or replace function get_char_desc (
        i_char_id   in kdr_characters.char_id%type,
        i_type      in varchar2 default null
)
return varchar2
is
    r_char_desc varchar2(1000);
begin
    select      case
                when (i_type is null or i_type = 'LONG')
                then  char_name || ' ('
                end ||
                race_name ||
                case
                    when sub_race_name is not null
                    then '/' || sub_race_name
                end ||
                case
                    when char_occupation is not null and char_class is not null
                    then
                        ' ' || char_class || '-' || char_occupation
                    when char_occupation is not null
                    then
                        ' ' || char_occupation
                    when char_class is not null
                    then
                        ' ' || char_class
                end  ||
                case
                when (i_type is null or i_type = 'LONG')
                then  ')'
                end
    into        r_char_desc
    from        kdr_characters_view
    where       char_id = i_char_id;

    return r_char_desc;
exception
    when no_data_found then
        return null;
end;
/