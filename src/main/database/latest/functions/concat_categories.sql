CREATE OR REPLACE EDITIONABLE FUNCTION  "CONCAT_CATEGORIES" (i_plot_cats kdr_plot.plot_category%type)
return varchar2
is
    r_categories varchar2(4000);
begin

    select  listagg(category_desc, ', ' )
            within group (order by category_desc)
    into    r_categories
    from    kdr_plot_categories
    where   category_name in
            (
                select      regexp_substr(i_plot_cats,'[^:]+', 1, level)
                from        dual
                connect by  regexp_substr(i_plot_cats, '[^:]+', 1, level) is not null
            );
    return r_categories;
exception
    when no_data_found then
        r_categories := null;
end;