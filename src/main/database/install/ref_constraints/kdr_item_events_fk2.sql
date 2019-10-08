alter table kdr_item_events add constraint kdr_item_events_fk2
foreign key (event_id)
references kdr_events (event_id)
on delete cascade
/
