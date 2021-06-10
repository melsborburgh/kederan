create or replace package body pck_kdr_lov as

    function skills_per_level
    return clob
    is
    begin
        return  'select      skill_level_name, skill_level_id, category_name' || chr(10)
            ||  'from        kdr_skills_per_level' || chr(10)
            ||  'order by    skill_name, level_id;'|| chr(10);
    end;

    function spell_types
    return clob
    is
    begin
        return  q'{ select      SPELL_TYPE_NAME as display_value, SPELL_TYPE_CODE as return_value
                    from        KDR_SPELL_TYPES
                    order by    SPELL_TYPE_NAME}';
    end;

    function spells_per_character(
        i_char_id in kdr_characters.char_id%type default null
    ) return clob
    is
    begin
        return  q'{ select      st.spell_type_name || ' - ' || sp.spell_level || ' - ' || sp.spell_name display_value,
                                sp.spell_id return_value,
                                st.spell_type_name
                    from        kdr_spells sp,
                                kdr_spell_types st
                    where       sp.spell_type_code = st.spell_type_code
                    and         sp.spell_id not in (select spell_id from kdr_char_spells where }'
                                || nvl(to_char(i_char_id),'null') || q'{ = char_id)
                    order by    st.spell_type_name, sp.spell_level, sp.spell_name}';
    end;

    function skills_per_character(
        i_char_id in kdr_characters.char_id%type default null
    ) return clob
    is
    begin
        return  q'{ select      spl.skill_level_name || ' (' || apex_string.get_initials(spl.skill_name,4) || level_id || ')' skill_level_name,
                                spl.skill_level_id,
                                spl.category_name
                    from        kdr_skills_per_level spl,
                                kdr_skill_category_types sct
                    where       spl.category_type = sct.type_id
                    and         lower(sct.type_name) != 'npc'
                    and         spl.skill_level_id not in (select skill_level_id from kdr_char_skills where }'
                                || nvl(to_char(i_char_id),'null') || q'{ = char_id)
                    order by    spl.category_name, spl.skill_level_name, spl.level_id}';
    end;

    function recipes_per_character(
        i_char_id in kdr_characters.char_id%type default null
    ) return clob
    is
    begin
        return  q'{ select      recipe_level || ' - ' || recipe_name recipe_name, recipe_id, recipe_type_name
                    from        kdr_recipes_view
                    where       recipe_id not in (select recipe_id from kdr_char_recipes where nvl(}'
                                || nvl(to_char(i_char_id),'null') || q'{,char_id) = char_id)
                    order by    recipe_type_name, recipe_level, recipe_name}';
    end;

    function prayers_per_character(
        i_char_id in kdr_characters.char_id%type default null
    ) return clob
    is
    begin
        return  q'{ select      deity_name || ' - ' || sp.prayer_level || ' - ' || sp.prayer_name display_value,
                                sp.prayer_id return_value,
                                deity_name
                    from        kdr_prayers sp,
                                kdr_deities st
                    where       sp.deity_code = st.deity_code
                    and         sp.prayer_id not in (select prayer_id from kdr_char_prayers where nvl(}'
                                || nvl(to_char(i_char_id),'null') || q'{,char_id) = char_id)
                    order by    st.deity_code, sp.prayer_level, sp.prayer_name}';
    end;

    function events_per_character(
        i_char_id in kdr_characters.char_id%type default null
    ) return clob
    is
    begin
        return  q'{ select      ev.event_name display_value,
                                ev.event_id return_value,
                                et.event_type_desc
                    from        kdr_events ev,
                                kdr_event_types et
                    where       ev.event_type   = et.event_type_name
                    and         ev.event_id not in (select event_id from kdr_char_events where nvl(}'
                                || nvl(to_char(i_char_id),'null') || q'{,char_id) = char_id)
                    order by    event_type_desc, event_name}';
    end;

    function items_per_character(
        i_char_id in kdr_characters.char_id%type default null
    ) return clob
    is
    begin
        return  q'{ select      item_name display_value,
                                item_id return_value,
                                item_type_name
                    from        kdr_item_types it,
                                kdr_items i,
                                table(apex_string.split(i.item_types_array, ':')) b
                    where       it.item_type_id = b.column_value
                    and         i.item_id not in (select item_id from kdr_char_items where nvl(}'
                                || nvl(to_char(i_char_id),'null') || q'{,char_id) = char_id)
                    order by    item_type_name, item_name}';
    end;

    function characters_per_event(
        i_event_id in kdr_events.event_id%type default null
    ) return clob
    is
    begin
        return  q'{ select      get_char_desc(char_id) || ' - ' || player_name,
                                char_id,
                                race_name
                    from        kdr_characters_view
                    where       char_id not in (select char_id from kdr_char_events where nvl(}'
                                || nvl(to_char(i_event_id),'null') || q'{,event_id) = event_id)
                    order by    1}';
    end;

    function components_per_recipe(
        i_recipe_id in kdr_recipes.recipe_id%type default null
    ) return clob
    is
    begin
        return  q'{ select      item_name display_value,
                                item_id return_value,
                                item_type_name
                    from        kdr_item_types it,
                                kdr_items i,
                                table(apex_string.split(i.item_types_array, ':')) b
                    where       it.item_type_id = b.column_value
                    and         it.component_type is not null
                    and         i.item_id not in (select item_id from kdr_recipe_components where nvl(}'
                                || nvl(to_char(i_recipe_id),'null') || q'{,recipe_id) = recipe_id and item_id is not null)
                    order by    item_type_name, item_name}';
    end;

    function item_types
    return clob
    is
    begin
        return  q'{ select      item_type_name || case when component_type is not null then ' (' || component_type || ')' end item_type_name, item_type_id
                    from        kdr_item_types
                    order by    item_type_name}';
    end;

    function recipes
    return clob
    is
    begin
        return  q'{ select      recipe_type_name || ' - ' || re.recipe_level || ' - ' || re.recipe_name recipe_desc,
                                re.recipe_id,
                                rt.recipe_type_name
                    from        kdr_recipes re,
                                kdr_recipe_types rt
                    where       re.recipe_type_id = rt.recipe_type_id
                    order by    3,1}';
    end;

    function recipe_types
    return clob
    is
    begin
        return  q'{ select      recipe_type_name,
                                recipe_type_id
                    from        kdr_recipe_types rt
                    order by    1}';
    end;

    function component_types
    return clob
    is
    begin
        return  q'{ select      item_type_name || ' (' || component_type || ')' component_type,
                                item_type_id
                    from        kdr_item_types
                    where       component_type is not null}';
    end;

    function skill_categories
    return clob
    is
    begin
        return  q'{ select      category_name, category_id
                    from        kdr_skill_categories
                    order by    category_name}';
    end;

    function event_done_last(
        i_grouping in varchar2 default null
    )
    return clob
    is
    begin
        return  q'{ with f as (
                        select    1 as VLGNR,
                                  EVENT_NAME as display_value,
                                  EVENT_ID as return_value,
                                  'Toekomst' as grouping,
                                  EVENT_START_DATE
                        from      KDR_EVENTS
                        where     COALESCE(EVENT_START_DATE,sysdate-1) >= sysdate
                        order by  EVENT_START_DATE, EVENT_NAME
                              )
                    ,    p as (
                        select    2 as VLGNR,
                                  EVENT_NAME || ' (verleden)' as display_value,
                                  EVENT_ID as return_value,
                                  'Verleden' as grouping,
                                  EVENT_START_DATE
                        from      KDR_EVENTS
                        where     COALESCE(EVENT_START_DATE,sysdate) <= sysdate
                        order by  EVENT_START_DATE, EVENT_NAME
                              ),
                    data as ( select * from f union all select * from p )
                    select display_value, return_value}'
                    || case when i_grouping = 'J' then ', grouping' end
                    || q'{ from data
                    order by vlgnr, EVENT_START_DATE, return_value}';
    end;

    function plots_per_event(
      i_event_id in kdr_plot.event_id%type default null
    )
    return clob
    is
        v_event varchar2(10);
    begin
        v_event := nvl(to_char(i_event_id),'null');
        return  q'{ select  p.plot_title as display_value, p.plot_id as return_value
                    from    kdr_plot p
                    where   (p.event_id = }' || v_event || ' or ' || v_event || ' is null);';
    end;

    function language_types
    return clob
    is
    begin
        return  q'{ select      'Spreuken/luisteren/schrijven/lezen','GENERAL'
                    from        dual
                    union all
                    select      'Magisch','MAGIC'
                    from        dual}';
    end;

    function seq_next_val(
        i_seqnm varchar2
    )
    return number
    is
    begin
        return  'select to_number(' || i_seqnm || '.nextval) from dual;';
    end;

    function props
    return clob
    is
    begin
        return  q'{ select      props_desc, props_id
                    from        kdr_plot_props
                    order by    props_desc;}';
    end;

    function skills_per_npc(
        i_npc_id in kdr_npcs.npc_id%type default null
    ) return clob
    is
    begin
        return  q'{ select      skill_level_name || ' (' || apex_string.get_initials(skill_name,4) || level_id || ')' skill_level_name,
                                skill_level_id,
                                category_name
                    from        kdr_skills_per_level
                    where       skill_level_id not in (select skill_level_id from kdr_npc_skills where nvl(}'
                                || nvl(to_char(i_npc_id),'null') || q'{,npc_id) = npc_id)
                    order by    category_name, skill_level_name, level_id}';
    end;

    function spells_per_npc(
        i_npc_id in kdr_npcs.npc_id%type default null
    ) return clob
    is
    begin
        return  q'{ select      st.spell_type_name || ' -' || sp.spell_level || ' - ' || sp.spell_name display_value,
                                sp.spell_id return_value,
                                st.spell_type_name
                    from        kdr_spells sp,
                                kdr_spell_types st
                    where       sp.spell_type_code = st.spell_type_code
                    and         sp.spell_id not in (select spell_id from kdr_npc_spells where nvl(}'
                                || nvl(to_char(i_npc_id),'null') || q'{,npc_id) = npc_id)
                    order by    st.spell_type_name, sp.spell_level, sp.spell_name}';
    end;

    function prayers_per_npc(
        i_npc_id in kdr_npcs.npc_id%type default null
    ) return clob
    is
    begin
        return  q'{ select      deity_name || ' - ' || sp.prayer_level || ' - ' || sp.prayer_name display_value,
                                sp.prayer_id return_value,
                                deity_name
                    from        kdr_prayers sp,
                                kdr_deities st
                    where       sp.deity_code = st.deity_code
                    and         sp.prayer_id not in (select prayer_id from kdr_npc_prayers where nvl(}'
                                || nvl(to_char(i_npc_id),'null') || q'{,npc_id) = npc_id)
                    order by    st.deity_code, sp.prayer_level, sp.prayer_name}';
    end;

    function players
    return clob
    is
    begin
        return  q'{ select      player_name, player_id
                    from        kdr_players
                    order by    1}';
    end;

    function characters
    return clob
    is
    begin
        return q'{  select      get_char_desc(char_id) char_desc,
                                char_id as char_id
                    from        kdr_characters_view
                    order by    1}';
    end;

    function skills_per_category
    return clob
    is
    begin
        return q'{  select      distinct skill_name,
                                skill_id,
                                category_name
                    from        kdr_skills_per_level
                    order by    1}';
    end;

    function plot_categories_concat
    return clob
    is
    begin
        return q'{  select      ltrim(sys_connect_by_path(category_desc, ', '), ', ')   display_value,
                                ltrim(sys_connect_by_path(category_name, ':'), ':')     return_value
                    from        kdr_plot_categories connect by
                                category_name > prior category_name
                    order by    1}';
    end;

    function plot_categories
    return clob
    is
    begin
        return q'{  select      category_desc display_value,
                                category_name return_value
                    from        kdr_plot_categories
                    order by    1}';
    end;

    function plot_sizes
    return clob
    is
    begin
        return q'{  select      size_desc as display_value,
                                size_name as return_value
                    from        kdr_plot_sizes
                    order by    size_seq}';
    end;

    function plot_timing
    return clob
    is
    begin
        return q'{  select      time_desc as display_value,
                                time_code as return_value
                    from        kdr_plot_timing
                    order by    time_seq}';
    end;

    function prayers_overall
    return clob
    is
    begin
        return  q'{ select      deity_name || ' - ' || sp.prayer_level || ' - ' || sp.prayer_name display_value,
                                sp.prayer_id return_value,
                                deity_name
                    from        kdr_prayers sp,
                                kdr_deities st
                    where       sp.deity_code = st.deity_code
                    order by    st.deity_code, sp.prayer_level, sp.prayer_name}';
    end;

    function spells_overall
    return clob
    is
    begin
        return  q'{ select      st.spell_type_name || ' - ' || sp.spell_level || ' - ' || sp.spell_name display_value,
                                sp.spell_id return_value,
                                st.spell_type_name
                    from        kdr_spells sp,
                                kdr_spell_types st
                    where       sp.spell_type_code = st.spell_type_code
                    order by    st.spell_type_name, sp.spell_level, sp.spell_name}';
    end;

    function yes_no
    return clob
    is
    begin
        return  q'{ select      'Ja'    display_value,
                                'J'     return_value
                    from        dual
                    union all
                    select      'Nee'   display_value,
                                'N'     return_value
                    from        dual}';
    end;

    function signup_type
    return clob
    is
    begin
        return  q'{ select      'Speler'     display_value,
                                'Speler'     return_value
                    from        dual
                    union all
                    select      'Figurant',
                                'Figurant'
                    from        dual
                    union all
                    select      'Spelleiding',
                                'Spelleiding'
                    from        dual
                    union all
                    select      'Crew/helpende handjes',
                                'Support'
                    from        dual                    }';
    end;

    function menu_types
    return clob
    is
    begin
        return  q'{ select      'Beheer'     display_value,
                                'MAIN'     return_value
                    from        dual
                    union all
                    select      'Publiekelijk',
                                'PUBLIC'
                    from        dual
                    union all
                    select      'Plottool',
                                'PLOT'
                    from        dual
                    union all
                    select      'Spelersportaal',
                                'CHAR'
                    from        dual                    }';
    end;

    function gender_icons
    return clob
    is
    begin
        return  q'{ select '<span class="fas fa-mars fa-2x"></span>   '            || 'Man' display_value, 'mars' from dual union all
                    select '<span class="fas fa-venus fa-2x"></span>   '           || 'Vrouw' display_value, 'venus' from dual union all
                    -- select '<span class="fas fa-neuter fa-2x"></span>   '          || 'Niet meer' display_value, 'neuter' from dual union all
                    select '<span class="fas fa-transgender fa-2x"></span>   '     || 'Transgender' display_value, 'transgender' from dual union all
                    -- select '<span class="fas fa-genderless fa-2x"></span>   '      || 'Onzijdig' display_value, 'genderless' from dual union all
                    select '<span class="fas fa-question fa-2x"></span>   '        || 'Zeg ik liever niet/onbekend/staat niet in de lijst' display_value, 'question' from dual}';
    end;

    function yes_no_icons
    return clob
    is
    begin
        return  q'{ select '<i color="green" class="fas fa-check-circle"></i>' display_value, 'J' from dual union all
                    select '<i color="green" class="fas fa-check-circle"></i>' display_value, 'Y' from dual union all
                    select '<i color="red" class="fas fa-times-circle"></i>' display_value, 'N' from dual}';
    end;

    function gender
    return clob
    is
    begin
        return  q'{ select 'Man' display_value, 'M' from dual union all
                    select 'Vrouw' display_value, 'V' from dual union all
                    select 'Transgender' display_value, 'T' from dual union all
                    select 'Zeg ik liever niet/onbekend/staat niet in de lijst' display_value, 'O' from dual}';
    end;

    function countries
    return clob
    is
    begin
        return  q'{ select  country_name display_value,
                            country_id return_value
                    from    kdr_countries}';
    end;

    function buildup_friday
    return clob
    is
    begin
        return  q'{ select      'Ja, vanaf 10:00'     display_value,
                                'Vroeg'     return_value
                    from        dual
                    union all
                    select      'Ja, vanaf 13:00',
                                'Lunch'
                    from        dual
                    union all
                    select      'Ja, vanaf 16:00',
                                'Laat'
                    from        dual
                    union all
                    select      'Nee',
                                'Nee'
                    from        dual                    }';
    end;


end pck_kdr_lov;