alter table "KDR_SIGNUPS" add
constraint "KDR_SIGNUPS_UK1"
unique ("EVENT_ID","CHAR_ID")
/