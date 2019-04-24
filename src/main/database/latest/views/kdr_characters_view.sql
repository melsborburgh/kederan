create or replace force view kdr_characters_view as
    with skills as(
        select char_id,
               count(char_skill_id)skill_amount
        from kdr_char_skills
        group by char_id
    ), spells as(
        select char_id,
               count(char_spell_id)spell_amount
        from kdr_char_spells
        group by char_id
    ), prayers as(
        select char_id,
               count(char_prayer_id)prayer_amount
        from kdr_char_prayers
        group by char_id
    )
    select ch.char_id,
           ch.char_name,
           ch.race_id,
           ra.race_name,
           ch.race_id_sub,
           ra2.race_name sub_race_name,
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
           ch.char_deity,
           ch.char_soul_left,
           case
                when char_soul_left = 0
                then '<i class="fas fa-2x fa-battery-empty"></i>'
                when char_soul_left between 1 and 33
                then '<i class="fas fa-2x fa-battery-quarter"></i>'
                when char_soul_left between 34 and 66
                then '<i class="fas fa-2x fa-battery-half"></i>'
                when char_soul_left between 67 and 99
                then '<i class="fas fa-2x fa-battery-three-quarters"></i>'
                when char_soul_left = 100
                then '<i class="fas fa-2x fa-battery-full"></i>'
           end as char_soul_left_icon,
           ch.char_xp_adjust,
           get_total_hp(ch.char_id)total_hp,
           get_total_elem_mana(ch.char_id)total_elem_mana,
           get_total_divinity(ch.char_id)total_divinity,
           get_total_arc_mana(ch.char_id)total_arc_mana,
           get_total_chaos_mana(ch.char_id)total_chaos_mana,
           get_total_xp(ch.char_id)total_xp,
           get_total_xp_spend(ch.char_id)total_xp_spend,
           get_total_xp(ch.char_id)- get_total_xp_spend(ch.char_id)total_xp_left,
           coalesce(sk.skill_amount, 0)skill_amount,
           coalesce(sp.spell_amount, 0)spell_amount,
           coalesce(pr.prayer_amount, 0)prayer_amount,
           '#APP_IMAGES#Kederan_facebookprofielfoto.jpg' char_icon
    from kdr_characters   ch,
         kdr_races        ra,
         kdr_races        ra2,
         prayers          pr,
         skills           sk,
         spells           sp
    where ra.race_id = ch.race_id
          and ch.race_id_sub = ra2.race_id(+)
          and ch.char_id = sk.char_id(+)
          and ch.char_id = sp.char_id(+)
          and ch.char_id = pr.char_id(+);