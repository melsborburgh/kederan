prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_180100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2018.04.04'
,p_release=>'18.1.0.00.45'
,p_default_workspace_id=>36378915130075744
,p_default_application_id=>102
,p_default_owner=>'APEXOFFICEPRINT'
);
end;
/
prompt --application/shared_components/plugins/process_type/be_apexrnd_aop
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(99442633011902309)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'BE.APEXRND.AOP'
,p_display_name=>'APEX Office Print (AOP) - Process'
,p_supported_ui_types=>'DESKTOP'
,p_api_version=>1
,p_execution_function=>'aop_api_pkg.f_process_aop'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX Office Print (AOP) was created by APEX R&D to facilitate exporting data and printing documents in Oracle Application Express (APEX) based on an Office document (Word, Excel, Powerpoint) or HTML, Markdown or Text. This plugin can only be used to '
||'print to AOP and is copyrighted by APEX R&D. If you have any questions please contact support@apexofficeprint.com.',
'We hope you enjoy AOP!',
'',
'Note that your page attribute "Reload on Submit" need to be set to "Always" and NOT "Only for Success" to use the process type plugin. If you want to keep "Only for Success", please use the APEX Office Print (AOP) Dynamic Action plugin.'))
,p_version_identifier=>'18.2'
,p_about_url=>'https://www.apexofficeprint.com'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99442949075902311)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
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
 p_id=>wwv_flow_api.id(99443293629902311)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
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
 p_id=>wwv_flow_api.id(99443784996902312)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
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
 p_id=>wwv_flow_api.id(99444152493902312)
,p_plugin_attribute_id=>wwv_flow_api.id(99443784996902312)
,p_display_sequence=>10
,p_display_value=>'Remote'
,p_return_value=>'Yes'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enabling remote debug will capture the JSON and is made available in your dashboard at https://www.apexofficeprint.com.',
'This makes it easier to debug your JSON, check if it''s valid and contact us in case you need support.',
'This option only works when you use http(s)://www.apexofficeprint.com/api in your AOP settings.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99444627990902313)
,p_plugin_attribute_id=>wwv_flow_api.id(99443784996902312)
,p_display_sequence=>20
,p_display_value=>'Local'
,p_return_value=>'Local'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enabling local debug will download the JSON that is sent to the AOP server component. ',
'This makes it easier to debug your JSON, check if it''s valid and contact us in case you need support.',
'Note that the output file will not be produced and the server will never be called.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(101930325296615205)
,p_plugin_attribute_id=>wwv_flow_api.id(99443784996902312)
,p_display_sequence=>30
,p_display_value=>'Derived from Application Item'
,p_return_value=>'APEX_ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option is useful when you want to dynamically set AOP debugging.<br/>',
'The application item needs to be called AOP_DEBUG and can have values: No, Yes (=Remote) or Local.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99445192739902313)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>4
,p_display_sequence=>4000
,p_prompt=>'Converter'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(99442949075902311)
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
 p_id=>wwv_flow_api.id(99445568198902313)
,p_plugin_attribute_id=>wwv_flow_api.id(99445192739902313)
,p_display_sequence=>10
,p_display_value=>'MS Office (Windows only)'
,p_return_value=>'officetopdf'
,p_help_text=>'Uses Microsoft Office to do the conversion and following module http://officetopdf.codeplex.com'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99446054074902314)
,p_plugin_attribute_id=>wwv_flow_api.id(99445192739902313)
,p_display_sequence=>20
,p_display_value=>'Custom'
,p_return_value=>'custom'
,p_help_text=>'Specify the name of the custom converter defined at the AOP Server.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99446519420902314)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>5
,p_display_sequence=>5000
,p_prompt=>'Use settings defined in package'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_examples=>'aop_settings_pkg'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'When you use a different AOP server in DEV, TEST, PROD it might be easier to define the package where the settings (e.g. AOP server) is defined.<br/>',
'This makes deployments seamless and you don''t need to update the plug-in component settings manually afterwards.<br/>',
'When a package is defined, we will always read those settings, regardless what is filled in above.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99446936286902314)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
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
 p_id=>wwv_flow_api.id(99447369628902315)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>7
