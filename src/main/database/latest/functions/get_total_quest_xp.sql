create or replace function get_total_quest_xp
( i_char_id in kdr_characters.char_id%type)
return number
is
    r_amount    number;
begin
    select      coalesce(sum(coalesce(ev.event_xp,0) + coalesce(ce.char_event_xp_adj,0)),0) char_event_xp
    into        r_amount
    from        kdr_char_events ce,
                kdr_events ev
    where       ce.char_id      = i_char_id
    and         ev.event_id     = ce.event_id
    and         ev.event_type   IN ('SPECIAL','BARAVOND');
    return r_amount;
exception
    when no_data_found then
        return 0;
end;
/