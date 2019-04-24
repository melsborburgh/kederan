set define off verify off feedback off

create or replace package aop_api18_pkg
AUTHID CURRENT_USER
as

/* Copyright 2015-2018 - APEX RnD
*/

-- CONSTANTS
 
/* AOP Version */
c_aop_version               constant varchar2(5)  := '18.2';                                 -- The version of APEX Office Print (AOP)
c_aop_url                   constant varchar2(50) := 'http://api.apexofficeprint.com/';      -- The default url for the AOP Server
                                                                                             -- for https use https://api.apexofficeprint.com/
                                                                                             -- alternative https url https://www.apexrnd.be/aop/
c_aop_url_fallback          constant varchar2(50) := 'http://www.cloudofficeprint.com/aop/'; -- The default url for the AOP Fallback Server in case the c_aop_url would fail
                                                                                             -- for https use https://www.cloudofficeprint.com/aop/

-- Available constants
-- Template and Data Type
c_source_type_apex          constant varchar2(4)  := 'APEX';      -- Template Type
c_source_type_workspace     constant varchar2(9)  := 'WORKSPACE'; -- Template Type
c_source_type_sql           constant varchar2(3)  := 'SQL';       -- Template and Data Type
c_source_type_plsql_sql     constant varchar2(9)  := 'PLSQL_SQL'; -- Template and Data Type
c_source_type_plsql         constant varchar2(5)  := 'PLSQL';     -- Template and Data Type
c_source_type_url           constant varchar2(3)  := 'URL';       -- Template and Data Type
c_source_type_rpt           constant varchar2(6)  := 'IR';        -- Data Type
c_source_type_filename      constant varchar2(8)  := 'FILENAME';  -- Template Type
-- Converter
c_source_type_converter     constant varchar2(9)  := 'CONVERTER';
-- Mime Type
c_mime_type_docx            constant varchar2(71) := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
c_mime_type_xlsx            constant varchar2(65) := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
c_mime_type_pptx            constant varchar2(73) := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
c_mime_type_pdf             constant varchar2(15) := 'application/pdf';
c_mime_type_html            constant varchar2(9)  := 'text/html';
c_mime_type_markdown        constant varchar2(13) := 'text/markdown';
c_mime_type_rtf             constant varchar2(15) := 'application/rtf';
c_mime_type_json            constant varchar2(16) := 'application/json';
c_mime_type_text            constant varchar2(10) := 'text/plain';
c_mime_type_csv             constant varchar2(10) := 'text/csv';
c_mime_type_png             constant varchar2(9)  := 'image/png';
c_mime_type_jpg             constant varchar2(10) := 'image/jpeg';
c_mime_type_gif             constant varchar2(9)  := 'image/gif';
c_mime_type_bmp             constant varchar2(9)  := 'image/bmp';
c_mime_type_msbmp           constant varchar2(19) := 'image/x-windows-bmp';
-- Output Encoding
c_output_encoding_raw       constant varchar2(3)  := 'raw';
c_output_encoding_base64    constant varchar2(6)  := 'base64';
-- Output Type
c_word_docx                 constant varchar2(4)  := 'docx';
c_excel_xlsx                constant varchar2(4)  := 'xlsx';
c_powerpoint_pptx           constant varchar2(4)  := 'pptx'; 
c_pdf_pdf                   constant varchar2(3)  := 'pdf'; 
c_html_html                 constant varchar2(4)  := 'html';
c_markdown_md               constant varchar2(2)  := 'md';
c_text_txt                  constant varchar2(3)  := 'txt'; 
c_csv_csv                   constant varchar2(3)  := 'csv'; 
c_word_rtf                  constant varchar2(3)  := 'rtf';
c_onepagepdf_pdf            constant varchar2(10) := 'onepagepdf';
c_count_tags                constant varchar2(10)  := 'count_tags';
c_defined_by_apex_item      constant varchar2(9)  := 'apex_item';
-- Output To
c_output_browser            constant varchar2(1)  := null;
c_output_procedure          constant varchar2(9)  := 'PROCEDURE';
c_output_procedure_browser  constant varchar2(17) := 'PROCEDURE_BROWSER';
c_output_inline             constant varchar2(14) := 'BROWSER_INLINE'; 
c_output_directory          constant varchar2(9)  := 'DIRECTORY';
c_output_cloud              constant varchar2(5)  := 'CLOUD';
-- Special
c_special_number_as_string  constant varchar2(16) := 'NUMBER_TO_STRING';
c_special_report_as_label   constant varchar2(16) := 'REPORT_AS_LABELS';
c_special_ir_filters_top    constant varchar2(14) := 'FILTERS_ON_TOP';
c_special_ir_highlights_top constant varchar2(17) := 'HIGHLIGHTS_ON_TOP';
c_special_ir_excel_header_f constant varchar2(18) := 'HEADER_WITH_FILTER';
c_special_ir_saved_report   constant varchar2(19) := 'ALWAYS_REPORT_ALIAS';
c_special_ir_repeat_header  constant varchar2(13) := 'repeat_header';
-- Debug
c_debug_remote              constant varchar2(3)  := 'Yes';
c_debug_local               constant varchar2(5)  := 'Local';
c_debug_application_item    constant varchar2(9)  := 'APEX_ITEM';
-- Converter
c_converter_libreoffice     constant varchar2(1)  := null;           -- LibreOffice is the default converter
c_converter_msoffice        constant varchar2(11) := 'officetopdf';  -- MS Office on Windows
c_converter_custom          constant varchar2(7)  := 'custom';       -- Custom converter defined in the AOP Server config
/* Strings */
c_init_null                 constant varchar2(5)  := 'null;';
c_false                     constant varchar2(5)  := 'false';
c_true                      constant varchar2(4)  := 'true';
c_yes                       constant varchar2(3)  := 'Yes';
c_no                        constant varchar2(2)  := 'No';
c_y                         constant varchar2(1)  := 'Y';
c_n                         constant varchar2(1)  := 'N';
/* Internal Use for conditional compilation */
c_apex_050                  constant pls_integer  := 20130101;
c_apex_051                  constant pls_integer  := 20160824;
c_apex_181                  constant pls_integer  := 20180404;


