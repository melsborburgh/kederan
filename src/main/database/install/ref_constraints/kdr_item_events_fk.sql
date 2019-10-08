alter table kdr_item_events add constraint kdr_item_events_fk
foreign key (item_id)
references kdr_items (item_id)
on delete cascade
/