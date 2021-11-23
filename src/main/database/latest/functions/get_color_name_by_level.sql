CREATE OR REPLACE EDITIONABLE FUNCTION  "GET_COLOR_NAME_BY_LEVEL" (
    i_level number
)
return varchar2
as
begin
return
       case i_level
        when 0 then 'u-color-29'
        when 1 then 'u-color-20'
        when 2 then 'u-color-31'
        when 3 then 'u-color-12'
        when 4 then 'u-color-8'
        when 5 then 'u-color-16'
        when 6 then 'u-color-37'
        when 7 then 'u-color-39'
       else
        'u-normal-text'
       end
       ;
end;