-- TYPES
/**
 * @types
 */

--type t_bind_record is record(name varchar2(100), value varchar2(32767));
--type t_bind_table  is table of t_bind_record index by pls_integer;
c_binds wwv_flow_plugin_util.t_bind_list;


-- VARIABLES

-- Logger
g_logger_enabled            boolean := true;        -- In case you use Logger (https://github.com/OraOpenSource/Logger), you can compile this package to enable Logger output:
                                                    -- SQL> ALTER PACKAGE aop_api18_pkg COMPILE PLSQL_CCFLAGS = 'logger_on:TRUE'; 
                                                    -- When compiled and this global variable is set to true, debug will be written to logger too
-- Call to AOP
g_aop_url                   varchar2(100) := null;  -- AOP Server url
g_api_key                   varchar2(50)  := null;  -- AOP API Key; only needed when AOP Cloud is used (http(s)://www.apexofficeprint.com/api)
g_failover_aop_url          varchar2(100) := null;  -- AOP Server url in case of failure of AOP url
g_failover_procedure        varchar2(200) := null;  -- When the failover url is used, the procedure specified in this variable will be called
g_output_converter          varchar2(50)  := null;  -- Set the converter to go to PDF (or other format different from template) e.g. officetopdf or libreoffice
g_proxy_override            varchar2(300) := null;  -- null=proxy defined in the application attributes
g_transfer_timeout          number(6)     := 1800;  -- default of APEX is 180
g_wallet_path               varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
g_wallet_pwd                varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
g_output_filename           varchar2(100) := null;  -- output
g_cloud_provider            varchar2(30)  := null;  -- dropbox, gdrive, onedrive, aws_s3
g_cloud_location            varchar2(300) := null;  -- directory in dropbox, gdrive, onedrive, aws_s3 (with bucket)
g_cloud_access_token        varchar2(500) := null;  -- access token for dropbox, gdrive, onedrive, aws_s3 (needs json)
g_language                  varchar2(2)   := 'en';  -- Language can be: en, fr, nl, de, used for the translation of filters applied etc. (translation build-in AOP)
g_app_language              varchar2(20)  := null;  -- Language specified in the APEX app (primary language, translated language), when left to null, apex_util.get_session_lang is being used
g_logging                   clob          := '';    -- ability to add your own logging: e.g. "request_id":"123", "request_app":"APEX", "request_user":"RND"
g_debug                     varchar2(10)  := null;  -- set to 'Local' when only the JSON needs to be generated, 'Remote' for remore debug
g_debug_procedure           varchar2(4000):= null;  -- when debug in APEX is turned on, next to the normal APEX debug, this procedure will be called
                                                    --   e.g. to write to your own debug table. The definition of the procedure needs to be the same as aop_debug
-- APEX Page Items
g_apex_items                varchar2(4000):= null;  -- colon separated list of APEX items e.g. P1_X:P1_Y, which can be referenced in a template using {Pxx_ITEM}                                                    
-- Layout for IR 
g_rpt_header_font_name      varchar2(50)  := '';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163
g_rpt_header_font_size      varchar2(3)   := '';    -- 14
g_rpt_header_font_color     varchar2(50)  := '';    -- #071626
g_rpt_header_back_color     varchar2(50)  := '';    -- #FAFAFA
g_rpt_header_border_width   varchar2(50)  := '';    -- 1 ; '0' = no border
g_rpt_header_border_color   varchar2(50)  := '';    -- #000000
g_rpt_data_font_name        varchar2(50)  := '';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163
g_rpt_data_font_size        varchar2(3)   := '';    -- 14
g_rpt_data_font_color       varchar2(50)  := '';    -- #000000
g_rpt_data_back_color       varchar2(50)  := '';    -- #FFFFFF
g_rpt_data_border_width     varchar2(50)  := '';    -- 1 ; '0' = no border
g_rpt_data_border_color     varchar2(50)  := '';    -- #000000
g_rpt_data_alt_row_color    varchar2(50)  := '';    -- #FFFFFF for no alt row color, use same color as g_rpt_data_back_color
/* see also Printing attributes in Interactive Report */
-- Settings for Calendar
g_cal_type                  varchar2(10)  := 'month'; -- can be month (default), week, day, list
g_start_date                date          := null;    -- start date of calendar
g_end_date                  date          := null;    -- end date of calendar
g_weekdays                  varchar2(300) := null;    -- translation for weekdays e.g. Monday:Tuesday:Wednesday etc.
g_months                    varchar2(300) := null;    -- translation for months   e.g. January:February etc.  
g_color_days_sql            varchar2(4000):= null;    -- color the background of certain days. 
                                                      --   e.g. select 1 as "id", sysdate as "date", 'FF8800' as "color" from dual
-- HTML template to Word/PDF
g_orientation               varchar2(50)  := '';      -- empty is portrait, other option is 'landscape'
-- Call to URL data source
g_url_username              varchar2(300) := null;
g_url_password              varchar2(300) := null;
g_url_proxy_override        varchar2(300) := null;
g_url_transfer_timeout      number        := 180;
g_url_body                  clob          := empty_clob();
g_url_body_blob             blob          := empty_blob();
g_url_parm_name             apex_application_global.vc_arr2; --:= empty_vc_arr;
g_url_parm_value            apex_application_global.vc_arr2; --:= empty_vc_arr;
g_url_wallet_path           varchar2(300) := null;
g_url_wallet_pwd            varchar2(300) := null;
g_url_https_host            varchar2(300) := null;    -- parameter for apex_web_service, not used, please apply APEX patch if issues
-- Web Source Module (APEX >= 18.1)
g_web_source_first_row      pls_integer   := null;    -- parameter for apex_exec.open_web_source_query
g_web_source_max_rows       pls_integer   := null;    -- parameter for apex_exec.open_web_source_query
g_web_source_total_row_cnt  boolean       := false;   -- parameter for apex_exec.open_web_source_query
-- REST Enabled SQL (APEX >= 18.1)
g_rest_sql_auto_bind_items  boolean       := true;    -- parameter for apex_exec.open_remote_sql_query
g_rest_sql_first_row        pls_integer   := null;    -- parameter for apex_exec.open_remote_sql_query
g_rest_sql_max_rows         pls_integer   := null;    -- parameter for apex_exec.open_remote_sql_query
g_rest_sql_total_row_cnt    boolean       := false;   -- parameter for apex_exec.open_remote_sql_query
g_rest_sql_total_row_limit  pls_integer   := null;    -- parameter for apex_exec.open_remote_sql_query
-- IP Printer support
g_ip_printer_location       varchar2(300) := null;
g_ip_printer_version        varchar2(300) := '1';
g_ip_printer_requester      varchar2(300) := nvl(apex_application.g_user, USER);
g_ip_printer_job_name       varchar2(300) := 'AOP';
g_ip_printer_return_output  varchar2(5)   := null;   -- null or 'Yes' or 'true'
-- Convert characterset
g_convert                   varchar2(1)   := c_n;    -- set to Y (c_y) if you want to convert the JSON that is send over; necessary for Arabic support
g_convert_source_charset    varchar2(20)  := null;   -- default of database 
g_convert_target_charset    varchar2(20)  := 'AL32UTF8';  
-- Output
g_output_directory          varchar2(200) := '.';    -- set output directory on AOP Server
                                                     -- if . is specified the files are saved in the default directory: outputfiles
g_output_split              varchar2(5)   := null;   -- split file: one file per page: true/false

-- Files
g_prepend_files_sql         clob := null;    -- format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server]
g_append_files_sql          clob := null;    --           from my_table

-- Sub-Templates
g_sub_templates_sql         clob := null;    -- format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server] from my_table

