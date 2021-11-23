CREATE OR REPLACE EDITIONABLE FUNCTION  "PLAYER_AUTH" (i_user_name in varchar2)
return boolean
is
    v_count number;
begin
    select  count(*)
    into    v_count
    from    kdr_players
    where   lower(player_user_name) = lower(i_user_name);

    if v_count = 1 or is_developer_email(i_user_name) then
        return true;
    end if;

    -- Failover if condition above was not met
    return false;
end;
/