,p_display_sequence=>9000
,p_prompt=>'Failover procedure'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(99446936286902314)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_examples=>'aop_sample_pkg.failover_procedure;'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Specify the procedure that should be called when the failover url is used.',
'The procedure can for example send an email to notify the primary AOP url is not used, but the fallback url.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99447757872902315)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
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
 p_id=>wwv_flow_api.id(55206099863358457)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>9
,p_display_sequence=>4050
,p_prompt=>'Custom Converter'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(99445192739902313)
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
 p_id=>wwv_flow_api.id(99448190780902316)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>23
,p_prompt=>'Data Source'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(99458139734902321)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'URL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'select ',
'  ''file1'' as filename,  ',
'  cursor( ',
'    select',
'      c.cust_first_name, ',
'      c.cust_last_name, ',
'      c.cust_city, ',
'      cursor(select o.order_total, ''Order '' || rownum as order_name,',
'                cursor(select p.product_name, i.quantity, i.unit_price, APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as image ',
'                         from demo_order_items i, demo_product_info p ',
'                        where o.order_id = i.order_id ',
'                          and i.product_id = p.product_id ',
'                      ) product                 ',
'               from demo_orders o ',
'              where c.customer_id = o.customer_id ',
'            ) orders ',
'    from demo_customers c ',
'    where customer_id = :id ',
'  ) as data ',
'from dual ',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Create (in for example ORDS) a new REST web service with a GET, source type "Query" and format "JSON".<br/>',
'Put the url in this text box, e.g. https://www.apexofficeprint.com/ords/aop/get_data/1',
'<br/><br/>',
'Here''s an example of a query in ORDS which contains a parameter too:',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99448528043902316)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>27
,p_prompt=>'Special'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(99458139734902321)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'SQL,PLSQL_SQL,IR'
,p_lov_type=>'STATIC'
,p_help_text=>'Specific features of APEX Office Print'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99449406235902316)
,p_plugin_attribute_id=>wwv_flow_api.id(99448528043902316)
,p_display_sequence=>10
,p_display_value=>'Treat all numbers as strings'
,p_return_value=>'NUMBER_TO_STRING'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'There''s a limitation in APEX with the cursor() statement in SQL that it doesn''t remember which datatype the column is in. So when doing to_char(0.9,''990D00'') it will return 0.9 as number instead of as string ''0.90''. To resolve this, enable this check'
||'box and concatenate your number with ''!FMT!'' e.g. ''!FMT!''||to_char(35, ''990D00'') - !FMT! stands for format.',
'</p>',
'<p>',
'Alternatively if you format your number with the currency sign to_char(35,''FML990D00'') Oracle will recognise it as a string and you don''t need to use this checkbox.',
'</p>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99449920130902317)
,p_plugin_attribute_id=>wwv_flow_api.id(99448528043902316)
,p_display_sequence=>20
,p_display_value=>'Report as Labels'
,p_return_value=>'REPORT_AS_LABELS'
,p_help_text=>'Check this box in case you want to use the Classic or Interactive Report data source but print them as Labels (using the Mailings feature in Word).'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99450486749902317)
,p_plugin_attribute_id=>wwv_flow_api.id(99448528043902316)
,p_display_sequence=>30
,p_display_value=>'IR/IG: Show Filters on top'
,p_return_value=>'FILTERS_ON_TOP'
,p_help_text=>'When there''re filters applied to the Interactive Report, this checkbox will print them above the report.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99450975416902317)
,p_plugin_attribute_id=>wwv_flow_api.id(99448528043902316)
,p_display_sequence=>40
,p_display_value=>'IR/IG: Show Highlights on top'
,p_return_value=>'HIGHLIGHTS_ON_TOP'
,p_help_text=>'When there''re highlights applied to the Interactive Report, this checkbox will print them above the report.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99451405253902318)
,p_plugin_attribute_id=>wwv_flow_api.id(99448528043902316)
,p_display_sequence=>50
,p_display_value=>'IR/IG: Show header with filter (Excel)'
,p_return_value=>'HEADER_WITH_FILTER'
,p_help_text=>'When exporting the Interactive Report to Excel, show the header with filter option.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99451930844902318)
,p_plugin_attribute_id=>wwv_flow_api.id(99448528043902316)
,p_display_sequence=>60
,p_display_value=>'IR/IG: Use Saved Report instead of Report in Session'
,p_return_value=>'ALWAYS_REPORT_ALIAS'
,p_help_text=>'When defining the Interactive Report source ir1|my_saved_report, the "my_saved_report" will be used, even when the person is looking at a different report in his session session.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99448903612902316)
,p_plugin_attribute_id=>wwv_flow_api.id(99448528043902316)
,p_display_sequence=>70
,p_display_value=>'IR/IG: Repeat header on every page'
,p_return_value=>'repeat_header'
,p_help_text=>'When the table spans multiple pages, the header row will be repeated on every page.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99452459458902318)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Output Filename'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Static: my_file',
'</p>',
'<p>',
'APEX Item: &P1_FILENAME.',
'</p>'))
,p_help_text=>'The filename can be a hard coded string or reference an APEX item. It does not need to include the file extension. If a file extension is defined that is different the the output type selected, a new file extension will be appended to the filename.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99452804234902318)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>31
,p_prompt=>'Output Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'docx'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99457693452902321)
,p_plugin_attribute_id=>wwv_flow_api.id(99452804234902318)
,p_display_sequence=>10
,p_display_value=>'Word (docx)'
,p_return_value=>'docx'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99454745450902320)
,p_plugin_attribute_id=>wwv_flow_api.id(99452804234902318)
,p_display_sequence=>20
,p_display_value=>'Excel (xlsx)'
,p_return_value=>'xlsx'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99455175709902320)
,p_plugin_attribute_id=>wwv_flow_api.id(99452804234902318)
,p_display_sequence=>30
,p_display_value=>'Powerpoint (pptx)'
,p_return_value=>'pptx'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99455684443902320)
,p_plugin_attribute_id=>wwv_flow_api.id(99452804234902318)
,p_display_sequence=>40
,p_display_value=>'PDF (pdf)'
,p_return_value=>'pdf'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99456644514902321)
,p_plugin_attribute_id=>wwv_flow_api.id(99452804234902318)
,p_display_sequence=>60
,p_display_value=>'HTML (html)'
,p_return_value=>'html'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99454270992902319)
,p_plugin_attribute_id=>wwv_flow_api.id(99452804234902318)
,p_display_sequence=>65
,p_display_value=>'Markdown (md)'
,p_return_value=>'md'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99453724240902319)
,p_plugin_attribute_id=>wwv_flow_api.id(99452804234902318)
,p_display_sequence=>66
,p_display_value=>'Text (txt)'
,p_return_value=>'txt'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99456100020902320)
,p_plugin_attribute_id=>wwv_flow_api.id(99452804234902318)
,p_display_sequence=>67
,p_display_value=>'Word (rtf)'
,p_return_value=>'rtf'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(78524138960597062)
,p_plugin_attribute_id=>wwv_flow_api.id(99452804234902318)
,p_display_sequence=>68
,p_display_value=>'CSV (csv)'
,p_return_value=>'csv'
,p_help_text=>'Comma separated values file. Text file containing information separated by commas.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99453292892902319)
,p_plugin_attribute_id=>wwv_flow_api.id(99452804234902318)
,p_display_sequence=>69
,p_display_value=>'One Page PDF (pdf)'
,p_return_value=>'onepagepdf'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99457160163902321)
,p_plugin_attribute_id=>wwv_flow_api.id(99452804234902318)
,p_display_sequence=>70
,p_display_value=>'Defined by APEX Item'
,p_return_value=>'apex_item'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99458139734902321)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>20
,p_prompt=>'Data Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'SQL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99458581921902322)
,p_plugin_attribute_id=>wwv_flow_api.id(99458139734902321)
,p_display_sequence=>10
,p_display_value=>'SQL'
,p_return_value=>'SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a select statement in which you can use a cursor to do nested records. Use "" as alias for column names to force lower case column names.<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99459034167902322)
,p_plugin_attribute_id=>wwv_flow_api.id(99458139734902321)
,p_display_sequence=>15
,p_display_value=>'PL/SQL Function (returning SQL)'
,p_return_value=>'PLSQL_SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a PL/SQL procedure that returns as select statement in which you can use a cursor to do nested records. Use "" as alias for column names to force lower case column names.<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99459567368902322)
,p_plugin_attribute_id=>wwv_flow_api.id(99458139734902321)
,p_display_sequence=>20
,p_display_value=>'PL/SQL Function (returning JSON)'
,p_return_value=>'PLSQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Return JSON as defined in the URL example above.',
'(see example in help of Data Source)'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99460049767902322)
,p_plugin_attribute_id=>wwv_flow_api.id(99458139734902321)
,p_display_sequence=>30
,p_display_value=>'URL (returning JSON)'
,p_return_value=>'URL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The Source should point to a URL that returns a JSON object with following format:',
'{',
'  "filename": "file1",',
'  "data":[{...}]',
'}',
'If the URL is using an APEX/ORDS REST call it will automatically be wrapped with additional JSON: {"items":[...]} This is ok as the plugin removes it for you.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99460557403902323)
,p_plugin_attribute_id=>wwv_flow_api.id(99458139734902321)
,p_display_sequence=>40
,p_display_value=>'Classic and/or Interactive Report/Grid(s)'
,p_return_value=>'IR'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99461033727902323)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>10
,p_prompt=>'Template Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'AOP Template'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'<b>AOP Template</b>: will generate a Word document with a starting template based on the data (JSON) that is submitted. <br/>',
'Documentation is also added on the next page(s) that describe the functions AOP will understand.',
'</p>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99461952592902324)
,p_plugin_attribute_id=>wwv_flow_api.id(99461033727902323)
,p_display_sequence=>5
,p_display_value=>'Static Application Files'
,p_return_value=>'APEX'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the filename of the file uploaded to your Shared Components > Static Application Files<br/>',
'e.g. aop_template_d01.docx'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99462432274902324)
,p_plugin_attribute_id=>wwv_flow_api.id(99461033727902323)
,p_display_sequence=>7
,p_display_value=>'Static Workspace Files'
,p_return_value=>'WORKSPACE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the filename of the file uploaded to your Shared Components > Static Workspace Files<br/>',
'e.g. aop_template_d01.docx'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99462913178902324)
,p_plugin_attribute_id=>wwv_flow_api.id(99461033727902323)
,p_display_sequence=>10
,p_display_value=>'SQL'
,p_return_value=>'SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Query that returns two columns: template_type and file (in this order) <br/>',
'- template_type: docx,xlsx,pptx <br/>',
'- file: blob column'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99461444440902323)
,p_plugin_attribute_id=>wwv_flow_api.id(99461033727902323)
,p_display_sequence=>15
,p_display_value=>'PL/SQL Function (returning SQL)'
,p_return_value=>'PLSQL_SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a PL/SQL procedure that returns a select statement with two columns: template_type and file (in this order) <br/>',
'- template_type: docx, xlsx, pptx, html, md <br/>',
'- file: blob column',
'<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99463475559902324)
,p_plugin_attribute_id=>wwv_flow_api.id(99461033727902323)
,p_display_sequence=>20
,p_display_value=>'PL/SQL Function (returning JSON)'
,p_return_value=>'PLSQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Return JSON object with following format: ',
'<pre>',
'{',
'  "file":"clob base 64 data",',
'  "template_type":"docx,xlsx,pptx"',
'}',
'</pre>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99463939231902325)
,p_plugin_attribute_id=>wwv_flow_api.id(99461033727902323)
,p_display_sequence=>30
,p_display_value=>'Filename (with path relative to AOP server)'
,p_return_value=>'FILENAME'
,p_help_text=>'Enter the path and filename of the template which is stored on the same server AOP is running at.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99464439072902325)
,p_plugin_attribute_id=>wwv_flow_api.id(99461033727902323)
,p_display_sequence=>40
,p_display_value=>'URL (returning file)'
,p_return_value=>'URL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the url to your template in docx, xlsx or pptx. <br/>',
'e.g. http://apexofficeprint.com/templates/aop_template_d01.docx'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99464964033902325)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>11
,p_prompt=>'Template Source'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(99461033727902323)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'APEX,WORKSPACE,FILENAME,URL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Reference a file in Shared Components > Static Application Files',
'</p>',
'<p>',
'Reference a file on the server. Include the path relative to the AOP executable.',
'</p>',
'<pre>',
'aop_template.docx',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The templates need to be of format: Word (docx), Excel (xlsx), Powerpoint (pptx), HTML (html) or Markdown (md).',
'</p>',
'<p>',
'The template needs to be base64 encoded. You can use the apex_web_service.blob2clobbase64 package to do this. <br/>',
'Below you find some examples. You can use substitution variables in the select statement.',
'</p>',
'<b>Filename (with path relative to AOP server)</b>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99465319079902325)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>32
,p_prompt=>'Output Type APEX Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(99452804234902318)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'apex_item'
,p_help_text=>'APEX item that contains the output type. See Output Type help text for valid list of output types.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99465736230902326)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>12
,p_prompt=>'Template Source'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(99461033727902323)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
' select template_type, template_blob',
'  from aop_template  ',
' where id = :P1_TEMPLATE_ID ',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'When you use your own table (or the one that is provided in the sample AOP app) to store the template documents, this select statement might help:',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99466109722902326)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>13
,p_prompt=>'Template Source'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(99461033727902323)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PLSQL,PLSQL_SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h3>PL/SQL Function (returning SQL)</h3>',
'<pre>',
'declare',
'  l_return clob;',
'begin',
'  l_return := q''[',
'    select',
'      a.TEMPLATE_TYPE as template_type,',
'      apex_web_service.blob2clobbase64(a.TEMPLATE_BLOB) as file',
'     from aop_template a',
'    where id = 1',
'  ]'';',
'  return l_return;',
'end;',
'</pre>',
'',
'<br/><br/>',
'',
'<h3>PL/SQL Function (returning JSON)</h3>',
'<pre>',
'declare ',
'  l_return        clob; ',
'  l_template      clob; ',
'  l_template_type aop_template.template_type%type; ',
'begin ',
'  select template_type, apex_web_service.blob2clobbase64(template_blob) template ',
'    into l_template_type, l_template ',
'    from aop_template ',
'   where id = :p4_template;',
'',
'  l_return := ''{ "file": "'' || replace(l_template,''"'', ''\u0022'') ',
'              || ''",'' || '' "template_type": "'' || replace(l_template_type,''"'', ''\u0022'') ',
'              || ''" }''; ',
'',
'  return l_return;',
'end;',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'By using PL/SQL to create your own SQL or JSON, you''re more flexible. You can use bind variables and page items.',
'</p>',
'<p>',
'The JSON format should be file and template_type. You can use substitution variables in the PL/SQL code. <br/>',
'The structure is like this:',
'</p>',
'<pre>',
'declare ',
'  l_return        clob; ',
'begin ',
'  l_return := ''{ "file": "", "template_type": "docx" }''; ',
'',
'  return l_return; ',
'end;',
'</pre>'))
);
end;
/
begin
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99466545503902326)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>21
,p_prompt=>'Data Source'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(99458139734902321)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Details of a customer e.g. for a letter</p>',
'<pre>',
'select',
'    ''file1'' as "filename",',
'    cursor',
'    (select ',
'         c.cust_first_name as "cust_first_name",',
'         c.cust_last_name as "cust_last_name",',
'         c.cust_city as "cust_city"',
'       from demo_customers c',
'      where c.customer_id = 1 ',
'    ) as "data"',
'from dual',
'</pre>',
'',
'<p>List of all customers e.g. to send letter to all</p>',
'<pre>',
'select',
'    ''file1'' as "filename",',
'    cursor',
'    (select ',
'       cursor(select',
'                  c.cust_first_name as "cust_first_name",',
'                  c.cust_last_name as "cust_last_name",',
'                  c.cust_city as "cust_city" ',
'                from demo_customers c) as "customers"',
'       from dual) as "data"',
'from dual ',
'</pre>',
'',
'<p>Details of all orders of a customer e.g. for invoices</p>',
'<pre>',
'select',
'  ''file1'' as "filename", ',
'  cursor(',
'    select',
'      c.cust_first_name as "cust_first_name",',
'      c.cust_last_name as "cust_last_name",',
'      c.cust_city as "cust_city",',
'      cursor(select o.order_total as "order_total", ',
'                    ''Order '' || rownum as "order_name",',
'                cursor(select p.product_name as "product_name", ',
'                              i.quantity as "quantity",',
'                              i.unit_price as "unit_price", APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"',
'                         from demo_order_items i, demo_product_info p',
'                        where o.order_id = i.order_id',
'                          and i.product_id = p.product_id',
'                      ) "product"',
'               from demo_orders o',
'              where c.customer_id = o.customer_id',
'            ) "orders"',
'    from demo_customers c',
'    where customer_id = 1',
'  ) as "data"',
'from dual',
'</pre>',
'',
'<p>Example of a SQL statement for a Column Chart</p>',
'<pre>',
'select',
'    ''file1'' as "filename",',
'    cursor(select',
'        cursor(select',
'            c.cust_first_name || '' '' || c.cust_last_name as "customer",',
'            c.cust_city                                  as "city"    ,',
'            o.order_total                                as "total"   ,',
'            o.order_timestamp                            as "timestamp"',
'          from demo_customers c, demo_orders o',
'          where c.customer_id = o.customer_id',
'          order by c.cust_first_name || '' '' || c.cust_last_name     ',
'        ) as "orders",',
'        cursor(select',
'            ''column'' as "type",',
'           ''My Column Chart'' as "name",   ',
'            cursor',
'            (select',
'                576     as "width" ,',
'                336     as "height",',
'                ''Title'' as "title in chart" ,',
'                ''true''  as "grid"  ,',
'                ''true''  as "border"',
'              from dual',
'            ) as "options",',
'            cursor(select',
'                ''column'' as "name",',
'                cursor',
'                (select',
'                    c.cust_first_name || '' '' || c.cust_last_name as "x",',
'                    sum(o.order_total)                           as "y"',
'                  from demo_customers c, demo_orders o',
'                  where c.customer_id = o.customer_id',
'                  group by c.cust_first_name || '' '' || c.cust_last_name',
'                 order by c.cust_first_name || '' '' || c.cust_last_name',
'                ) as "data"',
'              from dual) as "columns"',
'          from dual) as "chart"',
'      from dual) as "data"',
'  from dual ',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'A SQL statement is the easiest to use, but some complex statements might not run.<br/>',
'Images need to be base64 encoded. You can reference items by using :ITEM ',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99466938372902327)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>22
,p_prompt=>'Data Source'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(99458139734902321)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PLSQL,PLSQL_SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h3>PL/SQL Function (returning SQL)</h3>',
'<pre>',
'declare',
'  l_return clob;',
'begin',
'  l_return := q''[',
'    select',
'      ''file1'' as "filename",',
'      cursor(',
'        select',
'          c.cust_first_name as "cust_first_name",',
'          c.cust_last_name as "cust_last_name",',
'          c.cust_city as "cust_city",',
'          cursor(',
'            select',
'              o.order_total as "order_total",',
'              ''Order '' || rownum as "order_name",',
'              cursor(',
'                select',
'                  p.product_name as "product_name",',
'                  i.quantity as "quantity",',
'                  i.unit_price as "unit_price",',
'                  APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"',
'                from',
'                  demo_order_items i, demo_product_info p',
'                where',
'                  o.order_id = i.order_id',
'                  and i.product_id = p.product_id',
'                    ) "product"',
'            from',
'              demo_orders o',
'            where',
'              c.customer_id = o.customer_id',
'                ) "orders"',
'        from',
'          demo_customers c',
'        where',
'          customer_id = :P4_CUSTOMER_ID',
'            ) as "data"',
'    from dual',
'  ]'';',
'  return l_return;',
'end;',
'</pre>',
'',
'<br/><br/>',
'',
'<h3>PL/SQL Function (returning JSON)</h3>',
'<pre>',
'declare',
'  l_cursor sys_refcursor;',
'  l_return clob;',
'begin',
'  apex_json.initialize_clob_output(dbms_lob.call, true, 2) ;',
'  open l_cursor for ',
'  select ''file1'' as "filename",',
'  cursor',
'    (select',
'        c.cust_first_name as "cust_first_name",',
'        c.cust_last_name  as "cust_last_name" ,',
'        c.cust_city       as "cust_city"      ,',
'        cursor',
'        (select',
'            o.order_total      as "order_total",',
'            ''Order '' || rownum as "order_name" ,',
'            cursor',
'            (select',
'                p.product_name                                    as "product_name",',
'                i.quantity                                        as "quantity"    ,',
'                i.unit_price                                      as "unit_price"  ,',
'                apex_web_service.blob2clobbase64(p.product_image) as "image"',
'              from',
'                demo_order_items i,',
'                demo_product_info p',
'              where',
'                o.order_id       = i.order_id',
'                and i.product_id = p.product_id',
'            ) "product"',
'        from',
'          demo_orders o',
'        where',
'          c.customer_id = o.customer_id',
'        ) "orders"',
'      from',
'        demo_customers c',
'      where',
'        customer_id = :P4_CUSTOMER_ID',
'    ) as "data" ',
'  from dual;',
'  apex_json.write(l_cursor) ;',
'  l_return := apex_json.get_clob_output;',
'  return l_return;',
'end;',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'By using PL/SQL to create your own SQL or JSON, you''re more flexible. You can use bind variables and page items.',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99467383477902327)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>25
,p_prompt=>'Region Static Id(s)'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(99458139734902321)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'IR'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Define one or more Static Id(s) of the report region. Static ids should be separated by a comma. e.g. ir1,ir2 <br/>',
'You can set the Static ID of the region in the region attributes.',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99467732678902327)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
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
 p_id=>wwv_flow_api.id(99469643525902328)