-- Password protected PDF
g_output_read_password      varchar2(200) := null;  -- protect PDF to read
g_output_modify_password    varchar2(200) := null;  -- protect PDF to write (modify)
g_output_pwd_protection_flag number(4)    := null;  -- optional; default is 4. 
                                                    -- Number when bit calculation is done as specified in http://pdfhummus.com/post/147451287581/hummus-1058-and-pdf-writer-updates-encryption

-- EXCEPTIONS
  /**
   * @exception 
   */


-- FUNCTIONS AND PROCEDURES   
/**
 * Functions and Procedures
 * 
 * ! package body contains documentation
 */

-- debug function, will write to apex_debug_messages, logger (if enabled) and your own debug procedure
procedure aop_debug(p_message     in varchar2, 
                    p0            in varchar2 default null, 
                    p1            in varchar2 default null, 
                    p2            in varchar2 default null, 
                    p3            in varchar2 default null, 
                    p4            in varchar2 default null, 
                    p5            in varchar2 default null, 
                    p6            in varchar2 default null, 
                    p7            in varchar2 default null, 
                    p8            in varchar2 default null, 
                    p9            in varchar2 default null, 
                    p10           in varchar2 default null, 
                    p11           in varchar2 default null, 
                    p12           in varchar2 default null, 
                    p13           in varchar2 default null, 
                    p14           in varchar2 default null, 
                    p15           in varchar2 default null, 
                    p16           in varchar2 default null, 
                    p17           in varchar2 default null, 
                    p18           in varchar2 default null, 
                    p19           in varchar2 default null, 
                    p_level       in apex_debug.t_log_level default apex_debug.c_log_level_info, 
                    p_description in clob default null);

