create table kdr_plot_npcs
(
    NPC_ID              NUMBER not null enable,
    PLOT_ID             NUMBER not null enable,
    CONSTRAINT kdr_plot_npcs_pk PRIMARY KEY (NPC_ID, PLOT_ID),
    CONSTRAINT kdr_plot_npcs_plot_id_fk FOREIGN KEY (plot_id) REFERENCES kdr_plot(plot_id) ON DELETE CASCADE,
    CONSTRAINT kdr_plot_npcs_npc_id_fk FOREIGN KEY (npc_id) REFERENCES kdr_npcs(npc_id) ON DELETE CASCADE
);