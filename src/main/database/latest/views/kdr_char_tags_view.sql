create or replace force view kdr_char_tags_view as
select      ct.*, ch.char_name, get_char_desc(ch.char_id) char_desc, tg.tag_name
from        kdr_char_tags   ct,
            kdr_characters  ch,
            kdr_tags        tg
where       ct.char_id = ch.char_id
and         ct.tag_id  = tg.tag_id
order by    1;