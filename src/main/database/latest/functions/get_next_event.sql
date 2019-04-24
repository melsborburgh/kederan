create or replace function get_next_event
return KDR_EVENTS.EVENT_ID%type
is
    r_event KDR_EVENTS.EVENT_ID%type;
begin
    with x as (
        select      EVENT_ID
        from        KDR_EVENTS
        where       COALESCE(EVENT_START_DATE,sysdate-1) >= sysdate
        order by    EVENT_START_DATE, EVENT_NAME
    )
    select  *
    into    r_event
    from    x
    where   rownum = 1;

    return r_event;
end;
/