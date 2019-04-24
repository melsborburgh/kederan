drop table kdr_plot_sizes purge;
create table kdr_plot_sizes
(
    size_name     varchar2(30),
    size_desc     varchar2(4000),
    size_seq      number,  
    CONSTRAINT kdr_plot_sizes_pk PRIMARY KEY (size_name)
);