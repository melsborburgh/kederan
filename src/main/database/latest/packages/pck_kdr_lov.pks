create or replace package pck_kdr_lov as

    function skills_per_level
    return clob;

    function spell_types
    return clob;

    function spells_per_character(
        i_char_id in kdr_characters.char_id%type default null
    ) return clob;

    function skills_per_character(
        i_char_id in kdr_characters.char_id%type default null
    ) return clob;

    function recipes_per_character(
        i_char_id in kdr_characters.char_id%type default null
    ) return clob;

    function prayers_per_character(
        i_char_id in kdr_characters.char_id%type default null
    ) return clob;

    function events_per_character(
        i_char_id in kdr_characters.char_id%type default null
    ) return clob;

    function items_per_character(
        i_char_id in kdr_characters.char_id%type default null
    ) return clob;

    function characters_per_event(
        i_event_id in kdr_events.event_id%type default null
    ) return clob;

    function components_per_recipe(
        i_recipe_id in kdr_recipes.recipe_id%type default null
    ) return clob;

    function item_types
    return clob;

    function recipes
    return clob;

    function recipe_types
    return clob;

    function component_types
    return clob;

    function skill_categories
    return clob;

    function event_done_last(
      i_grouping in varchar2 default null
    )
    return clob;

    function plots_per_event(
      i_event_id in kdr_plot.event_id%type default null
    )
    return clob;

    function language_types
    return clob;

    function seq_next_val(
        i_seqnm varchar2
    )
    return number;

    function props
    return clob;

    function skills_per_npc(
        i_npc_id in kdr_npcs.npc_id%type default null
    ) return clob;

    function spells_per_npc(
        i_npc_id in kdr_npcs.npc_id%type default null
    ) return clob;

    function prayers_per_npc(
        i_npc_id in kdr_npcs.npc_id%type default null
    ) return clob;
end pck_kdr_lov;
/