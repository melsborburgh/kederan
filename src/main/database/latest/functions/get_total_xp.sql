create or replace function get_total_xp
( i_char_id in kdr_characters.char_id%type)
return number
is
    r_amount    number;
    r_xp_pen    number;
    r_event_xp  number;
begin
    -- Determine starting xp base on (sub) race
    r_amount := get_total_race_xp(i_char_id => i_char_id);

    -- Determine amount of XP gained via skills
    select      coalesce(sum(sl.skill_xp_gain),0)
    into        r_xp_pen
    from        kdr_skill_levels sl,
                kdr_char_skills cs
    where       sl.skill_level_id   = cs.skill_level_id
    and         cs.char_id          = i_char_id;

    -- Determine amount of XP gained via events
    select      coalesce(sum(coalesce(ev.event_xp,0) + coalesce(ce.char_event_xp_adj,0)),0) char_event_xp
    into        r_event_xp
    from        kdr_char_events ce,
                kdr_events ev
    where       ce.char_id  = i_char_id
    and         ev.event_id = ce.event_id
    order by    ce.event_id;

    -- Adjust XP according to data from KDR_CHARACTERS
    r_amount := r_amount + to_number(coalesce(kdr_characters_api.get_char_xp_adjust( p_char_id => i_char_id),0));

    r_amount := r_amount + r_xp_pen + r_event_xp;

    return r_amount;
exception
    when no_data_found then
        return 20;
end;
/