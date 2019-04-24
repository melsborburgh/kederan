create or replace procedure copy_plot(i_plot_id kdr_plot.plot_id%type, i_event_id kdr_events.event_id%type)
is
    v_plot_rt           kdr_plot%rowtype;
    v_plot_props_rt     kdr_plot_props%rowtype;
    v_plot_npcs_rt      kdr_plot_npcs%rowtype;
    v_lammies_rt        kdr_lammies%rowtype;
begin
    -- retrieve plot information from provided plot ID
    v_plot_rt   := kdr_plot_api.read_row( p_PLOT_ID => i_plot_id );

    -- clear plot ID (a new one will be generated during insert) and replace the event for the new event
    v_plot_rt.plot_id           := null;
    v_plot_rt.plot_title        := v_plot_rt.plot_title || ' (kopie)';
    v_plot_rt.event_id          := i_event_id;

    -- Create new record for the plot
    v_plot_rt.plot_id := kdr_plot_api.create_row(v_plot_rt);

    -- Copy all props belonging to original plot to new plot
    for rec in (select * from kdr_plot_props where plot_id =  i_plot_id) loop
        v_plot_props_rt             := kdr_plot_props_api.read_row(rec.props_id);

        v_plot_props_rt.props_id    := null;
        v_plot_props_rt.plot_id     := v_plot_rt.plot_id;

        kdr_plot_props_api.create_row(p_row => v_plot_props_rt);
    end loop;

    -- Copy all npc's belonging to original plot to new plot
    for rec in (select * from kdr_plot_npcs where plot_id =  i_plot_id) loop
        v_plot_npcs_rt              := kdr_plot_npcs_api.read_row(rec.plot_npc_id);

        v_plot_npcs_rt.plot_npc_id  := null;
        v_plot_npcs_rt.plot_id      := v_plot_rt.plot_id;

        kdr_plot_npcs_api.create_row(p_row => v_plot_npcs_rt);
    end loop;

    -- Copy all lammies belonging to original plot to new plot
    for rec in (select * from kdr_lammies where plot_id =  i_plot_id) loop
        v_lammies_rt                := kdr_lammies_api.read_row(rec.lammy_id);

        v_lammies_rt.lammy_id       := null;
        v_lammies_rt.plot_id        := v_plot_rt.plot_id;

        kdr_lammies_api.create_row(p_row => v_lammies_rt);
    end loop;
    commit;
end;