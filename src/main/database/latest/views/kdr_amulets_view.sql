create or replace force view kdr_amulets_view as
select      am.*,
            (am.amulet_light_charges / 12) * 100 amulet_light_charges_pct,
            (am.amulet_dark_charges / 12) * 100 amulet_dark_charges_pct,
            am.amulet_light_charges + am.amulet_dark_charges amulet_total_charges,
            ((am.amulet_light_charges + am.amulet_dark_charges)/12) * 100 amulet_total_charges_pct
from        kdr_amulets am;