-- convert a url with for example an image to base64
function url2base64 (
  p_url in varchar2)
  return clob;

-- get the value of one of the above constants
function getconstantvalue (
  p_constant in varchar2)
  return varchar2 deterministic;

-- get the mime type of a file extention: docx, xlsx, pptx, pdf
function getmimetype (
  p_file_ext in varchar2)
  return varchar2 deterministic;

-- get the file extention of a mime type
function getfileextension (
  p_mime_type in varchar2)
  return varchar2 deterministic;  

-- convert a blob to a clob
function blob2clob(p_blob in blob)
  return clob;

-- internal function to check a server-side condition
function is_component_used_yn(p_build_option_id         in number default null,
                              p_authorization_scheme_id in varchar2,
                              p_condition_type          in varchar2,
                              p_condition_expression1   in varchar2,
                              p_condition_expression2   in varchar2,
                              p_component               in varchar2 default null)
  return varchar2;

-- Manual call to AOP
-- p_aop_remote_debug: 
--   - No            : No debugging (= Default)
--   - Yes (=Remote) : Data is send to the AOP cloud server
--   - Local         : A JSON file is generated locally from your database server
-- p_special options: NUMBER_TO_STRING, ALWAYS_REPORT_ALIAS, FILTERS_ON_TOP, HIGHLIGHTS_ON_TOP, HEADER_WITH_FILTER
-- usage: p_special => 'ALWAYS_REPORT_ALIAS' or multiple p_special => 'FILTERS_ON_TOP:HIGHLIGHTS_ON_TOP'
function plsql_call_to_aop(
  p_data_type             in varchar2 default c_source_type_sql,
  p_data_source           in clob,
  p_template_type         in varchar2 default c_source_type_apex,
  p_template_source       in clob,
  p_output_type           in varchar2,
  p_output_filename       in out nocopy varchar2,
  p_output_type_item_name in varchar2 default null,
  p_output_to             in varchar2 default null,
  p_procedure             in varchar2 default null,
  p_binds                 in wwv_flow_plugin_util.t_bind_list default c_binds,
  p_special               in varchar2 default null,
  p_aop_remote_debug      in varchar2 default c_no,
  p_output_converter      in varchar2 default null,
  p_aop_url               in varchar2,
  p_api_key               in varchar2 default null,
  p_app_id                in number   default null,
  p_page_id               in number   default null,
  p_user_name             in varchar2 default null,
  p_init_code             in clob     default c_init_null,
  p_output_encoding       in varchar2 default c_output_encoding_raw,
  p_output_split          in varchar2 default c_false,
  p_failover_aop_url      in varchar2 default null,
  p_failover_procedure    in varchar2 default null,
  p_log_procedure         in varchar2 default null,
  p_prepend_files_sql     in clob     default null,
  p_append_files_sql      in clob     default null,
  p_sub_templates_sql     in clob     default null)
  return blob;

