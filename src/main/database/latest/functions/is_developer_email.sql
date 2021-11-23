CREATE OR REPLACE EDITIONABLE FUNCTION  "IS_DEVELOPER_EMAIL" (i_email in varchar2)
return boolean
as
    r_developer number;
begin
    select  count(1) into r_developer from apex_workspace_developers where email = i_email;

    if r_developer > 0 then
        return true;
    end if;

    return false;
end;