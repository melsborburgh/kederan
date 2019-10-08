
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_LOV_PLOT_CATS (RETURN_VALUE, DISP
LAY_VALUE) AS 
  select ltrim(sys_connect_by_path(category_name, ':'), ':')return_value,
           ltrim(sys_connect_by_path(category_desc, ', '), ', ')display_value
    from kdr_plot_categories connect by
        category_name > prior category_name;

