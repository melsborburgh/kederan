create or replace force view kdr_npc_check_view as
with checks as
(
        select      distinct npc_id, 'Bij NPC <strong>[' || npc_id || '] ' || npc_name || '</strong> ontbreekt een <u>ras</u> of bevat aantekeningen hierover.' text
        from        kdr_npcs
        where       (npc_race is null and lower(npc_name) not in (select lower(race_name) from kdr_races)) or instr(npc_race,'%TODO') > 0
        union all
        select      distinct npc_id, 'Bij NPC <strong>[' || npc_id || '] ' || npc_race || '</strong> ontbreekt een <u>naam</u> of bevat aantekeningen hierover.'
        from        kdr_npcs
        where       npc_name is null or instr(npc_name,'%TODO') > 0
        union all
        select      distinct npc_id, 'Bij NPC <strong>[' || npc_id || '] ' || npc_name || '</strong> ontbreekt een <u>persoonlijkheidsomschrijving</u> of bevat aantekeningen hierover.'
        from        kdr_npcs
        where       npc_personality is null or instr(npc_personality,'%TODO') > 0
        union all
        select      distinct npc_id, 'Bij NPC <strong>[' || npc_id || '] ' || npc_name || '</strong> ontbreekt uitleg over <u>benodigde voorwerpen</u> of bevat aantekeningen hierover.'
        from        kdr_npcs
        where       npc_items is null or instr(npc_items,'%TODO') > 0
        union all
        select      distinct npc_id, 'Bij NPC <strong>[' || npc_id || '] ' || npc_name || '</strong> ontbreekt uitleg over <u>aankleding</u> of bevat aantekeningen hierover.'
        from        kdr_npcs
        where       npc_dresscode is null or instr(npc_dresscode,'%TODO') > 0
        union all
        select      distinct npc_id, 'Bij NPC <strong>[' || npc_id || '] ' || npc_name || '</strong> ontbreekt een <u>korte omschrijving</u> of bevat aantekeningen hierover.'
        from        kdr_npcs
        where       npc_short_desc is null or instr(npc_short_desc,'%TODO') > 0
        union all
        select      distinct npc_id, 'Bij NPC <strong>[' || npc_id || '] ' || npc_name || '</strong> ontbreekt een <u>beschrijving</u>, deze is zeer beperkt of bevat aantekeningen.'
        from        kdr_npcs
        where       npc_desc is null or length(npc_desc) < 100 or instr(npc_desc,'%TODO') > 0
        union all
        select      distinct npc_id, 'Bij NPC <strong>[' || npc_id || '] ' || npc_name || '</strong> zijn niet (alle) basisgegevens klaar.'
        from        kdr_npcs
        where       nvl(npc_base_ready,'N') = 'N'
        union all
        select      distinct npc_id, 'Bij NPC <strong>[' || npc_id || '] ' || npc_name || '</strong> zijn niet (alle) regeltechnisch zaken klaar.'
        from        kdr_npcs
        where       nvl(npc_skills_ready,'N') = 'N'
),
data as
(
    select      npc_id,
                listagg(text, ', <br>') within group (order by npc_id) text_line
    from        checks
    group by    npc_id
)
select      distinct d.npc_id, pl.event_id, d.text_line
from        kdr_plot_npcs   pn,
            data            d,
            kdr_plot        pl
where       pn.plot_id  = pl.plot_id
and         d.npc_id    = pn.npc_id
;