create or replace view kdr_character_languages_view as
select      cl.char_lang_id,
            ch.*,
            la.*
from        KDR_CHAR_LANGUAGES  cl,
            KDR_CHARACTERS_VIEW ch,
            KDR_LANGUAGES       la
where       cl.language_id  = la.language_id
and         cl.char_id      = ch.char_id