
CREATE OR REPLACE EDITIONABLE FUNCTION  "PLAYER_CHARS" (i_user_name in varchar2)
return varchar2
is
    r_char_ids varchar2(4000);
begin
    if wwv_flow.g_edit_cookie_session_id is not null then
        select      listagg(c.char_id, ',') within group (order by c.char_name) as characters
        into        r_char_ids
        from        kdr_characters c;
    else
        select      listagg(c.char_id, ',') within group (order by c.char_name) as characters
        into        r_char_ids
        from        kdr_players p,
                    kdr_characters c
        where       p.player_id         = c.player_id
        and         p.player_user_name  = i_user_name
        group by    p.player_name;
    end if;

    return r_char_ids;
end;

/