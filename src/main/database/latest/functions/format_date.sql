CREATE OR REPLACE EDITIONABLE FUNCTION  "FORMAT_DATE" (i_date_string varchar2)
return varchar2
is
    r_value varchar2(100);
begin
    with x as (select regexp_replace(i_date_string, '[^0-9]+', '') formmated_date from dual)
    select      case
                    when length(formmated_date) = 2
                    then substr(formmated_date,1,2) || '-' || to_char(sysdate,'MM-YYYY')
                    when length(formmated_date) between 3 and 4
                    then substr(formmated_date,1,2) || '-' || substr(formmated_date,3,2) || '-' || to_char(sysdate,'YYYY')
                    when length(formmated_date) between 5 and 6
                    then substr(formmated_date,1,2) || '-' || substr(formmated_date,3,2) || '-' || case when to_number(substr(formmated_date,5,2)) < 50 then '20' else '19' end || substr(formmated_date,5,2)
                    when length(formmated_date) between 7 and 8
                    then substr(formmated_date,1,2) || '-' || substr(formmated_date,3,2) || '-' || rpad(substr(formmated_date,5,4),4,'0')
                end
    into        r_value
    from        x;

    return r_value;
end;