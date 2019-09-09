create or replace trigger kdr_char_tags_del_trg
    after delete on kdr_char_tags
    for each row
begin
    remove_unused_tags;
end;
/