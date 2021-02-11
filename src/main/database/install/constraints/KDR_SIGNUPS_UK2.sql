alter table "KDR_SIGNUPS" add
constraint "KDR_SIGNUPS_UK2"
unique ("EVENT_ID","PLAYER_ID")
/