CREATE OR REPLACE EDITIONABLE FUNCTION  "GET_NEXT_EVENT"
return KDR_EVENTS.EVENT_ID%type
is
    r_event KDR_EVENTS.EVENT_ID%type;
begin
    select      event_id
    into        r_event
    from        kdr_events
    where       coalesce(event_start_date,sysdate-1) >= sysdate
    order by    event_start_date, event_name
    fetch first row only;

    return r_event;
end;