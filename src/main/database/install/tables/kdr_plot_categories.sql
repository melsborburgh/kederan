drop table kdr_plot_categories purge;
create table kdr_plot_categories
(
    "category_name"   varchar2(30),
    "category_desc"   varchar2(4000),   
    CONSTRAINT "kdr_plot_categories_pk" PRIMARY KEY ("category_name")
);