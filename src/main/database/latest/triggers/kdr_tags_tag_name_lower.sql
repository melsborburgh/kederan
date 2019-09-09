CREATE OR REPLACE TRIGGER KDR_TAGS_TAG_NAME_LOWER
BEFORE INSERT OR UPDATE OF TAG_NAME ON KDR_TAGS
for each row
BEGIN
  :new.TAG_NAME := lower(:new.tag_name);
END;