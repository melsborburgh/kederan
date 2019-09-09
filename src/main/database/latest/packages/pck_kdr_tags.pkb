create or replace package body pck_kdr_tags as

    procedure process_tags (
        i_tags in varchar2
    )
    is
        v_varchar_arr     apex_t_varchar2;
        v_count           number;
        v_tags_rt         kdr_tags%rowtype;
        v_char_tags_rt    kdr_char_tags%rowtype;
    begin
        v_varchar_arr := apex_string.split(lower(i_tags), ':');

        for i in v_varchar_arr.FIRST .. v_varchar_arr.LAST
        loop
            dbms_output.put_line('Tag {' || v_varchar_arr(i) || '}');
            begin
                select  count(*)
                into    v_count
                from    kdr_tags
                where   to_char(tag_id) = v_varchar_arr(i);
                if v_count > 0 then
                    dbms_output.put_line('Tag {' || v_varchar_arr(i) || '} IS REEDS BEKEND.');
                else
                    dbms_output.put_line('Tag {' || v_varchar_arr(i) || '} bestaat nog niet.');
                    kdr_tags_api.create_row(p_TAG_NAME => v_varchar_arr(i));
                end if;
            exception
                when dup_val_on_index then
                    null;
            end;
        end loop;

        commit;
    end;

    procedure process_char_tags (
        i_tags    in varchar2,
        i_char_id in kdr_characters.char_id%type
    )
    is
        v_varchar_arr     apex_t_varchar2;
        v_count           number;
        v_tags_rt         kdr_tags%rowtype;
        v_char_tags_rt    kdr_char_tags%rowtype;
    begin
        if i_char_id is not null and i_tags is not null then
            v_varchar_arr           := apex_string.split(lower(i_tags), ':');
            v_char_tags_rt.char_id  := i_char_id;

            for i in v_varchar_arr.FIRST .. v_varchar_arr.LAST
            loop
                dbms_output.put_line('Tag {' || v_varchar_arr(i) || '}');
                begin
                    select  count(*)
                    into    v_count
                    from    kdr_tags
                    where   to_char(tag_id) = v_varchar_arr(i);
                    if v_count > 0 then
                        dbms_output.put_line('Tag {' || v_varchar_arr(i) || '} IS REEDS BEKEND.');
                        v_char_tags_rt.tag_id := v_varchar_arr(i);
                    else
                        dbms_output.put_line('Tag {' || v_varchar_arr(i) || '} bestaat nog niet.');
                        v_char_tags_rt.tag_id := kdr_tags_api.create_row(p_TAG_NAME => v_varchar_arr(i));
                    end if;

                    -- Add tag to character tags
                    kdr_char_tags_api.create_row(p_row => v_char_tags_rt);
                exception
                    when dup_val_on_index then
                        null;
                end;
            end loop;

            commit;
        end if;
    end;
end pck_kdr_tags;
/