-- retrieve underlaying PL/SQL code of APEX Plug-in call
function show_plsql_call_plugin(
  p_process_id            in number   default null,
  p_dynamic_action_id     in number   default null,
  p_show_api_key          in varchar2 default c_no)
  return clob;


-- APEX Plugins

-- Process Type Plugin
function f_process_aop(
  p_process in apex_plugin.t_process,
  p_plugin  in apex_plugin.t_plugin)
  return apex_plugin.t_process_exec_result;

-- Dynamic Action Plugin
function f_render_aop (
  p_dynamic_action in apex_plugin.t_dynamic_action,
  p_plugin         in apex_plugin.t_plugin)
  return apex_plugin.t_dynamic_action_render_result;

function f_ajax_aop(
  p_dynamic_action in apex_plugin.t_dynamic_action,
  p_plugin         in apex_plugin.t_plugin)
  return apex_plugin.t_dynamic_action_ajax_result;


-- Other Procedure

-- Create an APEX session from PL/SQL
-- p_enable_debug: Yes / No (default)
procedure create_apex_session(
  p_app_id       in apex_applications.application_id%type,
  p_user_name    in apex_workspace_sessions.user_name%type default 'ADMIN',
  p_page_id      in apex_application_pages.page_id%type default null,
  p_session_id   in apex_workspace_sessions.apex_session_id%type default null,
  p_enable_debug in varchar2 default 'No');

-- Get the current APEX Session
function get_apex_session
  return apex_workspace_sessions.apex_session_id%type;

-- Join an APEX Session
procedure join_apex_session(
  p_session_id   in apex_workspace_sessions.apex_session_id%type,
  p_app_id       in apex_applications.application_id%type default null,
  p_page_id      in apex_application_pages.page_id%type default null,
  p_enable_debug in varchar2 default 'No');

-- Drop the current APEX Session
procedure drop_apex_session(
  p_app_id     in apex_applications.application_id%type default null,
  p_session_id in apex_workspace_sessions.apex_session_id%type default null);

end aop_api18_pkg;
/


create or replace package body aop_api18_pkg wrapped 
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
44478 c594
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

/
create or replace package aop_plsql18_pkg
AUTHID CURRENT_USER
as

/* Copyright 2015-2018 - APEX RnD
*/

/* AOP Version */
c_aop_version  constant varchar2(5)   := '18.2';

