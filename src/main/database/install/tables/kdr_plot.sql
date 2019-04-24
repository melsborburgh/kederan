create table kdr_plot
(
    PLOT_ID             NUMBER not null enable,
    EVENT_ID            NUMBER,
    PLOT_TITLE          VARCHAR2(300),
    PLOT_CATEGORY       VARCHAR2(300),
    PLOT_SIZE           VARCHAR2(30),
    PLOT_GROUP_TYPE     VARCHAR2(30),
    plot_timing         VARCHAR2(30),
    PLOT_PROPPS         VARCHAR2(300),
    PLOT_LOCATION       VARCHAR2(300),
    PLOT_GOAL           VARCHAR2(4000),
    PLOT_TARGET         VARCHAR2(300),
    PLOT_GAMEMASTER     VARCHAR2(300),
    PLOT_AUTHOR         VARCHAR2(300),
    PLOT_NPCS	        VARCHAR2(4000),
    PLOT_DESCRIPTION    CLOB,
    CONSTRAINT KDR_PLOT_PK PRIMARY KEY (PLOT_ID)
);