,p_plugin_attribute_id=>wwv_flow_api.id(99467732678902327)
,p_display_sequence=>10
,p_display_value=>'Procedure'
,p_return_value=>'PROCEDURE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option will call a procedure in a specific format. This option is useful in case you don''t need the file on your own harddrive, but for example you want to mail the document automatically.',
'In that case you can create a procedure that adds the generated document as an attachment to your apex_mail.send.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99468671364902328)
,p_plugin_attribute_id=>wwv_flow_api.id(99467732678902327)
,p_display_sequence=>20
,p_display_value=>'Procedure and Browser (file)'
,p_return_value=>'PROCEDURE_BROWSER'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option allows you to call a procedure first and next download the file to your harddrive.',
'An example is when you first want to store the generated document in a table before letting the browser to download it.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99469147560902328)
,p_plugin_attribute_id=>wwv_flow_api.id(99467732678902327)
,p_display_sequence=>30
,p_display_value=>'Inline Region (pdf/html/md only)'
,p_return_value=>'BROWSER_INLINE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(99468146873902327)
,p_plugin_attribute_id=>wwv_flow_api.id(99467732678902327)
,p_display_sequence=>40
,p_display_value=>'Directory (on AOP Server)'
,p_return_value=>'DIRECTORY'
,p_help_text=>'Save the file to a directory specified with g_output_directory. The default directory on the AOP Server is outputfiles.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(101700205124118225)
,p_plugin_attribute_id=>wwv_flow_api.id(99467732678902327)
,p_display_sequence=>50
,p_display_value=>'Cloud (Dropbox, Google Drive, OneDrive, Amazon S3)'
,p_return_value=>'CLOUD'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Save the output straight in a directory on the cloud. <br/>',
'Use following global variables to define the provider and location.',
'<ul>',
'<li>g_cloud_provider (dropbox, gdrive, onedrive, amazon_s3)</li>',
'<li>g_cloud_location (directory, or bucket with directory on Amazon)</li>',
'<li>g_cloud_access_token (oauth token)</li>',
'</ul>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(99470104579902329)
,p_plugin_id=>wwv_flow_api.id(99442633011902309)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Procedure Name'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(99467732678902327)
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
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
