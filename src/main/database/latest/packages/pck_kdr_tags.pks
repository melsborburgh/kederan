create or replace package pck_kdr_tags as

    procedure process_tags (
        i_tags in varchar2
    );

    procedure process_char_tags (
        i_tags    in varchar2,
        i_char_id in kdr_characters.char_id%type
    );

end pck_kdr_tags;
/