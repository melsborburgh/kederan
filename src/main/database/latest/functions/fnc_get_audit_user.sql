CREATE OR REPLACE EDITIONABLE FUNCTION  "FNC_GET_AUDIT_USER"
return varchar2
is
    v_user varchar2(200);
begin
    -- Get the APEX APP_USER
    if sys_context('APEX$SESSION', 'app_user') is not null then
        v_user := upper(trim(sys_context('APEX$SESSION', 'app_user')));
    -- Get the LDAP user
    elsif sys_context('USERENV','OS_USER') is not null then
        v_user := upper(sys_context('USERENV','OS_USER'));
    -- Get the oracle user
    else
        v_user := upper(user);
    end if;

    return v_user;
end fnc_get_audit_user;