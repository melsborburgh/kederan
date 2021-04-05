alter table "KDR_SIGNUPS" add constraint
"KDR_SIGNUPS_FK4" foreign key ("COUNTRY_ID") references "KDR_COUNTRIES" ("COUNTRY_ID") on delete set null
/