--
-- Pre-requisites: apex_web_service package
-- if APEX is not installed, you can use this package as your starting point
-- but you would need to change the apex_web_service calls by utl_http calls or similar
--


--
-- Change following variables for your environment
--
g_aop_url  varchar2(200) := 'http://api.apexofficeprint.com/'; -- for https use https://api.apexofficeprint.com/
g_api_key  varchar2(200) := '';                                -- change to your API key

-- Global variables
-- Call to AOP
g_proxy_override          varchar2(300) := null;  -- null=proxy defined in the application attributes
g_transfer_timeout        number(6)     := 180;   -- default is 180
g_wallet_path             varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
g_wallet_pwd              varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings

-- Constants
c_mime_type_docx        varchar2(100) := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
c_mime_type_xlsx        varchar2(100) := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
c_mime_type_pptx        varchar2(100) := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
c_mime_type_pdf         varchar2(100) := 'application/pdf';

function make_aop_request(
  p_aop_url          in varchar2 default g_aop_url,
  p_api_key          in varchar2 default g_api_key,
  p_json             in clob,
  p_template         in blob,
  p_output_encoding  in varchar2 default 'raw', -- change to raw to have binary, change to base64 to have base64 encoded
  p_output_type      in varchar2 default null,
  p_output_filename  in varchar2 default 'output',
  p_aop_remote_debug in varchar2 default 'No')
  return blob;

end aop_plsql18_pkg;
/
/**
 * @Description: Package to show how to make a manual call with PL/SQL to the AOP Server
 *               If APEX is not installed, you can use this package as your starting point but you would need to change the apex_web_service calls by utl_http calls or similar.
 *
 * @Author: Dimitri Gielis
 * @Created: 12/12/2015
 */

create or replace package body aop_plsql18_pkg as


function replace_with_clob(
   p_source in clob
  ,p_search in varchar2
  ,p_replace in clob
) return clob
as
  l_pos pls_integer;
begin
  l_pos := instr(p_source, p_search);
  if l_pos > 0 then
    return substr(p_source, 1, l_pos-1)
      || p_replace
      || substr(p_source, l_pos+length(p_search));
  end if;
  return p_source;
end replace_with_clob;


/**
 * @Description: Example how to make a manual call to the AOP Server and generate the correct JSON.               
 *
 * @Author: Dimitri Gielis
 * @Created: 9/1/2018
 *
 * @Param: p_aop_url URL of AOP Server
 * @Param: p_api_key API Key in case AOP Cloud is used
 * @Param: p_json Data in JSON format
 * @Param: p_template Template in blob format
 * @Param: p_output_encoding Encoding in raw or base64
 * @Param: p_output_type The extension of the output e.g. pdf, if no output type is defined, the same extension as the template is used
 * @Param: p_output_filename Filename of the result
 * @Param: p_aop_remote_debug Ability to do remote debugging in case the AOP Cloud is used
 * @Return: Resulting file where the template and data are merged and outputted in the requested format (output type).
 */
function make_aop_request(
  p_aop_url          in varchar2 default g_aop_url,
  p_api_key          in varchar2 default g_api_key,
  p_json             in clob,
  p_template         in blob,
  p_output_encoding  in varchar2 default 'raw',  
  p_output_type      in varchar2 default null,
  p_output_filename  in varchar2 default 'output',
  p_aop_remote_debug in varchar2 default 'No')
  return blob
as
  l_output_converter  varchar2(20) := ''; --default
  l_aop_json          clob;
  l_template_clob     clob;
  l_template_type     varchar2(4);
  l_data_json         clob;
  l_output_type       varchar2(4);
  l_blob              blob;
  l_error_description varchar2(32767);
