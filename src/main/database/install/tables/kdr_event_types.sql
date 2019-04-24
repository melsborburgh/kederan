drop table kdr_event_types purge;
create table kdr_event_types
(
    event_type_name     varchar2(30),
    event_type_desc     varchar2(4000),
    event_type_seq      number,  
    CONSTRAINT kdr_event_types_pk PRIMARY KEY (event_type_name)
);