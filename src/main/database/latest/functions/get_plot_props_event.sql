create or replace function get_plot_props_event
(
    i_event_id in kdr_plot.event_id%type
)
return varchar2
is
    r_props varchar2(300);
begin
    select      listagg(pp.props_id,':') within group (order by pp.props_id)
    into        r_props
    from        kdr_plot_props pp,
                kdr_plot p
    where       pp.plot_id = p.plot_id
    and         p.event_id = i_event_id
    and         pp.props_ready = 'J';

    return      r_props;
end;
/