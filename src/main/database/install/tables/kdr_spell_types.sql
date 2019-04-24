create table kdr_spell_types
(
    spell_type_code varchar2(30),
    spell_type_name varchar2(300),
    spell_type_desc varchar2(4000),
    CONSTRAINT kdr_spell_type_pk PRIMARY KEY (spell_type_id)
);

INSERT INTO KDR_SPELL_TYPES (SPELL_TYPE_CODE, SPELL_TYPE_NAME,SPELL_TYPE_ICON) VALUES ('EARTH', 'Aarde','fas fa-globe-europe' || ' fa-3x fa-lg');
INSERT INTO KDR_SPELL_TYPES (SPELL_TYPE_CODE, SPELL_TYPE_NAME,SPELL_TYPE_ICON) VALUES ('AIR', 'Lucht','fas fa-wind' || ' fa-3x fa-lg');
INSERT INTO KDR_SPELL_TYPES (SPELL_TYPE_CODE, SPELL_TYPE_NAME,SPELL_TYPE_ICON) VALUES ('BLACK', 'Zwart','fas fa-skull' || ' fa-3x fa-lg');
INSERT INTO KDR_SPELL_TYPES (SPELL_TYPE_CODE, SPELL_TYPE_NAME,SPELL_TYPE_ICON) VALUES ('WHITE', 'Wit','fas fa-hat-wizard' || ' fa-3x fa-lg');
INSERT INTO KDR_SPELL_TYPES (SPELL_TYPE_CODE, SPELL_TYPE_NAME,SPELL_TYPE_ICON) VALUES ('NATURE', 'Natuur','fas fa-leaf' || ' fa-3x fa-lg');
INSERT INTO KDR_SPELL_TYPES (SPELL_TYPE_CODE, SPELL_TYPE_NAME,SPELL_TYPE_ICON) VALUES ('MIND', 'Geest','fas fa-brain' || ' fa-3x fa-lg');
INSERT INTO KDR_SPELL_TYPES (SPELL_TYPE_CODE, SPELL_TYPE_NAME,SPELL_TYPE_ICON) VALUES ('FIRE', 'Vuur','fab fa-fire' || ' fa-3x fa-lg');
INSERT INTO KDR_SPELL_TYPES (SPELL_TYPE_CODE, SPELL_TYPE_NAME,SPELL_TYPE_ICON) VALUES ('WATER', 'Water','fas fa-tint' || ' fa-3x fa-lg');
INSERT INTO KDR_SPELL_TYPES (SPELL_TYPE_CODE, SPELL_TYPE_NAME,SPELL_TYPE_ICON) VALUES ('GENERAL', 'Algemeen','fas fa-magic' || ' fa-3x fa-lg');