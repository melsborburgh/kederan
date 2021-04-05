set define '^'
set verify off
set serveroutput on size 1000000
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK

prompt  Set Credentials...

begin

  -- Assumes you are running the script connected to sqlplus as the schema associated with the UI defaults or as the product schema.
  wwv_flow_api.set_security_group_id(p_security_group_id=>2517572208264032);

end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en'; end;
/
prompt  Check Compatibility...

begin

-- This date identifies the minimum version required to install this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2020.10.01');

end;
/

-- SET SCHEMA

begin

   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'SH1BLUE21';
   wwv_flow_hint.check_schema_privs;

end;
/


--------------------------------------------------------------------
prompt  SCHEMA SH1BLUE21 - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_200200
-- Exported 10:28 Thursday February 11, 2021 by: MELS
--

begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_ACCESS_LOGGING');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51006733539894719 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_ACCESS_LOGGING',
  p_report_region_title => 'Kdr Access Logging',
  p_form_region_title => 'Kdr Access Logging');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51006819291894719 + wwv_flow_api.g_id_offset,
  p_table_id => 51006733539894719 + wwv_flow_api.g_id_offset,
  p_column_name => 'ACCESS_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51006907695894719 + wwv_flow_api.g_id_offset,
  p_table_id => 51006733539894719 + wwv_flow_api.g_id_offset,
  p_column_name => 'ACCESS_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Access Timestamp',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51007142840894720 + wwv_flow_api.g_id_offset,
  p_table_id => 51006733539894719 + wwv_flow_api.g_id_offset,
  p_column_name => 'ACCESS_TIMESTAMP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Access Token',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51007063525894720 + wwv_flow_api.g_id_offset,
  p_table_id => 51006733539894719 + wwv_flow_api.g_id_offset,
  p_column_name => 'ACCESS_TOKEN');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_AMULETS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50970762041894566 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_AMULETS',
  p_report_region_title => 'Kdr Amulets',
  p_form_region_title => 'Kdr Amulets');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dark Charges',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50971272651894570 + wwv_flow_api.g_id_offset,
  p_table_id => 50970762041894566 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_DARK_CHARGES');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dark effect',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50971433168894570 + wwv_flow_api.g_id_offset,
  p_table_id => 50970762041894566 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_DARK_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50971024817894569 + wwv_flow_api.g_id_offset,
  p_table_id => 50970762041894566 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Amulet Focus',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50971660862894571 + wwv_flow_api.g_id_offset,
  p_table_id => 50970762041894566 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_FOCUS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50970862058894568 + wwv_flow_api.g_id_offset,
  p_table_id => 50970762041894566 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Amulet Light Charges',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50971165905894569 + wwv_flow_api.g_id_offset,
  p_table_id => 50970762041894566 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_LIGHT_CHARGES');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Light effect',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50971306835894570 + wwv_flow_api.g_id_offset,
  p_table_id => 50970762041894566 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_LIGHT_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50970974672894569 + wwv_flow_api.g_id_offset,
  p_table_id => 50970762041894566 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Amulethoeder',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50971525620894570 + wwv_flow_api.g_id_offset,
  p_table_id => 50970762041894566 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_OWNER');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_AMULETS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_AMULETS_VIEW',
  p_report_region_title => 'Kdr Amulets View',
  p_form_region_title => 'Kdr Amulets View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dark Charges',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51011758443902296 + wwv_flow_api.g_id_offset,
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_DARK_CHARGES');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Percentage Dark Charges',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51012342316902297 + wwv_flow_api.g_id_offset,
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_DARK_CHARGES_PCT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dark effect',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51011920498902296 + wwv_flow_api.g_id_offset,
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_DARK_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51011522573902295 + wwv_flow_api.g_id_offset,
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Amulet Empty Charges',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51012490299902298 + wwv_flow_api.g_id_offset,
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_EMPTY_CHARGES');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Amulet Focus',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51012146108902297 + wwv_flow_api.g_id_offset,
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_FOCUS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51011395754902295 + wwv_flow_api.g_id_offset,
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Amulet Light Charges',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51011687235902295 + wwv_flow_api.g_id_offset,
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_LIGHT_CHARGES');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Amulet Light Charges Pct',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51012244873902297 + wwv_flow_api.g_id_offset,
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_LIGHT_CHARGES_PCT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Amulet Light Effect',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51011867736902296 + wwv_flow_api.g_id_offset,
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_LIGHT_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51011437122902295 + wwv_flow_api.g_id_offset,
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Amulethoeder',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51012084943902297 + wwv_flow_api.g_id_offset,
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_OWNER');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Aantal charges',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51012507614902298 + wwv_flow_api.g_id_offset,
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_TOTAL_CHARGES');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Percentage aantal charges',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51012613683902298 + wwv_flow_api.g_id_offset,
  p_table_id => 51011218318902294 + wwv_flow_api.g_id_offset,
  p_column_name => 'AMULET_TOTAL_CHARGES_PCT');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_ARTEFACTS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50971702431894572 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_ARTEFACTS',
  p_report_region_title => 'Kdr Artefacts',
  p_form_region_title => 'Kdr Artefacts');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50972088735894573 + wwv_flow_api.g_id_offset,
  p_table_id => 50971702431894572 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Artefact Guardian',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50972295840894573 + wwv_flow_api.g_id_offset,
  p_table_id => 50971702431894572 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_GUARDIAN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50971834333894572 + wwv_flow_api.g_id_offset,
  p_table_id => 50971702431894572 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50971906676894573 + wwv_flow_api.g_id_offset,
  p_table_id => 50971702431894572 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'XP van artefact',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50972119349894573 + wwv_flow_api.g_id_offset,
  p_table_id => 50971702431894572 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_XP');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_ARTEFACT_LEVELS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51004122733894710 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_ARTEFACT_LEVELS',
  p_report_region_title => 'Kdr Artefact Levels',
  p_form_region_title => 'Kdr Artefact Levels');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51004565504894711 + wwv_flow_api.g_id_offset,
  p_table_id => 51004122733894710 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_ABILITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51004696752894711 + wwv_flow_api.g_id_offset,
  p_table_id => 51004122733894710 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_ABILITY_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51004340926894710 + wwv_flow_api.g_id_offset,
  p_table_id => 51004122733894710 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51004419965894710 + wwv_flow_api.g_id_offset,
  p_table_id => 51004122733894710 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51004200606894710 + wwv_flow_api.g_id_offset,
  p_table_id => 51004122733894710 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_LEVEL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau Xp',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51004724630894711 + wwv_flow_api.g_id_offset,
  p_table_id => 51004122733894710 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_LEVEL_XP');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_ARTEFACT_LEVELS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51012797229902299 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_ARTEFACT_LEVELS_VIEW',
  p_report_region_title => 'Kdr Artefact Levels View',
  p_form_region_title => 'Kdr Artefact Levels View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51013379250902301 + wwv_flow_api.g_id_offset,
  p_table_id => 51012797229902299 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_ABILITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51013460710902301 + wwv_flow_api.g_id_offset,
  p_table_id => 51012797229902299 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_ABILITY_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51013076733902300 + wwv_flow_api.g_id_offset,
  p_table_id => 51012797229902299 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51012829247902299 + wwv_flow_api.g_id_offset,
  p_table_id => 51012797229902299 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51013240488902301 + wwv_flow_api.g_id_offset,
  p_table_id => 51012797229902299 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51012910167902300 + wwv_flow_api.g_id_offset,
  p_table_id => 51012797229902299 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'XP van artefact',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51013116911902300 + wwv_flow_api.g_id_offset,
  p_table_id => 51012797229902299 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT_XP');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_AUDIT');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51007966230894723 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_AUDIT',
  p_report_region_title => 'Kdr Audit',
  p_form_region_title => 'Kdr Audit');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Audit Column',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51008395102894724 + wwv_flow_api.g_id_offset,
  p_table_id => 51007966230894723 + wwv_flow_api.g_id_offset,
  p_column_name => 'AUDIT_COLUMN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Audit Date',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51008513268894725 + wwv_flow_api.g_id_offset,
  p_table_id => 51007966230894723 + wwv_flow_api.g_id_offset,
  p_column_name => 'AUDIT_DATE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51008063752894723 + wwv_flow_api.g_id_offset,
  p_table_id => 51007966230894723 + wwv_flow_api.g_id_offset,
  p_column_name => 'AUDIT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Audit Key',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51008264491894724 + wwv_flow_api.g_id_offset,
  p_table_id => 51007966230894723 + wwv_flow_api.g_id_offset,
  p_column_name => 'AUDIT_KEY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Audit New Value',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51008720227894725 + wwv_flow_api.g_id_offset,
  p_table_id => 51007966230894723 + wwv_flow_api.g_id_offset,
  p_column_name => 'AUDIT_NEW_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Audit Old Value',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51008641828894725 + wwv_flow_api.g_id_offset,
  p_table_id => 51007966230894723 + wwv_flow_api.g_id_offset,
  p_column_name => 'AUDIT_OLD_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Audit Table',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51008192946894724 + wwv_flow_api.g_id_offset,
  p_table_id => 51007966230894723 + wwv_flow_api.g_id_offset,
  p_column_name => 'AUDIT_TABLE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Audit Type',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51008882224894726 + wwv_flow_api.g_id_offset,
  p_table_id => 51007966230894723 + wwv_flow_api.g_id_offset,
  p_column_name => 'AUDIT_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Audit User',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51008418992894724 + wwv_flow_api.g_id_offset,
  p_table_id => 51007966230894723 + wwv_flow_api.g_id_offset,
  p_column_name => 'AUDIT_USER');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_AUDIT_DISPLAY_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51013525105902302 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_AUDIT_DISPLAY_VIEW',
  p_report_region_title => 'Kdr Audit Display View',
  p_form_region_title => 'Kdr Audit Display View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Audit Key',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51014708393902305 + wwv_flow_api.g_id_offset,
  p_table_id => 51013525105902302 + wwv_flow_api.g_id_offset,
  p_column_name => 'AUDIT_KEY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Audit Table',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51014623206902305 + wwv_flow_api.g_id_offset,
  p_table_id => 51013525105902302 + wwv_flow_api.g_id_offset,
  p_column_name => 'AUDIT_TABLE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Event Date',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51013962869902303 + wwv_flow_api.g_id_offset,
  p_table_id => 51013525105902302 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_DATE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51014239613902304 + wwv_flow_api.g_id_offset,
  p_table_id => 51013525105902302 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Event Icon',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 24,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51014377929902304 + wwv_flow_api.g_id_offset,
  p_table_id => 51013525105902302 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_ICON');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Event Link',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51014553156902305 + wwv_flow_api.g_id_offset,
  p_table_id => 51013525105902302 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_LINK');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Event Status',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51014435850902304 + wwv_flow_api.g_id_offset,
  p_table_id => 51013525105902302 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_STATUS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Event Title',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51014194203902304 + wwv_flow_api.g_id_offset,
  p_table_id => 51013525105902302 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_TITLE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Type evenement',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51014048028902303 + wwv_flow_api.g_id_offset,
  p_table_id => 51013525105902302 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'User Avatar',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 61,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51013661958902302 + wwv_flow_api.g_id_offset,
  p_table_id => 51013525105902302 + wwv_flow_api.g_id_offset,
  p_column_name => 'USER_AVATAR');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'User Color',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 48,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51013701347902302 + wwv_flow_api.g_id_offset,
  p_table_id => 51013525105902302 + wwv_flow_api.g_id_offset,
  p_column_name => 'USER_COLOR');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 518,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51013827981902303 + wwv_flow_api.g_id_offset,
  p_table_id => 51013525105902302 + wwv_flow_api.g_id_offset,
  p_column_name => 'USER_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CALANDER_ITEMS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51014857957902306 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CALANDER_ITEMS',
  p_report_region_title => 'Kdr Calander Items',
  p_form_region_title => 'Kdr Calander Items');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51015957429902309 + wwv_flow_api.g_id_offset,
  p_table_id => 51014857957902306 + wwv_flow_api.g_id_offset,
  p_column_name => 'CAL_EVENT_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dag',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51015650357902308 + wwv_flow_api.g_id_offset,
  p_table_id => 51014857957902306 + wwv_flow_api.g_id_offset,
  p_column_name => 'DAY_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51015790976902308 + wwv_flow_api.g_id_offset,
  p_table_id => 51014857957902306 + wwv_flow_api.g_id_offset,
  p_column_name => 'DAY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51015831872902309 + wwv_flow_api.g_id_offset,
  p_table_id => 51014857957902306 + wwv_flow_api.g_id_offset,
  p_column_name => 'DAY_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51015116614902307 + wwv_flow_api.g_id_offset,
  p_table_id => 51014857957902306 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51015236201902307 + wwv_flow_api.g_id_offset,
  p_table_id => 51014857957902306 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51015325608902307 + wwv_flow_api.g_id_offset,
  p_table_id => 51014857957902306 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51015472832902308 + wwv_flow_api.g_id_offset,
  p_table_id => 51014857957902306 + wwv_flow_api.g_id_offset,
  p_column_name => 'WEEK_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51015586028902308 + wwv_flow_api.g_id_offset,
  p_table_id => 51014857957902306 + wwv_flow_api.g_id_offset,
  p_column_name => 'WEEK_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51014917288902306 + wwv_flow_api.g_id_offset,
  p_table_id => 51014857957902306 + wwv_flow_api.g_id_offset,
  p_column_name => 'YEAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Year Number',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51015004255902307 + wwv_flow_api.g_id_offset,
  p_table_id => 51014857957902306 + wwv_flow_api.g_id_offset,
  p_column_name => 'YEAR_NUMBER');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CALENDER');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51007270021894720 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CALENDER',
  p_report_region_title => 'Kdr Calender',
  p_form_region_title => 'Kdr Calender');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51007709801894722 + wwv_flow_api.g_id_offset,
  p_table_id => 51007270021894720 + wwv_flow_api.g_id_offset,
  p_column_name => 'CALENDER_EVENT_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51007364004894721 + wwv_flow_api.g_id_offset,
  p_table_id => 51007270021894720 + wwv_flow_api.g_id_offset,
  p_column_name => 'CALENDER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dag',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51007683510894722 + wwv_flow_api.g_id_offset,
  p_table_id => 51007270021894720 + wwv_flow_api.g_id_offset,
  p_column_name => 'DAY_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51007553785894721 + wwv_flow_api.g_id_offset,
  p_table_id => 51007270021894720 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51007814843894722 + wwv_flow_api.g_id_offset,
  p_table_id => 51007270021894720 + wwv_flow_api.g_id_offset,
  p_column_name => 'WEEK_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51007450460894721 + wwv_flow_api.g_id_offset,
  p_table_id => 51007270021894720 + wwv_flow_api.g_id_offset,
  p_column_name => 'YEAR_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CALENDER_DAYS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CALENDER_DAYS_VIEW',
  p_report_region_title => 'Kdr Calender Days View',
  p_form_region_title => 'Kdr Calender Days View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dag',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51017472769902313 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'DAY_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51017558511902313 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'DAY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51017664312902314 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'DAY_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Month Amt Weeks',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51016892836902312 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_AMT_WEEKS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Month Bg Color',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51017127010902312 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_BG_COLOR');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Month Days Corr',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51017052593902312 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_DAYS_CORR');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51016509859902311 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51016667995902311 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51016725359902311 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Month Week Days',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51016991084902312 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_WEEK_DAYS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51017227387902313 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'WEEK_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51017323353902313 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'WEEK_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Year Amt Months',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51016466489902311 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'YEAR_AMT_MONTHS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51016190778902310 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'YEAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51016277322902310 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'YEAR_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Year Number',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51016391058902310 + wwv_flow_api.g_id_offset,
  p_table_id => 51016009360902309 + wwv_flow_api.g_id_offset,
  p_column_name => 'YEAR_NUMBER');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CALENDER_ITEMS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51017790389902314 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CALENDER_ITEMS',
  p_report_region_title => 'Kdr Calender Items',
  p_form_region_title => 'Kdr Calender Items');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51018877328902318 + wwv_flow_api.g_id_offset,
  p_table_id => 51017790389902314 + wwv_flow_api.g_id_offset,
  p_column_name => 'CAL_EVENT_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dag',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51018538524902317 + wwv_flow_api.g_id_offset,
  p_table_id => 51017790389902314 + wwv_flow_api.g_id_offset,
  p_column_name => 'DAY_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51018604514902317 + wwv_flow_api.g_id_offset,
  p_table_id => 51017790389902314 + wwv_flow_api.g_id_offset,
  p_column_name => 'DAY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51018743602902317 + wwv_flow_api.g_id_offset,
  p_table_id => 51017790389902314 + wwv_flow_api.g_id_offset,
  p_column_name => 'DAY_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51018096917902316 + wwv_flow_api.g_id_offset,
  p_table_id => 51017790389902314 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51018177405902316 + wwv_flow_api.g_id_offset,
  p_table_id => 51017790389902314 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51018290000902316 + wwv_flow_api.g_id_offset,
  p_table_id => 51017790389902314 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51018385785902316 + wwv_flow_api.g_id_offset,
  p_table_id => 51017790389902314 + wwv_flow_api.g_id_offset,
  p_column_name => 'WEEK_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51018484591902317 + wwv_flow_api.g_id_offset,
  p_table_id => 51017790389902314 + wwv_flow_api.g_id_offset,
  p_column_name => 'WEEK_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51017846372902315 + wwv_flow_api.g_id_offset,
  p_table_id => 51017790389902314 + wwv_flow_api.g_id_offset,
  p_column_name => 'YEAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Year Number',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51017950597902315 + wwv_flow_api.g_id_offset,
  p_table_id => 51017790389902314 + wwv_flow_api.g_id_offset,
  p_column_name => 'YEAR_NUMBER');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CALLS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51010083753894730 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CALLS',
  p_report_region_title => 'Kdr Calls',
  p_form_region_title => 'Kdr Calls');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Call Code',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51010243854894731 + wwv_flow_api.g_id_offset,
  p_table_id => 51010083753894730 + wwv_flow_api.g_id_offset,
  p_column_name => 'CALL_CODE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51010348873894731 + wwv_flow_api.g_id_offset,
  p_table_id => 51010083753894730 + wwv_flow_api.g_id_offset,
  p_column_name => 'CALL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51010111125894731 + wwv_flow_api.g_id_offset,
  p_table_id => 51010083753894730 + wwv_flow_api.g_id_offset,
  p_column_name => 'CALL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Call Reference',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51010414468894731 + wwv_flow_api.g_id_offset,
  p_table_id => 51010083753894730 + wwv_flow_api.g_id_offset,
  p_column_name => 'CALL_REFERENCE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51010525281894732 + wwv_flow_api.g_id_offset,
  p_table_id => 51010083753894730 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHARACTERS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHARACTERS',
  p_report_region_title => 'Kdr Characters',
  p_form_region_title => 'Kdr Characters');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Age',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50966330926655276 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_AGE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Ap Arms',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50967139463655276 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_AP_ARMS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Ap General',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50966556942655276 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_AP_GENERAL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Ap Head',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50966828281655276 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_AP_HEAD');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Ap Legs',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50967031098655276 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_AP_LEGS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Ap Torso',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50966961440655276 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_AP_TORSO');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Background',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_FILE',
  p_form_attribute_01 => 'DB_COLUMN',
  p_form_attribute_06 => 'Y',
  p_form_attribute_08 => 'attachment',
  p_form_attribute_09 => 'SESSION',
  p_form_attribute_10 => 'N',
  p_form_attribute_12 => 'INLINE',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50965981152655275 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_BACKGROUND');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50966234884655276 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_BG_FILENAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Bg Last Update',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50966121256655276 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_BG_LAST_UPDATE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Bg Mimetype',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50966086924655275 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_BG_MIMETYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Class',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50966604136655276 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_CLASS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Culture',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50966460843655276 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_CULTURE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Deity',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50967339790655277 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_DEITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Dom Hand',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50967226966655276 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_DOM_HAND');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50965584371655275 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50965734262655275 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Notes',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50965821201655275 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_NOTES');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Occupation',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50966744579655276 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_OCCUPATION');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Soul Left',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50967405276655277 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_SOUL_LEFT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Status',
  p_display_seq_form => 24,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 24,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50965476154655274 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_STATUS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Xp Adjust',
  p_display_seq_form => 21,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 21,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50967518291655277 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_XP_ADJUST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 23,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 23,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50967782290655277 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLAYER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50965629643655275 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID Sub',
  p_display_seq_form => 22,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 22,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50967654526655277 + wwv_flow_api.g_id_offset,
  p_table_id => 50965377333655225 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_ID_SUB');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHARACTERS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHARACTERS_VIEW',
  p_report_region_title => 'Kdr Characters View',
  p_form_region_title => 'Kdr Characters View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Age',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51020312044902322 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_AGE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Ap Arms',
  p_display_seq_form => 22,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 22,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51021107967902324 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_AP_ARMS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Ap General',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51020548479902323 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_AP_GENERAL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Ap Head',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51020893407902323 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_AP_HEAD');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Ap Legs',
  p_display_seq_form => 21,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 21,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51021041646902324 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_AP_LEGS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Ap Torso',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51020992508902324 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_AP_TORSO');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Background',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_FILE',
  p_form_attribute_01 => 'DB_COLUMN',
  p_form_attribute_06 => 'Y',
  p_form_attribute_08 => 'attachment',
  p_form_attribute_09 => 'SESSION',
  p_form_attribute_10 => 'N',
  p_form_attribute_12 => 'INLINE',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51019943349902321 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_BACKGROUND');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51020270095902322 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_BG_FILENAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Bg Last Update',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51020181806902322 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_BG_LAST_UPDATE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Bg Mimetype',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51020005361902321 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_BG_MIMETYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Class',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51020606056902323 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_CLASS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Culture',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51020437698902322 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_CULTURE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Deity',
  p_display_seq_form => 25,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 25,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51021497941902325 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_DEITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Dom Hand',
  p_display_seq_form => 23,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 23,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51021203112902324 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_DOM_HAND');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Dom Hand D',
  p_display_seq_form => 24,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 24,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51021308379902325 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_DOM_HAND_D');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Icon',
  p_display_seq_form => 42,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 42,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 43,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51023119538902329 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ICON');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51019058959902319 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51019135892902319 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Notes',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51019864772902321 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_NOTES');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Occupation',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51020731679902323 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_OCCUPATION');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Soul Left',
  p_display_seq_form => 27,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 27,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51021658340902325 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_SOUL_LEFT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Soul Left Icon',
  p_display_seq_form => 28,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 28,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 49,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51021715624902326 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_SOUL_LEFT_ICON');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Xp Adjust',
  p_display_seq_form => 29,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 29,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51021828347902326 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_XP_ADJUST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 26,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 26,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51021562260902325 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'DEITY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51019630067902320 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLAYER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51019793571902320 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLAYER_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Amount',
  p_display_seq_form => 41,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 41,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51023039551902329 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_AMOUNT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51019226414902319 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID Sub',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51019436615902320 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_ID_SUB');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51019367088902319 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Amount',
  p_display_seq_form => 39,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 39,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51022835877902329 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_AMOUNT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Amount',
  p_display_seq_form => 40,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 40,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51022935153902329 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_AMOUNT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51019545029902320 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'SUB_RACE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Total Arc Mana',
  p_display_seq_form => 33,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 33,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51022229498902327 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOTAL_ARC_MANA');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Total Chaos Mana',
  p_display_seq_form => 34,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 34,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51022321396902327 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOTAL_CHAOS_MANA');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Total Divinity',
  p_display_seq_form => 32,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 32,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51022145699902327 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOTAL_DIVINITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Total Elem Mana',
  p_display_seq_form => 31,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 31,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51022004131902327 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOTAL_ELEM_MANA');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Total Evenement XP',
  p_display_seq_form => 43,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 43,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51023253683902330 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOTAL_EVENT_XP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Total Hp',
  p_display_seq_form => 30,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 30,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51021979497902326 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOTAL_HP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Total Mana Divinity Gain',
  p_display_seq_form => 48,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 48,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51023784824902331 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOTAL_MANA_DIVINITY_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Total Quest Xp',
  p_display_seq_form => 44,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 44,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51023385509902330 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOTAL_QUEST_XP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Total Race Xp',
  p_display_seq_form => 36,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 36,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51022503652902328 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOTAL_RACE_XP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Total Xp',
  p_display_seq_form => 35,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 35,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51022424787902328 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOTAL_XP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Total Xp Left',
  p_display_seq_form => 38,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 38,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51022758541902328 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOTAL_XP_LEFT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Total Xp Spend',
  p_display_seq_form => 37,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 37,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51022696789902328 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOTAL_XP_SPEND');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Xp Spend Prayers',
  p_display_seq_form => 47,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 47,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51023683462902331 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'XP_SPEND_PRAYERS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Xp Spend Skills',
  p_display_seq_form => 45,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 45,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51023445575902330 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'XP_SPEND_SKILLS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Xp Spend Spells',
  p_display_seq_form => 46,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 46,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51023557401902330 + wwv_flow_api.g_id_offset,
  p_table_id => 51018960788902318 + wwv_flow_api.g_id_offset,
  p_column_name => 'XP_SPEND_SPELLS');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHARACTER_CARDS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHARACTER_CARDS_VIEW',
  p_report_region_title => 'Kdr Character Cards View',
  p_form_region_title => 'Kdr Character Cards View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute1',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51024709872902335 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE1');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute10',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51025665431902337 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE10');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute2',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1203,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51024875720902335 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE2');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute3',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51024914156902335 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE3');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute4',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51025076407902335 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE4');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute5',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51025187505902336 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE5');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute6',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 9,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51025270812902336 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE6');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute7',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 332,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51025328594902336 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE7');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute8',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51025484549902337 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE8');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute9',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51025579464902337 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE9');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51025792682902337 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 35,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51024457829902334 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Alt Attribute',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51024657062902334 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_ALT_ATTRIBUTE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Attribute',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51024519865902334 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_ATTRIBUTE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Is Current List Entry',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51024358128902333 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'IS_CURRENT_LIST_ENTRY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Label',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51024125360902333 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'LABEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Level Value',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51024082019902332 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'LEVEL_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51025902611902338 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLAYER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Target',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 99,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51024282098902333 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'TARGET');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Total Xp Left',
  p_display_seq_form => 21,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 21,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51023951675902332 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOTAL_XP_LEFT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 55,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51025812180902338 + wwv_flow_api.g_id_offset,
  p_table_id => 51023897617902331 + wwv_flow_api.g_id_offset,
  p_column_name => 'XP_DESC');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHARACTER_PRAYERS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHARACTER_PRAYERS_VIEW',
  p_report_region_title => 'Kdr Character Prayers View',
  p_form_region_title => 'Kdr Character Prayers View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51026224018902340 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51026351925902340 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51026195796902339 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_PRAYER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51027272602902342 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'DEITY_CODE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51027563551902343 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'DEITY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51027074771902342 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Distance',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51026689582902341 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_DISTANCE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Distance D',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1103,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51027406939902343 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_DISTANCE_D');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Divinity Cost',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51027103244902342 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_DIVINITY_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Duration',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51026750005902341 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_DURATION');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51026420392902340 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51026935691902342 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51026522944902340 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Target',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51026810121902341 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_TARGET');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Usage',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51027382568902343 + wwv_flow_api.g_id_offset,
  p_table_id => 51026000743902339 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_USAGE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHARACTER_RECIPES_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51027650843902344 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHARACTER_RECIPES_VIEW',
  p_report_region_title => 'Kdr Character Recipes View',
  p_form_region_title => 'Kdr Character Recipes View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51027965204902345 + wwv_flow_api.g_id_offset,
  p_table_id => 51027650843902344 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51028697424902347 + wwv_flow_api.g_id_offset,
  p_table_id => 51027650843902344 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51027740190902344 + wwv_flow_api.g_id_offset,
  p_table_id => 51027650843902344 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_RECIPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recipe Effect',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51028452947902346 + wwv_flow_api.g_id_offset,
  p_table_id => 51027650843902344 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51027835636902345 + wwv_flow_api.g_id_offset,
  p_table_id => 51027650843902344 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recipe Instructions',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51028332923902346 + wwv_flow_api.g_id_offset,
  p_table_id => 51027650843902344 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_INSTRUCTIONS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51028293883902346 + wwv_flow_api.g_id_offset,
  p_table_id => 51027650843902344 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51028135239902345 + wwv_flow_api.g_id_offset,
  p_table_id => 51027650843902344 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51028596236902346 + wwv_flow_api.g_id_offset,
  p_table_id => 51027650843902344 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_TYPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51028092394902345 + wwv_flow_api.g_id_offset,
  p_table_id => 51027650843902344 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_TYPE_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHARACTER_SKILLS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHARACTER_SKILLS_VIEW',
  p_report_region_title => 'Kdr Character Skills View',
  p_form_region_title => 'Kdr Character Skills View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51030086323902351 + wwv_flow_api.g_id_offset,
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51029804555902350 + wwv_flow_api.g_id_offset,
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51029907755902350 + wwv_flow_api.g_id_offset,
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Category Type',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51030163165902351 + wwv_flow_api.g_id_offset,
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51029306010902349 + wwv_flow_api.g_id_offset,
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51029583576902349 + wwv_flow_api.g_id_offset,
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51029445263902349 + wwv_flow_api.g_id_offset,
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_SKILL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51028977814902348 + wwv_flow_api.g_id_offset,
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_column_name => 'LEVEL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Cost',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51029643999902350 + wwv_flow_api.g_id_offset,
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51029291824902349 + wwv_flow_api.g_id_offset,
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51029721281902350 + wwv_flow_api.g_id_offset,
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_GENERAL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51029032269902348 + wwv_flow_api.g_id_offset,
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51029198281902348 + wwv_flow_api.g_id_offset,
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_LEVEL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51028856763902348 + wwv_flow_api.g_id_offset,
  p_table_id => 51028711390902347 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHARACTER_SL_LIST_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51030227980902352 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHARACTER_SL_LIST_VIEW',
  p_report_region_title => 'Kdr Character Sl List View',
  p_form_region_title => 'Kdr Character Sl List View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 904,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51030360967902352 + wwv_flow_api.g_id_offset,
  p_table_id => 51030227980902352 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51030423422902352 + wwv_flow_api.g_id_offset,
  p_table_id => 51030227980902352 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51030542609902353 + wwv_flow_api.g_id_offset,
  p_table_id => 51030227980902352 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam Initials',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51030667315902353 + wwv_flow_api.g_id_offset,
  p_table_id => 51030227980902352 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_NAME_INITIALS');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHARACTER_SPELLS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHARACTER_SPELLS_VIEW',
  p_report_region_title => 'Kdr Character Spells View',
  p_form_region_title => 'Kdr Character Spells View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51030965614902354 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51031088557902354 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51030829682902354 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_SPELL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51031939661902357 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'DURATION_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51032221371902358 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Distance',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51031698641902356 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_DISTANCE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Distance D',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1103,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51031764228902356 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_DISTANCE_D');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Duration',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51031811553902356 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_DURATION');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Duration D',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1103,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51032014826902357 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_DURATION_D');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51031192178902355 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51031401967902355 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51031579908902356 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Target',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51032174435902357 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TARGET');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Type Code',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51031227479902355 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TYPE_CODE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51031386285902355 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TYPE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Usage',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51032310560902358 + wwv_flow_api.g_id_offset,
  p_table_id => 51030740450902353 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_USAGE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHARS_PER_EVENT_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHARS_PER_EVENT_VIEW',
  p_report_region_title => 'Kdr Chars Per Event View',
  p_form_region_title => 'Kdr Chars Per Event View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51032515418902360 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_EVENT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Evenement XP Adj',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51032817231902360 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_EVENT_XP_ADJ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Evenement XP Remark',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51032999296902361 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_EVENT_XP_REMARK');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51032761482902360 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51033716440902363 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Unspend Xp',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51033819600902364 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_UNSPEND_XP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Einddatum',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51033439033902362 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_END_DATE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51032661357902360 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Locatie',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51033168813902361 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_LOCATION');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51033086065902361 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Startdatum',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51033361957902362 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_START_DATE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Type evenement',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51033283870902362 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51033610087902363 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_TYPE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Evenement XP',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 3,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51033517717902363 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_XP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51033950320902364 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLAYER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51034023489902365 + wwv_flow_api.g_id_offset,
  p_table_id => 51032428652902359 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLAYER_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHAR_ALLOWED_RACE_SKILLS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51034115845902366 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHAR_ALLOWED_RACE_SKILLS',
  p_report_region_title => 'Kdr Char Allowed Race Skills',
  p_form_region_title => 'Kdr Char Allowed Race Skills');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51034759892902368 + wwv_flow_api.g_id_offset,
  p_table_id => 51034115845902366 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51034275650902366 + wwv_flow_api.g_id_offset,
  p_table_id => 51034115845902366 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51034314378902367 + wwv_flow_api.g_id_offset,
  p_table_id => 51034115845902366 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Category',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51034522405902367 + wwv_flow_api.g_id_offset,
  p_table_id => 51034115845902366 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_CATEGORY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51034694653902368 + wwv_flow_api.g_id_offset,
  p_table_id => 51034115845902366 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_LEVEL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51034463451902367 + wwv_flow_api.g_id_offset,
  p_table_id => 51034115845902366 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHAR_ERRORS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51034847030902369 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHAR_ERRORS_VIEW',
  p_report_region_title => 'Kdr Char Errors View',
  p_form_region_title => 'Kdr Char Errors View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51035007821902370 + wwv_flow_api.g_id_offset,
  p_table_id => 51034847030902369 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Label',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 23,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51034989726902370 + wwv_flow_api.g_id_offset,
  p_table_id => 51034847030902369 + wwv_flow_api.g_id_offset,
  p_column_name => 'LABEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Text',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51035108488902370 + wwv_flow_api.g_id_offset,
  p_table_id => 51034847030902369 + wwv_flow_api.g_id_offset,
  p_column_name => 'TEXT');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHAR_EVENTS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50975127144894586 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHAR_EVENTS',
  p_report_region_title => 'Kdr Char Events',
  p_form_region_title => 'Kdr Char Events');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50975263468894587 + wwv_flow_api.g_id_offset,
  p_table_id => 50975127144894586 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_EVENT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Evenement XP Adj',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50975527270894588 + wwv_flow_api.g_id_offset,
  p_table_id => 50975127144894586 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_EVENT_XP_ADJ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Evenement XP Remark',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50975646199894588 + wwv_flow_api.g_id_offset,
  p_table_id => 50975127144894586 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_EVENT_XP_REMARK');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50975411869894587 + wwv_flow_api.g_id_offset,
  p_table_id => 50975127144894586 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50975347831894587 + wwv_flow_api.g_id_offset,
  p_table_id => 50975127144894586 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHAR_ITEMS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50975744929894589 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHAR_ITEMS',
  p_report_region_title => 'Kdr Char Items',
  p_form_region_title => 'Kdr Char Items');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50975827310894589 + wwv_flow_api.g_id_offset,
  p_table_id => 50975744929894589 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Item Amount',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50976081587894590 + wwv_flow_api.g_id_offset,
  p_table_id => 50975744929894589 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ITEM_AMOUNT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50976151362894590 + wwv_flow_api.g_id_offset,
  p_table_id => 50975744929894589 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ITEM_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50975978536894589 + wwv_flow_api.g_id_offset,
  p_table_id => 50975744929894589 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHAR_LANGUAGES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50976277409894591 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHAR_LANGUAGES',
  p_report_region_title => 'Kdr Char Languages',
  p_form_region_title => 'Kdr Char Languages');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50976512767894592 + wwv_flow_api.g_id_offset,
  p_table_id => 50976277409894591 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50976322198894591 + wwv_flow_api.g_id_offset,
  p_table_id => 50976277409894591 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_LANG_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50976467990894591 + wwv_flow_api.g_id_offset,
  p_table_id => 50976277409894591 + wwv_flow_api.g_id_offset,
  p_column_name => 'LANGUAGE_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHAR_NAV_MENU_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51035251655902372 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHAR_NAV_MENU_VIEW',
  p_report_region_title => 'Kdr Char Nav Menu View',
  p_form_region_title => 'Kdr Char Nav Menu View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Label Value',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51035376149902372 + wwv_flow_api.g_id_offset,
  p_table_id => 51035251655902372 + wwv_flow_api.g_id_offset,
  p_column_name => 'LABEL_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Target Value',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 42,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51035407401902372 + wwv_flow_api.g_id_offset,
  p_table_id => 51035251655902372 + wwv_flow_api.g_id_offset,
  p_column_name => 'TARGET_VALUE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHAR_NOTES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50976648049894592 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHAR_NOTES',
  p_report_region_title => 'Kdr Char Notes',
  p_form_region_title => 'Kdr Char Notes');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50977340350894594 + wwv_flow_api.g_id_offset,
  p_table_id => 50976648049894592 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Note Icon',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50977057981894594 + wwv_flow_api.g_id_offset,
  p_table_id => 50976648049894592 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOTE_ICON');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Note Icon Modifiers',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50977239033894594 + wwv_flow_api.g_id_offset,
  p_table_id => 50976648049894592 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOTE_ICON_MODIFIERS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50976727028894593 + wwv_flow_api.g_id_offset,
  p_table_id => 50976648049894592 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOTE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Note Text',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50976873234894593 + wwv_flow_api.g_id_offset,
  p_table_id => 50976648049894592 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOTE_TEXT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Note Text Modifiers',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50977189653894594 + wwv_flow_api.g_id_offset,
  p_table_id => 50976648049894592 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOTE_TEXT_MODIFIERS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Note Timestamp',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50977489576894595 + wwv_flow_api.g_id_offset,
  p_table_id => 50976648049894592 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOTE_TIMESTAMP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Note User',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50976991817894593 + wwv_flow_api.g_id_offset,
  p_table_id => 50976648049894592 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOTE_USER');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHAR_PRAYERS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50977560604894596 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHAR_PRAYERS',
  p_report_region_title => 'Kdr Char Prayers',
  p_form_region_title => 'Kdr Char Prayers');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50977758167894597 + wwv_flow_api.g_id_offset,
  p_table_id => 50977560604894596 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50977675410894597 + wwv_flow_api.g_id_offset,
  p_table_id => 50977560604894596 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_PRAYER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50977878106894597 + wwv_flow_api.g_id_offset,
  p_table_id => 50977560604894596 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHAR_RACE_SKILL_AMOUNT_VW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51035512654902373 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHAR_RACE_SKILL_AMOUNT_VW',
  p_report_region_title => 'Kdr Char Race Skill Amount Vw',
  p_form_region_title => 'Kdr Char Race Skill Amount Vw');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51035697295902374 + wwv_flow_api.g_id_offset,
  p_table_id => 51035512654902373 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51035783134902374 + wwv_flow_api.g_id_offset,
  p_table_id => 51035512654902373 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Current Amount',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51036184516902376 + wwv_flow_api.g_id_offset,
  p_table_id => 51035512654902373 + wwv_flow_api.g_id_offset,
  p_column_name => 'CURRENT_AMOUNT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51035828889902375 + wwv_flow_api.g_id_offset,
  p_table_id => 51035512654902373 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Race Skill Amount',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51036049770902376 + wwv_flow_api.g_id_offset,
  p_table_id => 51035512654902373 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_SKILL_AMOUNT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Category',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51035945032902375 + wwv_flow_api.g_id_offset,
  p_table_id => 51035512654902373 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_CATEGORY');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHAR_RECIPES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50977901320894598 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHAR_RECIPES',
  p_report_region_title => 'Kdr Char Recipes',
  p_form_region_title => 'Kdr Char Recipes');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50978246813894599 + wwv_flow_api.g_id_offset,
  p_table_id => 50977901320894598 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50978005004894598 + wwv_flow_api.g_id_offset,
  p_table_id => 50977901320894598 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_RECIPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50978144222894599 + wwv_flow_api.g_id_offset,
  p_table_id => 50977901320894598 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHAR_SKILLS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50978397749894600 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHAR_SKILLS',
  p_report_region_title => 'Kdr Char Skills',
  p_form_region_title => 'Kdr Char Skills');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50978524720894601 + wwv_flow_api.g_id_offset,
  p_table_id => 50978397749894600 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Skill Add Date',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50978898393894601 + wwv_flow_api.g_id_offset,
  p_table_id => 50978397749894600 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_SKILL_ADD_DATE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Skill Add Source',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50978914305894602 + wwv_flow_api.g_id_offset,
  p_table_id => 50978397749894600 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_SKILL_ADD_SOURCE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50978483000894600 + wwv_flow_api.g_id_offset,
  p_table_id => 50978397749894600 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_SKILL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Char Skill Remark',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50978792914894601 + wwv_flow_api.g_id_offset,
  p_table_id => 50978397749894600 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_SKILL_REMARK');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50978663948894601 + wwv_flow_api.g_id_offset,
  p_table_id => 50978397749894600 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_LEVEL_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHAR_SPELLS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50979023667894602 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHAR_SPELLS',
  p_report_region_title => 'Kdr Char Spells',
  p_form_region_title => 'Kdr Char Spells');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50979205587894603 + wwv_flow_api.g_id_offset,
  p_table_id => 50979023667894602 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50979102980894603 + wwv_flow_api.g_id_offset,
  p_table_id => 50979023667894602 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_SPELL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50979353610894603 + wwv_flow_api.g_id_offset,
  p_table_id => 50979023667894602 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHAR_TAGS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50974700991894584 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHAR_TAGS',
  p_report_region_title => 'Kdr Char Tags',
  p_form_region_title => 'Kdr Char Tags');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50974921265894584 + wwv_flow_api.g_id_offset,
  p_table_id => 50974700991894584 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50974898340894584 + wwv_flow_api.g_id_offset,
  p_table_id => 50974700991894584 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_TAG_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50975004159894585 + wwv_flow_api.g_id_offset,
  p_table_id => 50974700991894584 + wwv_flow_api.g_id_offset,
  p_column_name => 'TAG_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_CHAR_TAGS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51036289867902377 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_CHAR_TAGS_VIEW',
  p_report_region_title => 'Kdr Char Tags View',
  p_form_region_title => 'Kdr Char Tags View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51036768567902379 + wwv_flow_api.g_id_offset,
  p_table_id => 51036289867902377 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51036441132902378 + wwv_flow_api.g_id_offset,
  p_table_id => 51036289867902377 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51036639786902378 + wwv_flow_api.g_id_offset,
  p_table_id => 51036289867902377 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51036310346902377 + wwv_flow_api.g_id_offset,
  p_table_id => 51036289867902377 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_TAG_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51036513390902378 + wwv_flow_api.g_id_offset,
  p_table_id => 51036289867902377 + wwv_flow_api.g_id_offset,
  p_column_name => 'TAG_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51036801151902379 + wwv_flow_api.g_id_offset,
  p_table_id => 51036289867902377 + wwv_flow_api.g_id_offset,
  p_column_name => 'TAG_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_COMPONENTS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51036933444902380 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_COMPONENTS_VIEW',
  p_report_region_title => 'Kdr Components View',
  p_form_region_title => 'Kdr Components View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Component Type',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51037070119902380 + wwv_flow_api.g_id_offset,
  p_table_id => 51036933444902380 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMPONENT_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51037744035902382 + wwv_flow_api.g_id_offset,
  p_table_id => 51036933444902380 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMPONENT_TYPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comp Search Skill Array',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51037669483902382 + wwv_flow_api.g_id_offset,
  p_table_id => 51036933444902380 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_SEARCH_SKILL_ARRAY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Bad Effect',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51037430955902381 + wwv_flow_api.g_id_offset,
  p_table_id => 51036933444902380 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_BAD_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Bonus Effect',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51037310218902381 + wwv_flow_api.g_id_offset,
  p_table_id => 51036933444902380 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_BONUS_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Cost',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51038245608902384 + wwv_flow_api.g_id_offset,
  p_table_id => 51036933444902380 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51038198478902383 + wwv_flow_api.g_id_offset,
  p_table_id => 51036933444902380 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Direct Effect',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51037233962902381 + wwv_flow_api.g_id_offset,
  p_table_id => 51036933444902380 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_DIRECT_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51037939738902383 + wwv_flow_api.g_id_offset,
  p_table_id => 51036933444902380 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51037104867902380 + wwv_flow_api.g_id_offset,
  p_table_id => 51036933444902380 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51038007895902383 + wwv_flow_api.g_id_offset,
  p_table_id => 51036933444902380 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Types Array',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51037597455902382 + wwv_flow_api.g_id_offset,
  p_table_id => 51036933444902380 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_TYPES_ARRAY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51037811890902383 + wwv_flow_api.g_id_offset,
  p_table_id => 51036933444902380 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_TYPE_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_DAYS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50972654831894577 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_DAYS',
  p_report_region_title => 'Kdr Days',
  p_form_region_title => 'Kdr Days');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dag',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50972792961894577 + wwv_flow_api.g_id_offset,
  p_table_id => 50972654831894577 + wwv_flow_api.g_id_offset,
  p_column_name => 'DAY_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50972876072894577 + wwv_flow_api.g_id_offset,
  p_table_id => 50972654831894577 + wwv_flow_api.g_id_offset,
  p_column_name => 'DAY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50972941140894578 + wwv_flow_api.g_id_offset,
  p_table_id => 50972654831894577 + wwv_flow_api.g_id_offset,
  p_column_name => 'DAY_SEQ');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_DEITIES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50979428610894604 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_DEITIES',
  p_report_region_title => 'Kdr Deities',
  p_form_region_title => 'Kdr Deities');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_help_text => 'Code',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50979664787894605 + wwv_flow_api.g_id_offset,
  p_table_id => 50979428610894604 + wwv_flow_api.g_id_offset,
  p_column_name => 'DEITY_CODE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_help_text => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50979808544894605 + wwv_flow_api.g_id_offset,
  p_table_id => 50979428610894604 + wwv_flow_api.g_id_offset,
  p_column_name => 'DEITY_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Deity Icon',
  p_help_text => 'Icoon',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50979929203894606 + wwv_flow_api.g_id_offset,
  p_table_id => 50979428610894604 + wwv_flow_api.g_id_offset,
  p_column_name => 'DEITY_ICON');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_help_text => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50979705432894605 + wwv_flow_api.g_id_offset,
  p_table_id => 50979428610894604 + wwv_flow_api.g_id_offset,
  p_column_name => 'DEITY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50979520466894604 + wwv_flow_api.g_id_offset,
  p_table_id => 50979428610894604 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_DISTANCES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50980072085894606 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_DISTANCES',
  p_report_region_title => 'Kdr Distances',
  p_form_region_title => 'Kdr Distances');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50980446507894608 + wwv_flow_api.g_id_offset,
  p_table_id => 50980072085894606 + wwv_flow_api.g_id_offset,
  p_column_name => 'DISTANCE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50980250762894607 + wwv_flow_api.g_id_offset,
  p_table_id => 50980072085894606 + wwv_flow_api.g_id_offset,
  p_column_name => 'DISTANCE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50980319558894607 + wwv_flow_api.g_id_offset,
  p_table_id => 50980072085894606 + wwv_flow_api.g_id_offset,
  p_column_name => 'DISTANCE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50980505467894608 + wwv_flow_api.g_id_offset,
  p_table_id => 50980072085894606 + wwv_flow_api.g_id_offset,
  p_column_name => 'DISTANCE_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50980112617894607 + wwv_flow_api.g_id_offset,
  p_table_id => 50980072085894606 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_DURATIONS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50980675202894608 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_DURATIONS',
  p_report_region_title => 'Kdr Durations',
  p_form_region_title => 'Kdr Durations');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50981057129894610 + wwv_flow_api.g_id_offset,
  p_table_id => 50980675202894608 + wwv_flow_api.g_id_offset,
  p_column_name => 'DURATION_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50980862475894609 + wwv_flow_api.g_id_offset,
  p_table_id => 50980675202894608 + wwv_flow_api.g_id_offset,
  p_column_name => 'DURATION_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50980942075894610 + wwv_flow_api.g_id_offset,
  p_table_id => 50980675202894608 + wwv_flow_api.g_id_offset,
  p_column_name => 'DURATION_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Duration Type',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50981186007894610 + wwv_flow_api.g_id_offset,
  p_table_id => 50980675202894608 + wwv_flow_api.g_id_offset,
  p_column_name => 'DURATION_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50980745615894609 + wwv_flow_api.g_id_offset,
  p_table_id => 50980675202894608 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_EVENTS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50968537523824189 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_EVENTS',
  p_report_region_title => 'Kdr Events',
  p_form_region_title => 'Kdr Events');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Einddatum',
  p_help_text => 'Einddatum',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50969186947824241 + wwv_flow_api.g_id_offset,
  p_table_id => 50968537523824189 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_END_DATE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Verwacht aantal figuranten',
  p_help_text => 'Verwacht aantal figuranten',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50969491573824242 + wwv_flow_api.g_id_offset,
  p_table_id => 50968537523824189 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_EXP_NPC_AMOUNT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Verwacht aantal spelers',
  p_help_text => 'Verwacht aantal spelers',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50969391307824241 + wwv_flow_api.g_id_offset,
  p_table_id => 50968537523824189 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_EXP_PLAYER_AMOUNT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_help_text => 'Evenement ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50968611313824238 + wwv_flow_api.g_id_offset,
  p_table_id => 50968537523824189 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Locatie',
  p_help_text => 'Locatie',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50968809722824239 + wwv_flow_api.g_id_offset,
  p_table_id => 50968537523824189 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_LOCATION');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_help_text => 'Naam van het evenement',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50968787374824239 + wwv_flow_api.g_id_offset,
  p_table_id => 50968537523824189 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Startdatum',
  p_help_text => 'Startdatum',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50969008079824239 + wwv_flow_api.g_id_offset,
  p_table_id => 50968537523824189 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_START_DATE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Type evenement',
  p_help_text => 'Type',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50968901951824239 + wwv_flow_api.g_id_offset,
  p_table_id => 50968537523824189 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Evenement XP',
  p_help_text => 'Te verkrijgen xp',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 3,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50969245711824241 + wwv_flow_api.g_id_offset,
  p_table_id => 50968537523824189 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_XP');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_EVENT_TYPES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50981222889894612 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_EVENT_TYPES',
  p_report_region_title => 'Kdr Type evenements',
  p_form_region_title => 'Kdr Type evenements');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50981466063894612 + wwv_flow_api.g_id_offset,
  p_table_id => 50981222889894612 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_TYPE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50981300465894612 + wwv_flow_api.g_id_offset,
  p_table_id => 50981222889894612 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_TYPE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50981557064894613 + wwv_flow_api.g_id_offset,
  p_table_id => 50981222889894612 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_TYPE_SEQ');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_INCANTATIONS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51008914684894726 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_INCANTATIONS',
  p_report_region_title => 'Kdr Incantations',
  p_form_region_title => 'Kdr Incantations');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51009089530894727 + wwv_flow_api.g_id_offset,
  p_table_id => 51008914684894726 + wwv_flow_api.g_id_offset,
  p_column_name => 'INCANTATION_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 1,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51009181887894727 + wwv_flow_api.g_id_offset,
  p_table_id => 51008914684894726 + wwv_flow_api.g_id_offset,
  p_column_name => 'INCANTATION_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Incantation Requirement',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51009272812894727 + wwv_flow_api.g_id_offset,
  p_table_id => 51008914684894726 + wwv_flow_api.g_id_offset,
  p_column_name => 'INCANTATION_REQUIREMENT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Incantation Type',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51009326141894728 + wwv_flow_api.g_id_offset,
  p_table_id => 51008914684894726 + wwv_flow_api.g_id_offset,
  p_column_name => 'INCANTATION_TYPE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_ITEMS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50981686069894613 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_ITEMS',
  p_report_region_title => 'Kdr Items',
  p_form_region_title => 'Kdr Items');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comp Search Skill Array',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50982979589894617 + wwv_flow_api.g_id_offset,
  p_table_id => 50981686069894613 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_SEARCH_SKILL_ARRAY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Bad Effect',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50982727857894616 + wwv_flow_api.g_id_offset,
  p_table_id => 50981686069894613 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_BAD_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Bonus Effect',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50982650051894616 + wwv_flow_api.g_id_offset,
  p_table_id => 50981686069894613 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_BONUS_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Cost',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50982316585894615 + wwv_flow_api.g_id_offset,
  p_table_id => 50981686069894613 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50982241163894615 + wwv_flow_api.g_id_offset,
  p_table_id => 50981686069894613 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Direct Effect',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50982580559894616 + wwv_flow_api.g_id_offset,
  p_table_id => 50981686069894613 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_DIRECT_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50982056602894615 + wwv_flow_api.g_id_offset,
  p_table_id => 50981686069894613 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50982412441894616 + wwv_flow_api.g_id_offset,
  p_table_id => 50981686069894613 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50982170541894615 + wwv_flow_api.g_id_offset,
  p_table_id => 50981686069894613 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Types Array',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50982839295894617 + wwv_flow_api.g_id_offset,
  p_table_id => 50981686069894613 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_TYPES_ARRAY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50981941821894614 + wwv_flow_api.g_id_offset,
  p_table_id => 50981686069894613 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recipe Cost',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50981843397894614 + wwv_flow_api.g_id_offset,
  p_table_id => 50981686069894613 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50981715341894614 + wwv_flow_api.g_id_offset,
  p_table_id => 50981686069894613 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_ITEM_EVENTS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51005782264894715 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_ITEM_EVENTS',
  p_report_region_title => 'Kdr Item Events',
  p_form_region_title => 'Kdr Item Events');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51006026528894716 + wwv_flow_api.g_id_offset,
  p_table_id => 51005782264894715 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51005807503894715 + wwv_flow_api.g_id_offset,
  p_table_id => 51005782264894715 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_EVENT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51005907587894716 + wwv_flow_api.g_id_offset,
  p_table_id => 51005782264894715 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item New Cost',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51006151675894716 + wwv_flow_api.g_id_offset,
  p_table_id => 51005782264894715 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_NEW_COST');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_ITEM_FLUX');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51006292895894717 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_ITEM_FLUX',
  p_report_region_title => 'Kdr Item Flux',
  p_form_region_title => 'Kdr Item Flux');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Flux Date',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51006589271894718 + wwv_flow_api.g_id_offset,
  p_table_id => 51006292895894717 + wwv_flow_api.g_id_offset,
  p_column_name => 'FLUX_DATE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51006308358894717 + wwv_flow_api.g_id_offset,
  p_table_id => 51006292895894717 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_FLUX_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51006446070894717 + wwv_flow_api.g_id_offset,
  p_table_id => 51006292895894717 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item New Cost',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51006646133894718 + wwv_flow_api.g_id_offset,
  p_table_id => 51006292895894717 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_NEW_COST');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_ITEM_TREE_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51038376024902385 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_ITEM_TREE_VIEW',
  p_report_region_title => 'Kdr Item Tree View',
  p_form_region_title => 'Kdr Item Tree View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Icon',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51038705583902389 + wwv_flow_api.g_id_offset,
  p_table_id => 51038376024902385 + wwv_flow_api.g_id_offset,
  p_column_name => 'ICON');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Link',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51039072604902391 + wwv_flow_api.g_id_offset,
  p_table_id => 51038376024902385 + wwv_flow_api.g_id_offset,
  p_column_name => 'LINK');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Status',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51038417078902387 + wwv_flow_api.g_id_offset,
  p_table_id => 51038376024902385 + wwv_flow_api.g_id_offset,
  p_column_name => 'STATUS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Title',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 343,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51038637113902388 + wwv_flow_api.g_id_offset,
  p_table_id => 51038376024902385 + wwv_flow_api.g_id_offset,
  p_column_name => 'TITLE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tooltip',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51038921096902390 + wwv_flow_api.g_id_offset,
  p_table_id => 51038376024902385 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOOLTIP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Value',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 81,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51038873906902390 + wwv_flow_api.g_id_offset,
  p_table_id => 51038376024902385 + wwv_flow_api.g_id_offset,
  p_column_name => 'VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Level',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51038577152902387 + wwv_flow_api.g_id_offset,
  p_table_id => 51038376024902385 + wwv_flow_api.g_id_offset,
  p_column_name => 'level');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_ITEM_TYPES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50969988638879461 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_ITEM_TYPES',
  p_report_region_title => 'Kdr Item Types',
  p_form_region_title => 'Kdr Item Types');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Component Type',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50970588113879466 + wwv_flow_api.g_id_offset,
  p_table_id => 50969988638879461 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMPONENT_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50970327762879465 + wwv_flow_api.g_id_offset,
  p_table_id => 50969988638879461 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_TYPE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50970137424879464 + wwv_flow_api.g_id_offset,
  p_table_id => 50969988638879461 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_TYPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50970227511879465 + wwv_flow_api.g_id_offset,
  p_table_id => 50969988638879461 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_TYPE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Type Parent',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50970454376879466 + wwv_flow_api.g_id_offset,
  p_table_id => 50969988638879461 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_TYPE_PARENT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50970023233879464 + wwv_flow_api.g_id_offset,
  p_table_id => 50969988638879461 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_ITEM_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_ITEM_VIEW',
  p_report_region_title => 'Kdr Item View',
  p_form_region_title => 'Kdr Item View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comp Search Skill Array',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51039484467902393 + wwv_flow_api.g_id_offset,
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_SEARCH_SKILL_ARRAY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Bad Effect',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51040516048902396 + wwv_flow_api.g_id_offset,
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_BAD_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Bonus Effect',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51040420707902396 + wwv_flow_api.g_id_offset,
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_BONUS_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Cost',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51040018336902395 + wwv_flow_api.g_id_offset,
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51039912084902394 + wwv_flow_api.g_id_offset,
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Direct Effect',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51040381562902396 + wwv_flow_api.g_id_offset,
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_DIRECT_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51039276462902392 + wwv_flow_api.g_id_offset,
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51040246745902395 + wwv_flow_api.g_id_offset,
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51039319119902392 + wwv_flow_api.g_id_offset,
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Item Types Array',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51039739766902394 + wwv_flow_api.g_id_offset,
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_TYPES_ARRAY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recipe Cost',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51040146331902395 + wwv_flow_api.g_id_offset,
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skills List',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51039564347902393 + wwv_flow_api.g_id_offset,
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILLS_LIST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skills List C',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51039668359902393 + wwv_flow_api.g_id_offset,
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILLS_LIST_C');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Types List',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51039842949902394 + wwv_flow_api.g_id_offset,
  p_table_id => 51039147687902391 + wwv_flow_api.g_id_offset,
  p_column_name => 'TYPES_LIST');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_LAMMIES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50983050713894618 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_LAMMIES',
  p_report_region_title => 'Kdr Lammies',
  p_form_region_title => 'Kdr Lammies');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Lammy Charges',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50983640385894620 + wwv_flow_api.g_id_offset,
  p_table_id => 50983050713894618 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAMMY_CHARGES');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Lammy Effect',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50983448662894620 + wwv_flow_api.g_id_offset,
  p_table_id => 50983050713894618 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAMMY_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Lammy Exp Date',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50983577990894620 + wwv_flow_api.g_id_offset,
  p_table_id => 50983050713894618 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAMMY_EXP_DATE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50983110603894619 + wwv_flow_api.g_id_offset,
  p_table_id => 50983050713894618 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAMMY_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50983358853894619 + wwv_flow_api.g_id_offset,
  p_table_id => 50983050713894618 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAMMY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Lammy Quantity',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50983750689894620 + wwv_flow_api.g_id_offset,
  p_table_id => 50983050713894618 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAMMY_QUANTITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50983239620894619 + wwv_flow_api.g_id_offset,
  p_table_id => 50983050713894618 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_LANGUAGES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50983869201894621 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_LANGUAGES',
  p_report_region_title => 'Kdr Languages',
  p_form_region_title => 'Kdr Languages');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50984028948894622 + wwv_flow_api.g_id_offset,
  p_table_id => 50983869201894621 + wwv_flow_api.g_id_offset,
  p_column_name => 'LANGUAGE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50984169859894623 + wwv_flow_api.g_id_offset,
  p_table_id => 50983869201894621 + wwv_flow_api.g_id_offset,
  p_column_name => 'LANGUAGE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Language Type',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50984257949894623 + wwv_flow_api.g_id_offset,
  p_table_id => 50983869201894621 + wwv_flow_api.g_id_offset,
  p_column_name => 'LANGUAGE_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50983937782894622 + wwv_flow_api.g_id_offset,
  p_table_id => 50983869201894621 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_LOV_PLOT_CATS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51040688482902397 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_LOV_PLOT_CATS',
  p_report_region_title => 'Kdr Lov Plot Cats',
  p_form_region_title => 'Kdr Lov Plot Cats');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Display Value',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51040871715902398 + wwv_flow_api.g_id_offset,
  p_table_id => 51040688482902397 + wwv_flow_api.g_id_offset,
  p_column_name => 'DISPLAY_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Return Value',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51040704832902398 + wwv_flow_api.g_id_offset,
  p_table_id => 51040688482902397 + wwv_flow_api.g_id_offset,
  p_column_name => 'RETURN_VALUE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_MENU');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50984304127894624 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_MENU',
  p_report_region_title => 'Kdr Menu',
  p_form_region_title => 'Kdr Menu');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Menu Current',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50984826117894626 + wwv_flow_api.g_id_offset,
  p_table_id => 50984304127894624 + wwv_flow_api.g_id_offset,
  p_column_name => 'MENU_CURRENT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50984426870894625 + wwv_flow_api.g_id_offset,
  p_table_id => 50984304127894624 + wwv_flow_api.g_id_offset,
  p_column_name => 'MENU_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Menu Icon',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50984981576894626 + wwv_flow_api.g_id_offset,
  p_table_id => 50984304127894624 + wwv_flow_api.g_id_offset,
  p_column_name => 'MENU_ICON');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Menu Image',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50985047770894626 + wwv_flow_api.g_id_offset,
  p_table_id => 50984304127894624 + wwv_flow_api.g_id_offset,
  p_column_name => 'MENU_IMAGE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50985265451894627 + wwv_flow_api.g_id_offset,
  p_table_id => 50984304127894624 + wwv_flow_api.g_id_offset,
  p_column_name => 'MENU_ITEM_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Menu Label',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50984694580894625 + wwv_flow_api.g_id_offset,
  p_table_id => 50984304127894624 + wwv_flow_api.g_id_offset,
  p_column_name => 'MENU_LABEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50984557366894625 + wwv_flow_api.g_id_offset,
  p_table_id => 50984304127894624 + wwv_flow_api.g_id_offset,
  p_column_name => 'MENU_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50985389774894627 + wwv_flow_api.g_id_offset,
  p_table_id => 50984304127894624 + wwv_flow_api.g_id_offset,
  p_column_name => 'MENU_PARENT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50985150536894627 + wwv_flow_api.g_id_offset,
  p_table_id => 50984304127894624 + wwv_flow_api.g_id_offset,
  p_column_name => 'MENU_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Menu Target',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50984742788894625 + wwv_flow_api.g_id_offset,
  p_table_id => 50984304127894624 + wwv_flow_api.g_id_offset,
  p_column_name => 'MENU_TARGET');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Menu Type',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50985462817894628 + wwv_flow_api.g_id_offset,
  p_table_id => 50984304127894624 + wwv_flow_api.g_id_offset,
  p_column_name => 'MENU_TYPE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_MONTHS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50973568995894580 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_MONTHS',
  p_report_region_title => 'Kdr Months',
  p_form_region_title => 'Kdr Months');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Month Amt Weeks',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50974067490894581 + wwv_flow_api.g_id_offset,
  p_table_id => 50973568995894580 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_AMT_WEEKS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Month Bg Color',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50974349245894582 + wwv_flow_api.g_id_offset,
  p_table_id => 50973568995894580 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_BG_COLOR');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Month Days Corr',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50974287142894582 + wwv_flow_api.g_id_offset,
  p_table_id => 50973568995894580 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_DAYS_CORR');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Month Deity',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50973678790894580 + wwv_flow_api.g_id_offset,
  p_table_id => 50973568995894580 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_DEITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50973782742894581 + wwv_flow_api.g_id_offset,
  p_table_id => 50973568995894580 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50973871397894581 + wwv_flow_api.g_id_offset,
  p_table_id => 50973568995894580 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50973954186894581 + wwv_flow_api.g_id_offset,
  p_table_id => 50973568995894580 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Month Week Days',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50974193599894581 + wwv_flow_api.g_id_offset,
  p_table_id => 50973568995894580 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONTH_WEEK_DAYS');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NAVIGATION_CHAR_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51040972390902399 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NAVIGATION_CHAR_VIEW',
  p_report_region_title => 'Kdr Navigation Char View',
  p_form_region_title => 'Kdr Navigation Char View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute1',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51041699128902402 + wwv_flow_api.g_id_offset,
  p_table_id => 51040972390902399 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE1');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute2',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51041753797902402 + wwv_flow_api.g_id_offset,
  p_table_id => 51040972390902399 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE2');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute3',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51041872055902403 + wwv_flow_api.g_id_offset,
  p_table_id => 51040972390902399 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE3');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Alt Value',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51041533901902401 + wwv_flow_api.g_id_offset,
  p_table_id => 51040972390902399 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_ALT_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Attr Value',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51041415703902401 + wwv_flow_api.g_id_offset,
  p_table_id => 51040972390902399 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_ATTR_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Value',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1006,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51041336085902401 + wwv_flow_api.g_id_offset,
  p_table_id => 51040972390902399 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Is Current',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 3,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51041208309902400 + wwv_flow_api.g_id_offset,
  p_table_id => 51040972390902399 + wwv_flow_api.g_id_offset,
  p_column_name => 'IS_CURRENT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Label Value',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51041053684902399 + wwv_flow_api.g_id_offset,
  p_table_id => 51040972390902399 + wwv_flow_api.g_id_offset,
  p_column_name => 'LABEL_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Level Value',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51041980947902403 + wwv_flow_api.g_id_offset,
  p_table_id => 51040972390902399 + wwv_flow_api.g_id_offset,
  p_column_name => 'LEVEL_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Target Value',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51041113852902400 + wwv_flow_api.g_id_offset,
  p_table_id => 51040972390902399 + wwv_flow_api.g_id_offset,
  p_column_name => 'TARGET_VALUE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NAVIGATION_MENU_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51042013859902404 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NAVIGATION_MENU_VIEW',
  p_report_region_title => 'Kdr Navigation Menu View',
  p_form_region_title => 'Kdr Navigation Menu View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute1',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51042885676902407 + wwv_flow_api.g_id_offset,
  p_table_id => 51042013859902404 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE1');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute2',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51042939835902407 + wwv_flow_api.g_id_offset,
  p_table_id => 51042013859902404 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE2');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute3',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51043000175902408 + wwv_flow_api.g_id_offset,
  p_table_id => 51042013859902404 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE3');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Alt Value',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51042789181902407 + wwv_flow_api.g_id_offset,
  p_table_id => 51042013859902404 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_ALT_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Attr Value',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51042669360902406 + wwv_flow_api.g_id_offset,
  p_table_id => 51042013859902404 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_ATTR_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Value',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1006,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51042516084902406 + wwv_flow_api.g_id_offset,
  p_table_id => 51042013859902404 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Is Current',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51042461948902405 + wwv_flow_api.g_id_offset,
  p_table_id => 51042013859902404 + wwv_flow_api.g_id_offset,
  p_column_name => 'IS_CURRENT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Label Value',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51042227727902405 + wwv_flow_api.g_id_offset,
  p_table_id => 51042013859902404 + wwv_flow_api.g_id_offset,
  p_column_name => 'LABEL_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Level Value',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51042184304902404 + wwv_flow_api.g_id_offset,
  p_table_id => 51042013859902404 + wwv_flow_api.g_id_offset,
  p_column_name => 'LEVEL_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Target Value',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51042397445902405 + wwv_flow_api.g_id_offset,
  p_table_id => 51042013859902404 + wwv_flow_api.g_id_offset,
  p_column_name => 'TARGET_VALUE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NAVIGATION_PUBLIC_EXPLANATION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51043150104902411 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NAVIGATION_PUBLIC_EXPLANATION',
  p_report_region_title => 'Kdr Navigation Public Explanation',
  p_form_region_title => 'Kdr Navigation Public Explanation');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute1',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51043906950902427 + wwv_flow_api.g_id_offset,
  p_table_id => 51043150104902411 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE1');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute2',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51044026332902427 + wwv_flow_api.g_id_offset,
  p_table_id => 51043150104902411 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE2');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute3',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51044160704902428 + wwv_flow_api.g_id_offset,
  p_table_id => 51043150104902411 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE3');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Alt Value',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51043851719902427 + wwv_flow_api.g_id_offset,
  p_table_id => 51043150104902411 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_ALT_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Attr Value',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51043727770902427 + wwv_flow_api.g_id_offset,
  p_table_id => 51043150104902411 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_ATTR_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Value',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1006,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51043618258902426 + wwv_flow_api.g_id_offset,
  p_table_id => 51043150104902411 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Is Current',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51043560826902426 + wwv_flow_api.g_id_offset,
  p_table_id => 51043150104902411 + wwv_flow_api.g_id_offset,
  p_column_name => 'IS_CURRENT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Label Value',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51043310633902425 + wwv_flow_api.g_id_offset,
  p_table_id => 51043150104902411 + wwv_flow_api.g_id_offset,
  p_column_name => 'LABEL_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Level Value',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51043279923902425 + wwv_flow_api.g_id_offset,
  p_table_id => 51043150104902411 + wwv_flow_api.g_id_offset,
  p_column_name => 'LEVEL_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Target Value',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51043442332902426 + wwv_flow_api.g_id_offset,
  p_table_id => 51043150104902411 + wwv_flow_api.g_id_offset,
  p_column_name => 'TARGET_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tooltip',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51044212387902428 + wwv_flow_api.g_id_offset,
  p_table_id => 51043150104902411 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOOLTIP');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NAVIGATION_PUBLIC_MAIN');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51044342003902442 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NAVIGATION_PUBLIC_MAIN',
  p_report_region_title => 'Kdr Navigation Public Main',
  p_form_region_title => 'Kdr Navigation Public Main');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute1',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51045158089902445 + wwv_flow_api.g_id_offset,
  p_table_id => 51044342003902442 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE1');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute2',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51045266543902446 + wwv_flow_api.g_id_offset,
  p_table_id => 51044342003902442 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE2');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute3',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51045302923902446 + wwv_flow_api.g_id_offset,
  p_table_id => 51044342003902442 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE3');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Alt Value',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51045047266902445 + wwv_flow_api.g_id_offset,
  p_table_id => 51044342003902442 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_ALT_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Attr Value',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51044918542902445 + wwv_flow_api.g_id_offset,
  p_table_id => 51044342003902442 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_ATTR_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Value',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1006,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51044888576902444 + wwv_flow_api.g_id_offset,
  p_table_id => 51044342003902442 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Is Current',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51044733167902444 + wwv_flow_api.g_id_offset,
  p_table_id => 51044342003902442 + wwv_flow_api.g_id_offset,
  p_column_name => 'IS_CURRENT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Label Value',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51044502155902443 + wwv_flow_api.g_id_offset,
  p_table_id => 51044342003902442 + wwv_flow_api.g_id_offset,
  p_column_name => 'LABEL_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Level Value',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51044449834902443 + wwv_flow_api.g_id_offset,
  p_table_id => 51044342003902442 + wwv_flow_api.g_id_offset,
  p_column_name => 'LEVEL_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Target Value',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51044696474902444 + wwv_flow_api.g_id_offset,
  p_table_id => 51044342003902442 + wwv_flow_api.g_id_offset,
  p_column_name => 'TARGET_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tooltip',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51045446232902446 + wwv_flow_api.g_id_offset,
  p_table_id => 51044342003902442 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOOLTIP');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NPCS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NPCS',
  p_report_region_title => 'Kdr Npcs',
  p_form_region_title => 'Kdr Npcs');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Arc Mana',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50987307750894634 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ARC_MANA');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Base Ready',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50985780124894629 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_BASE_READY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Chaos Mana',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50985902125894630 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_CHAOS_MANA');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Checked',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50985694889894629 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_CHECKED');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50986358000894631 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Divinity',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50986052484894630 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_DIVINITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Dresscode',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50986208129894631 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_DRESSCODE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Hitpoints',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50987185142894633 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_HITPOINTS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50986636962894632 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Items',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50986188342894630 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ITEMS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Mana',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50987267327894634 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_MANA');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50986836917894632 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Personality',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50986947305894633 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_PERSONALITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Played By',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50986520671894632 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_PLAYED_BY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Race',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50986714232894632 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_RACE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50986476070894631 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_SHORT_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Skills',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50987018198894633 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_SKILLS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Skills Ready',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50985857889894630 + wwv_flow_api.g_id_offset,
  p_table_id => 50985577060894628 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_SKILLS_READY');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NPCS_SKILLS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51045530153902449 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NPCS_SKILLS_VIEW',
  p_report_region_title => 'Kdr Npcs Skills View',
  p_form_region_title => 'Kdr Npcs Skills View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51045754300902458 + wwv_flow_api.g_id_offset,
  p_table_id => 51045530153902449 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51045892933902458 + wwv_flow_api.g_id_offset,
  p_table_id => 51045530153902449 + wwv_flow_api.g_id_offset,
  p_column_name => 'LEVEL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51046287811902460 + wwv_flow_api.g_id_offset,
  p_table_id => 51045530153902449 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51046488250902460 + wwv_flow_api.g_id_offset,
  p_table_id => 51045530153902449 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51046328190902460 + wwv_flow_api.g_id_offset,
  p_table_id => 51045530153902449 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_SKILL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Cost',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51046501139902460 + wwv_flow_api.g_id_offset,
  p_table_id => 51045530153902449 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51046159649902459 + wwv_flow_api.g_id_offset,
  p_table_id => 51045530153902449 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51045913742902459 + wwv_flow_api.g_id_offset,
  p_table_id => 51045530153902449 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51046041550902459 + wwv_flow_api.g_id_offset,
  p_table_id => 51045530153902449 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_LEVEL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51045624907902458 + wwv_flow_api.g_id_offset,
  p_table_id => 51045530153902449 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NPCS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NPCS_VIEW',
  p_report_region_title => 'Kdr Npcs View',
  p_form_region_title => 'Kdr Npcs View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Arc Mana',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51047451216902477 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ARC_MANA');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Chaos Mana',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51047597842902477 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_CHAOS_MANA');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51047934430902478 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Divinity',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51047678845902477 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_DIVINITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Dresscode',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51047894332902478 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_DRESSCODE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Hitpoints',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51047290225902476 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_HITPOINTS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51046724186902475 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Items',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51047725223902478 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ITEMS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Mana',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51047392789902477 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_MANA');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51046952238902476 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Personality',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51047001056902476 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_PERSONALITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Played By',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51048103584902479 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_PLAYED_BY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Race',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51046832391902475 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_RACE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51048022851902478 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_SHORT_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Skills',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51047197163902476 + wwv_flow_api.g_id_offset,
  p_table_id => 51046652152902475 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_SKILLS');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NPC_CHECK_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51048218088902479 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NPC_CHECK_VIEW',
  p_report_region_title => 'Kdr Npc Check View',
  p_form_region_title => 'Kdr Npc Check View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51048458699902480 + wwv_flow_api.g_id_offset,
  p_table_id => 51048218088902479 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51048386782902480 + wwv_flow_api.g_id_offset,
  p_table_id => 51048218088902479 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Text Line',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51048593300902480 + wwv_flow_api.g_id_offset,
  p_table_id => 51048218088902479 + wwv_flow_api.g_id_offset,
  p_column_name => 'TEXT_LINE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NPC_PER_PLOT');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NPC_PER_PLOT',
  p_report_region_title => 'Kdr Npc Per Plot',
  p_form_region_title => 'Kdr Npc Per Plot');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51050243875902487 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 34,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 34,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51052000942902492 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Arc Mana',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51049450622902483 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ARC_MANA');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Chaos Mana',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51049580170902483 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_CHAOS_MANA');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51049995409902485 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Divinity',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51049676431902484 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_DIVINITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Dresscode',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51049891862902484 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_DRESSCODE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Hitpoints',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51049207961902483 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_HITPOINTS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51048771701902481 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Items',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51049795982902484 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ITEMS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Mana',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51049373384902483 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_MANA');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51048996315902482 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Personality',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51049003264902482 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_PERSONALITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Race',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51048868978902482 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_RACE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51050083914902485 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_SHORT_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Skills',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51049112790902482 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_SKILLS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Author',
  p_display_seq_form => 27,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 27,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51051394178902490 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_AUTHOR');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Category',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51050408438902487 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_CATEGORY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Checked',
  p_display_seq_form => 31,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 31,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51051719301902491 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_CHECKED');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijvingription',
  p_display_seq_form => 28,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 28,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51051499117902490 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_DESCRIPTION');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Gamemaster',
  p_display_seq_form => 26,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 26,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51051271795902490 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_GAMEMASTER');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Goal',
  p_display_seq_form => 24,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 24,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51051027360902489 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_GOAL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Group Type',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51050600985902488 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_GROUP_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51050181959902487 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Location',
  p_display_seq_form => 23,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 23,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51050932080902489 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_LOCATION');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Npcs',
  p_display_seq_form => 29,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 29,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51051556358902490 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_NPCS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Npc Quantity',
  p_display_seq_form => 32,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 32,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51051813705902491 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_NPC_QUANTITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Npc Quantity Upper',
  p_display_seq_form => 33,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 33,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51051993913902492 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_NPC_QUANTITY_UPPER');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Propps',
  p_display_seq_form => 22,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 22,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51050809272902488 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_PROPPS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 30,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 30,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51051669705902491 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Size',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51050518065902488 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_SIZE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Target',
  p_display_seq_form => 25,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 25,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51051114267902489 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_TARGET');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Timing',
  p_display_seq_form => 21,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 21,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51050754933902488 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_TIMING');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Title',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51050390394902487 + wwv_flow_api.g_id_offset,
  p_table_id => 51048629405902481 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_TITLE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NPC_PRAYERS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50987402746894635 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NPC_PRAYERS',
  p_report_region_title => 'Kdr Npc Prayers',
  p_form_region_title => 'Kdr Npc Prayers');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50987649247894636 + wwv_flow_api.g_id_offset,
  p_table_id => 50987402746894635 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50987592877894636 + wwv_flow_api.g_id_offset,
  p_table_id => 50987402746894635 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_PRAYER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50987736908894636 + wwv_flow_api.g_id_offset,
  p_table_id => 50987402746894635 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NPC_PRAYERS_PRINT_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51052179594902493 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NPC_PRAYERS_PRINT_VIEW',
  p_report_region_title => 'Kdr Npc Prayers Print View',
  p_form_region_title => 'Kdr Npc Prayers Print View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51052344463902493 + wwv_flow_api.g_id_offset,
  p_table_id => 51052179594902493 + wwv_flow_api.g_id_offset,
  p_column_name => 'DEITY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51052224748902493 + wwv_flow_api.g_id_offset,
  p_table_id => 51052179594902493 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 40,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51052410054902494 + wwv_flow_api.g_id_offset,
  p_table_id => 51052179594902493 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer List',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51052527893902495 + wwv_flow_api.g_id_offset,
  p_table_id => 51052179594902493 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_LIST');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NPC_PRAYERS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51052698499902495 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NPC_PRAYERS_VIEW',
  p_report_region_title => 'Kdr Npc Prayers View',
  p_form_region_title => 'Kdr Npc Prayers View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51053271207902498 + wwv_flow_api.g_id_offset,
  p_table_id => 51052698499902495 + wwv_flow_api.g_id_offset,
  p_column_name => 'DEITY_CODE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51052774725902496 + wwv_flow_api.g_id_offset,
  p_table_id => 51052698499902495 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51052845359902497 + wwv_flow_api.g_id_offset,
  p_table_id => 51052698499902495 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51053396707902498 + wwv_flow_api.g_id_offset,
  p_table_id => 51052698499902495 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_PRAYER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51052965938902497 + wwv_flow_api.g_id_offset,
  p_table_id => 51052698499902495 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51053018899902497 + wwv_flow_api.g_id_offset,
  p_table_id => 51052698499902495 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51053133838902497 + wwv_flow_api.g_id_offset,
  p_table_id => 51052698499902495 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NPC_SKILLS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50987847364894637 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NPC_SKILLS',
  p_report_region_title => 'Kdr Npc Skills',
  p_form_region_title => 'Kdr Npc Skills');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50988012534894638 + wwv_flow_api.g_id_offset,
  p_table_id => 50987847364894637 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Skill Add Date',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50988320521894639 + wwv_flow_api.g_id_offset,
  p_table_id => 50987847364894637 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_SKILL_ADD_DATE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Skill Add Source',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50988428203894639 + wwv_flow_api.g_id_offset,
  p_table_id => 50987847364894637 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_SKILL_ADD_SOURCE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50987997819894638 + wwv_flow_api.g_id_offset,
  p_table_id => 50987847364894637 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_SKILL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Npc Skill Remark',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50988253610894639 + wwv_flow_api.g_id_offset,
  p_table_id => 50987847364894637 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_SKILL_REMARK');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50988193681894638 + wwv_flow_api.g_id_offset,
  p_table_id => 50987847364894637 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_LEVEL_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NPC_SPELLS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50988587243894640 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NPC_SPELLS',
  p_report_region_title => 'Kdr Npc Spells',
  p_form_region_title => 'Kdr Npc Spells');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50988740864894641 + wwv_flow_api.g_id_offset,
  p_table_id => 50988587243894640 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50988687521894641 + wwv_flow_api.g_id_offset,
  p_table_id => 50988587243894640 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_SPELL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50988882519894641 + wwv_flow_api.g_id_offset,
  p_table_id => 50988587243894640 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NPC_SPELLS_PRINT_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51053462905902499 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NPC_SPELLS_PRINT_VIEW',
  p_report_region_title => 'Kdr Npc Spells Print View',
  p_form_region_title => 'Kdr Npc Spells Print View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51053521818902499 + wwv_flow_api.g_id_offset,
  p_table_id => 51053462905902499 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spells',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51053833748902500 + wwv_flow_api.g_id_offset,
  p_table_id => 51053462905902499 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELLS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 40,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51053706308902500 + wwv_flow_api.g_id_offset,
  p_table_id => 51053462905902499 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51053647625902499 + wwv_flow_api.g_id_offset,
  p_table_id => 51053462905902499 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TYPE_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_NPC_SPELLS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51053984101902501 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_NPC_SPELLS_VIEW',
  p_report_region_title => 'Kdr Npc Spells View',
  p_form_region_title => 'Kdr Npc Spells View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51054169809902501 + wwv_flow_api.g_id_offset,
  p_table_id => 51053984101902501 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51054206852902501 + wwv_flow_api.g_id_offset,
  p_table_id => 51053984101902501 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51054002677902501 + wwv_flow_api.g_id_offset,
  p_table_id => 51053984101902501 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_SPELL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51054350505902502 + wwv_flow_api.g_id_offset,
  p_table_id => 51053984101902501 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51054517114902503 + wwv_flow_api.g_id_offset,
  p_table_id => 51053984101902501 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51054655893902504 + wwv_flow_api.g_id_offset,
  p_table_id => 51053984101902501 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Type Code',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51054418259902503 + wwv_flow_api.g_id_offset,
  p_table_id => 51053984101902501 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TYPE_CODE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_PLAYERS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50988965101894642 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_PLAYERS',
  p_report_region_title => 'Kdr Players',
  p_form_region_title => 'Kdr Players');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50989041881894643 + wwv_flow_api.g_id_offset,
  p_table_id => 50988965101894642 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLAYER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50989161459894643 + wwv_flow_api.g_id_offset,
  p_table_id => 50988965101894642 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLAYER_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Player Pin',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50989313612894644 + wwv_flow_api.g_id_offset,
  p_table_id => 50988965101894642 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLAYER_PIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50989298825894643 + wwv_flow_api.g_id_offset,
  p_table_id => 50988965101894642 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLAYER_USER_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_PLOT');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_PLOT',
  p_report_region_title => 'Kdr Plot',
  p_form_region_title => 'Kdr Plot');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50989694939894646 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Author',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50990707205894650 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_AUTHOR');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Category',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50989831217894647 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_CATEGORY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Checked',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50991113686894652 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_CHECKED');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijvingription',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50990860716894651 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_DESCRIPTION');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Gamemaster',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50990620057894650 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_GAMEMASTER');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Goal',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50990434929894649 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_GOAL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Group Type',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50990038244894647 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_GROUP_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50989525181894645 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Location',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50990375219894649 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_LOCATION');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Npcs',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50990982716894651 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_NPCS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Propps',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50990239566894648 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_PROPPS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Ready',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50991205987894652 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_READY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50991016950894651 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Size',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50989961030894647 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_SIZE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Target',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50990595944894649 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_TARGET');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Timing',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50990127985894648 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_TIMING');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Title',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50989706560894646 + wwv_flow_api.g_id_offset,
  p_table_id => 50989445840894644 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_TITLE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_PLOT_CATEGORIES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50972355423894574 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_PLOT_CATEGORIES',
  p_report_region_title => 'Kdr Plot Categories',
  p_form_region_title => 'Kdr Plot Categories');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50972552787894576 + wwv_flow_api.g_id_offset,
  p_table_id => 50972355423894574 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50972429160894575 + wwv_flow_api.g_id_offset,
  p_table_id => 50972355423894574 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_PLOT_MENU_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51054706228902506 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_PLOT_MENU_VIEW',
  p_report_region_title => 'Kdr Plot Menu View',
  p_form_region_title => 'Kdr Plot Menu View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute1',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51055568082902508 + wwv_flow_api.g_id_offset,
  p_table_id => 51054706228902506 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE1');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute2',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51055635141902508 + wwv_flow_api.g_id_offset,
  p_table_id => 51054706228902506 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE2');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute3',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51055785320902509 + wwv_flow_api.g_id_offset,
  p_table_id => 51054706228902506 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE3');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Alt Value',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51055451815902508 + wwv_flow_api.g_id_offset,
  p_table_id => 51054706228902506 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_ALT_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Attr Value',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51055352313902507 + wwv_flow_api.g_id_offset,
  p_table_id => 51054706228902506 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_ATTR_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Image Value',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1006,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51055252463902507 + wwv_flow_api.g_id_offset,
  p_table_id => 51054706228902506 + wwv_flow_api.g_id_offset,
  p_column_name => 'IMAGE_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Is Current',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51055184443902507 + wwv_flow_api.g_id_offset,
  p_table_id => 51054706228902506 + wwv_flow_api.g_id_offset,
  p_column_name => 'IS_CURRENT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Label Value',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51054967489902506 + wwv_flow_api.g_id_offset,
  p_table_id => 51054706228902506 + wwv_flow_api.g_id_offset,
  p_column_name => 'LABEL_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Level Value',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51054864093902506 + wwv_flow_api.g_id_offset,
  p_table_id => 51054706228902506 + wwv_flow_api.g_id_offset,
  p_column_name => 'LEVEL_VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Target Value',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51055060674902506 + wwv_flow_api.g_id_offset,
  p_table_id => 51054706228902506 + wwv_flow_api.g_id_offset,
  p_column_name => 'TARGET_VALUE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_PLOT_NOTES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51004813188894712 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_PLOT_NOTES',
  p_report_region_title => 'Kdr Plot Notes',
  p_form_region_title => 'Kdr Plot Notes');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Note Icon',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51005201574894713 + wwv_flow_api.g_id_offset,
  p_table_id => 51004813188894712 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOTE_ICON');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Note Icon Modifiers',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51005420641894713 + wwv_flow_api.g_id_offset,
  p_table_id => 51004813188894712 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOTE_ICON_MODIFIERS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51004968206894712 + wwv_flow_api.g_id_offset,
  p_table_id => 51004813188894712 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOTE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Note Text',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51005094062894712 + wwv_flow_api.g_id_offset,
  p_table_id => 51004813188894712 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOTE_TEXT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Note Text Modifiers',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51005339627894713 + wwv_flow_api.g_id_offset,
  p_table_id => 51004813188894712 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOTE_TEXT_MODIFIERS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Note Timestamp',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51005615903894714 + wwv_flow_api.g_id_offset,
  p_table_id => 51004813188894712 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOTE_TIMESTAMP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Note User',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51005144836894713 + wwv_flow_api.g_id_offset,
  p_table_id => 51004813188894712 + wwv_flow_api.g_id_offset,
  p_column_name => 'NOTE_USER');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51005536967894713 + wwv_flow_api.g_id_offset,
  p_table_id => 51004813188894712 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_PLOT_NPCS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50991386404894653 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_PLOT_NPCS',
  p_report_region_title => 'Kdr Plot Npcs',
  p_form_region_title => 'Kdr Plot Npcs');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50991584985894655 + wwv_flow_api.g_id_offset,
  p_table_id => 50991386404894653 + wwv_flow_api.g_id_offset,
  p_column_name => 'NPC_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50991639333894655 + wwv_flow_api.g_id_offset,
  p_table_id => 50991386404894653 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50991457151894654 + wwv_flow_api.g_id_offset,
  p_table_id => 50991386404894653 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_NPC_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Npc Quantity',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50991720931894656 + wwv_flow_api.g_id_offset,
  p_table_id => 50991386404894653 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_NPC_QUANTITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Plot Npc Quantity Upper',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50991849556894656 + wwv_flow_api.g_id_offset,
  p_table_id => 50991386404894653 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_NPC_QUANTITY_UPPER');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_PLOT_PROPS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50991901659894657 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_PLOT_PROPS',
  p_report_region_title => 'Kdr Plot Props',
  p_form_region_title => 'Kdr Plot Props');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50992261918894658 + wwv_flow_api.g_id_offset,
  p_table_id => 50991901659894657 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLOT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50992180469894658 + wwv_flow_api.g_id_offset,
  p_table_id => 50991901659894657 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROPS_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50992078432894658 + wwv_flow_api.g_id_offset,
  p_table_id => 50991901659894657 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROPS_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Props Ready',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50992337382894659 + wwv_flow_api.g_id_offset,
  p_table_id => 50991901659894657 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROPS_READY');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_PLOT_SIZES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50992449331894659 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_PLOT_SIZES',
  p_report_region_title => 'Kdr Plot Sizes',
  p_form_region_title => 'Kdr Plot Sizes');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50992687300894660 + wwv_flow_api.g_id_offset,
  p_table_id => 50992449331894659 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIZE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50992564952894660 + wwv_flow_api.g_id_offset,
  p_table_id => 50992449331894659 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIZE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50992775292894661 + wwv_flow_api.g_id_offset,
  p_table_id => 50992449331894659 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIZE_SEQ');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Size Weight',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50992813150894661 + wwv_flow_api.g_id_offset,
  p_table_id => 50992449331894659 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIZE_WEIGHT');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_PLOT_TIMING');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50992943999894662 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_PLOT_TIMING',
  p_report_region_title => 'Kdr Plot Timing',
  p_form_region_title => 'Kdr Plot Timing');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Time Code',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50993064594894662 + wwv_flow_api.g_id_offset,
  p_table_id => 50992943999894662 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIME_CODE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50993146304894663 + wwv_flow_api.g_id_offset,
  p_table_id => 50992943999894662 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIME_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Time Hours',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50993347095894663 + wwv_flow_api.g_id_offset,
  p_table_id => 50992943999894662 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIME_HOURS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50993268854894663 + wwv_flow_api.g_id_offset,
  p_table_id => 50992943999894662 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIME_SEQ');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_PRAYERS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50993485808894664 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_PRAYERS',
  p_report_region_title => 'Kdr Prayers',
  p_form_region_title => 'Kdr Prayers');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_help_text => 'Godheid',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50994439254894667 + wwv_flow_api.g_id_offset,
  p_table_id => 50993485808894664 + wwv_flow_api.g_id_offset,
  p_column_name => 'DEITY_CODE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_help_text => 'Omschrijving',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50994237903894667 + wwv_flow_api.g_id_offset,
  p_table_id => 50993485808894664 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Distance',
  p_help_text => 'Afstand',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50993845036894666 + wwv_flow_api.g_id_offset,
  p_table_id => 50993485808894664 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_DISTANCE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Divinity Cost',
  p_help_text => 'Benodigde Divinity',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50994342816894667 + wwv_flow_api.g_id_offset,
  p_table_id => 50993485808894664 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_DIVINITY_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Duration',
  p_help_text => 'Duratie',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50993955950894666 + wwv_flow_api.g_id_offset,
  p_table_id => 50993485808894664 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_DURATION');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_help_text => 'Gebed ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50993663953894665 + wwv_flow_api.g_id_offset,
  p_table_id => 50993485808894664 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_help_text => 'Niveau',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50994167963894667 + wwv_flow_api.g_id_offset,
  p_table_id => 50993485808894664 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_help_text => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50993700438894665 + wwv_flow_api.g_id_offset,
  p_table_id => 50993485808894664 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Target',
  p_help_text => 'Doelwit',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50994091524894666 + wwv_flow_api.g_id_offset,
  p_table_id => 50993485808894664 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_TARGET');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Usage',
  p_help_text => 'Gebruik',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50994502063894668 + wwv_flow_api.g_id_offset,
  p_table_id => 50993485808894664 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_USAGE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50993588624894665 + wwv_flow_api.g_id_offset,
  p_table_id => 50993485808894664 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_PRAYERS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_PRAYERS_VIEW',
  p_report_region_title => 'Kdr Prayers View',
  p_form_region_title => 'Kdr Prayers View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51057123190902513 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'DEITY_CODE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51057265969902513 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'DEITY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Deity Publiekelijk zichtbaar',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51057676372902514 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'DEITY_PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Deity Tooltip',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51057386719902513 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'DEITY_TOOLTIP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51056240376902511 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'DISTANCE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Distance Tooltip',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51056365236902511 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'DISTANCE_TOOLTIP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51056568100902511 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'DURATION_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Duration Tooltip',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51056618646902512 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'DURATION_TOOLTIP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51056912485902512 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Distance',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51056110472902510 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_DISTANCE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Divinity Cost',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51057037352902513 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_DIVINITY_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Duration',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51056457011902511 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_DURATION');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51055983809902510 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 180,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51056854270902512 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51056032307902510 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Publiekelijk zichtbaar',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51057522868902514 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Target',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51056791704902512 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_TARGET');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Prayer Usage',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51057490771902514 + wwv_flow_api.g_id_offset,
  p_table_id => 51055828250902509 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRAYER_USAGE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RACES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50994649161894668 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RACES',
  p_report_region_title => 'Kdr Races',
  p_form_region_title => 'Kdr Races');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_help_text => 'Publieke toegankelijkheid',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50994733964894669 + wwv_flow_api.g_id_offset,
  p_table_id => 50994649161894668 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_help_text => 'Omschrijving ras',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50995081864894670 + wwv_flow_api.g_id_offset,
  p_table_id => 50994649161894668 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Race Gold',
  p_help_text => 'Startkapitaal',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50995243364894671 + wwv_flow_api.g_id_offset,
  p_table_id => 50994649161894668 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_GOLD');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_help_text => 'Ras ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50994850792894670 + wwv_flow_api.g_id_offset,
  p_table_id => 50994649161894668 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_help_text => 'Naam van het ras',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50994968254894670 + wwv_flow_api.g_id_offset,
  p_table_id => 50994649161894668 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Race Skill Amount',
  p_help_text => 'Aantal vaardigheden uit groep te kiezen',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50995446338894672 + wwv_flow_api.g_id_offset,
  p_table_id => 50994649161894668 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_SKILL_AMOUNT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Race Skill Category',
  p_help_text => 'Vaardigheidsgroep van het ras',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50995346977894671 + wwv_flow_api.g_id_offset,
  p_table_id => 50994649161894668 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_SKILL_CATEGORY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Race Type',
  p_help_text => 'Type ras',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50995585682894672 + wwv_flow_api.g_id_offset,
  p_table_id => 50994649161894668 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Race Xp Pen',
  p_help_text => 'Aantal xp in mindering',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50995111174894670 + wwv_flow_api.g_id_offset,
  p_table_id => 50994649161894668 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_XP_PEN');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RACE_COMPATIBILTY');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51009441202894728 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RACE_COMPATIBILTY',
  p_report_region_title => 'Kdr Race Compatibilty',
  p_form_region_title => 'Kdr Race Compatibilty');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51009677553894729 + wwv_flow_api.g_id_offset,
  p_table_id => 51009441202894728 + wwv_flow_api.g_id_offset,
  p_column_name => 'BASE_RACE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51009776268894729 + wwv_flow_api.g_id_offset,
  p_table_id => 51009441202894728 + wwv_flow_api.g_id_offset,
  p_column_name => 'BREED_RACE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51009567339894729 + wwv_flow_api.g_id_offset,
  p_table_id => 51009441202894728 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comp Status',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51009947281894730 + wwv_flow_api.g_id_offset,
  p_table_id => 51009441202894728 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_STATUS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51009891050894729 + wwv_flow_api.g_id_offset,
  p_table_id => 51009441202894728 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RACE_COMP_TABLE_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RACE_COMP_TABLE_VIEW',
  p_report_region_title => 'Kdr Race Comp Table View',
  p_form_region_title => 'Kdr Race Comp Table View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51057891968902515 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'BASE_RACE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Beastling',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51057960926902516 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'BEASTLING');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dragonblood Dragonborn',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51058090281902516 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'DRAGONBLOOD DRAGONBORN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dragonheart Dragonborn',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51058120546902516 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'DRAGONHEART DRAGONBORN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dragonskin Dragonborn',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51058274066902516 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'DRAGONSKIN DRAGONBORN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Drow',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51058309047902517 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'DROW');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dwarf',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51058440593902517 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'DWARF');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Firbolg',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51058551980902517 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'FIRBOLG');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Gnome',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51058693846902520 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'GNOME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Goblin',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51058795220902521 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'GOBLIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Half Elf',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51058866227902521 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'HALF ELF');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Halfling',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51058952600902521 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'HALFLING');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'High Elf',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51059047835902521 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'HIGH ELF');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Human',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51059132891902522 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'HUMAN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Orc',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51059244384902522 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'ORC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Wood Elf',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51059328968902522 + wwv_flow_api.g_id_offset,
  p_table_id => 51057743374902515 + wwv_flow_api.g_id_offset,
  p_column_name => 'WOOD ELF');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RACE_COMP_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51059408342902523 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RACE_COMP_VIEW',
  p_report_region_title => 'Kdr Race Comp View',
  p_form_region_title => 'Kdr Race Comp View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51059525457902523 + wwv_flow_api.g_id_offset,
  p_table_id => 51059408342902523 + wwv_flow_api.g_id_offset,
  p_column_name => 'BASE_RACE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51059636519902524 + wwv_flow_api.g_id_offset,
  p_table_id => 51059408342902523 + wwv_flow_api.g_id_offset,
  p_column_name => 'BREED_RACE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Max Comp Status',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51059729389902524 + wwv_flow_api.g_id_offset,
  p_table_id => 51059408342902523 + wwv_flow_api.g_id_offset,
  p_column_name => 'MAX_COMP_STATUS');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RACE_SKILLS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51059867875902525 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RACE_SKILLS',
  p_report_region_title => 'Kdr Race Skills',
  p_form_region_title => 'Kdr Race Skills');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51060145069902525 + wwv_flow_api.g_id_offset,
  p_table_id => 51059867875902525 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51059974466902525 + wwv_flow_api.g_id_offset,
  p_table_id => 51059867875902525 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51060043276902525 + wwv_flow_api.g_id_offset,
  p_table_id => 51059867875902525 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Category Type',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51060261581902526 + wwv_flow_api.g_id_offset,
  p_table_id => 51059867875902525 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Category',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51060951290902528 + wwv_flow_api.g_id_offset,
  p_table_id => 51059867875902525 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_CATEGORY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51060873641902528 + wwv_flow_api.g_id_offset,
  p_table_id => 51059867875902525 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51060651312902527 + wwv_flow_api.g_id_offset,
  p_table_id => 51059867875902525 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51060725260902527 + wwv_flow_api.g_id_offset,
  p_table_id => 51059867875902525 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51060536868902527 + wwv_flow_api.g_id_offset,
  p_table_id => 51059867875902525 + wwv_flow_api.g_id_offset,
  p_column_name => 'TYPE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51060394931902526 + wwv_flow_api.g_id_offset,
  p_table_id => 51059867875902525 + wwv_flow_api.g_id_offset,
  p_column_name => 'TYPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51060456805902526 + wwv_flow_api.g_id_offset,
  p_table_id => 51059867875902525 + wwv_flow_api.g_id_offset,
  p_column_name => 'TYPE_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RACE_SKILL_CATEGORIES_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51061085837902529 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RACE_SKILL_CATEGORIES_VIEW',
  p_report_region_title => 'Kdr Race Skill Categories View',
  p_form_region_title => 'Kdr Race Skill Categories View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51061370066902530 + wwv_flow_api.g_id_offset,
  p_table_id => 51061085837902529 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51061139827902529 + wwv_flow_api.g_id_offset,
  p_table_id => 51061085837902529 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51061232069902529 + wwv_flow_api.g_id_offset,
  p_table_id => 51061085837902529 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Category Type',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51061415669902530 + wwv_flow_api.g_id_offset,
  p_table_id => 51061085837902529 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51061790945902531 + wwv_flow_api.g_id_offset,
  p_table_id => 51061085837902529 + wwv_flow_api.g_id_offset,
  p_column_name => 'TYPE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51061575173902530 + wwv_flow_api.g_id_offset,
  p_table_id => 51061085837902529 + wwv_flow_api.g_id_offset,
  p_column_name => 'TYPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51061694280902530 + wwv_flow_api.g_id_offset,
  p_table_id => 51061085837902529 + wwv_flow_api.g_id_offset,
  p_column_name => 'TYPE_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RACE_SKILL_LEVELS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RACE_SKILL_LEVELS',
  p_report_region_title => 'Kdr Race Skill Levels',
  p_form_region_title => 'Kdr Race Skill Levels');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51063125754902535 + wwv_flow_api.g_id_offset,
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51062214829902533 + wwv_flow_api.g_id_offset,
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_column_name => 'LEVEL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Arcane Gain',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51062891483902534 + wwv_flow_api.g_id_offset,
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_ARCANE_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Category',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51061945851902532 + wwv_flow_api.g_id_offset,
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_CATEGORY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Chaos Gain',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51062923335902535 + wwv_flow_api.g_id_offset,
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_CHAOS_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Cost',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51062327323902533 + wwv_flow_api.g_id_offset,
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51062437882902533 + wwv_flow_api.g_id_offset,
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Div Gain',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51062698933902534 + wwv_flow_api.g_id_offset,
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_DIV_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Hp Gain',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51063031015902535 + wwv_flow_api.g_id_offset,
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_HP_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51062179207902532 + wwv_flow_api.g_id_offset,
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51062012782902532 + wwv_flow_api.g_id_offset,
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_LEVEL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Mana Gain',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51062519672902534 + wwv_flow_api.g_id_offset,
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_MANA_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51063287825902536 + wwv_flow_api.g_id_offset,
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Xp Gain',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51062757017902534 + wwv_flow_api.g_id_offset,
  p_table_id => 51061877969902531 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_XP_GAIN');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RACE_SKILL_LEVELS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RACE_SKILL_LEVELS_VIEW',
  p_report_region_title => 'Kdr Race Skill Levels View',
  p_form_region_title => 'Kdr Race Skill Levels View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51064363779902539 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51064133941902539 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51064242642902539 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Category Type',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51064451312902539 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 21,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 21,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51065384243902542 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'LEVEL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51063589214902537 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Race Gold',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51063707794902537 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_GOLD');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51066200024902544 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51063408884902537 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Race Skill Amount',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51063980639902538 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_SKILL_AMOUNT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Race Skill Category',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51063812004902538 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_SKILL_CATEGORY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Race Type',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51064083706902538 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Race Xp Pen',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51063639206902537 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_XP_PEN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Arcane Gain',
  p_display_seq_form => 27,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 27,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51065905292902543 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_ARCANE_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Category',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51065017547902541 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_CATEGORY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Chaos Gain',
  p_display_seq_form => 28,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 28,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51066066134902544 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_CHAOS_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Cost',
  p_display_seq_form => 22,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 22,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51065450957902542 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 23,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 23,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51065574264902542 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Div Gain',
  p_display_seq_form => 25,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 25,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51065754276902543 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_DIV_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Hp Gain',
  p_display_seq_form => 29,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 29,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51066116953902544 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_HP_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51065216529902542 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51065194104902541 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_LEVEL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Mana Gain',
  p_display_seq_form => 24,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 24,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51065633659902543 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_MANA_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51064855661902540 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Xp Gain',
  p_display_seq_form => 26,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 26,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51065895240902543 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_XP_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51064955067902541 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'SK_SKILL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51064742293902540 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'TYPE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51064575389902540 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'TYPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51064690146902540 + wwv_flow_api.g_id_offset,
  p_table_id => 51063314982902536 + wwv_flow_api.g_id_offset,
  p_column_name => 'TYPE_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RACE_TYPES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51066301893902545 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RACE_TYPES',
  p_report_region_title => 'Kdr Race Types',
  p_form_region_title => 'Kdr Race Types');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Race Type',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51066451669902545 + wwv_flow_api.g_id_offset,
  p_table_id => 51066301893902545 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51066532409902545 + wwv_flow_api.g_id_offset,
  p_table_id => 51066301893902545 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACE_TYPE_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RECIPES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50995684999894673 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RECIPES',
  p_report_region_title => 'Kdr Recipes',
  p_form_region_title => 'Kdr Recipes');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50995725712894673 + wwv_flow_api.g_id_offset,
  p_table_id => 50995684999894673 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recipe Effect',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50996213955894675 + wwv_flow_api.g_id_offset,
  p_table_id => 50995684999894673 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50995889480894674 + wwv_flow_api.g_id_offset,
  p_table_id => 50995684999894673 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recipe Instructions',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50996110719894675 + wwv_flow_api.g_id_offset,
  p_table_id => 50995684999894673 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_INSTRUCTIONS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50996097356894674 + wwv_flow_api.g_id_offset,
  p_table_id => 50995684999894673 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50995986206894674 + wwv_flow_api.g_id_offset,
  p_table_id => 50995684999894673 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50996303139894675 + wwv_flow_api.g_id_offset,
  p_table_id => 50995684999894673 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_TYPE_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RECIPES_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51066619857902546 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RECIPES_VIEW',
  p_report_region_title => 'Kdr Recipes View',
  p_form_region_title => 'Kdr Recipes View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recipe Effect',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51067316153902548 + wwv_flow_api.g_id_offset,
  p_table_id => 51066619857902546 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51066919283902547 + wwv_flow_api.g_id_offset,
  p_table_id => 51066619857902546 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recipe Instructions',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51067289694902548 + wwv_flow_api.g_id_offset,
  p_table_id => 51066619857902546 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_INSTRUCTIONS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51067148968902547 + wwv_flow_api.g_id_offset,
  p_table_id => 51066619857902546 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51067080175902547 + wwv_flow_api.g_id_offset,
  p_table_id => 51066619857902546 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51066823988902547 + wwv_flow_api.g_id_offset,
  p_table_id => 51066619857902546 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_TYPE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51067412330902548 + wwv_flow_api.g_id_offset,
  p_table_id => 51066619857902546 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_TYPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51066706158902546 + wwv_flow_api.g_id_offset,
  p_table_id => 51066619857902546 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_TYPE_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RECIPE_COMPONENTS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50996482024894676 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RECIPE_COMPONENTS',
  p_report_region_title => 'Kdr Recipe Components',
  p_form_region_title => 'Kdr Recipe Components');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comp Amount',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50996793715894677 + wwv_flow_api.g_id_offset,
  p_table_id => 50996482024894676 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_AMOUNT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comp Amount Upper',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50997219872894678 + wwv_flow_api.g_id_offset,
  p_table_id => 50996482024894676 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_AMOUNT_UPPER');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comp Comment',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50997164642894678 + wwv_flow_api.g_id_offset,
  p_table_id => 50996482024894676 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_COMMENT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50996548849894676 + wwv_flow_api.g_id_offset,
  p_table_id => 50996482024894676 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50996931067894677 + wwv_flow_api.g_id_offset,
  p_table_id => 50996482024894676 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50996883536894677 + wwv_flow_api.g_id_offset,
  p_table_id => 50996482024894676 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50997093101894678 + wwv_flow_api.g_id_offset,
  p_table_id => 50996482024894676 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_TYPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50996698225894677 + wwv_flow_api.g_id_offset,
  p_table_id => 50996482024894676 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_ID');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RECIPE_COMPONENTS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51067528570902549 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RECIPE_COMPONENTS_VIEW',
  p_report_region_title => 'Kdr Recipe Components View',
  p_form_region_title => 'Kdr Recipe Components View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Component Type',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51067916952902550 + wwv_flow_api.g_id_offset,
  p_table_id => 51067528570902549 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMPONENT_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comp Amount',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51068525196902552 + wwv_flow_api.g_id_offset,
  p_table_id => 51067528570902549 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_AMOUNT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 545,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51068221010902551 + wwv_flow_api.g_id_offset,
  p_table_id => 51067528570902549 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving Long',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51068382579902551 + wwv_flow_api.g_id_offset,
  p_table_id => 51067528570902549 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_DESC_LONG');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51068436614902551 + wwv_flow_api.g_id_offset,
  p_table_id => 51067528570902549 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51067658912902549 + wwv_flow_api.g_id_offset,
  p_table_id => 51067528570902549 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMP_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51068636876902552 + wwv_flow_api.g_id_offset,
  p_table_id => 51067528570902549 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51068757800902552 + wwv_flow_api.g_id_offset,
  p_table_id => 51067528570902549 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51067787380902550 + wwv_flow_api.g_id_offset,
  p_table_id => 51067528570902549 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_TYPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51067823236902550 + wwv_flow_api.g_id_offset,
  p_table_id => 51067528570902549 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITEM_TYPE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51068089090902550 + wwv_flow_api.g_id_offset,
  p_table_id => 51067528570902549 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51068189560902551 + wwv_flow_api.g_id_offset,
  p_table_id => 51067528570902549 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RECIPE_TYPES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50997324920894679 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RECIPE_TYPES',
  p_report_region_title => 'Kdr Recipe Types',
  p_form_region_title => 'Kdr Recipe Types');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50997473166894680 + wwv_flow_api.g_id_offset,
  p_table_id => 50997324920894679 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50997708714894681 + wwv_flow_api.g_id_offset,
  p_table_id => 50997324920894679 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_TYPE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recipe Type Icon',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50997880537894681 + wwv_flow_api.g_id_offset,
  p_table_id => 50997324920894679 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_TYPE_ICON');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recipe Type Icon Attr',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50997996976894681 + wwv_flow_api.g_id_offset,
  p_table_id => 50997324920894679 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_TYPE_ICON_ATTR');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50997546149894680 + wwv_flow_api.g_id_offset,
  p_table_id => 50997324920894679 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_TYPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50997621838894680 + wwv_flow_api.g_id_offset,
  p_table_id => 50997324920894679 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_TYPE_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RECIPE_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51068823124902553 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RECIPE_VIEW',
  p_report_region_title => 'Kdr Recipe View',
  p_form_region_title => 'Kdr Recipe View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recipe Base Cost',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51069722963902555 + wwv_flow_api.g_id_offset,
  p_table_id => 51068823124902553 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_BASE_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recipe Effect',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51069584256902555 + wwv_flow_api.g_id_offset,
  p_table_id => 51068823124902553 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_EFFECT');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51069147498902554 + wwv_flow_api.g_id_offset,
  p_table_id => 51068823124902553 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recipe Instructions',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51069487864902555 + wwv_flow_api.g_id_offset,
  p_table_id => 51068823124902553 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_INSTRUCTIONS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51069387210902554 + wwv_flow_api.g_id_offset,
  p_table_id => 51068823124902553 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51069241334902554 + wwv_flow_api.g_id_offset,
  p_table_id => 51068823124902553 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51069069242902554 + wwv_flow_api.g_id_offset,
  p_table_id => 51068823124902553 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_TYPE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51069621675902555 + wwv_flow_api.g_id_offset,
  p_table_id => 51068823124902553 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_TYPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51068958420902553 + wwv_flow_api.g_id_offset,
  p_table_id => 51068823124902553 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIPE_TYPE_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_RULESET_WORLD_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51069849197902556 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_RULESET_WORLD_VIEW',
  p_report_region_title => 'Kdr Ruleset World View',
  p_form_region_title => 'Kdr Ruleset World View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute1',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51070236215902557 + wwv_flow_api.g_id_offset,
  p_table_id => 51069849197902556 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE1');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute2',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51070320288902557 + wwv_flow_api.g_id_offset,
  p_table_id => 51069849197902556 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE2');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute3',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51070467474902558 + wwv_flow_api.g_id_offset,
  p_table_id => 51069849197902556 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE3');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute4',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51070591193902558 + wwv_flow_api.g_id_offset,
  p_table_id => 51069849197902556 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE4');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute5',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 44,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51070610109902559 + wwv_flow_api.g_id_offset,
  p_table_id => 51069849197902556 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE5');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute6',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 17,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51070782373902559 + wwv_flow_api.g_id_offset,
  p_table_id => 51069849197902556 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE6');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Attribute7',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 17,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51070812319902559 + wwv_flow_api.g_id_offset,
  p_table_id => 51069849197902556 + wwv_flow_api.g_id_offset,
  p_column_name => 'ATTRIBUTE7');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Label',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 19,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51070057302902557 + wwv_flow_api.g_id_offset,
  p_table_id => 51069849197902556 + wwv_flow_api.g_id_offset,
  p_column_name => 'LABEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Lvl',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 1,
  p_max_width => 0,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51069971489902557 + wwv_flow_api.g_id_offset,
  p_table_id => 51069849197902556 + wwv_flow_api.g_id_offset,
  p_column_name => 'LVL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Target',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 56,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51070169289902557 + wwv_flow_api.g_id_offset,
  p_table_id => 51069849197902556 + wwv_flow_api.g_id_offset,
  p_column_name => 'TARGET');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_SEARCH_SKILLS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50998035855894682 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_SEARCH_SKILLS',
  p_report_region_title => 'Kdr Search Skills',
  p_form_region_title => 'Kdr Search Skills');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Search Skill Bg Color',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50998594391894684 + wwv_flow_api.g_id_offset,
  p_table_id => 50998035855894682 + wwv_flow_api.g_id_offset,
  p_column_name => 'SEARCH_SKILL_BG_COLOR');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Search Skill Color',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50998459101894683 + wwv_flow_api.g_id_offset,
  p_table_id => 50998035855894682 + wwv_flow_api.g_id_offset,
  p_column_name => 'SEARCH_SKILL_COLOR');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50998396147894683 + wwv_flow_api.g_id_offset,
  p_table_id => 50998035855894682 + wwv_flow_api.g_id_offset,
  p_column_name => 'SEARCH_SKILL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50998154191894683 + wwv_flow_api.g_id_offset,
  p_table_id => 50998035855894682 + wwv_flow_api.g_id_offset,
  p_column_name => 'SEARCH_SKILL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50998207374894683 + wwv_flow_api.g_id_offset,
  p_table_id => 50998035855894682 + wwv_flow_api.g_id_offset,
  p_column_name => 'SEARCH_SKILL_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_SIGNUPS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_SIGNUPS',
  p_report_region_title => 'Deelnemer',
  p_form_region_title => 'Deelnemers');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 25,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 25,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50961634885494152 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 24,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 24,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50961599589494152 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'EVENT_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 26,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 26,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50961757237494152 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLAYER_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Address',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50959477780494150 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_ADDRESS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Allergy',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50960102751494151 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_ALLERGY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Birthday',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50959848338494151 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_BIRTHDAY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'IDay',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 5,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50961041711494152 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_BUILDUP_FRIDAY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup City',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50959653573494151 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_CITY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50960481151494151 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_CONTACT_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Contact Phone',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50960592387494151 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_CONTACT_PHONE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'IDay',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50960916795494152 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_DINER_FRIDAY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Email',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50960010895494151 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_EMAIL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Gender',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50959953794494151 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_GENDER');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50960619453494151 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_GP_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Gp Phone',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50960761032494152 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_GP_PHONE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50959249730494150 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Medical Problems',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50960274864494151 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_MEDICAL_PROBLEMS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Medicin',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50960854202494152 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_MEDICIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam (voor- en achternaam)',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50959350792494150 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Newsletter',
  p_display_seq_form => 22,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 22,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50961385274494152 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_NEWSLETTER');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Phone',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50959745896494151 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_PHONE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Photo Disclaimer',
  p_display_seq_form => 21,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 21,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50961257696494152 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_PHOTO_DISCLAIMER');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Regulations',
  p_display_seq_form => 23,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 23,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50961486457494152 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_REGULATIONS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Type',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50961170721494152 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Vega',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50960306667494151 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_VEGA');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Signup Zipcode',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 15,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50959599417494151 + wwv_flow_api.g_id_offset,
  p_table_id => 50959162769494094 + wwv_flow_api.g_id_offset,
  p_column_name => 'SIGNUP_ZIPCODE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_SKILLS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50998659301894685 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_SKILLS',
  p_report_region_title => 'Kdr Skills',
  p_form_region_title => 'Kdr Skills');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_help_text => 'Publieke toegankelijkheid',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50998738452894685 + wwv_flow_api.g_id_offset,
  p_table_id => 50998659301894685 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Category',
  p_help_text => 'Vaardigheidsgroep',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50999177437894686 + wwv_flow_api.g_id_offset,
  p_table_id => 50998659301894685 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_CATEGORY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_help_text => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50999000182894686 + wwv_flow_api.g_id_offset,
  p_table_id => 50998659301894685 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_help_text => 'Vaardigheid ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50998840483894685 + wwv_flow_api.g_id_offset,
  p_table_id => 50998659301894685 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_help_text => 'Naam van de vaardigheid',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50998946891894686 + wwv_flow_api.g_id_offset,
  p_table_id => 50998659301894685 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_SKILLS_PER_LEVEL');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_SKILLS_PER_LEVEL',
  p_report_region_title => 'Kdr Skills Per Level',
  p_form_region_title => 'Kdr Skills Per Level');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51071377824902561 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51071148755902560 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51071249611902561 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Category Skill Link',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51071590776902561 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_SKILL_LINK');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Category Type',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51071452242902561 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51072140609902563 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'LEVEL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Arcane Gain',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51072779024902564 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_ARCANE_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Category',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51071915502902562 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_CATEGORY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Chaos Gain',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51072804368902565 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_CHAOS_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Cost',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51072219031902563 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51071859250902562 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Div Gain',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51072589927902564 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_DIV_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Hp Gain',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51072906437902565 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_HP_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51071634069902561 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51072397325902563 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_LEVEL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51072001404902562 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_LEVEL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 592,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51071066556902560 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_LEVEL_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Mana Gain',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51072484431902563 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_MANA_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51071715406902562 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Xp Gain',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51072613754902564 + wwv_flow_api.g_id_offset,
  p_table_id => 51070995680902560 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_XP_GAIN');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_SKILLS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51073091109902565 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_SKILLS_VIEW',
  p_report_region_title => 'Kdr Skills View',
  p_form_region_title => 'Kdr Skills View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51073768762902567 + wwv_flow_api.g_id_offset,
  p_table_id => 51073091109902565 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51073561279902567 + wwv_flow_api.g_id_offset,
  p_table_id => 51073091109902565 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51073608986902567 + wwv_flow_api.g_id_offset,
  p_table_id => 51073091109902565 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Category Type',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51073878887902568 + wwv_flow_api.g_id_offset,
  p_table_id => 51073091109902565 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Category',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51073421025902566 + wwv_flow_api.g_id_offset,
  p_table_id => 51073091109902565 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_CATEGORY');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51073365465902566 + wwv_flow_api.g_id_offset,
  p_table_id => 51073091109902565 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51073130413902566 + wwv_flow_api.g_id_offset,
  p_table_id => 51073091109902565 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51073230494902566 + wwv_flow_api.g_id_offset,
  p_table_id => 51073091109902565 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_SKILL_CATEGORIES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50999264906894687 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_SKILL_CATEGORIES',
  p_report_region_title => 'Kdr Skill Categories',
  p_form_region_title => 'Kdr Skill Categories');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50999758070894689 + wwv_flow_api.g_id_offset,
  p_table_id => 50999264906894687 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50999590158894688 + wwv_flow_api.g_id_offset,
  p_table_id => 50999264906894687 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50999618860894689 + wwv_flow_api.g_id_offset,
  p_table_id => 50999264906894687 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Category Skill Link',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50999408676894688 + wwv_flow_api.g_id_offset,
  p_table_id => 50999264906894687 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_SKILL_LINK');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Category Type',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50999809474894689 + wwv_flow_api.g_id_offset,
  p_table_id => 50999264906894687 + wwv_flow_api.g_id_offset,
  p_column_name => 'CATEGORY_TYPE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50999398883894688 + wwv_flow_api.g_id_offset,
  p_table_id => 50999264906894687 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_SKILL_CATEGORY_TYPES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50999921341894690 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_SKILL_CATEGORY_TYPES',
  p_report_region_title => 'Kdr Skill Category Types',
  p_form_region_title => 'Kdr Skill Category Types');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51000043812894691 + wwv_flow_api.g_id_offset,
  p_table_id => 50999921341894690 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51000363641894692 + wwv_flow_api.g_id_offset,
  p_table_id => 50999921341894690 + wwv_flow_api.g_id_offset,
  p_column_name => 'TYPE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51000100609894691 + wwv_flow_api.g_id_offset,
  p_table_id => 50999921341894690 + wwv_flow_api.g_id_offset,
  p_column_name => 'TYPE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51000281737894691 + wwv_flow_api.g_id_offset,
  p_table_id => 50999921341894690 + wwv_flow_api.g_id_offset,
  p_column_name => 'TYPE_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_SKILL_LEVELS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51000497127894693 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_SKILL_LEVELS',
  p_report_region_title => 'Kdr Skill Levels',
  p_form_region_title => 'Kdr Skill Levels');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51000861979894694 + wwv_flow_api.g_id_offset,
  p_table_id => 51000497127894693 + wwv_flow_api.g_id_offset,
  p_column_name => 'LEVEL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51000598803894693 + wwv_flow_api.g_id_offset,
  p_table_id => 51000497127894693 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Arcane Gain',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51001465675894697 + wwv_flow_api.g_id_offset,
  p_table_id => 51000497127894693 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_ARCANE_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Chaos Gain',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51001500762894697 + wwv_flow_api.g_id_offset,
  p_table_id => 51000497127894693 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_CHAOS_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Cost',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51000960343894694 + wwv_flow_api.g_id_offset,
  p_table_id => 51000497127894693 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51001011291894695 + wwv_flow_api.g_id_offset,
  p_table_id => 51000497127894693 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Div Gain',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51001273780894696 + wwv_flow_api.g_id_offset,
  p_table_id => 51000497127894693 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_DIV_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Hp Gain',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51001604444894697 + wwv_flow_api.g_id_offset,
  p_table_id => 51000497127894693 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_HP_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51000748542894694 + wwv_flow_api.g_id_offset,
  p_table_id => 51000497127894693 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51000634361894694 + wwv_flow_api.g_id_offset,
  p_table_id => 51000497127894693 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_LEVEL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Mana Gain',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51001102253894695 + wwv_flow_api.g_id_offset,
  p_table_id => 51000497127894693 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_MANA_GAIN');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Skill Xp Gain',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51001354354894696 + wwv_flow_api.g_id_offset,
  p_table_id => 51000497127894693 + wwv_flow_api.g_id_offset,
  p_column_name => 'SKILL_XP_GAIN');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_SKILL_TREE_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51073954566902568 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_SKILL_TREE_VIEW',
  p_report_region_title => 'Kdr Skill Tree View',
  p_form_region_title => 'Kdr Skill Tree View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Icon',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 11,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51074553063902570 + wwv_flow_api.g_id_offset,
  p_table_id => 51073954566902568 + wwv_flow_api.g_id_offset,
  p_column_name => 'ICON');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Isleaf',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51074157470902569 + wwv_flow_api.g_id_offset,
  p_table_id => 51073954566902568 + wwv_flow_api.g_id_offset,
  p_column_name => 'IsLeaf');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Link',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51074853648902570 + wwv_flow_api.g_id_offset,
  p_table_id => 51073954566902568 + wwv_flow_api.g_id_offset,
  p_column_name => 'LINK');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Path',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51074203554902569 + wwv_flow_api.g_id_offset,
  p_table_id => 51073954566902568 + wwv_flow_api.g_id_offset,
  p_column_name => 'Path');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Status',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51074059842902569 + wwv_flow_api.g_id_offset,
  p_table_id => 51073954566902568 + wwv_flow_api.g_id_offset,
  p_column_name => 'STATUS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Title',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51074442911902569 + wwv_flow_api.g_id_offset,
  p_table_id => 51073954566902568 + wwv_flow_api.g_id_offset,
  p_column_name => 'TITLE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tooltip',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51074759668902570 + wwv_flow_api.g_id_offset,
  p_table_id => 51073954566902568 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOOLTIP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Value',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 49,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51074638105902570 + wwv_flow_api.g_id_offset,
  p_table_id => 51073954566902568 + wwv_flow_api.g_id_offset,
  p_column_name => 'VALUE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Level',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51074372587902569 + wwv_flow_api.g_id_offset,
  p_table_id => 51073954566902568 + wwv_flow_api.g_id_offset,
  p_column_name => 'level');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_SPELLS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51001723153894699 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_SPELLS',
  p_report_region_title => 'Kdr Spells',
  p_form_region_title => 'Kdr Spells');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51001887292894700 + wwv_flow_api.g_id_offset,
  p_table_id => 51001723153894699 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_help_text => 'Omschrijving',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51002507980894703 + wwv_flow_api.g_id_offset,
  p_table_id => 51001723153894699 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Distance',
  p_help_text => 'Afstand',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51002132374894701 + wwv_flow_api.g_id_offset,
  p_table_id => 51001723153894699 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_DISTANCE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Duration',
  p_help_text => 'Duratie',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51002236917894701 + wwv_flow_api.g_id_offset,
  p_table_id => 51001723153894699 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_DURATION');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_help_text => 'Spreuk ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51001921964894700 + wwv_flow_api.g_id_offset,
  p_table_id => 51001723153894699 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_help_text => 'Niveau',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 2,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51002476315894702 + wwv_flow_api.g_id_offset,
  p_table_id => 51001723153894699 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Mana Cost',
  p_help_text => 'Benodigde mana',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51002631794894703 + wwv_flow_api.g_id_offset,
  p_table_id => 51001723153894699 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_MANA_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_help_text => 'Naam spreuk',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51002024345894700 + wwv_flow_api.g_id_offset,
  p_table_id => 51001723153894699 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Target',
  p_help_text => 'Doelwit',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51002335377894702 + wwv_flow_api.g_id_offset,
  p_table_id => 51001723153894699 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TARGET');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Type Code',
  p_help_text => 'Element',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51002758504894703 + wwv_flow_api.g_id_offset,
  p_table_id => 51001723153894699 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TYPE_CODE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Usage',
  p_help_text => 'Gebruik',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51002841701894704 + wwv_flow_api.g_id_offset,
  p_table_id => 51001723153894699 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_USAGE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_SPELLS_VIEW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_SPELLS_VIEW',
  p_report_region_title => 'Kdr Spells View',
  p_form_region_title => 'Kdr Spells View');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51075569095902573 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'DISTANCE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Distance Tooltip',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51075619567902573 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'DISTANCE_TOOLTIP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51075857613902573 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'DURATION_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Duration Tooltip',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51075953552902573 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'DURATION_TOOLTIP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 32000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51076274048902574 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Distance',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51075445778902572 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_DISTANCE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Duration',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51075719156902573 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_DURATION');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51075247482902572 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Niveau',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 192,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51076154611902574 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_LEVEL');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Mana Cost',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51076356292902574 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_MANA_COST');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51075396846902572 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Publiekelijk zichtbaar',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51075060738902571 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Target',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51076032144902574 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TARGET');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Type Code',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51076417932902575 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TYPE_CODE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51076508528902575 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TYPE_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Type Publiekelijk zichtbaar',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51075108402902572 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TYPE_PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Type Tooltip',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51076611828902575 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TYPE_TOOLTIP');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Usage',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51076735555902576 + wwv_flow_api.g_id_offset,
  p_table_id => 51074926259902571 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_USAGE');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_SPELL_TYPES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51002945331894704 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_SPELL_TYPES',
  p_report_region_title => 'Kdr Spell Types',
  p_form_region_title => 'Kdr Spell Types');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Publiekelijk zichtbaar',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51003064527894705 + wwv_flow_api.g_id_offset,
  p_table_id => 51002945331894704 + wwv_flow_api.g_id_offset,
  p_column_name => 'PUBLIC_VIEW');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Type Code',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51003102527894705 + wwv_flow_api.g_id_offset,
  p_table_id => 51002945331894704 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TYPE_CODE');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51003393632894706 + wwv_flow_api.g_id_offset,
  p_table_id => 51002945331894704 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TYPE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Spell Type Icon',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51003418775894706 + wwv_flow_api.g_id_offset,
  p_table_id => 51002945331894704 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TYPE_ICON');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51003269161894705 + wwv_flow_api.g_id_offset,
  p_table_id => 51002945331894704 + wwv_flow_api.g_id_offset,
  p_column_name => 'SPELL_TYPE_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_TAGS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51003535446894707 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_TAGS',
  p_report_region_title => 'Kdr Tags',
  p_form_region_title => 'Kdr Tags');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51003662199894707 + wwv_flow_api.g_id_offset,
  p_table_id => 51003535446894707 + wwv_flow_api.g_id_offset,
  p_column_name => 'TAG_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51003798989894707 + wwv_flow_api.g_id_offset,
  p_table_id => 51003535446894707 + wwv_flow_api.g_id_offset,
  p_column_name => 'TAG_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_TEST_VW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51076860111902576 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_TEST_VW',
  p_report_region_title => 'Kdr Test Vw',
  p_form_region_title => 'Kdr Test Vw');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dummy',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51076993651902576 + wwv_flow_api.g_id_offset,
  p_table_id => 51076860111902576 + wwv_flow_api.g_id_offset,
  p_column_name => 'DUMMY');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_TODO');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51003849366894708 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_TODO',
  p_report_region_title => 'Kdr Todo',
  p_form_region_title => 'Kdr Todo');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51003987103894709 + wwv_flow_api.g_id_offset,
  p_table_id => 51003849366894708 + wwv_flow_api.g_id_offset,
  p_column_name => 'TODO_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Todo Text',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51004080289894709 + wwv_flow_api.g_id_offset,
  p_table_id => 51003849366894708 + wwv_flow_api.g_id_offset,
  p_column_name => 'TODO_TEXT');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_USAGES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 51010621109894733 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_USAGES',
  p_report_region_title => 'Kdr Usages',
  p_form_region_title => 'Kdr Usages');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Omschrijving',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51010982502894734 + wwv_flow_api.g_id_offset,
  p_table_id => 51010621109894733 + wwv_flow_api.g_id_offset,
  p_column_name => 'USAGE_DESC');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 51010777841894734 + wwv_flow_api.g_id_offset,
  p_table_id => 51010621109894733 + wwv_flow_api.g_id_offset,
  p_column_name => 'USAGE_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_form_attribute_05 => 'BOTH',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 51010845751894734 + wwv_flow_api.g_id_offset,
  p_table_id => 51010621109894733 + wwv_flow_api.g_id_offset,
  p_column_name => 'USAGE_NAME');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_WEEKS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50974496936894583 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_WEEKS',
  p_report_region_title => 'Kdr Weeks',
  p_form_region_title => 'Kdr Weeks');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50974586462894583 + wwv_flow_api.g_id_offset,
  p_table_id => 50974496936894583 + wwv_flow_api.g_id_offset,
  p_column_name => 'WEEK_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Volgnummer',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50974643650894583 + wwv_flow_api.g_id_offset,
  p_table_id => 50974496936894583 + wwv_flow_api.g_id_offset,
  p_column_name => 'WEEK_SEQ');

