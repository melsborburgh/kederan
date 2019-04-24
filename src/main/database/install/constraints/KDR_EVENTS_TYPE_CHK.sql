alter table "KDR_EVENTS" add constraint
"KDR_EVENTS_TYPE_CHK" check ( "EVENT_TYPE" in ('BARAVOND','SPECIAL','MAIN'))
/   
