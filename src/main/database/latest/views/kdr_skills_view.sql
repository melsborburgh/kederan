create or replace force view kdr_skills_view as
select  *
from    kdr_skills             sk,
        kdr_skill_categories   sc
where   sc.category_id = sk.skill_category;