end;
/


begin

wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'KDR_YEARS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 50973023775894578 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'KDR_YEARS',
  p_report_region_title => 'Kdr Years',
  p_form_region_title => 'Kdr Years');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Year Amt Months',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50973401181894579 + wwv_flow_api.g_id_offset,
  p_table_id => 50973023775894578 + wwv_flow_api.g_id_offset,
  p_column_name => 'YEAR_AMT_MONTHS');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'ID',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 50973125804894579 + wwv_flow_api.g_id_offset,
  p_table_id => 50973023775894578 + wwv_flow_api.g_id_offset,
  p_column_name => 'YEAR_ID');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Naam',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50973288370894579 + wwv_flow_api.g_id_offset,
  p_table_id => 50973023775894578 + wwv_flow_api.g_id_offset,
  p_column_name => 'YEAR_NAME');

end;
/


begin

wwv_flow_hint.create_column_hint_priv(
  p_label => 'Year Number',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'BOTH',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'ESCAPE_SC',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 50973393271894579 + wwv_flow_api.g_id_offset,
  p_table_id => 50973023775894578 + wwv_flow_api.g_id_offset,
  p_column_name => 'YEAR_NUMBER');

end;
/

commit;
begin
execute immediate 'alter session set nls_numeric_characters='''||wwv_flow_api.g_nls_numeric_chars||'''';
end;
/
set verify on
set feedback on
prompt  ...done