begin
  l_template_clob := apex_web_service.blob2clobbase64(p_template);
  l_template_clob := replace(l_template_clob, chr(13) || chr(10), null);
  l_template_clob := replace(l_template_clob, '"', '\u0022');
  if dbms_lob.instr(p_template, utl_raw.cast_to_raw('ppt/presentation'))> 0
  then
    l_template_type := 'pptx';
  elsif dbms_lob.instr(p_template, utl_raw.cast_to_raw('worksheets/'))> 0
  then
    l_template_type := 'xlsx';
  elsif dbms_lob.instr(p_template, utl_raw.cast_to_raw('word/document'))> 0
  then
    l_template_type := 'docx';
  else
    l_template_type := 'unknown';
  end if;

  if p_output_type is null
  then
    l_output_type := l_template_type;
  else
    l_output_type := p_output_type;
  end if;

  l_data_json := p_json;

  l_aop_json := '
  {
      "version": "***AOP_VERSION***",
      "api_key": "***AOP_API_KEY***",
      "aop_remote_debug": "***AOP_REMOTE_DEBUG***",
      "template": {
        "file":"***AOP_TEMPLATE_BASE64***",
         "template_type": "***AOP_TEMPLATE_TYPE***"
      },
      "output": {
        "output_encoding": "***AOP_OUTPUT_ENCODING***",
        "output_type": "***AOP_OUTPUT_TYPE***",
        "output_converter": "***AOP_OUTPUT_CONVERTER***"
      },
      "files":
        ***AOP_DATA_JSON***
  }';

  l_aop_json := replace(l_aop_json, '***AOP_VERSION***', c_aop_version);
  l_aop_json := replace(l_aop_json, '***AOP_API_KEY***', p_api_key);
  l_aop_json := replace(l_aop_json, '***AOP_REMOTE_DEBUG***', p_aop_remote_debug);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_TEMPLATE_BASE64***', l_template_clob);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_TEMPLATE_TYPE***', l_template_type);
  l_aop_json := replace(l_aop_json, '***AOP_OUTPUT_ENCODING***', p_output_encoding);
  l_aop_json := replace(l_aop_json, '***AOP_OUTPUT_TYPE***', l_output_type);
  l_aop_json := replace(l_aop_json, '***AOP_OUTPUT_CONVERTER***', l_output_converter);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_DATA_JSON***', l_data_json);
  l_aop_json := replace(l_aop_json, '\\n', '\n');

  apex_web_service.g_request_headers(1).name := 'Content-Type';
  apex_web_service.g_request_headers(1).value := 'application/json';

  begin
    l_blob := apex_web_service.make_rest_request_b(
      p_url              => p_aop_url,
      p_http_method      => 'POST',
      p_body             => l_aop_json,
      p_proxy_override   => g_proxy_override,
      p_transfer_timeout => g_transfer_timeout,
      p_wallet_path      => g_wallet_path,
      p_wallet_pwd       => g_wallet_pwd);
  exception
  when others
  then
    raise_application_error(-20001,'Issue calling AOP Service (REST call: ' || apex_web_service.g_status_code || '): ' || CHR(10) || SQLERRM);
  end;

  -- read header variable and create error message
  -- HTTP Status Codes:
  --  200 is normal
  --  500 error received
  --  503 Service Temporarily Unavailable, the AOP server is probably not running
  if apex_web_service.g_status_code = 200
  then
    l_error_description := null;
  elsif apex_web_service.g_status_code = 503
  then
    l_error_description := 'AOP Server not running.';
  elsif apex_web_service.g_status_code = 500
  then
    for l_loop in 1.. apex_web_service.g_headers.count loop
      if apex_web_service.g_headers(l_loop).name = 'error_description'
      then
        l_error_description := apex_web_service.g_headers(l_loop).value;
        -- errors returned by AOP server are base64 encoded
        l_error_description := utl_encode.text_decode(l_error_description, 'AL32UTF8', UTL_ENCODE.BASE64);
      end if;
    end loop;
  else
    l_error_description := 'Unknown error. Check AOP server logs.';
  end if;

  -- YOU CAN STORE THE L_BLOB TO A LOCAL DEBUG TABLE AS AOP SERVER RETURNS A DOCUMENT WITH MORE INFORMATION
  --

  -- check if succesfull
  if apex_web_service.g_status_code <> 200
  then
    raise_application_error(-20002,'Issue returned by AOP Service (REST call: ' || apex_web_service.g_status_code || '): ' || CHR(10) || l_error_description);
  end if;

  -- return print
  return l_blob;

end make_aop_request;

end aop_plsql18_pkg;
/
create or replace package aop_convert18_pkg
AUTHID CURRENT_USER
as

/* Copyright 2015-2018 - APEX RnD
*/

