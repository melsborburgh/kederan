create table kdr_item_events (
    item_event_id number generated BY DEFAULT ON NULL as identity,
    item_id       number,
    event_id      number,
    item_new_cost number,
    constraint  kdr_item_events_pk primary key (item_event_id)
)
/