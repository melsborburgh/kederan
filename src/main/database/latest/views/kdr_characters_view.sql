
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_CHARACTERS_VIEW (CHAR_ID, CHAR_NA
ME, RACE_ID, RACE_NAME, RACE_ID_SUB, SUB_RACE_NAME, PLAYER_ID, PLAYER_NAME, CHAR
_NOTES, CHAR_BACKGROUND, CHAR_BG_MIMETYPE, CHAR_BG_LAST_UPDATE, CHAR_BG_FILENAME
, CHAR_AGE, CHAR_CULTURE, CHAR_AP_GENERAL, CHAR_CLASS, CHAR_OCCUPATION, CHAR_AP_
HEAD, CHAR_AP_TORSO, CHAR_AP_LEGS, CHAR_AP_ARMS, CHAR_DOM_HAND, CHAR_DOM_HAND_D,
 CHAR_DEITY, DEITY_NAME, CHAR_SOUL_LEFT, CHAR_SOUL_LEFT_ICON, CHAR_XP_ADJUST, TO
TAL_HP, TOTAL_ELEM_MANA, TOTAL_DIVINITY, TOTAL_ARC_MANA, TOTAL_CHAOS_MANA, TOTAL
_XP, TOTAL_RACE_XP, TOTAL_XP_SPEND, TOTAL_XP_LEFT, SKILL_AMOUNT, SPELL_AMOUNT, P
RAYER_AMOUNT, CHAR_ICON, TOTAL_EVENT_XP, TOTAL_QUEST_XP, XP_SPEND_SKILLS, XP_SPE
ND_SPELLS, XP_SPEND_PRAYERS, TOTAL_MANA_DIVINITY_GAIN) AS 
  with skills as(
    select      char_id,
                count(char_skill_id)skill_amount
    from        kdr_char_skills
    group by    char_id
), spells as(
    select      char_id,
                count(char_spell_id)spell_amount
    from        kdr_char_spells
    group by    char_id
), prayers as(
    select      char_id,
                count(char_prayer_id)prayer_amount
    from        kdr_char_prayers
    group by    char_id
)
select  ch.char_id,
        ch.char_name,
        ch.race_id,
        ra.race_name,
        ch.race_id_sub,
        ra2.race_name sub_race_name,
        ch.player_id,
        pl.player_name,
        ch.char_notes,
        ch.char_background,
        ch.char_bg_mimetype,
        ch.char_bg_last_update,
        ch.char_bg_filename,
        ch.char_age,
        ch.char_culture,
        ch.char_ap_general,
        ch.char_class,
        ch.char_occupation,
        ch.char_ap_head,
        ch.char_ap_torso,
        ch.char_ap_legs,
        ch.char_ap_arms,
        ch.char_dom_hand,
        case ch.char_dom_hand
               when 'LEFT'
               then 'Left'
               when 'RIGHT'
               then 'Right'
               when 'AMBI'
               then 'Both'
        end as char_dom_hand_d,
        ch.char_deity,
        dt.deity_name,
        ch.char_soul_left,
        case
               when char_soul_left = 0
               then '<i class=fas fa-2x fa-battery-empty></i>'
               when char_soul_left between 1 and 33
               then '<i class=fas fa-2x fa-battery-quarter></i>'
               when char_soul_left between 34 and 66
               then '<i class=fas fa-2x fa-battery-half></i>'
               when char_soul_left between 67 and 99
               then '<i class=fas fa-2x fa-battery-three-quarters></i>'
               when char_soul_left = 100
               then '<i class=fas fa-2x fa-battery-full></i>'
        end as char_soul_left_icon,
        ch.char_xp_adjust,
        get_total_hp(ch.char_id)                                    total_hp,
        get_total_elem_mana(ch.char_id)                             total_elem_m
ana,
        get_total_divinity(ch.char_id)                              total_divini
ty,
        get_total_arc_mana(ch.char_id)                              total_arc_ma
na,
        get_total_chaos_mana(ch.char_id)                            total_chaos_
mana,
        get_total_xp(ch.char_id)                                    total_xp,
        get_total_race_xp(ch.char_id)                               total_race_x
p,
        get_total_xp_spend(ch.char_id)                              total_xp_spe
nd,
        get_total_xp(ch.char_id)- get_total_xp_spend(ch.char_id)    total_xp_lef
t,
        coalesce(sk.skill_amount, 0)                                skill_amount
,
        coalesce(sp.spell_amount, 0)                                spell_amount
,
        coalesce(pr.prayer_amount, 0)                               prayer_amoun
t,
        '#APP_IMAGES#Kederan_facebookprofielfoto.jpg'               char_icon,
        get_total_event_xp(ch.char_id)                              as TOTAL_EVE
NT_XP,
        get_total_quest_xp(ch.char_id)                              as TOTAL_QUE
ST_XP,
        get_total_xp_spend_skills(ch.char_id)                       as xp_spend_
skills,
        get_total_xp_spend_spells(ch.char_id)                       as xp_spend_
spells,
        get_total_xp_spend_prayers(ch.char_id)                      as xp_spend_
prayers,
        get_total_mana_divinity_gain(ch.char_id)                    as total_man
a_divinity_gain
from    kdr_characters     ch,
        kdr_races          ra,
        kdr_races          ra2,
        prayers            pr,
        skills             sk,
        spells             sp,
        kdr_deities        dt,
        kdr_players        pl
where   ra.race_id      = ch.race_id
and     ch.race_id_sub  = ra2.race_id(+)
and     ch.char_id      = sk.char_id(+)
and     ch.char_id      = sp.char_id(+)
and     ch.char_id      = pr.char_id(+)
and     ch.char_deity   = dt.deity_code(+)
and     ch.player_id    = pl.player_id(+);

