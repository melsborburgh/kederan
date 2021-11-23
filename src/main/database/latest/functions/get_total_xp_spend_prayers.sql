create or replace FUNCTION GET_TOTAL_XP_SPEND_PRAYERS
( i_char_id in kdr_characters.char_id%type)
return number
is
    r_amount            number;
begin
    -- Determine amount of XP spend via prayers
    with data as (
        select      coalesce(sum(pr.prayer_level),0) total
        from        kdr_char_prayers cs,
                    kdr_prayers pr
        where       pr.prayer_id        = cs.prayer_id
        and         cs.char_id          = i_char_id)
    select  data.total
    into    r_amount
    from    data;

    return r_amount;
exception
    when no_data_found then
        return 0;
end;