-- CONSTANTS

/* AOP Version */
c_aop_version             constant varchar2(5) := '18.2';
c_aop_url                 constant varchar2(50) := 'http://api.apexofficeprint.com/'; -- for https use https://api.apexofficeprint.com/
-- Mime Types
c_mime_type_docx          constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
c_mime_type_xlsx          constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
c_mime_type_pptx          constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
c_mime_type_pdf           constant varchar2(100) := 'application/pdf';
c_mime_type_html          constant varchar2(100) := 'text/html';
c_mime_type_markdown      constant varchar2(100) := 'text/markdown';
c_mime_type_rtf           constant varchar2(100) := 'application/rtf';
c_mime_type_json          constant varchar2(100) := 'application/json';
c_mime_type_text          constant varchar2(100) := 'text/plain';
c_mime_type_zip           constant varchar2(100) := 'application/zip';
-- Output
c_output_encoding_raw     constant varchar2(3) := 'raw';
c_output_encoding_base64  constant varchar2(6) := 'base64';
/* Init */
c_init_null               constant varchar2(5) := 'null;';
c_source_type_sql         constant varchar2(3) := 'SQL';

-- VARIABLES

-- Logger
g_logger_enabled          constant boolean := false;  -- set to true to write extra debug output to logger - see https://github.com/OraOpenSource/Logger

-- Call to AOP
g_proxy_override          varchar2(300) := null;  -- null=proxy defined in the application attributes
g_https_host              varchar2(300) := null;  -- parameter for utl_http and apex_web_service
g_transfer_timeout        number(6)     := 1800;  -- default of APEX is 180
g_wallet_path             varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
g_wallet_pwd              varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
g_output_filename         varchar2(100) := null;  -- output
g_language                varchar2(2)   := 'en';  -- Language can be: en, fr, nl, de
g_logging                 clob          := '';    -- ability to add your own logging: e.g. "request_id":"123", "request_app":"APEX", "request_user":"RND"
g_debug                   varchar2(10)  := null;  -- set to 'Local' when only the JSON needs to be generated, 'Remote' for remore debug
g_debug_procedure         varchar2(4000):= null;  -- when debug in APEX is turned on, next to the normal APEX debug, this procedure will be called
   

--
-- Convert one or more files by using a SQL query with following syntax (between [] can be one or more columns)
-- select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server] from my_table
--
function convert_files(
  p_query                 in clob,
  p_output_type           in varchar2,
  p_output_encoding       in varchar2 default c_output_encoding_raw,
  p_output_to             in varchar2 default null,
  p_output_filename       in out nocopy varchar2,  
  p_output_converter      in varchar2 default null,
  p_output_collection     in varchar2 default null,
  p_aop_remote_debug      in varchar2 default 'No',
  p_aop_url               in varchar2,
  p_api_key               in varchar2 default null,
  p_app_id                in number   default null,
  p_page_id               in number   default null,
  p_user_name             in varchar2 default null,
  p_init_code             in clob     default c_init_null,
  p_failover_aop_url      in varchar2 default null,
  p_failover_procedure    in varchar2 default null,
  p_log_procedure         in varchar2 default null
) return blob;


-- APEX Plugins

-- Process Type Plugin
/*
function f_process_aop(
  p_process in apex_plugin.t_process,
  p_plugin  in apex_plugin.t_plugin)
  return apex_plugin.t_process_exec_result;
*/
-- Dynamic Action Plugin
function f_render_aop (
  p_dynamic_action in apex_plugin.t_dynamic_action,
  p_plugin         in apex_plugin.t_plugin)
  return apex_plugin.t_dynamic_action_render_result;

function f_ajax_aop(
  p_dynamic_action in apex_plugin.t_dynamic_action,
  p_plugin         in apex_plugin.t_plugin)
  return apex_plugin.t_dynamic_action_ajax_result;


end aop_convert18_pkg;
/
create or replace package body aop_convert18_pkg wrapped 
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
3f7d 1347
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

/
create or replace synonym aop_api_pkg for aop_api18_pkg;
create or replace synonym aop_plsql_pkg for aop_plsql18_pkg;
create or replace synonym aop_convert_pkg for aop_convert18_pkg;
