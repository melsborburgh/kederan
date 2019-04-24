drop table kdr_plot_props purge;
create table kdr_plot_props
(
    props_id        number not null enable,
    props_omsch     varchar2(4000),
    plot_id         number not null enable,  
    CONSTRAINT kdr_plot_props_pk PRIMARY KEY (props_id),
    CONSTRAINT kdr_plot_props_plot_id_fk FOREIGN KEY (plot_id) REFERENCES kdr_plot(plot_id) ON DELETE CASCADE
);