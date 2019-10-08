
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_CHAR_TAGS_VIEW (CHAR_TAG_ID, CHAR
_ID, TAG_ID, CHAR_NAME, CHAR_DESC, TAG_NAME) AS 
  select      ct.CHAR_TAG_ID,ct.CHAR_ID,ct.TAG_ID, ch.char_name, get_char_desc(c
h.char_id) char_desc, tg.tag_name
from        kdr_char_tags   ct,
            kdr_characters  ch,
            kdr_tags        tg
where       ct.char_id = ch.char_id
and         ct.tag_id  = tg.tag_id
order by    1;

