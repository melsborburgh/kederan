CREATE OR REPLACE EDITIONABLE FUNCTION  "GET_COLOR_BY_LEVEL" (
    i_level number,
    i_column_name varchar2
)
return varchar2
as
begin
return
    '<span class="' ||
       case i_level
        when 0 then 'u-color-29-text'
        when 1 then 'u-color-20-text'
        when 2 then 'u-color-31-text'
        when 3 then 'u-color-12-text'
        when 4 then 'u-color-8-text'
        when 5 then 'u-color-16-text'
        when 6 then 'u-color-37-text'
        when 7 then 'u-color-39-text'
       else
        'u-normal-text'
       end
       || '">' || i_column_name || '</span>';
end;