create table kdr_lammies
(
    LAMMY_ID            NUMBER not null enable,
    PLOT_ID             NUMBER,
    LAMMY_NAME          VARCHAR2(1000),
    LAMMY_EFFECT        VARCHAR2(4000),
    LAMMY_EXP_DATE      VARCHAR2(100),
    LAMMY_CHARGES       NUMBER,
    CONSTRAINT kdr_lammies_pk PRIMARY KEY (LAMMY_ID),
    CONSTRAINT kdr_lammies_plot_id_fk FOREIGN KEY (plot_id) REFERENCES kdr_plot(plot_id) ON DELETE CASCADE
);