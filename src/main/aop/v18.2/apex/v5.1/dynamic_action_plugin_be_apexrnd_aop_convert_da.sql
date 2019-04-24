prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.4.00.08'
,p_default_workspace_id=>36378915130075744
,p_default_application_id=>232
,p_default_owner=>'APEXOFFICEPRINT'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/be_apexrnd_aop_convert_da
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2010965116496925677)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'BE.APEXRND.AOP_CONVERT_DA'
,p_display_name=>'APEX Office Print (AOP) - Convert DA'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#js/aop_da.min.js'
,p_api_version=>1
,p_render_function=>'aop_convert_pkg.f_render_aop'
,p_ajax_function=>'aop_convert_pkg.f_ajax_aop'
,p_standard_attributes=>'ITEM:STOP_EXECUTION_ON_ERROR:WAIT_FOR_RESULT:INIT_JAVASCRIPT_CODE'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX Office Print (AOP) was created by APEX R&D to facilitate exporting data and printing documents in Oracle Application Express (APEX) based on an Office document (Word, Excel, Powerpoint) or HTML, Markdown or Text. This plugin can only be used to '
||'print to AOP and is copyrighted by APEX R&D. If you have any questions please contact support@apexofficeprint.com.',
'We hope you enjoy AOP!'))
,p_version_identifier=>'18.2'
,p_about_url=>'https://www.apexofficeprint.com'
,p_files_version=>218
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010981624742271573)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>1000
,p_prompt=>'AOP URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'http://api.apexofficeprint.com/'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'URL to APEX Office Print server. <br/>',
'When installed on the same server as the database using the default port you can use http://localhost:8010/ <br/>',
'To use AOP as a service, you can use http(s)://api.apexofficeprint.com/ <br/>',
'When using HTTPS, make sure to add the certificate to the wallet of your database. Alternatively you can setup a proxy rule in your webserver to do the HTTPS handshaking so the AOP plugin can call a local url. Instructions how to setup both options c'
||'an be found in the documentation.<br/>',
'When running AOP on the Oracle Cloud you are obliged to use HTTPS, so the url should be https://api.apexofficeprint.com/ or https://www.cloudofficeprint.com/aop/<br/>',
'You can also dynamically specify a url by an Application Item e.g. &AI_AOP_URL.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1897798408180306866)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>2000
,p_prompt=>'API key'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>50
,p_max_length=>50
,p_is_translatable=>false
,p_help_text=>'Enter your API key found on your account when you login at https://www.apexofficeprint.com.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1597612341589785026)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>3000
,p_prompt=>'Debug'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'No'
,p_help_text=>'By default debug is turned off.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1597619808262786416)
,p_plugin_attribute_id=>wwv_flow_api.id(1597612341589785026)
,p_display_sequence=>10
,p_display_value=>'Remote'
,p_return_value=>'Yes'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enabling remote debug will capture the JSON and is made available in your dashboard at https://www.apexofficeprint.com.',
'This makes it easier to debug your JSON, check if it''s valid and contact us in case you need support.',
'This option only works when you use http(s)://www.apexofficeprint.com/api in your AOP settings.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1343860987293811599)
,p_plugin_attribute_id=>wwv_flow_api.id(1597612341589785026)
,p_display_sequence=>20
,p_display_value=>'Local'
,p_return_value=>'Local'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enabling local debug will download the JSON that is sent to the AOP server component. ',
'This makes it easier to debug your JSON, check if it''s valid and contact us in case you need support.',
'Note that the output file will not be produced and the server will never be called.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1600499727954968833)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>4
,p_display_sequence=>4000
,p_prompt=>'Converter'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2010981624742271573)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_IN_LIST'
,p_depending_on_expression=>'http://apexofficeprint.com/api/,http://www.apexofficeprint.com/api/,https://www.apexofficeprint.com/api/'
,p_lov_type=>'STATIC'
,p_null_text=>'LibreOffice'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'To transform an Office document to PDF, APEX Office Print is using an external converter.',
'By default LibreOffice is used, but you can select another converter on request.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1600522161620995881)
,p_plugin_attribute_id=>wwv_flow_api.id(1600499727954968833)
,p_display_sequence=>10
,p_display_value=>'MS Office (Windows only)'
,p_return_value=>'officetopdf'
,p_help_text=>'Uses Microsoft Office to do the conversion and following module http://officetopdf.codeplex.com'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1600522610781999060)
,p_plugin_attribute_id=>wwv_flow_api.id(1600499727954968833)
,p_display_sequence=>20
,p_display_value=>'Custom'
,p_return_value=>'custom'
,p_help_text=>'Specify the name of the custom converter defined at the AOP Server.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(790088416813763986)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>5
,p_display_sequence=>5000
,p_prompt=>'Use settings defined in package'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_display_length=>80
,p_max_length=>300
,p_is_translatable=>false
,p_examples=>'aop_settings_pkg'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'When you use a different AOP server in DEV, TEST, PROD it might be easier to define the package where the settings (e.g. AOP server) is defined.<br/>',
'This makes deployments seamless and you don''t need to update the plug-in component settings manually afterwards.<br/>',
'When a package is defined, we will always read those settings, regardless what is filled in above.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(839325579803381697)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>6
,p_display_sequence=>1500
,p_prompt=>'AOP Failover URL'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Failover URL to APEX Office Print server incase the AOP URL fails. <br/>',
'When installed on the same server as the database using the default port you can use http://localhost:8010/ <br/>',
'To use AOP as a service, you can use http(s)://www.apexofficeprint.com/failover-api/ <br/>',
'When using HTTPS, make sure to add the certificate to the wallet of your database. Alternatively you can setup a proxy rule in your webserver to do the HTTPS handshaking so the AOP plugin can call a local url. Instructions how to setup both options c'
||'an be found in the documentation.<br/>',
'When running AOP on the Oracle Cloud you are obliged to use HTTPS, so the url should be https://www.apexofficeprint.com/failover-api/'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(865583180280407343)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>7
,p_display_sequence=>9000
,p_prompt=>'Failover procedure'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(839325579803381697)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_examples=>'aop_sample_pkg.failover_procedure;'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Specify the procedure that should be called when the failover url is used.',
'The procedure can for example send an email to notify the primary AOP url is not used, but the fallback url.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(704756594289855120)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>8
,p_display_sequence=>8000
,p_prompt=>'Log package'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>'see aop_log_pkg that comes with the AOP Sample app.'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If you want every request to aop_api_pkg.plsql_call_to_aop to be logged, you can specify a logging package here.<br/>',
'The logging package needs at least a function and a procedure with following definition:',
'<pre>',
'function start_request (',
'  p_data_type             in varchar2,',
'  p_data_source           in clob,',
'  p_template_type         in varchar2,',
'  p_template_source       in clob,',
'  p_output_type           in varchar2,',
'  p_output_filename       in varchar2,',
'  p_output_type_item_name in varchar2,',
'  p_output_to             in varchar2,',
'  p_procedure             in varchar2,',
'  p_binds                 in varchar2,',
'  p_special               in varchar2,',
'  p_aop_remote_debug      in varchar2,',
'  p_output_converter      in varchar2,',
'  p_aop_url               in varchar2,',
'  p_api_key               in varchar2,',
'  p_app_id                in number,',
'  p_page_id               in number,',
'  p_user_name             in varchar2,',
'  p_init_code             in clob,',
'  p_output_encoding       in varchar2,',
'  p_failover_aop_url      in varchar2,',
'  p_failover_procedure    in varchar2',
') return number;',
'',
'',
'procedure end_request (',
'  p_aop_log_id            in number,  ',
'  p_status                in varchar2, ',
'  p_aop_json              in clob,',
'  p_aop_error             in varchar2, ',
'  p_ora_sqlcode           in number, ',
'  p_ora_sqlerrm           in varchar2',
')',
'</pre>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(263886736721922501)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>9
,p_display_sequence=>4050
,p_prompt=>'Custom Converter'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1600499727954968833)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'custom'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'AOP Server config looks like this:',
'<br/>',
'<pre><code>',
'{',
'    "converters": {',
'        "abiword":{',
'            "command": "abiword --to={outputFormat} --to-name={outputFile} {inputFile}"',
'        },',
'        "other":{',
'            "command":""',
'        }',
'    }',
'}',
'</code></pre>',
'</p>',
'<p>',
'This means you can use abiword or other as the name of the custom converter.',
'</p>'))
,p_help_text=>'Specify the name of the custom converter as specified at the AOP Server e.g. abiword'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1340494056234086227)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Init PL/SQL Code'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'aop_api_pkg.g_output_filename      := ''output'';',
'aop_api_pkg.g_output_filename      := v(''P1_FILENAME'');',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'You can define global variables of the aop_api_pkg in this area.<br/>',
'</p>',
'Available variables:',
'<pre>',
'-- Global variables',
'g_output_filename         varchar2(100) := null;',
'g_language                varchar2(2)   := ''en'';  -- Language can be: en, fr, nl, de',
'</pre>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2011006831365261245)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>31
,p_prompt=>'Output Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'pdf'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2011009019288266918)
,p_plugin_attribute_id=>wwv_flow_api.id(2011006831365261245)
,p_display_sequence=>40
,p_display_value=>'PDF (pdf)'
,p_return_value=>'pdf'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2011137834106194977)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>32
,p_prompt=>'Output Type APEX Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2011006831365261245)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'apex_item'
,p_help_text=>'APEX item that contains the output type. See Output Type help text for valid list of output types.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1839146267486418185)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>12
,p_prompt=>'SQL Query'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>3
,p_sql_max_column_count=>7
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server]',
'  from my_table',
' where instr()',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Enter the SQL statement in following format. At least 3 columns are necessary up to a maximum of 7.',
'<br/>The columns between [] are optional.',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1805665538986740109)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Output To'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Browser (file)'
,p_help_text=>'By default the file that''s generated by AOP, will be downloaded by the Browser and saved on your harddrive.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1805670662086741533)
,p_plugin_attribute_id=>wwv_flow_api.id(1805665538986740109)
,p_display_sequence=>10
,p_display_value=>'Procedure'
,p_return_value=>'PROCEDURE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option will call a procedure in a specific format. This option is useful in case you don''t need the file on your own harddrive, but for example you want to mail the document automatically.',
'In that case you can create a procedure that adds the generated document as an attachment to your apex_mail.send.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1805671025276743083)
,p_plugin_attribute_id=>wwv_flow_api.id(1805665538986740109)
,p_display_sequence=>20
,p_display_value=>'Procedure and Browser (file)'
,p_return_value=>'PROCEDURE_BROWSER'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option allows you to call a procedure first and next download the file to your harddrive.',
'An example is when you first want to store the generated document in a table before letting the browser to download it.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1005061215161283051)
,p_plugin_attribute_id=>wwv_flow_api.id(1805665538986740109)
,p_display_sequence=>30
,p_display_value=>'Inline Region (pdf/html/md/txt only)'
,p_return_value=>'BROWSER_INLINE'
,p_help_text=>'add data-aop-inline-pdf="Name of Dynamic Action" or data-aop-inline-txt="Name of Dynamic Action" to a region, div, textarea of other.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(866982585571405629)
,p_plugin_attribute_id=>wwv_flow_api.id(1805665538986740109)
,p_display_sequence=>40
,p_display_value=>'Directory (on AOP Server)'
,p_return_value=>'DIRECTORY'
,p_help_text=>'Save the file to a directory specified with g_output_directory. The default directory on the AOP Server is outputfiles.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1805671419797774414)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Procedure Name'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1805665538986740109)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PROCEDURE,PROCEDURE_BROWSER'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Create following procedure in the database:',
'</p>',
'<pre>',
'create procedure send_email_prc(',
'    p_output_blob      in blob,',
'    p_output_filename  in varchar2,',
'    p_output_mime_type in varchar2)',
'is',
'  l_id number;',
'begin',
'  l_id := apex_mail.send( ',
'            p_to => ''support@apexofficeprint.com'', ',
'            p_from => ''support@apexofficeprint.com'', ',
'            p_subj => ''Mail from APEX with attachment'', ',
'            p_body => ''Please review the attachment.'', ',
'            p_body_html => ''<b>Please</b> review the attachment.'') ;',
'  apex_mail.add_attachment( ',
'      p_mail_id    => l_id, ',
'      p_attachment => p_output_blob, ',
'      p_filename   => p_output_filename, ',
'      p_mime_type  => p_output_mime_type) ;',
'  commit;    ',
'end send_email_prc;',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter only the procedure name in this field (so without parameters) for example "download_prc".',
'The procedure in the database needs to be structured with the parameters as in the example. ',
'The procedure name can be any name, but the parameters need to match exactly as in the example.',
'You can add other parameters with a default value.'))
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(868476787506730900)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_name=>'INIT_JAVASCRIPT_CODE'
,p_is_required=>false
,p_depending_on_has_to_exist=>true
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'AOP.gAOPOptions.waitSpinner = ''three-bounce'';<br>',
'AOP.gAOPOptions.showNotification = false;<br>',
'AOP.gAOPOptions.notificatonMessage = ''An AOP error occurred'';'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<strong>Options</strong><br>',
'<strong>AOP.gAOPOptions.waitSpinner - Waiting Spinner</strong><br>',
'Available waiting spinners:<br>',
'apex (default), double-bounce, three-bounce, rotating-plane, fading-circle, folding-cube, wave, wandering-cubes, pulse, chasing-dots, circle, cube-grid<br><br>',
'<strong>AOP.gAOPOptions.showNotification - Show Notification if something went wrong</strong><br>',
'Values: true (default) / false<br><br>',
'<strong>AOP.gAOPOptions.notificatonMessage - Overrides Server-side Notification Message</strong><br>'))
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1142961393668468391)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_name=>'aop-file-error'
,p_display_name=>'AOP Print File Error'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1142961864153468391)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_name=>'aop-file-progress'
,p_display_name=>'AOP Print File Progress'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1142962238734468391)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_name=>'aop-file-success'
,p_display_name=>'AOP Print File Success'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '76617220414F503D7B67414F504F7074696F6E733A7B616A61784964656E7469666965723A22222C74726967676572456C656D49643A22222C737461746963526567696F6E4964733A22222C6F7574707574546F3A22222C64614E616D653A22222C7761';
wwv_flow_api.g_varchar2_table(2) := '69745370696E6E65723A2261706578222C73686F774E6F74696669636174696F6E3A21302C6E6F746966696361746F6E4D6573736167653A22222C7375626D69744974656D7341727261793A5B5D2C7375626D697456616C75657341727261793A5B5D2C';
wwv_flow_api.g_varchar2_table(3) := '6630313A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630323A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D6178576964';
wwv_flow_api.g_varchar2_table(4) := '74683A302C6D61784865696768743A307D2C6630333A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630343A7B6461746141727261793A5B5D2C7769647468';
wwv_flow_api.g_varchar2_table(5) := '3A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630353A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630363A7B';
wwv_flow_api.g_varchar2_table(6) := '6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630373A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C';
wwv_flow_api.g_varchar2_table(7) := '6D61784865696768743A307D2C6630383A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630393A7B6461746141727261793A5B5D2C77696474683A302C6865';
wwv_flow_api.g_varchar2_table(8) := '696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631303A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631313A7B6461746141';
wwv_flow_api.g_varchar2_table(9) := '727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631323A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865';
wwv_flow_api.g_varchar2_table(10) := '696768743A307D2C6631333A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631343A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A';
wwv_flow_api.g_varchar2_table(11) := '302C6D617857696474683A302C6D61784865696768743A307D2C6631353A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D7D2C67657442726F777365724E616D65';
wwv_flow_api.g_varchar2_table(12) := '3A66756E6374696F6E28297B76617220652C612C743D6E6176696761746F722E757365724167656E742C693D6E6176696761746F722E6170704E616D653B72657475726E28613D742E696E6465784F6628224F70657261222929213D2D313F693D226F70';
wwv_flow_api.g_varchar2_table(13) := '657261223A28613D742E696E6465784F6628224D534945222929213D2D313F693D226965223A28613D742E696E6465784F66282254726964656E74222929213D2D313F693D226965223A28613D742E696E6465784F66282245646765222929213D2D313F';
wwv_flow_api.g_varchar2_table(14) := '693D2265646765223A28613D742E696E6465784F6628224368726F6D65222929213D2D313F693D226368726F6D65223A28613D742E696E6465784F662822536166617269222929213D2D313F693D22736166617269223A28613D742E696E6465784F6628';
wwv_flow_api.g_varchar2_table(15) := '2246697265666F78222929213D2D313F693D2266697265666F78223A28653D742E6C617374496E6465784F6628222022292B31293C28613D742E6C617374496E6465784F6628222F222929262628693D742E737562737472696E6728652C61292C692E74';
wwv_flow_api.g_varchar2_table(16) := '6F4C6F7765724361736528293D3D692E746F5570706572436173652829262628693D6E6176696761746F722E6170704E616D6529292C697D2C73686F774572726F724D6573736167653A66756E6374696F6E2865297B7472797B617065782E6D65737361';
wwv_flow_api.g_varchar2_table(17) := '67652E636C6561724572726F727328292C617065782E6D6573736167652E73686F774572726F7273285B7B747970653A226572726F72222C6C6F636174696F6E3A2270616765222C6D6573736167653A652C756E736166653A21317D5D297D6361746368';
wwv_flow_api.g_varchar2_table(18) := '2865297B617065782E64656275672E696E666F2822414F502073686F774572726F724D657373616765222C65297D7D2C73686F77537563636573734D6573736167653A66756E6374696F6E2865297B7472797B617065782E6D6573736167652E73686F77';
wwv_flow_api.g_varchar2_table(19) := '50616765537563636573732865297D63617463682865297B617065782E64656275672E696E666F2822414F502073686F77537563636573734D657373616765222C65297D7D2C73686F774E6F74696669636174696F6E3A66756E6374696F6E28652C6129';
wwv_flow_api.g_varchar2_table(20) := '7B696628414F502E67414F504F7074696F6E732E73686F774E6F74696669636174696F6E297B76617220743D414F502E67414F504F7074696F6E732E6E6F746966696361746F6E4D6573736167657C7C613B2273756363657373223D3D653F414F502E73';
wwv_flow_api.g_varchar2_table(21) := '686F77537563636573734D6573736167652874293A226572726F72223D3D652626414F502E73686F774572726F724D6573736167652874297D7D2C73686F775370696E6E65723A66756E6374696F6E28652C61297B76617220742C692C732C722C6E2C6F';
wwv_flow_api.g_varchar2_table(22) := '3D414F502E67414F504F7074696F6E732E776169745370696E6E65722C643D617065782E7574696C2E68746D6C4275696C64657228292C6C3D653F242865293A242822626F647922292C633D242877696E646F77292C673D6C2E6F666673657428292C70';
wwv_flow_api.g_varchar2_table(23) := '3D242E657874656E64287B616C6572743A617065782E6C616E672E6765744D6573736167652822415045582E50524F43455353494E4722292C7370696E6E6572436C6173733A22227D2C61292C753D7B746F703A632E7363726F6C6C546F7028292C6C65';
wwv_flow_api.g_varchar2_table(24) := '66743A632E7363726F6C6C4C65667428297D3B72657475726E20752E626F74746F6D3D752E746F702B632E68656967687428292C752E72696768743D752E6C6566742B632E776964746828292C672E626F74746F6D3D672E746F702B6C2E6F7574657248';
wwv_flow_api.g_varchar2_table(25) := '656967687428292C672E72696768743D672E6C6566742B6C2E6F75746572576964746828292C693D672E746F703E752E746F703F672E746F703A752E746F702C733D672E626F74746F6D3C752E626F74746F6D3F672E626F74746F6D3A752E626F74746F';
wwv_flow_api.g_varchar2_table(26) := '6D2C723D28732D69292F322C6E3D752E746F702D672E746F702C6E3E30262628722B3D6E292C2261706578223D3D3D6F3F642E6D61726B757028223C7370616E22292E617474722822636C617373222C22752D50726F63657373696E67222B28702E7370';
wwv_flow_api.g_varchar2_table(27) := '696E6E6572436C6173733F2220222B702E7370696E6E6572436C6173733A222229292E617474722822726F6C65222C22616C65727422292E6D61726B757028223E22292E6D61726B757028223C7370616E22292E617474722822636C617373222C22752D';
wwv_flow_api.g_varchar2_table(28) := '50726F63657373696E672D7370696E6E657222292E6D61726B757028223E22292E6D61726B757028223C2F7370616E3E22292E6D61726B757028223C7370616E22292E617474722822636C617373222C22752D56697375616C6C7948696464656E22292E';
wwv_flow_api.g_varchar2_table(29) := '6D61726B757028223E22292E636F6E74656E7428702E616C657274292E6D61726B757028223C2F7370616E3E22292E6D61726B757028223C2F7370616E3E22293A2274687265652D626F756E6365223D3D3D6F3F642E6D61726B757028273C6469762063';
wwv_flow_api.g_varchar2_table(30) := '6C6173733D22736B2D74687265652D626F756E636522207374796C653D227A2D696E6465783A2039393939393939393939223E3C64697620636C6173733D22736B2D6368696C6420736B2D626F756E636531223E3C2F6469763E3C64697620636C617373';
wwv_flow_api.g_varchar2_table(31) := '3D22736B2D6368696C6420736B2D626F756E636532223E3C2F6469763E3C64697620636C6173733D22736B2D6368696C6420736B2D626F756E636533223E3C2F6469763E3C2F6469763E27293A22726F746174696E672D706C616E65223D3D3D6F3F642E';
wwv_flow_api.g_varchar2_table(32) := '6D61726B757028273C64697620636C6173733D22736B2D726F746174696E672D706C616E65223E3C2F6469763E27293A22666164696E672D636972636C65223D3D3D6F3F642E6D61726B757028273C64697620636C6173733D22736B2D666164696E672D';
wwv_flow_api.g_varchar2_table(33) := '636972636C6522207374796C653D227A2D696E6465783A2039393939393939393939223E3C64697620636C6173733D22736B2D636972636C653120736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C65322073';
wwv_flow_api.g_varchar2_table(34) := '6B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653320736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653420736B2D636972636C65223E3C2F6469763E3C646976';
wwv_flow_api.g_varchar2_table(35) := '20636C6173733D22736B2D636972636C653520736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653620736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C65372073';
wwv_flow_api.g_varchar2_table(36) := '6B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653820736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653920736B2D636972636C65223E3C2F6469763E3C646976';
wwv_flow_api.g_varchar2_table(37) := '20636C6173733D22736B2D636972636C65313020736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C65313120736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C6531';
wwv_flow_api.g_varchar2_table(38) := '3220736B2D636972636C65223E3C2F6469763E3C2F6469763E27293A22666F6C64696E672D63756265223D3D3D6F3F642E6D61726B757028273C64697620636C6173733D22736B2D666F6C64696E672D6375626522207374796C653D227A2D696E646578';
wwv_flow_api.g_varchar2_table(39) := '3A2039393939393939393939223E3C64697620636C6173733D22736B2D637562653120736B2D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D637562653220736B2D63756265223E3C2F6469763E3C64697620636C6173733D22736B';
wwv_flow_api.g_varchar2_table(40) := '2D637562653420736B2D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D637562653320736B2D63756265223E3C2F6469763E3C2F6469763E27293A22646F75626C652D626F756E6365223D3D3D6F3F642E6D61726B757028273C6469';
wwv_flow_api.g_varchar2_table(41) := '7620636C6173733D22736B2D646F75626C652D626F756E636522207374796C653D227A2D696E6465783A2039393939393939393939223E3C64697620636C6173733D22736B2D6368696C6420736B2D646F75626C652D626F756E636531223E3C2F646976';
wwv_flow_api.g_varchar2_table(42) := '3E3C64697620636C6173733D22736B2D6368696C6420736B2D646F75626C652D626F756E636532223E3C2F6469763E3C2F6469763E27293A2277617665223D3D3D6F3F642E6D61726B757028273C64697620636C6173733D22736B2D7761766522207374';
wwv_flow_api.g_varchar2_table(43) := '796C653D227A2D696E6465783A2039393939393939393939223E3C64697620636C6173733D22736B2D7265637420736B2D7265637431223E3C2F6469763E3C64697620636C6173733D22736B2D7265637420736B2D7265637432223E3C2F6469763E3C64';
wwv_flow_api.g_varchar2_table(44) := '697620636C6173733D22736B2D7265637420736B2D7265637433223E3C2F6469763E3C64697620636C6173733D22736B2D7265637420736B2D7265637434223E3C2F6469763E3C64697620636C6173733D22736B2D7265637420736B2D7265637435223E';
wwv_flow_api.g_varchar2_table(45) := '3C2F6469763E3C2F6469763E27293A2277616E646572696E672D6375626573223D3D3D6F3F642E6D61726B757028273C64697620636C6173733D22736B2D77616E646572696E672D637562657322207374796C653D227A2D696E6465783A203939393939';
wwv_flow_api.g_varchar2_table(46) := '3939393939223E3C64697620636C6173733D22736B2D6375626520736B2D6375626531223E3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B2D6375626532223E3C2F6469763E3C2F6469763E27293A2270756C7365223D3D3D6F3F';
wwv_flow_api.g_varchar2_table(47) := '642E6D61726B757028273C64697620636C6173733D22736B2D7370696E6E657220736B2D7370696E6E65722D70756C736522207374796C653D227A2D696E6465783A2039393939393939393939223E3C2F6469763E27293A2263686173696E672D646F74';
wwv_flow_api.g_varchar2_table(48) := '73223D3D3D6F3F642E6D61726B757028273C64697620636C6173733D22736B2D63686173696E672D646F747322207374796C653D227A2D696E6465783A2039393939393939393939223E3C64697620636C6173733D22736B2D6368696C6420736B2D646F';
wwv_flow_api.g_varchar2_table(49) := '7431223E3C2F6469763E3C64697620636C6173733D22736B2D6368696C6420736B2D646F7432223E3C2F6469763E3C2F6469763E27293A22636972636C65223D3D3D6F3F642E6D61726B757028273C64697620636C6173733D22736B2D636972636C6522';
wwv_flow_api.g_varchar2_table(50) := '207374796C653D227A2D696E6465783A2039393939393939393939223E3C64697620636C6173733D22736B2D636972636C653120736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653220736B2D6368696C6422';
wwv_flow_api.g_varchar2_table(51) := '3E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653320736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653420736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D';
wwv_flow_api.g_varchar2_table(52) := '636972636C653520736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653620736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653720736B2D6368696C64223E3C2F6469';
wwv_flow_api.g_varchar2_table(53) := '763E3C64697620636C6173733D22736B2D636972636C653820736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653920736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C';
wwv_flow_api.g_varchar2_table(54) := '65313020736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C65313120736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C65313220736B2D6368696C64223E3C2F6469763E';
wwv_flow_api.g_varchar2_table(55) := '3C2F6469763E27293A22637562652D67726964223D3D3D6F2626642E6D61726B757028273C64697620636C6173733D22736B2D637562652D6772696422207374796C653D227A2D696E6465783A2039393939393939393939223E3C64697620636C617373';
wwv_flow_api.g_varchar2_table(56) := '3D22736B2D6375626520736B2D6375626531223E3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B2D6375626532223E3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B2D6375626533223E3C2F6469763E3C64';
wwv_flow_api.g_varchar2_table(57) := '697620636C6173733D22736B2D6375626520736B2D6375626534223E3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B2D6375626535223E3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B2D6375626536223E';
wwv_flow_api.g_varchar2_table(58) := '3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B2D6375626537223E3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B2D6375626538223E3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B';
wwv_flow_api.g_varchar2_table(59) := '2D6375626539223E3C2F6469763E3C2F6469763E27292C743D2428642E746F537472696E672829292C742E617070656E64546F286C292C742E706F736974696F6E287B6D793A2263656E746572222C61743A226C6566742B35302520746F702B222B722B';
wwv_flow_api.g_varchar2_table(60) := '227078222C6F663A6C2C636F6C6C6973696F6E3A22666974227D292C747D2C6173796E634C6F6F703A66756E6374696F6E28652C612C74297B76617220693D302C733D21312C723D7B6E6578743A66756E6374696F6E28297B737C7C28693C3D653F2869';
wwv_flow_api.g_varchar2_table(61) := '2B2B2C61287229293A28733D21302C74282929297D2C697465726174696F6E3A66756E6374696F6E28297B72657475726E20692D317D2C627265616B3A66756E6374696F6E28297B733D21302C7428297D7D3B72657475726E20722E6E65787428292C72';
wwv_flow_api.g_varchar2_table(62) := '7D2C6275696C6441666665637465644974656D41727261793A66756E6374696F6E2865297B617065782E64656275672E696E666F2822414F5020704166666563746564456C656D656E7473222C65293B76617220613D5B5D3B72657475726E2065262628';
wwv_flow_api.g_varchar2_table(63) := '613D652E7265706C616365282F5C732F672C2222292E73706C697428222C2229292C617D2C6275696C6441666665637465644974656D56616C756541727261793A66756E6374696F6E2865297B617065782E64656275672E696E666F2822414F50206275';
wwv_flow_api.g_varchar2_table(64) := '696C6441666665637465644974656D56616C75654172726179222C65293B76617220613D5B5D2C743D5B5D3B69662865297B613D652E7265706C616365282F5C732F672C2222292E73706C697428222C22293B666F722876617220693D303B693C612E6C';
wwv_flow_api.g_varchar2_table(65) := '656E6774683B692B2B29742E7075736828247628615B695D29297D72657475726E20747D2C737667456E68616E63653A66756E6374696F6E28652C61297B7472797B617065782E64656275672E696E666F2822414F5020737667456E68616E6365222C65';
wwv_flow_api.g_varchar2_table(66) := '293B76617220743D242865292E66696E64282273766722292C693D303B617065782E64656275672E696E666F2822414F5020737667456E68616E6365222C692C742E6C656E677468293B76617220733D66756E6374696F6E28297B692B2B2C617065782E';
wwv_flow_api.g_varchar2_table(67) := '64656275672E696E666F2822414F5020737667456E68616E636520737667446F6E65222C692C742E6C656E677468292C693D3D742E6C656E677468262628617065782E64656275672E696E666F2822414F5020737667456E68616E636520737667446F6E';
wwv_flow_api.g_varchar2_table(68) := '652063616C6C6261636B22292C612829297D3B742E656163682866756E6374696F6E28297B617065782E64656275672E696E666F2822414F5020737667456E68616E636520222C74686973293B76617220653D746869732C613D242865292E696E6E6572';
wwv_flow_api.g_varchar2_table(69) := '576964746828292C743D242865292E696E6E657248656967687428293B242865292E6174747228227769647468222C61292C242865292E617474722822686569676874222C74292C242865292E617474722822786D6C6E73222C22687474703A2F2F7777';
wwv_flow_api.g_varchar2_table(70) := '772E77332E6F72672F323030302F73766722292C242865292E617474722822786D6C6E733A786C696E6B222C22687474703A2F2F7777772E77332E6F72672F313939392F786C696E6B22293B666F722876617220693D652E676574456C656D656E747342';
wwv_flow_api.g_varchar2_table(71) := '795461674E616D652822696D61676522292C723D302C6E3D66756E6374696F6E28297B617065782E64656275672E696E666F2822414F5020737667456E68616E636520696D616765446F6E65222C722C692E6C656E677468292C722B2B2C723E3D692E6C';
wwv_flow_api.g_varchar2_table(72) := '656E677468262628617065782E64656275672E696E666F2822414F5020737667456E68616E636520696D616765446F6E652063616C6C696E6720737667446F6E65222C722C692E6C656E677468292C732829297D2C6F3D303B6F3C692E6C656E6774683B';
wwv_flow_api.g_varchar2_table(73) := '6F2B2B292866756E6374696F6E28297B76617220653D695B6F5D3B414F502E67657442617365363446726F6D55524C28414F502E6765744162736F6C75746555726C28652E67657441747472696275746528226872656622297C7C652E67657441747472';
wwv_flow_api.g_varchar2_table(74) := '69627574652822786C696E6B3A687265662229292C66756E6374696F6E2861297B652E7365744174747269627574652822786C696E6B3A68726566222C61292C652E736574417474726962757465282268726566222C61292C617065782E64656275672E';
wwv_flow_api.g_varchar2_table(75) := '696E666F2822446174612052657475726E65643A222C61292C6E28297D297D2928293B303D3D3D692E6C656E67746826267328297D292C303D3D3D742E6C656E67746826266128297D63617463682865297B617065782E64656275672E696E666F282241';
wwv_flow_api.g_varchar2_table(76) := '4F5020737667456E68616E636520636175676874206572726F72222C65292C6128297D7D2C63616E76617332446174615552493A66756E6374696F6E28652C61297B76617220743D652E746F4461746155524C2861293B72657475726E20747D2C646174';
wwv_flow_api.g_varchar2_table(77) := '61555249326261736536343A66756E6374696F6E2865297B76617220613D652E73756273747228652E696E6465784F6628222C22292B31293B72657475726E20617D2C636C6F623241727261793A66756E6374696F6E28652C612C74297B6C6F6F70436F';
wwv_flow_api.g_varchar2_table(78) := '756E743D4D6174682E666C6F6F7228652E6C656E6774682F61292B313B666F722876617220693D303B693C6C6F6F70436F756E743B692B2B29742E7075736828652E736C69636528612A692C612A28692B312929293B72657475726E20747D2C67657449';
wwv_flow_api.g_varchar2_table(79) := '6D6167654261736536343A66756E6374696F6E28652C61297B76617220743D242865293B6C57696474683D742E696E6E6572576964746828292C6C4865696768743D742E696E6E657248656967687428293B76617220693B693D617065782E6465627567';
wwv_flow_api.g_varchar2_table(80) := '2E6765744C6576656C28293E302C22636C69656E745F63616E766173223D3D3D745B305D2E6765744174747269627574652822616F702D726567696F6E2D617322293F28617065782E64656275672E696E666F2822414F5020676574496D616765426173';
wwv_flow_api.g_varchar2_table(81) := '6536342063616C6C696E67207468652063616E7661732067657420696D616765206F7074696F6E20776974682073656C6563746F72222B652B222063616E766173222C2428652B222063616E76617322295B305D2E746F4461746155524C2829292C6128';
wwv_flow_api.g_varchar2_table(82) := '2428652B222063616E76617322295B305D2E746F4461746155524C28292E73706C697428223B6261736536342C22295B315D29293A414F502E737667456E68616E636528652C66756E6374696F6E28297B68746D6C3263616E76617328745B305D2C7B62';
wwv_flow_api.g_varchar2_table(83) := '61636B67726F756E64436F6C6F723A2223666666222C77696474683A6C57696474682C6865696768743A6C4865696768742C616C6C6F775461696E743A21312C6C6F6767696E673A697D292E7468656E2866756E6374696F6E2865297B76617220743D41';
wwv_flow_api.g_varchar2_table(84) := '4F502E63616E766173324461746155524928652C22696D6167652F706E6722292C693D414F502E64617461555249326261736536342874293B612869297D297D297D2C676574496D61676542617365363441727261793A66756E6374696F6E28652C612C';
wwv_flow_api.g_varchar2_table(85) := '74297B414F502E676574496D61676542617365363428652C66756E6374696F6E2865297B613D414F502E636C6F6232417272617928652C3365342C61292C742861297D297D2C626173653634746F426C6F623A66756E6374696F6E28652C61297B666F72';
wwv_flow_api.g_varchar2_table(86) := '2876617220743D61746F622865292C693D612C733D6E657720417272617942756666657228742E6C656E677468292C723D6E65772055696E743841727261792873292C6E3D303B6E3C742E6C656E6774683B6E2B2B29725B6E5D3D742E63686172436F64';
wwv_flow_api.g_varchar2_table(87) := '654174286E293B7472797B72657475726E206E657720426C6F62285B735D2C7B747970653A697D297D63617463682865297B766172206F3D77696E646F772E5765624B6974426C6F624275696C6465727C7C77696E646F772E4D6F7A426C6F624275696C';
wwv_flow_api.g_varchar2_table(88) := '6465727C7C77696E646F772E4D53426C6F624275696C6465722C643D6E6577206F3B72657475726E20642E617070656E642873292C642E676574426C6F622869297D7D2C646F776E6C6F61644261736536343A66756E6374696F6E28652C612C74297B61';
wwv_flow_api.g_varchar2_table(89) := '7065782E64656275672E696E666F2822414F5020646F776E6C6F61644261736536342064617461222C65293B76617220693D414F502E67657442726F777365724E616D6528293B696628226965223D3D697C7C2265646765223D3D69297B76617220733D';
wwv_flow_api.g_varchar2_table(90) := '414F502E626173653634746F426C6F6228652C61293B77696E646F772E6E6176696761746F722E6D7353617665426C6F6228732C74297D656C73657B76617220723D22646174613A222B612B223B6261736536342C222B653B617065782E64656275672E';
wwv_flow_api.g_varchar2_table(91) := '696E666F28224D696D6554797065222C61293B766172206E3D646F63756D656E742E637265617465456C656D656E7428226122293B646F63756D656E742E626F64792E617070656E644368696C64286E292C6E2E7374796C653D22646973706C61793A20';
wwv_flow_api.g_varchar2_table(92) := '6E6F6E65222C6E2E636C6173734E616D653D22616F705F6C696E6B222C6E2E687265663D722C226368726F6D65223D3D692626286E2E687265663D55524C2E6372656174654F626A65637455524C28414F502E626173653634746F426C6F6228652C6129';
wwv_flow_api.g_varchar2_table(93) := '29292C6E2E646F776E6C6F61643D742C6E2E636C69636B28292C242822612E616F705F6C696E6B22292E72656D6F766528297D7D2C6765744162736F6C75746555726C3A66756E6374696F6E28297B76617220653B72657475726E2066756E6374696F6E';
wwv_flow_api.g_varchar2_table(94) := '2861297B72657475726E20653D657C7C646F63756D656E742E637265617465456C656D656E7428226122292C652E687265663D612C652E636C6F6E654E6F6465282131292E687265667D7D28292C67657442617365363446726F6D55524C3A66756E6374';
wwv_flow_api.g_varchar2_table(95) := '696F6E28652C61297B617065782E64656275672E696E666F2822414F502067657442617365363446726F6D55524C222C65293B76617220743D6E657720584D4C48747470526571756573743B742E6F70656E2822474554222C652C2130292C742E726573';
wwv_flow_api.g_varchar2_table(96) := '706F6E7365547970653D226172726179627566666572222C742E6F6E6C6F61643D66756E6374696F6E2865297B76617220743D6E65772055696E7438417272617928746869732E726573706F6E7365292C693D537472696E672E66726F6D43686172436F';
wwv_flow_api.g_varchar2_table(97) := '64652E6170706C79286E756C6C2C74292C733D62746F612869292C723D22646174613A696D6167652F706E673B6261736536342C222B733B612872297D2C742E73656E6428297D2C696E6C696E654261736536343A66756E6374696F6E28652C612C7429';
wwv_flow_api.g_varchar2_table(98) := '7B76617220693D22646174613A222B612B223B6261736536342C222B653B6C44614E616D653D414F502E67414F504F7074696F6E732E64614E616D653B76617220733D2428275B646174612D616F702D696E6C696E652D7064663D22272B6C44614E616D';
wwv_flow_api.g_varchar2_table(99) := '652B27225D27292C723D732E617474722822696422297C7C22616F70222C6E3D2428273C6F626A6563742069643D22696E6C696E655F7064665F6F626A6563745F272B722B272220646174613D2222207469746C653D22272B742B27222077696474683D';
wwv_flow_api.g_varchar2_table(100) := '223130302522206865696768743D22313030252220747970653D22272B612B27223E3C2F6F626A6563743E27293B732E68746D6C286E292C6E2E61747472282264617461222C69297D2C696E6C696E65546578743A66756E6374696F6E28652C612C7429';
wwv_flow_api.g_varchar2_table(101) := '7B76617220693D61746F622865293B6C44614E616D653D414F502E67414F504F7074696F6E732E64614E616D653B76617220733D2428275B646174612D616F702D696E6C696E652D7478743D22272B6C44614E616D652B27225D27293B732E76616C2869';
wwv_flow_api.g_varchar2_table(102) := '297D2C676574416C6C496D61676555706C6F61644172726179733A66756E6374696F6E28652C61297B617065782E64656275672E696E666F2822414F5020676574416C6C496D61676555706C6F6164417261797320526567696F6E204944204172726179';
wwv_flow_api.g_varchar2_table(103) := '222C65293B76617220742C693D303B743D652E6C656E6774683E31303F31303A652E6C656E6774682C617065782E64656275672E696E666F2822414F5020676574416C6C496D61676555706C6F616441727261797320526567696F6E204172726179204C';
wwv_flow_api.g_varchar2_table(104) := '656E677468222C74292C414F502E6173796E634C6F6F7028742C66756E6374696F6E2873297B76617220723D732E697465726174696F6E28293B696628617065782E64656275672E696E666F2822414F5020676574416C6C496D61676555706C6F616441';
wwv_flow_api.g_varchar2_table(105) := '727261797320526567696F6E204172726179204C6F6F7020697465726174696F6E222C72292C655B725D297472797B766172206E3D2223222B655B725D3B692B3D313B766172206F3D66756E6374696F6E28297B617065782E64656275672E696E666F28';
wwv_flow_api.g_varchar2_table(106) := '22414F5020676574416C6C496D61676555706C6F6164417272617973206C4172726179436F756E74222C692C226C41727261794C656E677468222C74292C693D3D743F28617065782E64656275672E696E666F2822414F5020676574416C6C496D616765';
wwv_flow_api.g_varchar2_table(107) := '55706C6F61644172726179732063616C6C696E672063616C6C6261636B22292C612829293A28617065782E64656275672E696E666F2822414F5020676574416C6C496D61676555706C6F6164417272617973206D6F76696E67206F6E20746F206E657874';
wwv_flow_api.g_varchar2_table(108) := '20697465726174696F6E22292C732E6E6578742829297D2C643D2266222B28693E3D31303F692E746F537472696E6728293A2230222B692E746F537472696E672829293B73776974636828617065782E64656275672E696E666F2822414F502067657441';
wwv_flow_api.g_varchar2_table(109) := '6C6C496D61676555706C6F616441727261797320636865636B696E6720666F722074797065206F6620726567696F6E20776974682073656C6563746F7220222B6E292C617065782E64656275672E696E666F2822414F5020676574416C6C496D61676555';
wwv_flow_api.g_varchar2_table(110) := '706C6F61644172726179732020222B24286E295B305D2E6765744174747269627574652822616F702D726567696F6E2D617322292C24286E295B305D292C24286E295B305D2E6765744174747269627574652822616F702D726567696F6E2D6173222929';
wwv_flow_api.g_varchar2_table(111) := '7B63617365227365727665725F68746D6C223A6361736522636C69656E745F68746D6C223A617065782E64656275672E696E666F2822414F5020676574416C6C496D61676555706C6F61644172726179732068746D6C20666F756E642070617373696E67';
wwv_flow_api.g_varchar2_table(112) := '2069742061732069742069732E222C6E292C617065782E64656275672E696E666F2822414F5020676574416C6C496D61676555706C6F61644172726179732068746D6C2069733A222C24286E2B22202E742D526567696F6E2D626F647922295B305D2E69';
wwv_flow_api.g_varchar2_table(113) := '6E6E657248544D4C292C414F502E636C6F623241727261792824286E2B22202E742D526567696F6E2D626F647922295B305D2E696E6E657248544D4C2C3365332C414F502E67414F504F7074696F6E735B645D2E646174614172726179292C6F28293B62';
wwv_flow_api.g_varchar2_table(114) := '7265616B3B6361736522636C69656E745F737667223A414F502E737667456E68616E6365286E2C66756E6374696F6E28297B617065782E64656275672E696E666F2822414F5020676574416C6C496D61676555706C6F6164417272617973207376672062';
wwv_flow_api.g_varchar2_table(115) := '65696E672073656E74222C286E657720584D4C53657269616C697A6572292E73657269616C697A65546F537472696E672824286E2B222073766722295B305D29292C414F502E636C6F6232417272617928286E657720584D4C53657269616C697A657229';
wwv_flow_api.g_varchar2_table(116) := '2E73657269616C697A65546F537472696E672824286E2B222073766722295B305D292C3365332C414F502E67414F504F7074696F6E735B645D2E646174614172726179292C414F502E67414F504F7074696F6E735B645D2E77696474683D24286E292E64';
wwv_flow_api.g_varchar2_table(117) := '6174612822616F702D776964746822297C7C24286E292E696E6E6572576964746828292C414F502E67414F504F7074696F6E735B645D2E6865696768743D24286E292E646174612822616F702D68656967687422297C7C24286E292E696E6E6572486569';
wwv_flow_api.g_varchar2_table(118) := '67687428292C414F502E67414F504F7074696F6E735B645D2E6D617857696474683D24286E292E646174612822616F702D6D61782D776964746822292C414F502E67414F504F7074696F6E735B645D2E6D61784865696768743D24286E292E6461746128';
wwv_flow_api.g_varchar2_table(119) := '22616F702D6D61782D68656967687422292C6F28297D293B627265616B3B64656661756C743A414F502E676574496D6167654261736536344172726179286E2C414F502E67414F504F7074696F6E735B645D2E6461746141727261792C66756E6374696F';
wwv_flow_api.g_varchar2_table(120) := '6E2865297B617065782E64656275672E696E666F2822414F5020676574416C6C496D61676555706C6F61644172726179732073657474696E6720646174614172726179222C65292C414F502E67414F504F7074696F6E735B645D2E646174614172726179';
wwv_flow_api.g_varchar2_table(121) := '3D652C414F502E67414F504F7074696F6E735B645D2E77696474683D24286E292E646174612822616F702D776964746822297C7C24286E292E696E6E6572576964746828292C414F502E67414F504F7074696F6E735B645D2E6865696768743D24286E29';
wwv_flow_api.g_varchar2_table(122) := '2E646174612822616F702D68656967687422297C7C24286E292E696E6E657248656967687428292C414F502E67414F504F7074696F6E735B645D2E6D617857696474683D24286E292E646174612822616F702D6D61782D776964746822292C414F502E67';
wwv_flow_api.g_varchar2_table(123) := '414F504F7074696F6E735B645D2E6D61784865696768743D24286E292E646174612822616F702D6D61782D68656967687422292C617065782E64656275672E696E666F2822414F5020676574416C6C496D61676555706C6F61644172726179732063616C';
wwv_flow_api.g_varchar2_table(124) := '6C696E67206E65787420737465702061667465722067657474696E6720696D616765206461746122292C6F28297D297D7D63617463682865297B617065782E64656275672E696E666F2822457863657074696F6E3A222C65297D7D297D2C646F776E6C6F';
wwv_flow_api.g_varchar2_table(125) := '6164414F5046696C653A66756E6374696F6E2865297B617065782E64656275672E696E666F2822414F5020646F776E6C6F6164414F5046696C6520414F502E67414F504F7074696F6E73222C414F502E67414F504F7074696F6E73293B666F7228766172';
wwv_flow_api.g_varchar2_table(126) := '20613D5B5D2C743D5B5D2C693D5B5D2C733D5B5D2C723D7B705F7769646765745F616374696F6E3A22414F50222C705F726571756573743A22504C5547494E3D222B414F502E67414F504F7074696F6E732E616A61784964656E7469666965722C705F66';
wwv_flow_api.g_varchar2_table(127) := '6C6F775F69643A2476282270466C6F77496422292C705F666C6F775F737465705F69643A2476282270466C6F7753746570496422292C705F696E7374616E63653A2476282270496E7374616E636522292C705F64656275673A2476282270646562756722';
wwv_flow_api.g_varchar2_table(128) := '292C705F6172675F6E616D65733A414F502E67414F504F7074696F6E732E7375626D69744974656D7341727261792C705F6172675F76616C7565733A414F502E67414F504F7074696F6E732E7375626D697456616C75657341727261792C7830313A414F';
wwv_flow_api.g_varchar2_table(129) := '502E67414F504F7074696F6E732E737461746963526567696F6E4964737D2C6E3D313B6E3C3D31353B6E2B2B297B766172206F3D2266222B286E3E3D31303F6E2E746F537472696E6728293A2230222B6E2E746F537472696E672829293B612E70757368';
wwv_flow_api.g_varchar2_table(130) := '28414F502E67414F504F7074696F6E735B6F5D2E7769647468292C742E7075736828414F502E67414F504F7074696F6E735B6F5D2E686569676874292C692E7075736828414F502E67414F504F7074696F6E735B6F5D2E6D61785769647468292C732E70';
wwv_flow_api.g_varchar2_table(131) := '75736828414F502E67414F504F7074696F6E735B6F5D2E6D6178486569676874292C725B6F5D3D414F502E67414F504F7074696F6E735B6F5D2E6461746141727261797D722E6631363D612C722E6631373D742C722E6631383D692C722E6631393D732C';
wwv_flow_api.g_varchar2_table(132) := '617065782E6A51756572792E616A6178287B64617461547970653A2274657874222C747970653A22504F5354222C75726C3A77696E646F772E6C6F636174696F6E2E687265662E73756273747228302C77696E646F772E6C6F636174696F6E2E68726566';
wwv_flow_api.g_varchar2_table(133) := '2E696E6465784F6628222F663F703D22292B31292B227777765F666C6F772E73686F77222C6173796E633A21302C747261646974696F6E616C3A21302C646174613A722C737563636573733A66756E6374696F6E2861297B76617220743B7472797B743D';
wwv_flow_api.g_varchar2_table(134) := '6A51756572792E70617273654A534F4E2861297D63617463682865297B617065782E64656275672E6C6F672822414F5020646F776E6C6F6164414F5046696C6520526573706F6E73652050617273654572726F72222C65293B76617220693D2428223C64';
wwv_flow_api.g_varchar2_table(135) := '69763E3C2F6469763E22293B692E68746D6C2861293B76617220733D2428222E742D416C6572742D626F6479206833222C69292E7465787428293B733D732E7265706C616365282F222F672C222022292C22223D3D73262628733D22414F5020414A4158';
wwv_flow_api.g_varchar2_table(136) := '2043616C6C6261636B2069737375652E22292C743D6A51756572792E70617273654A534F4E28277B2022737461747573223A20226572726F72222C20226D657373616765223A2022526573706F6E73652050617273654572726F72222C2022636F646522';
wwv_flow_api.g_varchar2_table(137) := '3A2022414A41582043616C6C6261636B20287044617461292050617273654572726F72222C20226E6F74696669636174696F6E223A22272B732B2722207D27297D226572726F72223D3D742E7374617475733F28617065782E64656275672E6C6F672822';
wwv_flow_api.g_varchar2_table(138) := '414F5020646F776E6C6F6164414F5046696C65204572726F72222C742E6D6573736167652C742E636F6465292C617065782E6576656E742E7472696767657228414F502E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66';
wwv_flow_api.g_varchar2_table(139) := '696C652D6572726F72222C74292C414F502E73686F774E6F74696669636174696F6E28226572726F72222C742E6E6F74696669636174696F6E292C652829293A2273756363657373223D3D742E737461747573262628617065782E64656275672E6C6F67';
wwv_flow_api.g_varchar2_table(140) := '2822414F5020646F776E6C6F6164414F5046696C65205375636365737322292C617065782E6576656E742E7472696767657228414F502E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D73756363657373222C';
wwv_flow_api.g_varchar2_table(141) := '74292C617065782E64656275672E6C6F672822414F5020646F776E6C6F6164414F5046696C6520446F776E6C6F6164696E672066696C6522292C2242524F57534552223D3D414F502E67414F504F7074696F6E732E6F7574707574546F7C7C2250524F43';
wwv_flow_api.g_varchar2_table(142) := '45445552455F42524F57534552223D3D414F502E67414F504F7074696F6E732E6F7574707574546F7C7C224449524543544F5259223D3D414F502E67414F504F7074696F6E732E6F7574707574546F3F28617065782E64656275672E6C6F672822414F50';
wwv_flow_api.g_varchar2_table(143) := '20646F776E6C6F6164414F5046696C6520646F776E6C6F616442617365363422292C414F502E646F776E6C6F616442617365363428742E646174612C742E6D696D65747970652C742E66696C656E616D6529293A2242524F575345525F494E4C494E4522';
wwv_flow_api.g_varchar2_table(144) := '213D414F502E67414F504F7074696F6E732E6F7574707574546F7C7C226170706C69636174696F6E2F70646622213D742E6D696D6574797065262622746578742F68746D6C22213D742E6D696D65747970653F2242524F575345525F494E4C494E452221';
wwv_flow_api.g_varchar2_table(145) := '3D414F502E67414F504F7074696F6E732E6F7574707574546F7C7C22746578742F6D61726B646F776E22213D742E6D696D6574797065262622746578742F706C61696E22213D742E6D696D6574797065262622746578742F63737622213D742E6D696D65';
wwv_flow_api.g_varchar2_table(146) := '747970653F22434C4F5544223D3D414F502E67414F504F7074696F6E732E6F7574707574546F3F28617065782E64656275672E6C6F672822414F503A204F757470757420746F20636C6F756422292C414F502E73686F77537563636573734D6573736167';
wwv_flow_api.g_varchar2_table(147) := '652822446F63756D656E7420736176656420746F20636C6F75642E2229293A617065782E64656275672E6C6F672822414F503A204E6F20737570706F72746564206F7574707574206D6574686F6422293A28617065782E64656275672E6C6F672822414F';
wwv_flow_api.g_varchar2_table(148) := '5020646F776E6C6F6164414F5046696C6520696E6C696E655465787422292C414F502E696E6C696E655465787428742E646174612C742E6D696D65747970652C742E66696C656E616D6529293A28617065782E64656275672E6C6F672822414F5020646F';
wwv_flow_api.g_varchar2_table(149) := '776E6C6F6164414F5046696C6520696E6C696E6542617365363422292C414F502E696E6C696E6542617365363428742E646174612C742E6D696D65747970652C742E66696C656E616D6529292C65287429297D2C6572726F723A66756E6374696F6E2861';
wwv_flow_api.g_varchar2_table(150) := '2C74297B617065782E64656275672E6C6F672822414F5020646F776E6C6F6164414F5046696C65204572726F72222C74292C617065782E6576656E742E7472696767657228414F502E67414F504F7074696F6E732E74726967676572456C656D49642C22';
wwv_flow_api.g_varchar2_table(151) := '616F702D66696C652D6572726F72222C74292C414F502E73686F774E6F74696669636174696F6E28226572726F72222C74292C6528297D2C7868723A66756E6374696F6E28297B72657475726E205868724F626A3D242E616A617853657474696E67732E';
wwv_flow_api.g_varchar2_table(152) := '78687228292C5868724F626A2E75706C6F61643F5868724F626A2E75706C6F61642E6164644576656E744C697374656E6572282270726F6772657373222C66756E6374696F6E2865297B696628652E6C656E677468436F6D70757461626C65297B766172';
wwv_flow_api.g_varchar2_table(153) := '20613D652E6C6F616465642F652E746F74616C2A3130303B617065782E6576656E742E7472696767657228414F502E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D70726F6772657373222C61297D7D2C2131';
wwv_flow_api.g_varchar2_table(154) := '293A617065782E64656275672E6C6F672822414F5020646F776E6C6F6164414F5046696C6520584852222C2250726F6772657373206973206E6F7420737570706F727465642062792042726F777365722E22292C5868724F626A7D7D297D2C63616C6C41';
wwv_flow_api.g_varchar2_table(155) := '4F503A66756E6374696F6E28297B76617220652C613D746869732C743D612E616374696F6E2E616A61784964656E7469666965722C693D612E616374696F6E2E61747472696275746530312C733D612E616374696F6E2E61747472696275746530352C72';
wwv_flow_api.g_varchar2_table(156) := '3D612E616374696F6E2E61747472696275746531332C6E3D612E616374696F6E2E61747472696275746531342C6F3D746869732E74726967676572696E67456C656D656E743B653D24286F292E697328225B69645D22293F2223222B24286F292E617474';
wwv_flow_api.g_varchar2_table(157) := '722822696422293A22626F6479223B76617220643D5B5D3B72262628643D722E73706C697428222C2229292C414F502E67414F504F7074696F6E732E616A61784964656E7469666965723D742C414F502E67414F504F7074696F6E732E74726967676572';
wwv_flow_api.g_varchar2_table(158) := '456C656D49643D652C414F502E67414F504F7074696F6E732E737461746963526567696F6E4964733D722C414F502E67414F504F7074696F6E732E64614E616D653D692C414F502E67414F504F7074696F6E732E6F7574707574546F3D6E2C224954454D';
wwv_flow_api.g_varchar2_table(159) := '223D3D612E616374696F6E2E6166666563746564456C656D656E747354797065262628414F502E67414F504F7074696F6E732E7375626D69744974656D7341727261793D414F502E6275696C6441666665637465644974656D417272617928612E616374';
wwv_flow_api.g_varchar2_table(160) := '696F6E2E6166666563746564456C656D656E7473292C414F502E67414F504F7074696F6E732E7375626D697456616C75657341727261793D414F502E6275696C6441666665637465644974656D56616C7565417272617928612E616374696F6E2E616666';
wwv_flow_api.g_varchar2_table(161) := '6563746564456C656D656E747329293B666F7228766172206C3D313B6C3C3D31353B6C2B2B297B76617220633D2266222B286C3E3D31303F6C2E746F537472696E6728293A2230222B6C2E746F537472696E672829293B414F502E67414F504F7074696F';
wwv_flow_api.g_varchar2_table(162) := '6E735B635D2E6461746141727261793D5B5D2C414F502E67414F504F7074696F6E735B635D2E77696474683D302C414F502E67414F504F7074696F6E735B635D2E6865696768743D302C414F502E67414F504F7074696F6E735B635D2E6D617857696474';
wwv_flow_api.g_varchar2_table(163) := '683D302C414F502E67414F504F7074696F6E735B635D2E6D61784865696768743D307D617065782E64656275672E696E666F2822414F502063616C6C414F502076416A61784964656E746966696572222C74292C617065782E64656275672E696E666F28';
wwv_flow_api.g_varchar2_table(164) := '22414F502063616C6C414F50207654726967676572456C656D4964222C65292C617065782E64656275672E696E666F2822414F502063616C6C414F50207644614E616D65222C69292C617065782E64656275672E696E666F2822414F502063616C6C414F';
wwv_flow_api.g_varchar2_table(165) := '5020764461746154797065222C73292C617065782E64656275672E696E666F2822414F502063616C6C414F502076526567696F6E496473222C72292C617065782E64656275672E696E666F2822414F502063616C6C414F5020764F7574707574546F222C';
wwv_flow_api.g_varchar2_table(166) := '6E292C617065782E64656275672E696E666F2822414F502063616C6C414F5020414F502E67414F504F7074696F6E73222C414F502E67414F504F7074696F6E73293B76617220673D414F502E73686F775370696E6E657228242822626F64792229293B67';
wwv_flow_api.g_varchar2_table(167) := '2E617474722822646174612D68746D6C3263616E7661732D69676E6F7265222C227472756522293B7472797B224952223D3D732626723F28617065782E64656275672E696E666F2822414F503A2047657474696E6720746865206461746120666F722076';
wwv_flow_api.g_varchar2_table(168) := '526567696F6E496473222C72292C414F502E676574416C6C496D61676555706C6F616441727261797328642C66756E6374696F6E28297B414F502E646F776E6C6F6164414F5046696C652866756E6374696F6E28297B672E72656D6F766528292C617065';
wwv_flow_api.g_varchar2_table(169) := '782E64612E726573756D6528612E726573756D6543616C6C6261636B2C2131297D297D29293A414F502E646F776E6C6F6164414F5046696C652866756E6374696F6E28297B672E72656D6F766528292C617065782E64612E726573756D6528612E726573';
wwv_flow_api.g_varchar2_table(170) := '756D6543616C6C6261636B2C2131297D297D63617463682865297B617065782E6576656E742E7472696767657228414F502E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D6572726F7222292C672E72656D6F';
wwv_flow_api.g_varchar2_table(171) := '766528292C617065782E64612E726573756D6528612E726573756D6543616C6C6261636B2C2131297D7D7D3B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(209496049103009182)
,p_plugin_id=>wwv_flow_api.id(2010965116496925677)
,p_file_name=>'js/aop_da.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
