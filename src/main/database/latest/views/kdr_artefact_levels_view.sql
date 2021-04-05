create or replace view kdr_artefact_levels_view as
select      af.artefact_id,
            af.artefact_name,
            af.artefact_desc,
            af.artefact_xp,
            al.artefact_level,
            al.artefact_ability,
            al.artefact_ability_desc
from        kdr_artefacts       af,
            kdr_artefact_levels al
where       af.artefact_id = al.artefact_id (+)
/