CREATE OR REPLACE EDITIONABLE FUNCTION  "GET_PRC_PLOT_APPROVED" (i_event_id kdr_events.event_id%type) return number
is
    r_prc_approved number;
begin
return 0;
    with j as(
        select  count(plot_checked)as approved
        from    kdr_plot
        where   event_id = i_event_id
        and     plot_checked = 'J'
    ), total as(
        select  count(plot_checked)as total_plots
        from    kdr_plot
        where   event_id = i_event_id
    )
    select  round((approved / decode(total_plots, 0, 1, total_plots))* 100, 0)as plot_approve_prc
    into    r_prc_approved
    from    j,
            total;

    return r_prc_approved;
exception
    when others then return 0;
end;