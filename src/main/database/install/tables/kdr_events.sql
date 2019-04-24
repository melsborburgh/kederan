create table kdr_events
   (
    "EVENT_ID"          NUMBER not null enable,
	"EVENT_NAME"        VARCHAR2(100), 
	"EVENT_LOCATION"    VARCHAR2(100), 
	"EVENT_TYPE"        VARCHAR2(100), 	
	"EVENT_START_DATE"  DATE, 
	"EVENT_END_DATE"    DATE, 
	"EVENT_XP"          NUMBER(3,0),
    CONSTRAINT "KDR_EVENTS_PK" PRIMARY KEY ("EVENT_ID")
   );