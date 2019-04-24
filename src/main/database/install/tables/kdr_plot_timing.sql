drop table kdr_plot_timing purge;
create table kdr_plot_timing
(
    time_code     varchar2(30),
    time_desc     varchar2(4000),
    time_seq      number,  
    CONSTRAINT kdr_timing_pk PRIMARY KEY (time_code)
);