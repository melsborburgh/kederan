CREATE OR REPLACE EDITIONABLE FUNCTION  "GET_CHAR_LANGUAGES"
(i_char_id in NUMBER)
return VARCHAR2
is
    r_char_languages varchar2(300);
begin
    select  listagg(cl.language_id,':') within group(order by cl.language_id)
    into    r_char_languages
    from    kdr_char_languages cl
    where   cl.char_id = i_char_id;

    return r_char_languages;
end;