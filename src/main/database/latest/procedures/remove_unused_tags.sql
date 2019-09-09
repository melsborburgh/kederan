create or replace procedure remove_unused_tags
as
begin
    delete
    from    kdr_tags
    where   tag_id not in
            (   select  tag_id
                from    kdr_char_tags
            );
end;
/