set define off verify off feedback off

/**
 * @Description: Package to hold settings of AOP, defined in global variables. 
 *               Reference this package in the APEX Plug-in. 
 *               Using only the PL/SQL API you don't need to use this package as you can just define the global variables.
 *
 * @Author: Dimitri Gielis
 * @Created: 12/12/2015
 */ 
create or replace package aop_settings18_pkg
AUTHID CURRENT_USER
as

/* Copyright 2015-2018 - APEX RnD
*/

/* AOP Version */
c_aop_version        constant varchar2(5) := '18.2';

-- AOP Plug-in Component Settings

-- AOP Server url
g_aop_url            varchar2(100) := 'http://api.apexofficeprint.com/'; -- for https use https://api.apexofficeprint.com/

-- AOP Server url in case of failure of AOP URL
g_failover_aop_url   varchar2(100) := 'http://www.cloudofficeprint.com/aop/'; -- for https use https://www.cloudofficeprint.com/aop/ 

-- When the failover url is used, the procedure specified in this variable will be called
g_failover_procedure varchar2(200) := null;

-- AOP API Key; only needed when AOP Cloud is used (http(s)://api.apexofficeprint.com/)
g_api_key            varchar2(50)  := '';

-- Set AOP in Debug mode
-- options: Local, Yes(=Remote), No
g_debug              varchar2(10)  := 'No';

-- Set the converter to go to PDF (or other format different from template)
-- options: null (LibreOffice), officetopdf (MS Office - Windows only), custom (Custom defined)
g_converter          varchar2(50)  := null;

-- Split file: one file per page: true/false
g_output_split       varchar2(5)   := null;   

end aop_settings18_pkg;
/
create or replace package aop_sample18_pkg as

/* Copyright 2015-2018 - APEX RnD
*/

/* AOP Version */
c_aop_version  constant varchar2(5)   := '18.2';


--
-- Change following variables for your environment
--
g_aop_url  varchar2(200) := 'http://api.apexofficeprint.com/'; -- for https use https://api.apexofficeprint.com/
g_api_key  varchar2(200) := '';                                -- change to your API key


--
-- Store output in AOP Output table
--
procedure aop_store_document(
    p_output_blob      in blob,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2);


--
-- Send email with attachment from AOP
--
procedure send_email_prc(
    p_output_blob      in blob,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2);


--
-- Send HTML email from AOP
--
procedure send_html_prc(
    p_output_blob      in blob,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2);


--
-- AOP_PLSQL_PKG example
--
procedure call_aop_plsql_pkg;


--
-- AOP_API18_pkg example
--
procedure call_aop_api_pkg;


--
-- AOP_API18_pkg example to IP Printer
--
procedure call_aop_api_ip;


--
-- Procedure which can be scheduled with dbms_scheduler
--
procedure schedule_aop_api_pkg;


--
-- REST example (call this procedure from ORDS)
--
function get_file(p_customer_id   in number,
                  p_output_type   in varchar2)
return blob;


--
-- write to filesystem
--
procedure write_filesystem;


--
-- view the tags that are used in a template (docx)
--
procedure get_tags_in_template;


--
-- all possible options for Excel cell styling
--
function test_excel_styles
return clob;

--
-- custom debug procedure which can be called by AOP to log what's happening
--
procedure custom_debug(p_message     in varchar2, 
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

--
-- Failover procedure that will notify the administrator
--
procedure failover_procedure;

--
-- D3 example
--
function d3_radial_stacked_bar
return clob;

--
-- PL/SQL Function Returning SQL
--
function plsql_function_returning_sql
return clob;

end aop_sample18_pkg;
/
/**
 * @Description: Examples to show case how to use the different AOP PL/SQL APIs.
 *
 * @Author: Dimitri Gielis
 * @Created: 12/12/2015
 */
 
 create or replace package body aop_sample18_pkg as

--
-- Package constants
--

-- change to the APP id of the AOP Sample App
c_app_id constant number(10) := 232;


--
-- Store output in AOP Output table
--
procedure aop_store_document(
    p_output_blob      in blob,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2)
as
begin
  insert into aop_output (output_blob, filename, mime_type, last_update_date)
  values (p_output_blob, p_output_filename, p_output_mime_type, sysdate);

  commit;
end aop_store_document;


--
-- Send email with attachment from AOP
--
procedure send_email_prc(
    p_output_blob      in blob,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2)
as
  l_id number;
begin
  l_id := apex_mail.send(
            p_to => 'support@apexofficeprint.com',
            p_from => 'support@apexofficeprint.com',
            p_subj => 'Mail from APEX with attachment',
            p_body => 'Please review the attachment.',
            p_body_html => '<b>Please</b> review the attachment.') ;
  apex_mail.add_attachment(
      p_mail_id    => l_id,
      p_attachment => p_output_blob,
      p_filename   => p_output_filename,
      p_mime_type  => p_output_mime_type) ;
  commit;
end send_email_prc;


--
-- Send html email from AOP
--
procedure send_html_prc(
    p_output_blob      in blob,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2)
as
  l_body      clob;
  l_body_html clob;
begin
  l_body      := 'HTML view only';
  l_body_html := aop_api_pkg.blob2clob(p_output_blob);  

  apex_mail.send( 
            p_to => 'support@apexofficeprint.com', 
            p_from => 'support@apexofficeprint.com', 
            p_subj => 'HTML Email with AOP', 
            p_body => l_body, 
            p_body_html => l_body_html);
  apex_mail.push_queue;
end send_html_prc;


--
-- AOP_PLSQL_pkg example
--
procedure call_aop_plsql_pkg
as
  c_mime_type_docx  varchar2(100) := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
  c_mime_type_xlsx  varchar2(100) := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
  c_mime_type_pptx  varchar2(100) := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
  c_mime_type_pdf   varchar2(100) := 'application/pdf';
  l_template        blob;
  l_output_file     blob;
begin
  select template_blob
    into l_template
    from aop_template
   where id = 1;

  l_output_file := aop_plsql_pkg.make_aop_request(
                     p_json             => '[{ "filename": "file1", "data": [{ "cust_first_name": "APEX Office Print" }] }]',
                     p_template         => l_template,
                     p_output_encoding  => 'raw',
                     p_output_type      => 'docx',
                     p_aop_remote_debug => 'No');

  insert into aop_output (output_blob, filename, mime_type, last_update_date)
  values (l_output_file, 'output.docx', c_mime_type_docx, sysdate);
end call_aop_plsql_pkg;


--
-- AOP_API_pkg example
--
procedure call_aop_api_pkg
as
  l_binds           wwv_flow_plugin_util.t_bind_list;
  l_return          blob;
  l_output_filename varchar2(100) := 'output';

begin
  -- define bind variables
  l_binds(1).name := 'p_id';
  l_binds(1).value := '1';

  for i in 1..l_binds.count
  loop
    dbms_output.put_line('AOP: Bind ' || to_char(i) || ': ' || l_binds(i).name || ': ' || l_binds(i).value);
  end loop;

  l_return := aop_api_pkg.plsql_call_to_aop (
                p_data_type       => 'SQL',
                p_data_source     => q'[
                  select
                    'file1' as "filename",
                    cursor(
                      select
                        c.cust_first_name as "cust_first_name",
                        c.cust_last_name as "cust_last_name",
                        c.cust_city as "cust_city",
                        cursor(select o.order_total as "order_total",
                                      'Order ' || rownum as "order_name",
                                  cursor(select p.product_name as "product_name",
                                                i.quantity as "quantity",
                                                i.unit_price as "unit_price", APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"
                                           from demo_order_items i, demo_product_info p
                                          where o.order_id = i.order_id
                                            and i.product_id = p.product_id
                                        ) "product"
                                 from demo_orders o
                                where c.customer_id = o.customer_id
                              ) "orders"
                      from demo_customers c
                      where customer_id = :p_id
                    ) as "data"
                  from dual
                ]',
                p_template_type   => 'SQL',
                p_template_source => q'[
                   select template_type, template_blob
                    from aop_template
                   where id = 1
                ]',
                p_output_type     => 'docx',
                p_output_filename => l_output_filename,
                p_binds           => l_binds,
                p_aop_url         => g_aop_url,
                p_api_key         => g_api_key,
                p_app_id          => c_app_id);

  insert into aop_output (output_blob, filename, mime_type, last_update_date)
  values (l_return, l_output_filename, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', sysdate);
end call_aop_api_pkg;


--
-- AOP_API_pkg example to IP Printer
--
procedure call_aop_api_ip
as
  l_return blob;
  l_result clob;
  l_output_filename varchar2(100) := 'test.pdf';
begin
  l_return := aop_api_pkg.plsql_call_to_aop(
              p_data_type             => 'SQL',
              p_data_source           => q'[select 
                                              'file1' as "filename", 
                                              cursor(
                                                select
                                                  c.cust_first_name as "cust_first_name",
                                                  c.cust_last_name as "cust_last_name",
                                                  c.cust_city as "cust_city",
                                                  cursor(select o.order_total as "order_total", 
                                                                'Order ' || rownum as "order_name",
                                                            cursor(select p.product_name as "product_name", 
                                                                          i.quantity as "quantity",
                                                                          i.unit_price as "unit_price", APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"
                                                                    from demo_order_items i, demo_product_info p
                                                                    where o.order_id = i.order_id
                                                                      and i.product_id = p.product_id
                                                                  ) "product"
                                                          from demo_orders o
                                                          where c.customer_id = o.customer_id
                                                        ) "orders"
                                                from demo_customers c
                                                where customer_id = 1
                                              ) as "data"
                                            from dual ]',
              p_template_type         => 'APEX',
              p_template_source       => 'aop_template_d01.docx',
              p_output_type           => 'pdf',
              p_output_filename       => l_output_filename,
              p_aop_url               => g_aop_url,
              p_api_key               => g_api_key,
              p_app_id                => 232,
              p_page_id               => 88,
              p_init_code             => q'[aop_api_pkg.g_ip_printer_location := 'http://localhost:3000/';
                                            aop_api_pkg.g_ip_printer_version := '1.0';]');

  -- calling an IP Printer will give back the result (Success)
  -- we have to convert blob to clob (text)
  l_result := aop_api_pkg.blob2clob(l_return);
  sys.htp.p(l_result);                  
end call_aop_api_ip;                  


-- procedure which can be scheduled with dbms_scheduler
-- to automatically receive a PDF with a specific Interactive Report
-- debugging is set to Yes
-- set dbms_output or htp output on
-- view the debug output with: select * from apex_debug_messages;
-- view the JSON with: select clob001 from apex_collections where collection_name = 'AOP_DEBUG';
procedure schedule_aop_api_pkg
as
  l_binds           wwv_flow_plugin_util.t_bind_list;
  l_return          blob;
  l_output_filename varchar2(100) := 'output';
  l_id              number;
begin
  aop_api_pkg.create_apex_session(
    p_app_id       => c_app_id,
    --p_user_name    => 'DIMI',
    p_page_id      => 5,
    p_enable_debug => 'Yes');

  apex_util.set_session_state('P5_CUSTOMER_ID','2');

  l_return := aop_api_pkg.plsql_call_to_aop (
                p_data_type       => aop_api_pkg.c_source_type_rpt,
                p_data_source     => 'ir1|PRIMARY',
                p_template_type   => aop_api_pkg.c_source_type_apex,
                p_template_source => 'aop_interactive.docx',
                p_output_type     => 'pdf',
                p_output_filename => l_output_filename,
                p_binds           => l_binds,
                p_aop_url         => g_aop_url,
                p_api_key         => g_api_key,
                p_app_id          => c_app_id,
                p_page_id         => 5);

  l_id := apex_mail.send(
            p_to => 'support@apexofficeprint.com',
            p_from => 'support@apexofficeprint.com',
            p_subj => 'Mail from APEX with attachment PLSQL 2',
            p_body => 'Please review the attachment.',
            p_body_html => '<b>Please</b> review the attachment.') ;
  apex_mail.add_attachment(
      p_mail_id    => l_id,
      p_attachment => l_return,
      p_filename   => l_output_filename,
      p_mime_type  => aop_api_pkg.c_mime_type_pdf) ;
  apex_mail.push_queue;
end schedule_aop_api_pkg;


--
-- REST example (call this procedure from ORDS)
--
function get_file(p_customer_id   in number,
                  p_output_type   in varchar2)
return blob
as PRAGMA AUTONOMOUS_TRANSACTION;
  l_binds           wwv_flow_plugin_util.t_bind_list;
  l_template        varchar2(100);
  l_output_filename varchar2(100);
  l_return          blob;
begin
  if p_output_type = 'xlsx'
  then
    l_template := 'aop_IR_template.xlsx';
  else
    l_template := 'aop_interactive.docx';
  end if;
  l_return := aop_api_pkg.plsql_call_to_aop (
                p_data_type       => aop_api_pkg.c_source_type_rpt,
                p_data_source     => 'ir1|PRIMARY',
                p_template_type   => aop_api_pkg.c_source_type_apex,
                p_template_source => l_template,
                p_output_type     => p_output_type,
                p_output_filename => l_output_filename,
                p_binds           => l_binds,
                p_aop_url         => g_aop_url,
                p_api_key         => g_api_key,
                p_app_id          => c_app_id,
                p_page_id         => 5,
                p_user_name       => 'ADMIN',
                p_init_code       => q'[apex_util.set_session_state('P5_CUSTOMER_ID',']'|| to_char(p_customer_id) || q'[');]',
                p_aop_remote_debug=> 'No');
  -- we have to do a commit in order to call this function from a SQL statement
  commit;
  return l_return;
end get_file;


--
-- write to filesystem
-- MAKE SURE YOU CREATE A DIRECTORY FIRST CALLED AOP_OUTPUT
-- CREATE DIRECTORY AOP_OUTPUT AS '/tmp';
--
procedure write_filesystem
as
  -- aop
  l_binds           wwv_flow_plugin_util.t_bind_list;
  l_output_filename varchar2(100) := 'output';
  -- file
  l_file      UTL_FILE.FILE_TYPE;
  l_buffer    RAW(32767);
  l_amount    BINARY_INTEGER := 32767;
  l_pos       INTEGER := 1;
  l_blob      BLOB;
  l_blob_len  INTEGER;
begin
  -- loop over records
  l_binds(1).name := 'p_id';
  for r in (select 1 as id from dual union all select 2 as id from dual)
  loop
    l_pos := 1;
    l_binds(1).value := r.id;
    -- call AOP
    l_blob := aop_api_pkg.plsql_call_to_aop (
                p_data_type       => 'SQL',
                p_data_source     => q'[
                  select
                    'file1' as "filename",
                    cursor(
                      select
                        c.cust_first_name as "cust_first_name",
                        c.cust_last_name as "cust_last_name",
                        c.cust_city as "cust_city",
                        cursor(select o.order_total as "order_total",
                                      'Order ' || rownum as "order_name",
                                  cursor(select p.product_name as "product_name",
                                                i.quantity as "quantity",
                                                i.unit_price as "unit_price", APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"
                                           from demo_order_items i, demo_product_info p
                                          where o.order_id = i.order_id
                                            and i.product_id = p.product_id
                                        ) "product"
                                 from demo_orders o
                                where c.customer_id = o.customer_id
                              ) "orders"
                      from demo_customers c
                      where customer_id = :p_id
                    ) as "data"
                  from dual
                ]',
                p_template_type   => 'APEX',
                p_template_source => 'aop_template_d01.docx',
                p_output_type     => 'pdf',
                p_output_filename => l_output_filename,
                p_binds           => l_binds,
                p_aop_url         => g_aop_url,
                p_api_key         => g_api_key,
                p_app_id          => c_app_id);

      l_output_filename := to_char(r.id)||'_'||l_output_filename;

      -- write to file system
      BEGIN
        l_blob_len := DBMS_LOB.getlength(l_blob);

        -- Open the destination file.
        l_file := UTL_FILE.fopen('AOP_OUTPUT', l_output_filename,'w', 32767);

        -- Read chunks of the BLOB and write them to the file
        -- until complete.
        WHILE l_pos < l_blob_len LOOP
          DBMS_LOB.read(l_blob, l_amount, l_pos, l_buffer);
          UTL_FILE.put_raw(l_file, l_buffer, TRUE);
          l_pos := l_pos + l_amount;
        END LOOP;

        -- Close the file.
        UTL_FILE.fclose(l_file);

      EXCEPTION
        WHEN OTHERS THEN
          -- Close the file if something goes wrong.
          IF UTL_FILE.is_open(l_file) THEN
            UTL_FILE.fclose(l_file);
          END IF;
          RAISE;
      END;
  end loop;
end write_filesystem;



--
-- view the tags that are used in a template (docx)
--
procedure get_tags_in_template
as
  l_output varchar2(100);
  l_blob   blob;
  l_clob clob;
begin
  l_blob := aop_api_pkg.plsql_call_to_aop(
              p_data_source           => q'[
                  select
                    'file1' as "filename",
                    cursor(
                      select sysdate from dual
                    ) as "data"
                  from dual
                ]',
              p_template_source       => 'aop_template_d01.docx',
              p_output_type           => 'count_tags',
              p_output_filename       => l_output,
              p_aop_url               => g_aop_url,
              p_api_key               => g_api_key,
              p_app_id                => c_app_id
            );

  l_clob := aop_api_pkg.blob2clob(l_blob);
  sys.htp.p(l_clob);
  -- returns: {"{cust_last_name}":1,"{cust_first_name}":2,"{cust_city}":1,"{#orders}":2,"{#product}":2,"{product_name}":2,"{/product}":2,"{order_total}":2,"{/orders}":2,"{%image}":1,"{unit_price}":1,"{#quantity<3}":1,"{quantity}":2,"{/quantity<3}":2,"{^quantity<3}":1,"{ unit_price*quantity }":1}

end get_tags_in_template;


--
-- all possible options for Excel cell styling
--
function test_excel_styles
return clob
as
begin
   return '[{"data": [{
            "tag1": "Lorem ipsum",
            "info1":"in bold and arial",
            "tag1_font_bold":"y",
            "tag1_font_name":"Arial",
            "tag2": "Lorem ipsum",
            "info2":"arial font",
            "tag2_font_name":"Arial",
            "tag3": "Lorem ipsum",
            "info3":"font 20",
            "tag3_font_size":"20",
            "tag4": "Lorem ipsum",
            "info4":"font color #1782A6",
            "tag4_font_color":"#1782A6",
            "tag5": "Lorem ipsum",
            "info5":"underline single",
            "tag5_font_underline":"single",
            "tag6": "Lorem ipsum",
            "info6":"underline double double",
            "tag6_font_underline":"double",
            "tag7": "Lorem ipsum",
            "info7":"underline single financieel",
            "tag7_font_underline":"single-financial",
            "tag8": "Lorem ipsum",
            "info8":"underline dubbel financieel",
            "tag8_font_underline":"double-financial",
            "tag9": "Lorem ipsum",
            "info9":"left:thin, top:medium, right:thick, bottom:hair",
            "tag9_border_left":"thin",
            "tag9_border_top":"medium",
            "tag9_border_right":"thick",
            "tag9_border_bottom":"hair",
            "tag10": "Lorem ipsum",
            "info10":"left:dotted, top:medium-dashed, right:dash-dot, bottom:medium-dash-dot",
            "tag10_border_left":"dotted",
            "tag10_border_top":"medium-dashed",
            "tag10_border_right":"dash-dot",
            "tag10_border_bottom":"medium-dash-dot",
            "tag11": "Lorem ipsum",
            "info11":"left:dash-dot-dot, top:medium-dash-dot-dot, right:slash-dash-dot, bottom:double",
            "tag11_border_left":"dash-dot-dot",
            "tag11_border_top":"medium-dash-dot-dot",
            "tag11_border_right":"slash-dash-dot",
            "tag11_border_bottom":"double",
            "tag29": "Lorem ipsum",
            "info29":"diagonal border, up-wards",
            "tag29_border_diagonal":"dash-dot-dot",
            "tag29_border_diagonal_direction":"up-wards",
            "tag29_border_diagonal_color":"#FFFFFF",
            "tag30": "Lorem ipsum",
            "info30":"diagonal border, down-wards, colored",
            "tag30_border_diagonal":"dotted",
            "tag30_border_diagonal_direction":"down-wards",
            "tag30_border_diagonal_color":"4E8A0E",
            "tag31": "Lorem ipsum",
            "info31":"diagonal border, both",
            "tag31_border_diagonal":"slash-dash-dot",
            "tag31_border_diagonal_direction":"both",
            "tag31_border_diagonal_color":"ED4043",
            "tag12": "Lorem ipsum",
            "info12":"background green, font color blue",
            "tag12_cell_background":"1DF248",
            "tag12_font_color":"020EB8",
            "tag13": "Lorem ipsum",
            "info13":"pattern: dark-gray, pattern green, background yellow",
            "tag13_cell_pattern":"dark-gray",
            "tag13_cell_color":"FF17881D",
            "tag13_background_color":"FFE9E76B",
            "tag14": "Lorem ipsum",
            "info14":"pattern: medium-gray",
            "tag14_cell_pattern":"medium-gray",
            "tag15": "Lorem ipsum",
            "info15":"pattern: light-gray",
            "tag15_cell_pattern":"light-gray",
            "tag16": "Lorem ipsum",
            "info16":"pattern: gray-0625",
            "tag16_cell_pattern":"",
            "tag17": "Lorem ipsum",
            "info17":"pattern: dark-horizontal",
            "tag17_cell_pattern":"dark-horizontal",
            "tag18": "Lorem ipsum",
            "info18":"pattern: dark-vertical",
            "tag18_cell_pattern":"dark-vertical",
            "tag19": "Lorem ipsum",
            "info19":"pattern: dark-down",
            "tag19_cell_pattern":"dark-down",
            "tag20": "Lorem ipsum",
            "info20":"pattern: dark-up",
            "tag20_cell_pattern":"dark-up",
            "tag21": "Lorem ipsum",
            "info21":"pattern: dark-grid",
            "tag21_cell_pattern":"dark-grid",
            "tag22": "Lorem ipsum",
            "info22":"pattern: dark-trellis",
            "tag22_cell_pattern":"dark-trellis",
            "tag23": "Lorem ipsum",
            "info23":"pattern: light-horizontal",
            "tag23_cell_pattern":"light-horizontal",
            "tag24": "Lorem ipsum",
            "info24":"pattern: light-vertical",
            "tag24_cell_pattern":"light-vertical",
            "tag25": "Lorem ipsum",
            "info25":"pattern: light-down",
            "tag25_cell_pattern":"light-down",
            "tag26": "Lorem ipsum",
            "info26":"pattern: light-up",
            "tag26_cell_pattern":"light-up",
            "tag27": "Lorem ipsum",
            "info27":"pattern: light-grid",
            "tag27_cell_pattern":"light-grid",
            "tag28": "Lorem ipsum",
            "info28":"pattern: light-trellis",
            "tag28_cell_pattern":"light-trellis",
            "tag32": "Lorem ipsum",
            "info32":"horizonal alignment: center",
            "tag32_text_h_alignment":"center",
            "tag33": "Lorem ipsum",
            "info33":"horizonal alignment: right",
            "tag33_text_h_alignment":"right",
            "tag34": "Lorem ipsum",
            "info34":"horizonal alignment: fill",
            "tag34_text_h_alignment":"fill",
            "tag35": "Lorem ipsum",
            "info35":"horizonal alignment: justify",
            "tag35_text_h_alignment":"justify",
            "tag36": "Lorem ipsum",
            "info36":"horizonal alignment: center-continous",
            "tag36_text_h_alignment":"center-continous",
            "tag37": "Lorem ipsum",
            "info37":"horizonal alignment: distributed",
            "tag37_text_h_alignment":"distributed",
            "tag38": "Lorem ipsum",
            "info38":"horizonal alignment: left (was right)",
            "tag38_text_h_alignment":"left",
            "tag39": "Lorem ipsum",
            "info39":"vertical alignment: top",
            "tag39_text_v_alignment":"top",
            "tag40": "Lorem ipsum",
            "info40":"vertical alignment: center",
            "tag40_text_v_alignment":"center",
            "tag41": "Lorem ipsum",
            "info41":"vertical alignment: justify",
            "tag41_text_v_alignment":"justify",
            "tag42": "Lorem ipsum",
            "info42":"vertical alignment: distributed",
            "tag42_text_v_alignment":"distributed",
            "tag43": "Lorem ipsum",
            "info43":"vertical alignment: bottom (was top)",
            "tag43_text_v_alignment":"bottom",
            "tag44": "Lorem ipsum",
            "info44":"text rotation: 90",
            "tag44_text_rotation":"90",
            "tag45": "Lorem ipsum",
            "info45":"text rotation: 45",
            "tag45_text_rotation":"45",
            "tag46": "Lorem ipsum",
            "info46":"text rotation: 0",
            "tag46_text_rotation":"0",
            "tag47": "Lorem ipsum",
            "info47":"text rotation: -45",
            "tag47_text_rotation":"-45",
            "tag48": "Lorem ipsum",
            "info48":"text rotation: -180",
            "tag48_text_rotation":"-180",
            "tag49": "Lorem ipsum",
            "info49":"text rotation: aligned-vertically",
            "tag49_text_rotation":"aligned-vertically",
            "tag50": "Lorem ipsum",
            "info50":"text indent: (Number of spaces to indent = indent value * 3)",
            "tag50_text_indent":"2",
            "tag51": "Lorem ipsum Lorem ipsumLorem ipsum",
            "info51":"text wrap: y",
            "tag51_text_wrap":"y",
            "tag52": "Lorem ipsum Lorem ipsumLorem ipsum",
            "info52":"text shrink: y",
            "tag52_text_shrink":"y",
            "tag53": "Lorem ipsum",
            "info53":"cell locked: y",
            "tag53_cell_locked":"y",
            "tag54": "Lorem ipsum",
            "info54":"cell hidden: y",
            "tag54_cell_hidden":"y"
            }],
            "filename": "file1"}]';
end test_excel_styles;


--
-- custom debug procedure which can be called by AOP to log what's happening
--
procedure custom_debug(p_message     in varchar2, 
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
                       p_description in clob default null)                       
as
PRAGMA AUTONOMOUS_TRANSACTION;
begin
  insert into aop_debug (p_message, p_description)
  values (p_message, p_description);
  commit;
end custom_debug;


--
-- Failover procedure that will notify the administrator
--
procedure failover_procedure
as 
begin
  apex_mail.send(
    p_to => 'support@apexofficeprint.com',
    p_from => 'support@apexofficeprint.com',
    p_subj => 'AOP Failover notification',
    p_body => 'It looks like the main AOP url was not working, so the failover url was used at ' || to_char(sysdate,'DD-MON-YYYY HH24:MI:SS') || '.' || CHR(10) ||
              'APEX app: ' || v('APP_ID') || CHR(10) ||
              'APEX page: ' || v('APP_PAGE_ID') || CHR(10) ||              
              'APEX session: ' || v('APP_SESSION') || CHR(10) ||
              'APEX user: ' || nvl(v('APP_USER'),user) 
  );

  apex_mail.push_queue;  
end failover_procedure;

--
-- D3 example
--
function d3_radial_stacked_bar
return clob
as
  l_d3     clob;
  l_return clob;
begin
  -- D3 based on https://bl.ocks.org/mbostock/3686329aa6e1f5938df8eef12ec353fe

  l_d3 := q'!    
    const d3 = require('d3');
    const D3Node = require('d3-node');
    const linear = require('d3-scale').scaleLinear();
    
    function square(x) {
        return x * x;
    }
    
    function scaleRadial() {
    
        function scale(x) {
            return Math.sqrt(linear(x));
        }
    
        scale.domain = function (_) {
            return arguments.length ? (linear.domain(_), scale) : linear.domain();
        };
    
        scale.nice = function (count) {
            return (linear.nice(count), scale);
        };
    
        scale.range = function (_) {
            linear.range(_.map(square));
            return scale;
        };
    
        scale.ticks = linear.ticks;
        scale.tickFormat = linear.tickFormat;
    
        return scale;
    }
    
    const d3n = new D3Node();
    const [width, height] = [960, 960];
    const svg = d3n.createSVG(width, height);
    const innerRadius = 180;
    const outerRadius = Math.min(width, height) * 0.77;
    
    svg.attr('font-family', 'sans-serif').attr('font-size', 10);
    
    const g = svg.append("g").attr("transform", "translate(" + width / 2 + "," + height * 0.78 + ")");
    
    var x = d3.scaleBand()
        .range([0, 2 * Math.PI])
        .align(0);
    
    var y = scaleRadial()
        .range([innerRadius, outerRadius]);
    
    var z = d3.scaleOrdinal()
        .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);
    
    d3.csv("https://bl.ocks.org/mbostock/raw/3686329aa6e1f5938df8eef12ec353fe/data.csv", function (d, _, columns) {
        var t, i;
        // @ts-ignore
        for (i = 1, t = 0; i < columns.length; ++i) t += d[columns[i]] = +d[columns[i]];
        // @ts-ignore
        d.total = t;
        return d;
    }, function (error, data) {
        if (error) throw error;
    
        weave(data, function (a, b) { return b[data.columns[6]] - a[data.columns[6]]; });
        x.domain(data.map(function (d) { return d.State; }));
        y.domain([0, d3.max(data, function (d) { return d.total; })]);
        z.domain(data.columns.slice(1));
    
        g.append("g")
            .selectAll("g")
            // @ts-ignore
            .data(d3.stack().keys(data.columns.slice(1))(data))
            .enter().append("g")
            .attr("fill", function (d) { return z(d.key); })
            .selectAll("path")
            .data(function (d) { return d; })
            .enter().append("path")
            .attr("d", d3.arc()
                .innerRadius(function (d) { return y(d[0]); })
                .outerRadius(function (d) { return y(d[1]); })
                // @ts-ignore
                .startAngle(function (d) { return x(d.data.State); })
                // @ts-ignore
                .endAngle(function (d) { return x(d.data.State) + x.bandwidth(); })
                .padAngle(0.01)
                .padRadius(innerRadius));
    
        var label = g.append("g")
            .selectAll("g")
            .data(data)
            .enter().append("g")
            .attr("text-anchor", "middle")
            .attr("transform", function (d) { return "rotate(" + ((x(d.State) + x.bandwidth() / 2) * 180 / Math.PI - 90) + ")translate(" + innerRadius + ",0)"; });
    
        label.append("line")
            .attr("x2", -5)
            .attr("stroke", "#000");
    
        label.append("text")
            .attr("transform", function (d) { return (x(d.State) + x.bandwidth() / 2 + Math.PI / 2) % (2 * Math.PI) < Math.PI ? "rotate(90)translate(0,16)" : "rotate(-90)translate(0,-9)"; })
            .text(function (d) { return d.State; });
    
        var yAxis = g.append("g")
            .attr("text-anchor", "end");
    
        var yTick = yAxis
            .selectAll("g")
            .data(y.ticks(10).slice(1))
            .enter().append("g");
    
        yTick.append("circle")
            .attr("fill", "none")
            .attr("stroke", "#000")
            .attr("stroke-opacity", 0.5)
            .attr("r", y);
    
        yTick.append("text")
            .attr("x", -6)
            .attr("y", function (d) { return -y(d); })
            .attr("dy", "0.35em")
            .attr("fill", "none")
            .attr("stroke", "#fff")
            .attr("stroke-linejoin", "round")
            .attr("stroke-width", 3)
            .text(y.tickFormat(10, "s"));
    
        yTick.append("text")
            .attr("x", -6)
            .attr("y", function (d) { return -y(d); })
            .attr("dy", "0.35em")
            .text(y.tickFormat(10, "s"));
    
        yAxis.append("text")
            .attr("x", -6)
            .attr("y", function (d) { return -y(y.ticks(10).pop()); })
            .attr("dy", "-1em")
            .text("Population");
    
        var legend = g.append("g")
            .selectAll("g")
            .data(data.columns.slice(1).reverse())
            .enter().append("g")
            .attr("transform", function (d, i) { return "translate(-40," + (i - (data.columns.length - 1) / 2) * 20 + ")"; });
    
        legend.append("rect")
            .attr("width", 18)
            .attr("height", 18)
            .attr("fill", z);
    
        legend.append("text")
            .attr("x", 24)
            .attr("y", 9)
            .attr("dy", "0.35em")
            .text(function (d) { return d; });
    
        // @ts-ignore // Injected global, has to be called with the D3Node object once the SVG is finished
        finish(d3n);
    });
    
    function weave(array, compare) {
        var i = -1, j, n = array.sort(compare).length, weave = new Array(n);
        while (++i < n) weave[i] = array[(j = i << 1) >= n ? (n - i << 1) - 1 : j];
        while (--n >= 0) array[n] = weave[n];
    }
  !';
  apex_json.initialize_clob_output;
  apex_json.open_array;  -- [
  apex_json.open_object; -- {
  apex_json.write('filename','file1');     
  apex_json.open_array('data');  -- [
  apex_json.open_object;  -- {
  apex_json.write('d3_width', 600);   
  apex_json.write('d3_height', 600);  
  apex_json.write('d3', l_d3);  
  apex_json.close_object;
  apex_json.close_array;
  apex_json.close_object;
  apex_json.close_array;
  
  l_return := apex_json.get_clob_output;
  
  apex_json.free_output;
  
  return l_return;
  
end d3_radial_stacked_bar;

--
-- PL/SQL Function Returning SQL
--
function plsql_function_returning_sql
return clob
as 
  l_sql clob;
begin
  -- note that you can also pass :Px_X in your statement
  l_sql := q'!
                select
                  'file1' as "filename", 
                  cursor(
                    select
                      c.cust_first_name as "cust_first_name",
                      c.cust_last_name as "cust_last_name",
                      c.cust_city as "cust_city",
                      cursor(select o.order_total as "order_total", 
                                    'Order ' || rownum as "order_name",
                                cursor(select p.product_name as "product_name", 
                                              i.quantity as "quantity",
                                              i.unit_price as "unit_price", APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"
                                         from demo_order_items i, demo_product_info p
                                        where o.order_id = i.order_id
                                          and i.product_id = p.product_id
                                      ) "product"
                               from demo_orders o
                              where c.customer_id = o.customer_id
                            ) "orders"
                    from demo_customers c
                    where customer_id = 1
                  ) as "data"
                from dual  
           !';
  return l_sql;
end plsql_function_returning_sql;

end aop_sample18_pkg;
/
create or replace package aop_test18_pkg as

/* Copyright 2015-2018 - APEX RnD
*/

/* AOP Version */
c_aop_version            constant varchar2(5) := '18.2';


-- Run automated tests in table AOP_AUTOMATED_TEST; if p_id is null, all tests will be ran
procedure run_automated_tests(
  p_app_id      in number,
  p_id          in aop_automated_test.id%type default null,
  p_only_failed in varchar2 default null);

-- Reset all automated tests in table AOP_AUTOMATED_TEST
procedure reset_automated_tests(
  p_app_id      in number,
  p_id          in aop_automated_test.id%type default null,
  p_only_failed in varchar2 default null);

-- Add new and update existing automated tests in table AOP_AUTOMATED_TEST based on the entries in the AOP Sample App
procedure sync_automated_tests(
  p_app_id      in number,
  p_id          in aop_automated_test.id%type default null,
  p_only_failed in varchar2 default null);


end aop_test18_pkg;
/
/**
 * @Description: Package to run automated tests for AOP internally used by the AOP Team.
 *
 * @Author: Dimitri Gielis
 * @Created: 12/12/2015
 */

create or replace package body aop_test18_pkg as

/**
 * @Description: Run automated tests in table AOP_AUTOMATED_TEST; if p_id is null, all tests will be ran
 *
 * @Author: Dimitri Gielis
 * @Created: 2015-7-9
 *
 * @Param: p_id     Id of record in table, null is all
 * @Param: p_app_id Application Id
 */
procedure run_automated_tests(
  p_app_id      in number,
  p_id          in aop_automated_test.id%type default null,
  p_only_failed in varchar2 default null)
as
  l_return blob;
  l_error  varchar2(4000);
  l_start  date;
  l_end    date;
  l_output_filename varchar2(150);
  --
  l_aop_url          varchar2(1000);
  l_api_key          varchar2(40);
  l_aop_remote_debug varchar2(10);
  l_output_converter varchar2(100);
begin
  -- note that session state needs to be set manually for the items (see pre-rendering page 8)

  -- set logging on by going to aop_api_pkg g_logger_enabled true

  -- read plugin settings
  select attribute_01 as aop_url, attribute_02 as api_key, attribute_03 as aop_remote_debug, attribute_04 as output_converter
    into l_aop_url, l_api_key, l_aop_remote_debug, l_output_converter
    from APEX_APPL_PLUGIN_SETTINGS
   where application_id = p_app_id
     and plugin_code = 'PLUGIN_BE.APEXRND.AOP_DA';

  -- reset tests
  update aop_automated_test
    set received_bytes     = null,
        output_blob        = null,
        result             = null,
        processing_seconds = null,
        run_date           = sysdate
  where app_id = p_app_id
    and (id = p_id or p_id is null) 
    and active = 'Y'
    and 1 = case 
             when p_only_failed='Y' and (result <> 'ok' or result is null) then 1 
             when p_only_failed is null then 1
            end;

  -- loop over reports
  for r in (select id, data_type, data_source,
                   template_type, template_source,
                   output_type, output_filename, output_to, output_type_item_name,
                   filename, special, procedure_, app_id, page_id, init_code 
                   --output_split, prepend_files_sql, append_files_sql, sub_templates_sql
              from aop_automated_test
             where (id = p_id or p_id is null)
               and app_id = p_app_id
               and active = 'Y'
               and 1 = case 
                       when p_only_failed='Y' and (result <> 'ok' or result is null) then 1 
                       when p_only_failed is null then 1
                       end
             order by seq_nr
           )
  loop
    begin
      l_start := sysdate;
      l_output_filename := nvl(r.output_filename,'output');
      -- reset global variables
      aop_api_pkg.g_rpt_header_font_name       := '';
      aop_api_pkg.g_rpt_header_font_size       := '';
      aop_api_pkg.g_rpt_header_font_color      := '';
      aop_api_pkg.g_rpt_header_back_color      := '';
      aop_api_pkg.g_rpt_header_border_width    := '';
      aop_api_pkg.g_rpt_header_border_color    := '';
      aop_api_pkg.g_rpt_data_font_name         := '';
      aop_api_pkg.g_rpt_data_font_size         := '';
      aop_api_pkg.g_rpt_data_font_color        := '';
      aop_api_pkg.g_rpt_data_back_color        := '';
      aop_api_pkg.g_rpt_data_border_width      := '';
      aop_api_pkg.g_rpt_data_border_color      := '';
      aop_api_pkg.g_rpt_data_alt_row_color     := '';
      aop_api_pkg.g_apex_items      := null; 
      aop_api_pkg.g_orientation      := null; 
      aop_api_pkg.g_output_filename       := null; 
      aop_api_pkg.g_cloud_provider        := null; 
      aop_api_pkg.g_cloud_location        := null;  
      aop_api_pkg.g_cloud_access_token    := null; 
      aop_api_pkg.g_ip_printer_location   := null; 
      aop_api_pkg.g_output_directory      := null;
      aop_api_pkg.g_output_split := null;
      aop_api_pkg.g_prepend_files_sql := null;
      aop_api_pkg.g_append_files_sql := null;
      aop_api_pkg.g_sub_templates_sql := null;
      aop_api_pkg.g_output_read_password := null;
      aop_api_pkg.g_output_modify_password := null;
      aop_api_pkg.g_output_pwd_protection_flag:= null;

      l_return := aop_api_pkg.plsql_call_to_aop (
                    p_data_type       => r.data_type,
                    p_data_source     => r.data_source,
                    p_template_type   => r.template_type,
                    p_template_source => r.template_source,
                    p_output_type     => r.output_type,
                    p_output_filename => l_output_filename,
                    p_output_type_item_name => r.output_type_item_name,
                    p_output_to             => r.output_to,
                    p_procedure             => r.procedure_,
                    --p_binds               in t_bind_table default c_binds,
                    p_special               => r.special,
                    p_aop_remote_debug      => l_aop_remote_debug,
                    p_output_converter      => l_output_converter,
                    p_aop_url               => l_aop_url,
                    p_api_key               => l_api_key,
                    p_app_id                => r.app_id,
                    p_page_id               => r.page_id,
                    --p_user_name             => r.user_name,
                    p_init_code             => r.init_code
                    -- will be set through global variables through init code
                    --p_output_encoding       => r.output_encoding,
                    --p_output_split          => r.output_split,
                    --p_failover_aop_url      => r.failover_aop_url,
                    --p_failover_procedure    => r.failover_procedure,
                    --p_log_procedure         => r.log_procedure,
                    --p_prepend_files_sql     => r.prepend_files_sql,
                    --p_append_files_sql      => r.append_files_sql,
                    --p_sub_templates_sql     => r.sub_templates_sql
                  );
      l_end := sysdate;

      update aop_automated_test
         set received_bytes = dbms_lob.getlength(l_return),
             output_blob = l_return,
             result = 'ok',
             processing_seconds = round((l_end-l_start)*60*60*24,2)
       where id = r.id;

     exception
       when others
       then
         l_end := sysdate;
         l_error := substr(SQLERRM, 1, 4000);
         update aop_automated_test
            set received_bytes = null,
                output_blob = null,
                result = l_error,
                processing_seconds = round((l_end-l_start)*60*60*24,2)
          where id = r.id;
     end;
  end loop;

  -- set inactive to result NA
  update aop_automated_test
    set received_bytes = null,
        output_blob = null,
        result = 'Inactive',
        processing_seconds = null
  where app_id = p_app_id
    and active = 'N'
    and (id = p_id or p_id is null) 
    and 1 = case 
             when p_only_failed='Y' and (result <> 'ok' or result is null) then 1 
             when p_only_failed is null then 1
            end;

end run_automated_tests;


/**
 * @Description: Reset all automated tests in table AOP_AUTOMATED_TEST
 *
 * @Author: Dimitri Gielis
 * @Created: 9/9/2018
 *
 */
procedure reset_automated_tests(
  p_app_id      in number,
  p_id          in aop_automated_test.id%type default null,
  p_only_failed in varchar2 default null)
as
begin
  update aop_automated_test
    set received_bytes     = null,
        output_blob        = null,
        result             = null,
        processing_seconds = null,
        run_date           = null
  where app_id = p_app_id
    and (id = p_id or p_id is null) 
    and 1 = case 
             when p_only_failed='Y' and (result <> 'ok' or result is null) then 1 
             when p_only_failed is null then 1
            end;
end reset_automated_tests;


/**
 * @Description: Add new and update existing automated tests in table AOP_AUTOMATED_TEST based on the entries in the AOP Sample App
 *
 * @Author: Dimitri Gielis
 * @Created: 9/9/2018
 *
 */
procedure sync_automated_tests(
  p_app_id      in number,
  p_id          in aop_automated_test.id%type default null,
  p_only_failed in varchar2 default null)
as
begin
  -- CHECK IF TEST IS STILL IN APP (set active to C)
  update AOP_AUTOMATED_TEST
    set active = 'C'
  where app_id = p_app_id
    and active = 'Y'
    and expected_bytes is null
    and (id = p_id or p_id is null) 
    and 1 = case 
             when p_only_failed='Y' and (result <> 'ok' or result is null) then 1 
             when p_only_failed is null then 1
            end;  
            
  update AOP_AUTOMATED_TEST
    set active = 'Y'
  where page_id||'#'||description in (select  page_id||'#'||'Page: ' || lpad(page_id,4,' ') || ': ' || process_name 
                          from APEX_APPLICATION_PAGE_PROC
                        where application_id = p_app_id
                          and process_type_plugin_name = 'PLUGIN_BE.APEXRND.AOP')
    and app_id = p_app_id
    and active = 'C'
    and (id = p_id or p_id is null) 
    and 1 = case 
             when p_only_failed='Y' and (result <> 'ok' or result is null) then 1 
             when p_only_failed is null then 1
            end;  

  update AOP_AUTOMATED_TEST
    set active = 'Y'
  where page_id||'#'||description in (select  page_id||'#'||'Page: ' || lpad(page_id,4,' ') || ': ' || dynamic_action_name  
                          from APEX_APPLICATION_PAGE_DA_ACTS
                        where application_id = p_app_id
                          and action_code = 'PLUGIN_BE.APEXRND.AOP_DA')
    and app_id = p_app_id
    and active = 'C'
    and (id = p_id or p_id is null) 
    and 1 = case 
             when p_only_failed='Y' and (result <> 'ok' or result is null) then 1 
             when p_only_failed is null then 1
            end;  

  -- DELETE NON EXISTING RECORDS
  delete 
    from aop_automated_test
   where active = 'C'; 

  -- INSERT AOP PROCESSES
  insert into AOP_AUTOMATED_TEST 
    (seq_nr, description, data_type, data_source, template_type, template_source, output_type, output_type_item_name, output_filename, output_to, special, procedure_, app_id, page_id, active, plugin_type)
  select 
      row_number() over (order by  LAST_UPDATED_ON)  as seq_nr
    , 'Page: ' || lpad(page_id,4,' ') || ': ' || process_name as description
    , attribute_05 as data_type
      , case 
        when attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_sql')       then attribute_11
        when attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_plsql')     then attribute_12
        when attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_plsql_sql') then attribute_12
        when attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_url')       then attribute_01      
        when attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_rpt')       then attribute_13
        else 'invalid data source'
        end as data_source
    --, attribute_11 as data_source_sql
    --, attribute_12 as data_source_plsql
    --, attribute_01 as data_source_url
    --, attribute_13 as data_source_static_id
    , attribute_06 as template_type
    , case 
      when attribute_06 is null                                                                then null
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_apex')      then attribute_07
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_workspace') then attribute_07
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_sql')       then attribute_09
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_plsql_sql') then attribute_10
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_plsql')     then attribute_10
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_filename')  then attribute_07
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_url')       then attribute_07     
        else 'invalid template source'
      end as template_source
    --, attribute_07 as template_source_file	  
    --, attribute_09 as template_source_sql
    --, attribute_10 as template_source_plsql
    , attribute_04 as output_type
    , attribute_08 as output_type_item_name
    , attribute_03 as output_filename
    , attribute_14 as output_to
    , attribute_02 as special
    , attribute_15 as procedure_
    , application_id
    , page_id
    , 'Y' as active
    , 'Process' as plugin_type
    from APEX_APPLICATION_PAGE_PROC 
  where application_id = p_app_id
    and process_type_plugin_name = 'PLUGIN_BE.APEXRND.AOP'
    --and attribute_05 = 'SQL'
    --and attribute_04 <> 'apex_item' 
    and 'Page: ' || lpad(page_id,4,' ') || ': ' || process_name not in (select description from AOP_AUTOMATED_TEST)
    and (condition_type_code <> 'NEVER' or condition_type_code is null)
  order by LAST_UPDATED_ON;

  -- INSERT AOP DYNAMIC ACTIONS
  insert into AOP_AUTOMATED_TEST 
    (seq_nr, description, data_type, data_source, template_type, template_source, output_type, output_type_item_name, output_filename, output_to, special, procedure_, app_id, page_id, init_code, active, plugin_type)
  select 
      row_number() over (order by a.LAST_UPDATED_ON)  as seq_nr
    , 'Page: ' || lpad(a.page_id,4,' ') || ': ' || a.dynamic_action_name as description
    , a.attribute_05 as data_type
      , case 
        when a.attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_sql')       then attribute_11
        when a.attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_plsql')     then attribute_12
        when a.attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_plsql_sql') then attribute_12
        when a.attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_url')       then attribute_01      
        when a.attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_rpt')       then attribute_13
        else 'invalid data source'
        end as data_source
    --, attribute_11 as data_source_sql
    --, attribute_12 as data_source_plsql
    --, attribute_01 as data_source_url
    --, attribute_13 as data_source_static_id
    , a.attribute_06 as template_type
    , case 
      when a.attribute_06 is null                                                                then null
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_apex')      then attribute_07
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_workspace') then attribute_07
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_sql')       then attribute_09
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_plsql')     then attribute_10
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_filename')  then attribute_07
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_url')       then attribute_07     
        else 'invalid template source'
      end as template_source
    --, attribute_07 as template_source_file	  
    --, attribute_09 as template_source_sql
    --, attribute_10 as template_source_plsql
    , a.attribute_04 as output_type
    , a.attribute_08 as output_type_item_name
    , 'output_'||to_char(a.page_id)||'_'||substr(replace(a.dynamic_action_name,' ','_'),1,130) as output_filename
    , a.attribute_14 as output_to
    , a.attribute_02 as special
    , a.attribute_15 as procedure_
    , a.application_id
    , a.page_id
    , a.attribute_03 as init_code
    , 'Y' as active
    , 'DA' as plugin_type
    from APEX_APPLICATION_PAGE_DA_ACTS a, APEX_APPLICATION_PAGE_DA d
  where a.application_id = p_app_id
    and a.action_code = 'PLUGIN_BE.APEXRND.AOP_DA'
    --and attribute_05 = 'SQL'
    --and attribute_04 <> 'apex_item' 
    and 'Page: ' || lpad(a.page_id,4,' ') || ': ' || a.dynamic_action_name not in (select description from AOP_AUTOMATED_TEST)
    and a.dynamic_action_id = d.dynamic_action_id
    and (d.condition_type_code <> 'NEVER' or d.condition_type_code is null)  
  order by a.LAST_UPDATED_ON;

end sync_automated_tests;

end aop_test18_pkg;
/
create or replace package aop_log18_pkg 
as

/* Copyright 2015-2018 - APEX RnD
*/

/* AOP Version */
c_aop_version  constant varchar2(5)   := '18.2';

--
-- Function: start_request
-- Purpose: When there's a call to AOP (aop_api18_pkg.plsql_call_to_aop), this function logs the request (start)
--
function start_request (
  p_data_type             in varchar2,
  p_data_source           in clob,
  p_template_type         in varchar2,
  p_template_source       in clob,
  p_output_type           in varchar2,
  p_output_filename       in varchar2,
  p_output_type_item_name in varchar2,
  p_output_to             in varchar2,
  p_procedure             in varchar2,
  p_binds                 in varchar2,
  p_special               in varchar2,
  p_aop_remote_debug      in varchar2,
  p_output_converter      in varchar2,
  p_aop_url               in varchar2,
  p_api_key               in varchar2,
  p_app_id                in number,
  p_page_id               in number,
  p_user_name             in varchar2,
  p_init_code             in clob,
  p_output_encoding       in varchar2,
  p_output_split          in varchar2,
  p_failover_aop_url      in varchar2,
  p_failover_procedure    in varchar2,
  p_prepend_files_sql     in clob,
  p_append_files_sql      in clob,
  p_sub_templates_sql     in clob
) return number;

--
-- Function: end_request
-- Purpose: When there's a call to AOP (aop_api18_pkg.plsql_call_to_aop), this function logs the request (end)
--
procedure end_request (
  p_aop_log_id            in number,      
  p_status                in varchar2, 
  p_aop_json              in clob,
  p_aop_error             in varchar2, 
  p_ora_sqlcode           in number, 
  p_ora_sqlerrm           in varchar2
);

end aop_log18_pkg;
/
/**
 * @Description: Example of additional logging package.
 *
 * @Author: Dimitri Gielis
 * @Created: 12/12/2015
 */

create or replace package body aop_log18_pkg 
as

/**
 * @Description: When there's a call to AOP (aop_api18_pkg.plsql_call_to_aop), this function logs the request (start)
 *
 * @Author: Dimitri Gielis
 * @Created: 9/1/2018
 *
 * @Param: p_data_type As defined in aop_api_pkg
 * @Param: p_data_source As defined in aop_api_pkg
 * @Param: p_template_type As defined in aop_api_pkg
 * @Param: p_template_source As defined in aop_api_pkg
 * @Param: p_output_type As defined in aop_api_pkg
 * @Param: p_output_filename As defined in aop_api_pkg
 * @Param: p_output_type_item_name As defined in aop_api_pkg
 * @Param: p_output_to As defined in aop_api_pkg
 * @Param: p_procedure As defined in aop_api_pkg
 * @Param: p_binds As defined in aop_api_pkg
 * @Param: p_special As defined in aop_api_pkg
 * @Param: p_aop_remote_debug As defined in aop_api_pkg
 * @Param: p_output_converter As defined in aop_api_pkg
 * @Param: p_aop_url As defined in aop_api_pkg
 * @Param: p_api_key As defined in aop_api_pkg
 * @Param: p_app_id As defined in aop_api_pkg
 * @Param: p_page_id As defined in aop_api_pkg
 * @Param: p_user_name As defined in aop_api_pkg
 * @Param: p_init_code As defined in aop_api_pkg
 * @Param: p_output_encoding As defined in aop_api_pkg
 * @Param: p_output_split As defined in aop_api_pkg
 * @Param: p_failover_aop_url As defined in aop_api_pkg
 * @Param: p_failover_procedure As defined in aop_api_pkg
 * @Param: p_prepend_files_sql As defined in aop_api_pkg
 * @Param: p_append_files_sql As defined in aop_api_pkg
 * @Param: p_sub_templates_sql As defined in aop_api_pkg
 * @Return: Description
 */
function start_request (
  p_data_type             in varchar2,
  p_data_source           in clob,
  p_template_type         in varchar2,
  p_template_source       in clob,
  p_output_type           in varchar2,
  p_output_filename       in varchar2,
  p_output_type_item_name in varchar2,
  p_output_to             in varchar2,
  p_procedure             in varchar2,
  p_binds                 in varchar2,
  p_special               in varchar2,
  p_aop_remote_debug      in varchar2,
  p_output_converter      in varchar2,
  p_aop_url               in varchar2,
  p_api_key               in varchar2,
  p_app_id                in number,
  p_page_id               in number,
  p_user_name             in varchar2,
  p_init_code             in clob,
  p_output_encoding       in varchar2,
  p_output_split          in varchar2,
  p_failover_aop_url      in varchar2,
  p_failover_procedure    in varchar2,
  p_prepend_files_sql     in clob,
  p_append_files_sql      in clob,
  p_sub_templates_sql     in clob
) return number
as
pragma autonomous_transaction;
  l_aop_log_id aop_log.id%type;
begin
  insert into aop_log (
    start_date               ,  
    p_data_type              ,
    p_data_source            ,
    p_template_type          ,
    p_template_source        ,
    p_output_type            ,
    p_output_filename        ,
    p_output_type_item_name  ,
    p_output_to              ,
    p_procedure              ,
    p_binds                  ,
    p_special                ,
    p_aop_remote_debug       ,
    p_output_converter       ,
    p_aop_url                ,
    p_api_key                ,
    p_app_id                 ,
    p_page_id                ,
    p_user_name              ,
    p_init_code              ,
    p_output_encoding        ,
    p_output_split           ,
    p_failover_aop_url       ,
    p_failover_procedure     ,
    p_prepend_files_sql      ,
    p_append_files_sql       ,
    p_sub_templates_sql      ,
    apex_session             ,
    apex_app_id              ,
    apex_app_page_id         ,
    apex_app_user            ,
    apex_user_agent          , 
    apex_ip_address          ,
    apex_ip_address2         
  )
  values (
    sysdate                  ,    
    p_data_type              ,
    p_data_source            ,
    p_template_type          ,
    p_template_source        ,
    p_output_type            ,
    p_output_filename        ,
    p_output_type_item_name  ,
    p_output_to              ,
    p_procedure              ,
    p_binds                  ,
    p_special                ,
    p_aop_remote_debug       ,
    p_output_converter       ,
    p_aop_url                ,
    p_api_key                ,
    p_app_id                 ,
    p_page_id                ,
    p_user_name              ,
    p_init_code              ,
    p_output_encoding        ,
    p_output_split           ,
    p_failover_aop_url       ,
    p_failover_procedure     ,
    p_prepend_files_sql      ,
    p_append_files_sql       ,
    p_sub_templates_sql      ,
    v('APP_SESSION'),
    v('APP_ID'),
    v('APP_PAGE_ID'),
    v('APP_USER'),
    owa_util.get_cgi_env('HTTP_USER_AGENT'),
    owa_util.get_cgi_env('REMOTE_ADDR'),
    sys_context('USERENV', 'IP_ADDRESS')
  ) returning id into l_aop_log_id;

  commit;
  
  return l_aop_log_id;
end start_request;


/**
 * @Description: When there's a call to AOP (aop_api18_pkg.plsql_call_to_aop), this function logs the request (end)
 *
 * @Author: Dimitri Gielis
 * @Created: 9/1/2018
 *
 * @Param: p_aop_log_id id which was returned by start_request
 * @Param: p_status Status
 * @Param: p_aop_json JSON generated by AOP
 * @Param: p_aop_error Error message
 * @Param: p_ora_sqlcode SQL Error Code
 * @Param: p_ora_sqlerrm SQL Error Message
 */
procedure end_request (
  p_aop_log_id            in number,  
  p_status                in varchar2, 
  p_aop_json              in clob,
  p_aop_error             in varchar2, 
  p_ora_sqlcode           in number, 
  p_ora_sqlerrm           in varchar2
)
as
pragma autonomous_transaction;
begin
  update aop_log 
     set status      = p_status              
       , aop_json    = p_aop_json           
       , aop_error   = p_aop_error           
       , ora_sqlcode = p_ora_sqlcode        
       , ora_sqlerrm = p_ora_sqlerrm 
       , end_date    = sysdate 
    where id = p_aop_log_id;

  commit;

end end_request;

end aop_log18_pkg;
/
create or replace package aop_error18_pkg
as
    --
    -- Function: apex_error_handling
    -- Purpose: Try to elegantly handle errors that occur while using the application.
    --
    function apex_error_handling (
        p_error in apex_error.t_error )
        return apex_error.t_error_result;

    --
    -- Procedure: add_error_log
    -- Purpose: logs application errors
    --
    procedure add_error_log (
        p_error               in varchar2 default  null,
        p_procedure_name      in varchar2 default  null,
        p_page_item_name      in varchar2 default  null,
        p_region_id           in varchar2 default  null,
        p_column_alias        in varchar2 default  null,
        p_row_num             in varchar2 default  null,
        p_apex_error_code     in varchar2 default  null,
        p_ora_sqlcode         in varchar2 default  null,
        p_ora_sqlerrm         in varchar2 default  null,
        p_error_backtrace     in varchar2 default  null,
        p_arg1_name           in varchar2 default  null,
        p_arg1_val            in varchar2 default  null,
        p_arg2_name           in varchar2 default  null,
        p_arg2_val            in varchar2 default  null,
        p_arg3_name           in varchar2 default  null,
        p_arg3_val            in varchar2 default  null,
        p_arg4_name           in varchar2 default  null,
        p_arg4_val            in varchar2 default  null,
        p_arg5_name           in varchar2 default  null,
        p_arg5_val            in varchar2 default  null,
        p_arg6_name           in varchar2 default  null,
        p_arg6_val            in varchar2 default  null,
        p_arg7_name           in varchar2 default  null,
        p_arg7_val            in varchar2 default  null,
        p_arg8_name           in varchar2 default  null,
        p_arg8_val            in varchar2 default  null,
        p_arg9_name           in varchar2 default  null,
        p_arg9_val            in varchar2 default  null,
        p_arg10_name          in varchar2 default  null,
        p_arg10_val           in varchar2 default  null
        );
end aop_error18_pkg;
/

/**
 * @Description: Error handling package used in the AOP Sample App.
 *
 * @Author: Dimitri Gielis
 * @Created: 12/12/2015
 */

create or replace package body aop_error18_pkg
as

    /**
     * @Description: Try to elegantly handle errors that occur while using the application.
     *
     * @Author: Dimitri Gielis
     * @Created: 9/1/2018
     *
     * @Param: p_error Error we get in APEX
     * @Return: Nicer error message
     */
    function apex_error_handling ( p_error in apex_error.t_error )
            return apex_error.t_error_result is
        l_result          apex_error.t_error_result;
        l_constraint_name varchar2(255);
        procedure add_error_log ( p_error in apex_error.t_error ) is
            pragma autonomous_transaction;
        begin
            -- Remove old errors
            --delete from aop_errors where err_time <= localtimestamp - 21;
            -- Log the error.
            insert into aop_error (
                app_id,
                app_page_id,
                app_user,
                user_agent,
                ip_address,
                ip_address2,
                message,
                page_item_name,
                region_id,
                column_alias,
                row_num,
                apex_error_code,
                ora_sqlcode,
                ora_sqlerrm,
                error_backtrace )
            select v('APP_ID'),
                v('APP_PAGE_ID'),
                v('APP_USER'),
                owa_util.get_cgi_env('HTTP_USER_AGENT'),
                owa_util.get_cgi_env('REMOTE_ADDR'),
                sys_context('USERENV', 'IP_ADDRESS'),
                substr(p_error.message,0,4000),
                p_error.page_item_name,
                p_error.region_id,
                p_error.column_alias,
                p_error.row_num,
                p_error.apex_error_code,
                p_error.ora_sqlcode,
                substr(p_error.ora_sqlerrm,0,4000),
                substr(p_error.error_backtrace,0,4000)
            from dual;
            commit;
        end add_error_log;
    begin
        l_result := apex_error.init_error_result (
                        p_error => p_error );
        -- If it is an internal error raised by APEX, like an invalid statement or
        -- code which can not be executed, the error text might contain security sensitive
        -- information. To avoid this security problem we can rewrite the error to
        -- a generic error message and log the original error message for further
        -- investigation by the help desk.
        if p_error.is_internal_error then
            -- mask all errors that are not common runtime errors (Access Denied
            -- errors raised by application / page authorization and all errors
            -- regarding session and session state)
            if not p_error.is_common_runtime_error then
                add_error_log( p_error );
                -- Change the message to the generic error message which doesn't expose
                -- any sensitive information.
                l_result.message         := 'An unexpected internal application error has occurred: ' || substr(p_error.message,0,3500);
                l_result.additional_info := null;
            end if;
        else
            -- Always show the error as inline error
            -- Note: If you have created manual tabular forms (using the package
            --       apex_item/htmldb_item in the SQL statement) you should still
            --       use "On error page" on that pages to avoid loosing entered data
            l_result.display_location := case
                                           when l_result.display_location = apex_error.c_on_error_page then apex_error.c_inline_in_notification
                                           else l_result.display_location
                                         end;
            -- If it's a constraint violation like
            --
            --   -) ORA-00001: unique constraint violated
            --   -) ORA-02091: transaction rolled back (-> can hide a deferred constraint)
            --   -) ORA-02290: check constraint violated
            --   -) ORA-02291: integrity constraint violated - parent key not found
            --   -) ORA-02292: integrity constraint violated - child record found
            --
            -- we try to get a friendly error message from our constraint lookup configuration.
            -- If we don't find the constraint in our lookup table we fallback to
            -- the original ORA error message.
            if p_error.ora_sqlcode in (-1, -2091, -2290, -2291, -2292) then
                l_constraint_name := apex_error.extract_constraint_name (
                                         p_error => p_error );
                begin
                    select message
                      into l_result.message
                      from aop_error_lookup
                     where constraint_name = l_constraint_name;
                exception when no_data_found then null; -- not every constraint has to be in our lookup table
                end;
            end if;
            -- If an ORA error has been raised, for example a raise_application_error(-20xxx, '...')
            -- in a table trigger or in a PL/SQL package called by a process and we
            -- haven't found the error in our lookup table, then we just want to see
            -- the actual error text and not the full error stack with all the ORA error numbers.
            if p_error.ora_sqlcode is not null and l_result.message = p_error.message then
                l_result.message := apex_error.get_first_ora_error_text (
                                        p_error => p_error );
            end if;
            -- If no associated page item/tabular form column has been set, we can use
            -- apex_error.auto_set_associated_item to automatically guess the affected
            -- error field by examine the ORA error for constraint names or column names.
            if l_result.page_item_name is null and l_result.column_alias is null then
                apex_error.auto_set_associated_item (
                    p_error        => p_error,
                    p_error_result => l_result );
            end if;
        end if;
        return l_result;
    end apex_error_handling;


    /**
     * @Description: Logs application errors
     *
     * @Author: Dimitri Gielis
     * @Created: 9/1/2018
     *
     * @Param: p_error Error message
     * @Param: p_procedure_name Procedure
     * @Param: p_page_item_name Page Item
     * @Param: p_region_id Region
     * @Param: p_column_alias Column
     * @Param: p_row_num Row
     * @Param: p_apex_error_code APEX Error
     * @Param: p_ora_sqlcode SQL Error Code
     * @Param: p_ora_sqlerrm SQL Error Message
     * @Param: p_error_backtrace Backtrace
     * @Param: p_arg1-10_name Arguments to pass other information
     * @Param: p_arg1-10_val Values of arguments
     */
    procedure add_error_log (
        p_error               in varchar2 default  null,
        p_procedure_name      in varchar2 default  null,
        p_page_item_name      in varchar2 default  null,
        p_region_id           in varchar2 default  null,
        p_column_alias        in varchar2 default  null,
        p_row_num             in varchar2 default  null,
        p_apex_error_code     in varchar2 default  null,
        p_ora_sqlcode         in varchar2 default  null,
        p_ora_sqlerrm         in varchar2 default  null,
        p_error_backtrace     in varchar2 default  null,
        p_arg1_name           in varchar2 default  null,
        p_arg1_val            in varchar2 default  null,
        p_arg2_name           in varchar2 default  null,
        p_arg2_val            in varchar2 default  null,
        p_arg3_name           in varchar2 default  null,
        p_arg3_val            in varchar2 default  null,
        p_arg4_name           in varchar2 default  null,
        p_arg4_val            in varchar2 default  null,
        p_arg5_name           in varchar2 default  null,
        p_arg5_val            in varchar2 default  null,
        p_arg6_name           in varchar2 default  null,
        p_arg6_val            in varchar2 default  null,
        p_arg7_name           in varchar2 default  null,
        p_arg7_val            in varchar2 default  null,
        p_arg8_name           in varchar2 default  null,
        p_arg8_val            in varchar2 default  null,
        p_arg9_name           in varchar2 default  null,
        p_arg9_val            in varchar2 default  null,
        p_arg10_name          in varchar2 default  null,
        p_arg10_val           in varchar2 default  null )
    is
    begin
        -- Remove old errors
        --delete from aop_errors where err_time <= localtimestamp - 21;
        -- Log the error.
        insert into aop_error (
            app_id,
            app_page_id,
            app_user,
            user_agent,
            --
            ip_address,
            ip_address2,
            message,
            page_item_name,
            --
            region_id,
            column_alias,
            row_num,
            apex_error_code,
            --
            ora_sqlcode,
            ora_sqlerrm,
            error_backtrace,
            arg1_name,
            arg1_val,
            arg2_name,
            arg2_val,
            arg3_name,
            arg3_val,
            arg4_name,
            arg4_val,
            arg5_name,
            arg5_val,
            arg6_name,
            arg6_val,
            arg7_name,
            arg7_val,
            arg8_name,
            arg8_val,
            arg9_name,
            arg9_val,
            arg10_name,
            arg10_val )
        select v('APP_ID'),
            v('APP_PAGE_ID'),
            v('APP_USER'),
            owa_util.get_cgi_env('HTTP_USER_AGENT'),
            --
            owa_util.get_cgi_env('REMOTE_ADDR'),
            sys_context('USERENV', 'IP_ADDRESS'),
            substr(p_error,0,4000),
            substr(p_page_item_name,0,4000),
            --
            p_region_id,
            p_column_alias,
            p_row_num,
            p_apex_error_code,
            --
            p_ora_sqlcode,
            substr(p_ora_sqlerrm,1,4000),
            substr(p_error_backtrace,1,4000),
            p_arg1_name,
            p_arg1_val,
            p_arg2_name,
            p_arg2_val,
            p_arg3_name,
            p_arg3_val,
            p_arg4_name,
            p_arg4_val,
            p_arg5_name,
            p_arg5_val,
            p_arg6_name,
            p_arg6_val,
            p_arg7_name,
            p_arg7_val,
            p_arg8_name,
            p_arg8_val,
            p_arg9_name,
            p_arg9_val,
            p_arg10_name,
            p_arg10_val
        from dual;
        commit;
    end add_error_log;

    end aop_error18_pkg;
    /
create or replace synonym aop_error_pkg for aop_error18_pkg;
create or replace synonym aop_log_pkg for aop_log18_pkg;
create or replace synonym aop_sample_pkg for aop_sample18_pkg;
create or replace synonym aop_test_pkg for aop_test18_pkg;
create or replace synonym aop_user_test_pkg for aop_user_test18_pkg;
create or replace synonym aop_settings_pkg for aop_settings18_pkg;

SET DEFINE OFF;   


Insert into AOP_AUTOMATED_TEST (ID,DESCRIPTION,DATA_TYPE,TEMPLATE_TYPE,OUTPUT_TYPE,OUTPUT_FILENAME,EXPECTED_BYTES,RECEIVED_BYTES,RESULT,PROCESSING_SECONDS,SEQ_NR,DATA_SOURCE,TEMPLATE_SOURCE,OUTPUT_TYPE_ITEM_NAME,OUTPUT_TO,SPECIAL,PROCEDURE_,CREATED_DATE,RUN_DATE,APP_ID,PAGE_ID) values (79154343032776274722465249329506393396,'Page:   25: Print Column Chart (multi-serie) Pptx','SQL','APEX','pptx','p25_output_multiple_charts',33925,33925,'ok',0,41,'with both_lines as
(
SELECT 
   ''line 1'' line_name, 
   NULL    AS LINK,
       rownum        AS x,
       o.order_total AS y
        FROM demo_customers c,
          demo_orders o
        WHERE c.customer_id = o.customer_id
union all
SELECT 
  ''line 2'' line_name, 
   NULL                AS LINK,
    rownum                    AS x,
    o.order_total*1.21/rownum AS y
  FROM demo_customers c,
    demo_orders o
  WHERE c.customer_id = o.customer_id
),
lines as (select ''line 1'' line_name from dual
          union all
          select  ''line 2'' line_name from dual),
both_columns as
(
SELECT 
   ''column 1'' column_name, 
                    c.cust_first_name || '' '' || c.cust_last_name as x,
                    sum(o.order_total)                          as y
                  from demo_customers c, demo_orders o
                  where c.customer_id = o.customer_id
                  group by c.cust_first_name || '' '' || c.cust_last_name
union all
SELECT 
  ''column 2'' column_name, 
                    c.cust_first_name || '' '' || c.cust_last_name as x,
                    sum(o.order_total*1.21/rownum)                          as y
                  from demo_customers c, demo_orders o
                  where c.customer_id = o.customer_id
                  group by c.cust_first_name || '' '' || c.cust_last_name
    order by 2
),
columns as (select ''column 1'' column_name from dual
          union all
          select  ''column 2'' column_name from dual)          
SELECT ''file1'' AS "filename",
  CURSOR
  (SELECT CURSOR
    (SELECT ''line''                 AS "type",
      ''My Multi-Series Line Chart'' AS "name",
      CURSOR
      (SELECT line_name AS "name",
        CURSOR
        (select link, x as "x", y as "y"
           from both_lines bl 
          where bl.line_name = l.line_name
        ) AS "data"
      FROM lines l
      ) AS "lines"
    FROM dual
    ) AS "line_chart",
    cursor(select
            ''column'' as "type",
            ''My Column Chart'' as "name",   
            cursor
            (select
                576     as "width" ,
                336     as "height",
                ''Title'' as "title in chart" ,
                ''true''  as "grid"  ,
                ''true''  as "border"
              from dual
            ) as "options",
            cursor(select
                column_name as "name",
                cursor
                (select null as link, x as "x", y as "y"
           from both_columns bl 
          where bl.column_name = l.column_name                
                ) as "data"
              from columns l
                  ) as "columns"
          from dual) as "column_chart"
  FROM dual
  ) AS "data"
FROM dual
','aop_template_multiple_charts.pptx',null,null,null,null,to_date('02/09/16','DD/MM/RR'),to_date('06/09/16','DD/MM/RR'),232,25);
Insert into AOP_AUTOMATED_TEST (ID,DESCRIPTION,DATA_TYPE,TEMPLATE_TYPE,OUTPUT_TYPE,OUTPUT_FILENAME,EXPECTED_BYTES,RECEIVED_BYTES,RESULT,PROCESSING_SECONDS,SEQ_NR,DATA_SOURCE,TEMPLATE_SOURCE,OUTPUT_TYPE_ITEM_NAME,OUTPUT_TO,SPECIAL,PROCEDURE_,CREATED_DATE,RUN_DATE,APP_ID,PAGE_ID) values (79154343032777483648284863958681099572,'Page:   16: Print Column Chart (multi-serie) PDF','SQL','APEX','pdf','p16_output_column_chart_multi',64623,64623,'ok',2,42,'select
    ''file1'' as "filename",
    cursor(select
        cursor(select
            c.cust_first_name || '' '' || c.cust_last_name as "customer",
            c.cust_city                                  as "city"    ,
            o.order_total                                as "total"   ,
            o.order_timestamp                            as "timestamp"
          from demo_customers c, demo_orders o
          where c.customer_id = o.customer_id
          order by c.cust_first_name || '' '' || c.cust_last_name               
        ) as "orders",
        cursor(select
            ''column'' as "type",
            ''My Column Chart'' as "name",   
            cursor
            (select
                576     as "width" ,
                336     as "height",
                ''Title'' as "title in chart" ,
                ''true''  as "grid"  ,
                ''true''  as "border"
              from dual
            ) as "options",
            cursor(select
                ''column '' || to_char(nbr) as "name",
                cursor
                (select
                    c.cust_first_name || '' '' || c.cust_last_name as "x",
                    sum(o.order_total) * nbr                          as "y"
                  from demo_customers c, demo_orders o
                  where c.customer_id = o.customer_id
                  group by c.cust_first_name || '' '' || c.cust_last_name
                  order by c.cust_first_name || '' '' || c.cust_last_name                 
                ) as "data"
              from (select 1 as nbr from dual union select 1.21 as nbr from dual)
                  ) as "columns"
          from dual) as "chart"
      from dual) as "data"
  from dual ','aop_template_chart_with_data.docx',null,null,null,null,to_date('02/09/16','DD/MM/RR'),to_date('06/09/16','DD/MM/RR'),232,16);
Insert into AOP_AUTOMATED_TEST (ID,DESCRIPTION,DATA_TYPE,TEMPLATE_TYPE,OUTPUT_TYPE,OUTPUT_FILENAME,EXPECTED_BYTES,RECEIVED_BYTES,RESULT,PROCESSING_SECONDS,SEQ_NR,DATA_SOURCE,TEMPLATE_SOURCE,OUTPUT_TYPE_ITEM_NAME,OUTPUT_TO,SPECIAL,PROCEDURE_,CREATED_DATE,RUN_DATE,APP_ID,PAGE_ID) values (79154343032778692574104478587855805748,'Page:   25: Print Column Chart (multi-serie) Docx','SQL','APEX','docx','p25_output_multiple_charts',86800,86800,'ok',0,43,'with both_lines as
(
SELECT 
   ''line 1'' line_name, 
   NULL    AS LINK,
       rownum        AS x,
       o.order_total AS y
        FROM demo_customers c,
          demo_orders o
        WHERE c.customer_id = o.customer_id
union all
SELECT 
  ''line 2'' line_name, 
   NULL                AS LINK,
    rownum                    AS x,
    o.order_total*1.21/rownum AS y
  FROM demo_customers c,
    demo_orders o
  WHERE c.customer_id = o.customer_id
),
lines as (select ''line 1'' line_name from dual
          union all
          select  ''line 2'' line_name from dual),
both_columns as
(
SELECT 
   ''column 1'' column_name, 
                    c.cust_first_name || '' '' || c.cust_last_name as x,
                    sum(o.order_total)                          as y
                  from demo_customers c, demo_orders o
                  where c.customer_id = o.customer_id
                  group by c.cust_first_name || '' '' || c.cust_last_name
union all
SELECT 
  ''column 2'' column_name, 
                    c.cust_first_name || '' '' || c.cust_last_name as x,
                    sum(o.order_total*1.21/rownum)                          as y
                  from demo_customers c, demo_orders o
                  where c.customer_id = o.customer_id
                  group by c.cust_first_name || '' '' || c.cust_last_name
    order by 2
),
columns as (select ''column 1'' column_name from dual
          union all
          select  ''column 2'' column_name from dual)          
SELECT ''file1'' AS "filename",
  CURSOR
  (SELECT CURSOR
    (SELECT ''line''                 AS "type",
      ''My Multi-Series Line Chart'' AS "name",
      CURSOR
      (SELECT line_name AS "name",
        CURSOR
        (select link, x as "x", y as "y"
           from both_lines bl 
          where bl.line_name = l.line_name
        ) AS "data"
      FROM lines l
      ) AS "lines"
    FROM dual
    ) AS "line_chart",
    cursor(select
            ''column'' as "type",
            ''My Column Chart'' as "name",   
            cursor
            (select
                576     as "width" ,
                336     as "height",
                ''Title'' as "title in chart" ,
                ''true''  as "grid"  ,
                ''true''  as "border"
              from dual
            ) as "options",
            cursor(select
                column_name as "name",
                cursor
                (select null as link, x as "x", y as "y"
           from both_columns bl 
          where bl.column_name = l.column_name                
                ) as "data"
              from columns l
                  ) as "columns"
          from dual) as "column_chart"
  FROM dual
  ) AS "data"
FROM dual
','aop_template_multiple_charts.docx',null,null,null,null,to_date('02/09/16','DD/MM/RR'),to_date('06/09/16','DD/MM/RR'),232,25);

commit;

Insert into AOP_TEMPLATE (ID,FILENAME,MIME_TYPE,LAST_UPDATE_DATE,TEMPLATE_TYPE,DESCRIPTION) values (1,'aop_template_d01.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',to_date('26/06/15','DD/MM/RR'),'docx',null);
Insert into AOP_TEMPLATE (ID,FILENAME,MIME_TYPE,LAST_UPDATE_DATE,TEMPLATE_TYPE,DESCRIPTION) values (2,'aop_template_p01.pptx','application/vnd.openxmlformats-officedocument.presentationml.presentation',to_date('26/06/15','DD/MM/RR'),'pptx',null);
Insert into AOP_TEMPLATE (ID,FILENAME,MIME_TYPE,LAST_UPDATE_DATE,TEMPLATE_TYPE,DESCRIPTION) values (3,'aop_template_x01.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',to_date('09/12/15','DD/MM/RR'),'xlsx',null);
Insert into AOP_TEMPLATE (ID,FILENAME,MIME_TYPE,LAST_UPDATE_DATE,TEMPLATE_TYPE,DESCRIPTION) values (4,'aop_template_p02.pptx','application/vnd.openxmlformats-officedocument.presentationml.presentation',to_date('02/08/15','DD/MM/RR'),'pptx',null);
Insert into AOP_TEMPLATE (ID,FILENAME,MIME_TYPE,LAST_UPDATE_DATE,TEMPLATE_TYPE,DESCRIPTION) values (5,'aop_template_p03.pptx','application/vnd.openxmlformats-officedocument.presentationml.presentation',to_date('02/08/15','DD/MM/RR'),'pptx',null);

commit;

update aop_template t
   set t.template_blob = (select a.blob_content
                            from apex_application_files a 
                           where a.filename = t.filename
                             and rownum < 2
                         )
 where t.template_blob is null;
 
commit; 

SET DEFINE OFF;
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (914,0.63,2879);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (915,0.7,2879);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (916,0.71,2879);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (917,0.84,2879);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (918,0.84,2879);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (919,1.02,2879);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (920,0.72,2879);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (921,0.72,2879);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (922,0.92,2880);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (923,0.74,2880);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (924,0.7,2881);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (925,0.71,2881);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (926,1.05,2881);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (927,0.7,2882);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (928,0.54,2882);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (929,0.73,2882);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (930,0.88,2882);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (931,0.73,2882);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (932,0.72,2883);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (933,0.9,2883);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (934,0.9,2883);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (935,1.03,2884);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (936,0.84,2885);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (937,1.01,2885);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (938,0.77,2885);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (939,0.8,2885);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (940,0.9,2885);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (941,0.73,2886);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (942,0.72,2886);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (943,0.71,2887);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (944,0.7,2887);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (945,0.79,2888);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (946,0.72,2889);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (947,0.7,2889);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (948,0.7,2889);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (949,0.9,2889);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (950,0.71,2889);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (951,0.5,2889);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (952,0.5,2889);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (953,0.74,2889);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (954,0.77,2889);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (955,0.77,2889);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (956,0.8,2890);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (957,0.8,2890);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (958,0.8,2890);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (959,0.8,2890);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (960,0.66,2890);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (961,0.71,2891);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (962,0.71,2891);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (963,0.71,2891);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (964,0.71,2891);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (965,0.72,2891);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (966,0.71,2891);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (967,0.86,2892);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (968,1.19,2892);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (969,0.71,2893);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (970,0.82,2893);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (971,0.71,2893);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (972,0.75,2893);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (973,0.7,2893);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (974,0.8,2893);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (975,0.82,2893);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (976,0.82,2893);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (977,0.82,2893);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (978,0.81,2894);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (979,0.81,2894);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (980,0.76,2894);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (981,0.71,2895);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (982,0.7,2895);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (983,0.7,2895);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (984,0.74,2896);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (985,0.77,2896);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (986,0.77,2896);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (987,0.53,2896);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (988,0.79,2896);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (989,0.73,2896);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (990,0.77,2896);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (991,0.77,2896);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (992,1.01,2896);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (993,1.01,2896);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (994,0.6,2897);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (995,0.76,2897);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (996,0.54,2897);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (997,0.72,2897);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (998,0.72,2897);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (999,0.74,2897);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1000,1.12,2898);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1001,0.75,2898);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1002,0.77,2898);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1003,0.98,2898);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1004,0.79,2898);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1005,0.79,2898);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1006,0.79,2898);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1007,0.79,2898);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1008,0.79,2898);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1009,0.79,2898);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1010,0.7,2899);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1011,0.7,2900);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1012,0.72,2900);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1013,0.8,2901);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1014,0.81,2901);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1015,0.81,2901);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1016,0.74,2901);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1017,0.73,2902);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1018,0.73,2902);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1019,0.75,2902);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1020,0.71,2902);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1021,0.71,2902);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1022,0.75,2903);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1023,0.75,2903);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1024,0.72,2903);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1025,0.72,2903);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1026,0.72,2903);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1027,0.79,2904);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1028,0.79,2904);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1029,0.7,2904);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1030,0.62,2904);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1031,0.7,2905);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1032,0.7,2905);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1033,0.7,2905);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1034,0.71,2905);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1035,0.86,2905);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1036,0.53,2905);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1037,0.91,2905);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1038,0.95,2905);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1039,0.91,2905);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1040,0.74,2906);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1041,0.8,2906);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1042,0.74,2906);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1043,0.61,2907);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1044,0.61,2907);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1045,0.61,2907);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1046,0.72,2907);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1047,0.7,2907);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1048,0.71,2907);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1049,0.79,2907);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1050,0.72,2907);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1051,0.33,557);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1052,0.39,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1053,0.32,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1054,0.25,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1055,0.25,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1056,0.25,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1057,0.25,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1058,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1059,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1060,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1061,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1062,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1063,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1064,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1065,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1066,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1067,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1068,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1069,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1070,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1071,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1072,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1073,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1074,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1075,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1076,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1077,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1078,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1079,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1080,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1081,0.82,2908);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1082,0.73,2908);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1083,0.7,2909);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1084,0.7,2909);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1085,0.71,2909);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1086,0.71,2909);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1087,0.9,2909);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1088,0.71,2910);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1089,1.05,2911);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1090,0.59,2911);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1091,0.71,2911);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1092,0.77,2911);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1093,0.73,2912);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1094,0.7,2912);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1095,0.73,2912);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1096,0.8,2912);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1097,1,2912);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1098,1,2912);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1099,1,2912);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1100,0.7,2913);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1101,0.71,2913);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1102,0.71,2913);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1103,0.71,2913);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1104,0.71,2913);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1105,0.71,2913);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1106,0.71,2913);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1107,0.91,2913);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1108,0.83,2913);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1109,0.85,2913);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1110,0.8,2914);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1111,0.73,2914);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1112,0.83,2915);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1113,0.77,2915);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1114,0.8,2915);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1115,0.71,2915);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1116,0.73,2916);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1117,0.93,2917);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1118,0.74,2917);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1119,0.7,2917);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1120,0.71,2917);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1121,0.71,2918);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1122,0.8,2918);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1123,0.71,2918);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1124,0.72,2918);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1125,0.83,2918);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1126,0.72,2919);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1127,0.8,2919);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1128,0.73,2919);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1129,0.7,2919);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1130,0.73,2919);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1131,0.73,2919);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1132,0.71,2920);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1133,0.72,2920);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1134,0.71,2920);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1135,0.71,2920);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1136,0.74,2921);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1137,0.71,2921);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1138,0.71,2921);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1139,0.71,2921);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1140,0.65,2921);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1141,0.9,2921);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1142,0.71,2922);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1143,0.71,2922);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1144,0.68,2922);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1145,0.53,2922);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1146,0.77,2922);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1147,0.72,2923);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1148,0.72,2923);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1149,0.7,2923);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1150,0.75,2923);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1151,0.75,2923);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1152,0.87,2923);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1153,0.71,2923);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1154,0.77,2923);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1155,0.78,2923);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1156,0.75,2923);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1157,0.9,2923);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1158,0.7,2924);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1159,0.8,2925);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1160,0.7,2925);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1161,0.51,2925);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1162,0.71,2925);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1163,1.02,2925);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1164,1.2,2925);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1165,0.81,2926);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1166,0.81,2926);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1167,0.81,2926);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1168,0.77,2927);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1169,0.8,2927);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1170,0.9,2927);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1171,0.7,2928);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1172,0.7,2928);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1173,0.74,2929);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1174,0.8,2929);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1175,0.7,2929);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1176,0.7,2929);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1177,0.71,2930);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1178,0.7,2930);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1179,0.7,2930);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1180,0.71,2930);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1181,0.71,2930);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1182,0.71,2930);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1183,0.9,2930);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1184,0.9,2930);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1185,0.71,2930);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1186,0.7,2931);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1187,0.72,2931);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1188,0.72,2931);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1189,0.7,2932);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1190,0.7,2932);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1191,0.7,2932);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1192,0.72,2933);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1193,0.59,2933);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1194,0.73,2933);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1195,0.75,2933);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1196,0.75,2933);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1197,0.9,2934);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1198,0.71,2934);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1199,0.91,2935);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1200,1.17,2935);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1201,0.8,2935);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1202,0.7,2936);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1203,0.81,2936);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1204,0.74,2936);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1205,0.7,2936);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1206,0.82,2937);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1207,0.76,2937);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1208,0.76,2937);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1209,0.95,2937);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1210,0.71,2938);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1211,0.71,2938);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1212,0.81,2938);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1213,0.73,2939);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1214,0.73,2939);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1215,0.83,2939);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1216,0.77,2939);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1217,0.8,2939);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1218,0.73,2939);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1219,0.72,2939);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1220,0.75,2939);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1221,0.8,2939);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1222,0.81,2939);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1223,0.82,2939);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1224,0.7,2940);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1225,1.24,2940);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1226,0.7,2940);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1227,0.7,2940);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1228,0.75,2940);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1229,1,2940);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1230,0.75,2940);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1231,0.7,2940);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1232,0.79,2941);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1233,0.8,2941);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1234,0.81,2942);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1235,0.71,2942);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1236,1.03,2942);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1237,0.7,2942);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1238,0.76,2942);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1239,1.01,2942);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1240,0.73,2943);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1241,0.72,2943);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1242,0.74,2944);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1243,0.79,2944);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1244,0.57,2945);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1245,0.79,2945);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1246,0.78,2945);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1247,0.85,2945);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1248,0.71,2946);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1249,0.71,2946);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1250,0.72,2946);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1251,0.72,2946);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1252,0.77,2946);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1253,0.79,2946);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1254,0.78,2947);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1255,0.76,2947);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1256,0.92,2947);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1257,0.73,2947);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1258,0.7,2947);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1259,0.7,2947);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1260,0.74,2947);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1261,0.74,2947);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1262,0.73,2947);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1263,0.82,2947);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1264,0.9,2947);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1265,0.73,2948);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1266,0.7,2948);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1267,0.9,2948);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1268,0.9,2948);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1269,0.9,2948);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1270,0.9,2948);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1271,1,2948);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1272,0.72,2949);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1273,0.76,2949);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1274,0.77,2949);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1275,0.72,2949);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1276,0.99,2949);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1277,0.81,2950);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1278,0.71,2950);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1279,0.71,2950);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1280,0.54,2951);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1281,0.72,2951);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1282,0.81,2951);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1283,0.73,2951);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1284,0.72,2951);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1285,0.7,2952);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1286,0.7,2952);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1287,0.7,2952);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1288,0.7,2952);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1289,0.72,2952);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1290,0.72,2952);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1291,0.7,2952);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1292,0.7,2952);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1293,0.7,2952);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1294,0.74,2952);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1295,0.7,2952);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1296,0.8,2953);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1297,0.79,2953);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1298,0.75,2953);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1299,0.71,2954);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1300,0.72,2954);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1301,0.72,2954);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1302,0.72,2954);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1303,0.75,2954);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1304,0.82,2954);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1305,0.76,2954);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1306,0.89,2955);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1307,0.7,2956);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1308,0.74,2956);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1309,0.74,2956);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1310,0.95,2956);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1311,0.91,2956);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1312,0.7,2956);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1313,0.71,2956);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1314,0.7,2956);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1315,0.72,2956);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1316,0.72,2956);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1317,0.72,2958);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1318,0.79,2958);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1319,0.72,2958);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1320,0.98,2958);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1321,0.56,2959);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1322,0.7,2959);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1323,0.79,2959);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1324,0.82,2959);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1325,0.74,2959);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1326,0.71,2960);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1327,0.7,2960);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1328,0.7,2960);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1329,0.7,2960);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1330,0.76,2960);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1331,0.72,2960);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1332,0.64,2960);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1333,0.71,2960);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1334,0.74,2960);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1335,0.77,2961);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1336,0.74,2961);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1337,0.72,2961);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1338,0.73,2961);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1339,0.73,2961);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1340,0.63,2961);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1341,0.72,2961);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1342,0.76,2961);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1343,0.71,2961);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1344,0.75,2961);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1345,0.96,2961);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1346,0.63,2962);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1347,0.72,2962);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1348,0.71,2962);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1349,0.82,2962);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1350,0.71,2963);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1351,0.91,2963);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1352,0.71,2964);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1353,0.71,2964);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1354,0.71,2964);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1355,0.7,2964);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1356,0.7,2964);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1357,0.75,2964);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1358,0.9,2964);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1359,0.9,2964);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1360,0.9,2964);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1361,0.9,2964);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1362,1,2964);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1363,1.5,2964);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1364,1.05,2964);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1365,0.9,2964);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1366,0.71,2965);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1367,0.71,2965);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1820,0.57,3057);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1821,0.76,3057);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1822,0.9,3057);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1823,0.82,3057);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1824,0.91,3058);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1825,0.79,3058);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1826,0.91,3058);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1827,0.72,3059);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1828,0.81,3059);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1829,0.71,3059);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1830,1.03,3060);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1831,0.9,3060);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1832,0.74,3061);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1833,0.7,3061);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1834,0.71,3061);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1835,0.9,3061);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1836,0.71,3061);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1837,0.91,3061);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1838,0.71,3062);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1839,0.7,3062);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1840,0.72,3062);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1841,0.9,3062);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1842,0.71,3062);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1843,0.71,3062);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1844,0.93,3062);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1845,0.7,3063);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1846,0.7,3063);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1847,0.7,3063);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1848,0.71,3064);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1849,0.76,3064);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1850,0.7,3064);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1851,0.7,3064);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1852,0.8,3064);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1853,0.72,3065);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1854,0.7,3065);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1855,0.65,3065);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1856,0.85,3066);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1857,0.77,3066);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1858,0.71,3066);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1859,0.71,3066);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1860,0.8,3066);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1861,0.8,3066);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1862,0.73,3066);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1863,0.9,3067);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1864,0.78,3067);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1865,0.7,3068);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1866,0.7,3068);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1867,0.85,3070);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1868,0.8,3070);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1869,0.8,3070);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1870,0.92,3070);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1871,0.8,3071);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1872,0.82,3071);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1873,0.71,3072);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1874,0.7,3073);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1875,0.79,3073);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1876,0.7,3073);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1877,0.75,3073);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1878,0.71,3073);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1879,0.62,3073);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1880,1.03,3073);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1881,0.7,3073);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1882,0.78,3074);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1883,0.9,3074);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1884,0.77,3074);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1885,0.9,3074);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1886,0.72,3075);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1887,0.72,3075);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1888,0.71,3075);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1889,0.7,3075);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1890,0.72,3075);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1891,0.76,3075);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1892,0.76,3075);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1893,0.79,3075);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1894,0.79,3077);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1895,0.79,3077);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1896,0.73,3077);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1897,0.71,3077);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1898,0.71,3077);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1899,0.75,3078);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1900,0.72,3078);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1901,0.83,3078);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1902,0.76,3079);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1903,0.94,3079);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1904,0.91,3079);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1905,1,3080);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1906,1,3080);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1907,1,3080);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1908,1,3080);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1909,1,3080);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1910,0.82,3080);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1911,0.71,3080);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1912,0.71,3080);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1913,0.79,3081);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1914,0.75,3081);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1915,0.79,3081);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1916,0.71,3081);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1917,0.8,3082);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1918,0.91,3082);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1919,0.6,3082);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1920,0.6,3082);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1921,0.7,3082);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1922,0.91,3082);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1923,0.71,3082);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1924,0.86,3082);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1925,0.8,3082);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1926,0.8,3082);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1927,0.8,3082);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1928,0.92,3083);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1929,0.72,3083);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1930,1.01,3083);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1931,0.71,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1932,0.72,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1933,0.81,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1934,0.53,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1935,0.61,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1936,0.85,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1937,0.75,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1938,0.9,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1939,0.9,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1940,0.9,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1941,0.9,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1942,0.9,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1943,0.9,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1944,0.9,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1945,0.81,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1946,0.81,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1947,0.9,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1948,1.02,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1949,0.72,3084);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1950,0.75,3085);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1951,0.84,3086);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1952,0.75,3086);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1953,0.7,3087);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1954,0.7,3087);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1955,0.91,3087);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1956,0.7,3087);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1957,0.76,3087);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1958,0.74,3087);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1959,1.01,3088);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1960,1.01,3088);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1961,0.79,3089);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1962,0.77,3089);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1963,0.73,3089);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1964,0.73,3089);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1965,0.73,3089);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1966,0.73,3089);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1967,0.73,3089);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1968,0.73,3089);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1969,0.71,3090);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1970,0.58,3090);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1971,0.87,3090);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1972,0.71,3090);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1973,0.72,3091);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1974,0.92,3091);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1975,1.2,3091);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1976,0.8,3091);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1977,0.98,3091);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1978,0.7,3092);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1979,0.7,3092);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1980,0.7,3092);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1981,0.8,3093);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1982,0.7,3093);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1983,0.7,3093);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1984,0.72,3093);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1985,0.71,3095);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1986,0.7,3095);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1987,0.81,3095);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1988,0.94,3095);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1989,0.9,3095);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1990,0.71,3096);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1991,0.71,3096);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1992,0.77,3096);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1993,0.91,3096);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1994,0.81,3097);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1995,0.81,3097);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1996,0.52,3097);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1997,0.53,3097);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1998,1.29,3098);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1999,0.9,3099);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2000,0.72,3099);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2001,0.94,3099);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2002,0.93,3101);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2003,0.74,3101);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2004,0.81,3101);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2005,0.71,3101);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2006,0.72,3102);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2007,0.9,3102);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2008,0.72,3102);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2009,0.9,3102);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2010,0.83,3103);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2011,0.66,3103);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2012,0.71,3103);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2013,0.78,3103);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2014,0.81,3104);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2015,0.71,3104);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2016,0.9,3104);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2017,0.9,3104);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2018,0.9,3104);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2019,0.7,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2020,0.78,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2021,0.78,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2022,0.9,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2023,0.9,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2024,0.9,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2025,1.52,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2026,1.52,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2027,0.9,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2028,0.9,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2029,0.75,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2030,0.7,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2031,0.9,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2032,0.72,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2033,0.9,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2034,0.9,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2035,0.72,3105);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2036,0.79,3107);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2037,0.79,3107);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2038,0.7,3107);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2039,0.7,3107);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2040,0.7,3107);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2041,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2042,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2043,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2044,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2045,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2046,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2047,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2048,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2049,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2050,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2051,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2052,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2053,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2054,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2055,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2056,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2057,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2058,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2059,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2060,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2061,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2062,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2063,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2064,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2065,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2066,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2067,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2068,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2069,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2070,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2071,0.76,3107);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2072,0.9,3107);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2073,0.9,3107);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2074,0.76,3107);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2075,0.81,3107);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2076,0.77,3108);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2077,0.74,3108);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2078,0.75,3108);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2079,0.7,3109);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2080,0.7,3109);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2081,0.81,3109);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2082,1.01,3110);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2083,0.76,3111);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2084,1.01,3111);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2085,0.8,3111);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2086,0.68,3112);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2087,0.91,3112);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2088,0.79,3112);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2089,0.71,3112);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2090,0.71,3112);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2091,0.71,3112);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2092,0.71,3113);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2093,0.78,3113);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2094,0.82,3113);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2095,0.9,3114);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2096,0.9,3114);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2097,0.76,3114);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2098,0.77,3114);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2099,0.9,3114);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2100,0.93,3114);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2101,0.86,3115);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2102,0.7,3115);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2103,0.9,3115);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2104,0.84,3115);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2105,0.8,3116);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2106,0.9,3116);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2107,0.9,3116);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2108,0.71,3116);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2109,0.92,3117);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2110,1.08,3118);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2111,0.85,3118);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2112,0.83,3118);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2113,1.16,3118);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2114,0.87,3118);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2115,0.9,3119);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2116,0.7,3119);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2117,0.7,3119);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2118,1.02,3119);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2119,1.02,3119);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2120,0.91,3119);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2121,0.75,3120);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2122,0.9,3120);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2123,0.77,3121);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2124,0.76,3121);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2125,0.9,3121);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2126,0.9,3121);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2127,0.9,3121);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2128,0.86,3121);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2129,0.71,3122);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2130,0.72,3122);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2131,0.72,3122);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2132,0.92,3122);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2133,0.9,3123);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2134,0.7,3123);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2135,0.71,3123);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2136,0.71,3123);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2137,0.71,3123);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2138,0.82,3123);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2139,0.77,3124);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2140,0.72,3124);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2141,0.84,3125);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2142,0.83,3125);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2143,0.94,3125);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2144,0.9,3125);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2145,0.52,3125);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2146,0.93,3125);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2147,0.57,3126);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2148,0.72,3126);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2149,0.57,3126);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2150,1.13,3127);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2151,0.7,3127);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2152,0.7,3127);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2153,0.73,3127);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2154,0.73,3127);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2155,0.73,3127);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2156,0.71,3128);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2157,0.7,3129);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2158,0.75,3129);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2159,0.75,3129);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2160,0.97,3129);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2161,0.74,3130);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2162,0.74,3130);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2163,0.74,3130);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2164,0.74,3130);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2165,0.7,3131);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2166,0.71,3131);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2167,0.82,3131);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2168,0.72,3133);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2169,0.82,3133);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2170,0.74,3133);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2171,0.94,3134);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2172,0.71,3135);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2173,0.71,3135);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2174,0.73,3135);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2175,0.8,3135);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2176,0.81,3135);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2177,0.7,3136);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2178,1,3136);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2179,0.8,3136);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2180,0.75,3136);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2181,1,3136);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2182,0.71,3136);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2183,1,3136);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2184,1,3136);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2185,1,3136);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2186,1,3136);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2187,0.8,3137);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2188,0.72,3137);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2189,0.71,3137);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2190,0.71,3137);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2191,1.01,3137);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2192,0.79,3138);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2193,0.74,3138);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2194,0.72,3139);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2195,0.9,3139);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2196,0.9,3139);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2197,0.9,3139);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2198,0.9,3139);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2199,0.72,3139);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2200,0.54,3139);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2201,0.73,3140);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2202,0.7,3140);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2203,0.72,3140);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2204,0.73,3140);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2205,1.02,3141);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2206,1.02,3141);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2207,0.9,3141);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2208,1,3142);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2209,0.7,3142);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2210,1,3142);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2211,1.02,3142);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2212,1,3142);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2213,1,3142);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2214,0.68,3143);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2215,0.83,3143);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2216,0.8,3144);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2217,1.21,3144);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2218,0.7,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2219,0.71,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2220,0.84,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2221,0.9,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2222,0.9,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2223,0.7,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2224,0.7,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2225,0.71,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2226,0.7,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2227,0.9,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2228,0.9,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2229,0.9,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2230,0.9,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2231,0.74,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2232,0.72,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2233,0.72,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2234,0.78,3145);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2235,0.71,3146);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2236,0.71,3146);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2237,0.92,3146);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2238,0.8,3146);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2239,0.81,3146);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2240,0.78,3146);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2241,0.73,3146);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2242,1.06,3146);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2243,1,3146);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2244,0.77,3148);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2245,0.7,3148);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2246,0.7,3148);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2247,1.02,3148);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2248,0.91,3149);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2249,1.03,3149);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2250,1.03,3149);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2251,1.03,3149);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2252,0.94,3150);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2253,0.88,3150);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2254,0.75,3150);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2255,0.75,3150);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2256,0.72,3151);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2257,0.77,3152);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2258,0.75,3152);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2259,0.83,3153);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2260,0.9,3153);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2261,0.8,3153);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2262,0.71,3153);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2263,0.92,3153);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2264,0.7,3154);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2265,0.7,3154);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2266,0.7,3154);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2267,0.95,3154);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2268,0.58,3154);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2269,0.73,3154);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2270,0.77,3154);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1368,0.71,2965);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1369,0.71,2965);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1370,0.7,2965);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1371,0.7,2965);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1372,0.73,2966);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1373,0.85,2966);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1374,0.7,2966);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1375,0.75,2966);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1376,0.82,2966);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1377,0.7,2967);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1378,0.7,2967);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1379,0.86,2967);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1380,0.79,2967);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1381,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1382,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1383,0.31,558);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1384,0.3,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1385,0.31,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1386,0.31,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1387,0.31,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1388,0.24,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1389,0.24,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1390,0.24,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1391,0.24,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1392,0.24,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1393,0.32,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1394,0.32,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1395,0.24,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1396,0.24,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1397,0.24,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1398,0.24,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1399,0.24,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1400,0.32,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1401,0.32,559);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1402,0.25,560);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1403,0.25,560);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1404,0.25,560);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1405,0.27,560);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1406,0.32,560);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1407,0.36,560);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1408,0.41,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1409,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1410,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1411,0.75,2968);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1412,0.92,2968);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1413,1.13,2968);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1414,0.71,2968);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1415,1.06,2968);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1416,0.9,2968);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1417,0.8,2969);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1418,0.52,2970);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1419,0.72,2970);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1420,0.7,2970);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1421,0.78,2970);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1422,0.78,2970);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1423,1.04,2970);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1424,0.91,2971);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1425,0.81,2972);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1426,0.76,2972);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1427,0.7,2972);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1428,0.9,2972);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1429,0.81,2972);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1430,0.9,2973);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1431,0.75,2973);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1432,0.77,2973);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1433,0.7,2973);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1434,0.81,2973);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1435,0.7,2973);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1436,0.82,2974);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1437,0.57,2974);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1438,0.9,2974);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1439,1,2974);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1440,0.71,2974);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1441,0.7,2975);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1442,0.7,2975);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1443,0.82,2975);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1444,0.8,2975);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1445,0.83,2975);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1446,0.83,2975);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1447,0.77,2975);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1448,0.79,2976);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1449,0.72,2976);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1450,0.91,2976);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1451,0.71,2977);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1452,0.81,2977);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1453,0.76,2977);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1454,0.54,2977);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1455,0.71,2978);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1456,0.7,2978);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1457,0.8,2978);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1458,0.76,2978);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1459,0.72,2979);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1460,0.7,2979);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1461,0.86,2980);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1462,0.7,2980);
commit;
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1463,0.7,2980);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1464,0.64,2980);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1465,0.7,2981);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1466,0.91,2981);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1467,0.91,2981);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1468,0.9,2982);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1469,0.71,2982);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1470,0.9,2982);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1471,0.71,2982);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1472,0.71,2982);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1473,0.71,2982);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1474,0.74,2984);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1475,0.9,2984);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1476,1,2984);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1477,0.7,2985);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1478,0.75,2985);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1479,0.82,2985);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1480,0.77,2986);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1481,0.8,2986);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1482,0.82,2986);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1483,0.84,2986);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1484,0.7,2987);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1485,0.74,2987);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1486,0.77,2988);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1487,0.6,2988);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1488,1.03,2988);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1489,0.76,2988);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1490,0.72,2989);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1491,0.83,2990);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1492,0.76,2990);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1493,0.72,2990);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1494,0.57,2990);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1495,0.75,2991);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1496,0.7,2991);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1497,0.7,2992);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1498,0.75,2992);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1499,1.06,2992);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1500,0.69,2993);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1501,0.87,2993);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1502,0.75,2993);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1503,0.7,2993);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1504,0.7,2993);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1505,0.75,2993);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1506,0.72,2993);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1507,1.01,2993);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1508,0.71,2994);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1509,0.71,2994);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1510,0.81,2994);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1511,1.24,2994);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1512,0.81,2994);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1513,0.81,2994);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1514,0.73,2995);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1515,0.7,2995);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1516,0.91,2996);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1517,0.88,2996);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1518,0.77,2996);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1519,0.74,2997);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1520,0.72,2997);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1521,0.7,2998);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1522,0.72,2998);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1523,0.7,2998);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1524,1.01,2998);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1525,0.85,2998);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1526,0.7,2999);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1527,0.73,2999);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1528,1.02,2999);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1529,0.87,2999);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1530,0.71,2999);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1531,0.7,2999);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1532,0.74,2999);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1533,0.74,2999);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1534,0.7,2999);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1535,0.77,3000);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1536,0.93,3000);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1537,0.9,3001);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1538,0.9,3001);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1539,0.9,3001);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1540,0.72,3001);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1541,0.7,3001);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1542,0.7,3001);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1543,0.7,3001);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1544,0.6,3001);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1545,0.75,3002);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1546,0.83,3002);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1547,0.77,3002);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1548,0.71,3002);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1549,0.89,3002);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1550,0.72,3002);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1551,0.72,3002);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1552,0.8,3002);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1553,0.73,3002);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1554,0.76,3003);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1555,1.01,3003);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1556,0.65,3003);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1557,0.81,3004);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1558,0.81,3004);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1559,0.7,3004);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1560,0.61,3004);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1561,0.78,3004);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1562,0.72,3004);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1563,0.92,3004);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1564,0.75,3005);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1565,0.55,3005);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1566,0.8,3005);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1567,0.72,3005);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1568,0.73,3005);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1569,0.91,3006);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1570,0.91,3006);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1571,0.71,3006);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1572,0.71,3006);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1573,0.55,3006);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1574,0.71,3007);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1575,0.71,3007);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1576,0.7,3007);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1577,0.71,3007);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1578,0.71,3007);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1579,0.71,3007);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1580,0.71,3007);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1581,0.71,3007);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1582,0.76,3007);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1583,0.91,3007);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1584,0.7,3008);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1585,0.61,3008);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1586,0.7,3008);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1587,0.82,3008);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1588,0.71,3009);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1589,0.71,3009);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1590,0.71,3009);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1591,0.74,3009);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1592,0.83,3010);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1593,0.83,3010);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1594,0.8,3010);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1595,0.8,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1596,0.73,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1597,1,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1598,1.2,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1599,1.2,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1600,1.2,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1601,0.61,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1602,0.7,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1603,0.7,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1604,0.7,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1605,0.7,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1606,0.77,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1607,0.75,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1608,0.75,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1609,1,3011);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1610,0.78,3012);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1611,0.82,3012);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1612,0.72,3012);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1613,0.72,3012);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1614,0.72,3012);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1615,0.8,3013);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1616,0.75,3013);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1617,0.71,3013);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1618,0.71,3013);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1619,0.81,3013);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1620,0.81,3013);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1621,0.9,3013);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1622,0.78,3014);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1623,0.71,3014);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1624,0.73,3014);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1625,1.01,3014);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1626,0.9,3014);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1627,0.84,3015);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1628,0.91,3015);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1629,0.78,3015);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1630,0.81,3015);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1631,0.72,3016);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1632,0.7,3016);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1633,0.7,3016);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1634,0.9,3016);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1635,0.76,3016);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1636,0.96,3016);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1637,0.9,3016);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1638,0.7,3017);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1639,0.71,3017);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1640,1.12,3017);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1641,0.7,3017);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1642,0.5,3017);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1643,1.12,3017);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1644,0.7,3018);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1645,1.03,3018);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1646,0.7,3018);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1647,0.71,3018);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1648,0.72,3018);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1649,0.7,3018);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1650,1.02,3018);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1651,0.77,3018);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1652,0.7,3018);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1653,0.93,3019);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1654,0.78,3019);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1655,0.71,3020);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1656,0.73,3023);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1657,0.65,3023);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1658,0.85,3023);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1659,0.9,3024);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1660,0.9,3024);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1661,0.75,3024);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1662,0.9,3024);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1663,0.9,3024);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1664,0.72,3024);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1665,0.9,3024);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1666,0.72,3024);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1667,0.75,3024);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1668,0.75,3024);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1669,0.72,3024);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1670,0.75,3024);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1671,0.65,3025);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1672,0.7,3026);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1673,0.59,3026);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1674,0.71,3026);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1675,0.83,3027);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1676,1.02,3027);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1677,1,3027);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1678,1.02,3027);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1679,0.77,3027);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1680,0.7,3028);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1681,0.8,3030);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1682,0.74,3030);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1683,0.77,3031);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1684,0.72,3032);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1685,1.01,3032);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1686,1.01,3032);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1687,0.55,3032);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1688,0.71,3033);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1689,0.73,3033);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1690,0.76,3033);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1691,0.52,3033);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1692,0.7,3033);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1693,0.7,3033);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1694,0.7,3033);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1695,0.92,3033);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1696,0.91,3033);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1697,0.91,3034);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1698,0.91,3034);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1699,0.7,3034);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1700,0.72,3035);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1701,0.71,3035);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1702,0.72,3035);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1703,0.78,3035);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1704,0.71,3035);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1705,0.8,3036);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1706,0.74,3036);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1707,0.74,3036);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1708,0.61,3036);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1709,0.78,3036);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1710,0.7,3037);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1711,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1712,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1713,0.4,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1714,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1715,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1716,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1717,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1718,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1719,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1720,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1721,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1722,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1723,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1724,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1725,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1726,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1727,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1728,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1729,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1730,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1731,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1732,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1733,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1734,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1735,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1736,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1737,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1738,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1739,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1740,0.32,561);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1741,0.72,3037);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1742,0.76,3038);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1743,0.7,3038);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1744,0.73,3038);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1745,0.7,3039);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1746,0.7,3039);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1747,0.77,3040);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1748,0.92,3040);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1749,0.73,3041);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1750,0.71,3041);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1751,0.71,3041);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1752,0.81,3042);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1753,0.71,3042);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1754,0.72,3043);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1755,0.81,3043);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1756,0.81,3043);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1757,0.77,3044);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1758,0.83,3044);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1759,0.71,3045);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1760,0.71,3045);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1761,0.78,3045);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1762,0.71,3045);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1763,0.72,3045);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1764,1.14,3045);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1765,0.75,3045);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1766,0.75,3046);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1767,0.7,3046);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1768,0.79,3047);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1769,0.73,3047);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1770,0.91,3047);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1771,0.91,3047);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1772,0.93,3047);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1773,0.82,3048);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1774,0.75,3048);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1775,0.72,3048);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1776,0.72,3048);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1777,0.72,3048);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1778,0.72,3048);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1779,0.9,3048);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1780,0.72,3048);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1781,0.72,3048);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1782,0.75,3049);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1783,0.66,3049);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1784,0.83,3049);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1785,0.62,3050);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1786,0.8,3050);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1787,0.76,3050);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1788,0.76,3050);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1789,0.82,3050);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1790,0.81,3050);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1791,1.02,3051);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1792,0.66,3051);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1793,0.7,3052);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1794,0.77,3052);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1795,0.7,3052);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1796,1.03,3052);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1797,0.7,3053);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1798,0.71,3053);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1799,0.7,3053);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1800,0.71,3053);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1801,0.81,3053);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1802,0.78,3053);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1803,0.75,3053);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1804,0.79,3053);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1805,0.79,3053);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1806,0.79,3053);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1807,0.79,3053);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1808,0.7,3054);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1809,1.01,3054);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1810,1.01,3054);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1811,1.01,3054);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1812,1.01,3054);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1813,0.78,3055);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1814,0.65,3056);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1815,0.61,3056);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1816,0.78,3056);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1817,0.76,3056);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1818,0.9,3057);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1819,0.92,3057);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (1,0.23,326);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (2,0.21,326);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (3,0.23,327);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (4,0.29,334);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (5,0.31,335);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (6,0.24,336);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (7,0.24,336);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (8,0.26,337);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (9,0.22,337);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (10,0.23,338);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (11,0.3,339);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (12,0.23,340);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (13,0.22,342);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (14,0.31,344);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (15,0.2,345);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (16,0.32,345);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (17,0.3,348);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (18,0.3,351);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (19,0.3,351);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (20,0.3,351);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (21,0.3,351);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (22,0.23,352);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (23,0.23,353);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (24,0.31,353);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (25,0.31,353);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (26,0.23,354);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (27,0.24,355);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (28,0.3,357);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (29,0.23,357);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (30,0.23,357);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (31,0.23,402);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (32,0.23,402);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (33,0.23,402);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (34,0.23,402);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (35,0.23,402);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (36,0.23,402);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (37,0.23,402);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (38,0.31,402);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (39,0.26,403);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (40,0.33,403);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (41,0.33,403);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (42,0.33,403);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (43,0.26,403);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (44,0.26,403);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (45,0.32,403);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (46,0.29,403);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (47,0.32,403);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (48,0.32,403);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (49,0.25,404);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (50,0.29,404);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (51,0.24,404);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (52,0.23,404);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (53,0.32,404);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (54,0.22,404);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (55,0.22,404);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (56,0.3,405);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (57,0.3,405);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (58,0.3,405);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (59,0.3,405);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (60,0.3,405);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (61,0.35,552);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (62,0.3,552);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (63,0.3,552);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (64,0.3,552);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (65,0.42,552);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (66,0.28,553);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (67,0.32,553);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (68,0.31,553);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (69,0.31,553);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (70,0.24,553);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (71,0.24,553);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (72,0.3,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (73,0.3,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (74,0.3,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (75,0.3,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (76,0.26,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (77,0.26,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (78,0.26,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (79,0.26,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (80,0.26,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (81,0.26,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (82,0.26,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (83,0.26,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (84,0.38,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (85,0.26,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (86,0.24,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (87,0.24,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (88,0.24,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (89,0.24,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (90,0.32,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (91,0.7,2757);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (92,0.86,2757);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (93,0.7,2757);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (94,0.71,2759);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (95,0.78,2759);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (96,0.7,2759);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (97,0.7,2759);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (98,0.96,2759);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (99,0.73,2760);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (100,0.8,2760);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (101,0.75,2760);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (102,0.75,2760);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (103,0.74,2760);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (104,0.75,2760);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (105,0.8,2760);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (106,0.75,2760);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (107,0.8,2760);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (108,0.74,2761);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (109,0.81,2761);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (110,0.59,2761);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (111,0.8,2761);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (112,0.74,2761);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (113,0.9,2761);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (114,0.74,2762);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (115,0.73,2762);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (116,0.73,2762);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (117,0.8,2762);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (118,0.71,2762);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (119,0.7,2762);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (120,0.8,2762);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (121,0.71,2762);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (122,0.74,2762);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (123,0.7,2762);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (124,0.7,2762);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (125,0.7,2762);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (126,0.7,2762);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (127,0.91,2763);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (128,0.61,2763);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (129,0.91,2763);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (130,0.91,2763);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (131,0.77,2763);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (132,0.71,2764);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (133,0.71,2764);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (134,0.7,2765);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (135,0.77,2765);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (136,0.63,2765);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (137,0.71,2765);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (138,0.71,2765);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (139,0.76,2765);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (140,0.64,2766);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (141,0.71,2766);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (142,0.71,2766);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (143,0.7,2767);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (144,0.7,2767);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (145,0.71,2767);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (146,0.7,2767);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (147,0.71,2768);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (148,0.73,2768);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (149,0.7,2768);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (150,0.7,2768);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (151,0.71,2768);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (152,0.74,2769);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (153,0.71,2770);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (154,0.73,2770);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (155,0.76,2770);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (156,0.76,2770);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (157,0.71,2770);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (158,0.73,2770);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (159,0.73,2770);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (160,0.73,2770);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (161,0.73,2770);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (162,0.72,2771);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (163,0.73,2771);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (164,0.71,2771);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (165,0.79,2771);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (166,0.73,2772);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (167,0.8,2772);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (168,0.58,2772);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (169,0.58,2772);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (170,0.71,2772);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (171,0.75,2773);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (172,0.7,2773);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (173,1.17,2774);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (174,0.6,2774);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (175,0.7,2774);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (176,0.83,2774);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (177,0.74,2775);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (178,0.72,2776);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (179,0.71,2776);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (180,0.71,2776);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (181,0.54,2776);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (182,0.54,2776);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (183,0.72,2776);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (184,0.72,2776);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (185,0.72,2776);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (186,0.71,2776);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (187,0.7,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (188,0.71,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (189,0.71,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (190,0.71,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (191,0.71,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (192,0.7,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (193,0.7,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (194,0.7,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (195,0.7,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (196,0.7,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (197,0.7,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (198,0.7,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (199,0.7,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (200,0.72,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (201,0.7,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (202,0.7,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (203,0.7,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (204,0.7,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (205,0.98,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (206,0.78,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (207,0.7,2777);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (208,0.52,2778);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (209,0.73,2779);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (210,0.74,2779);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (211,0.7,2780);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (212,0.77,2780);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (213,0.71,2780);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (214,0.74,2780);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (215,0.7,2780);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (216,1.01,2781);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (217,0.77,2781);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (218,0.78,2781);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (219,0.72,2782);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (220,0.53,2782);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (221,0.76,2782);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (222,0.7,2782);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (223,0.7,2782);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (224,0.75,2782);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (225,0.72,2782);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (226,0.72,2782);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (227,0.7,2782);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (228,0.84,2782);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (229,0.75,2782);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (230,0.52,2783);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (231,0.72,2784);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (232,0.79,2784);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (233,0.72,2787);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (234,0.51,2787);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (235,0.64,2787);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (236,0.7,2788);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (237,0.83,2788);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (238,0.76,2788);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (239,0.71,2788);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (240,0.77,2788);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (241,0.71,2788);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (242,1.01,2788);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (243,1.01,2788);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (244,0.77,2789);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (245,0.76,2789);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (246,0.76,2789);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (247,0.76,2789);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (248,1.05,2789);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (249,0.81,2789);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (250,0.7,2789);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (251,0.55,2789);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (252,0.81,2789);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (253,0.63,2789);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (254,0.63,2789);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (255,0.77,2789);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (256,1.05,2789);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (257,0.64,2790);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (258,0.76,2790);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (259,0.83,2790);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (260,0.71,2790);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (261,0.71,2790);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (262,0.87,2791);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (263,0.73,2791);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (264,0.71,2792);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (265,0.71,2792);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (266,0.71,2792);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (267,0.7,2792);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (268,0.7,2792);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (269,0.76,2792);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (270,0.7,2792);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (271,0.79,2793);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (272,0.7,2793);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (273,0.7,2793);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (274,0.76,2793);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (275,0.73,2793);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (276,0.79,2794);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (277,0.71,2795);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (278,0.81,2795);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (279,0.81,2795);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (280,0.72,2795);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (281,0.72,2795);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (282,0.72,2795);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (283,0.81,2795);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (284,0.72,2795);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (285,1,2795);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (286,0.73,2796);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (287,0.81,2797);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (288,0.81,2797);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (289,0.71,2797);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (290,0.71,2797);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (291,0.71,2797);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (292,0.57,2797);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (293,0.51,2797);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (294,0.72,2797);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (295,0.74,2797);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (296,0.74,2797);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (297,0.7,2797);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (298,0.8,2797);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (299,1.01,2797);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (300,0.8,2797);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (301,0.77,2798);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (302,0.83,2799);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (303,0.82,2799);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (304,0.78,2799);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (305,0.6,2800);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (306,0.9,2800);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (307,0.7,2800);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (308,0.9,2800);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (309,0.83,2800);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (310,0.83,2800);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (311,0.83,2800);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (312,0.74,2800);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (313,0.79,2800);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (314,0.61,2800);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (315,0.76,2800);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (316,0.96,2801);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (317,0.73,2801);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (318,0.73,2801);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (319,0.75,2801);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (320,0.71,2801);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (321,0.71,2801);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (322,0.71,2801);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (323,0.71,2801);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (324,1.04,2801);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (325,1,2801);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (326,0.87,2802);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (327,0.53,2802);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (328,0.72,2802);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (329,0.72,2802);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (330,0.7,2803);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (331,0.74,2803);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (332,0.71,2803);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (333,0.73,2803);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (334,0.7,2803);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (335,0.71,2803);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (336,0.71,2803);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (337,0.71,2803);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (338,0.77,2803);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (339,0.71,2803);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (340,0.78,2803);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (341,0.71,2803);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (342,0.91,2803);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (343,0.71,2804);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (344,0.71,2804);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (345,0.8,2804);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (346,0.7,2804);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (347,0.72,2804);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (348,0.72,2804);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (349,0.82,2804);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (350,0.7,2804);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (351,0.72,2804);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (352,0.72,2804);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (353,0.9,2804);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (354,0.74,2805);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (355,0.74,2805);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (356,0.73,2805);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (357,0.57,2805);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (358,0.73,2805);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (359,0.72,2805);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (360,0.74,2805);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (361,0.82,2805);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (362,0.81,2806);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (363,0.75,2806);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (364,0.7,2806);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (365,0.71,2807);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (366,0.71,2807);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (367,0.93,2807);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (368,0.8,2808);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (369,0.7,2808);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (370,1,2808);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (371,0.75,2808);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (372,0.58,2808);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (373,0.73,2808);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (374,0.81,2809);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (375,0.81,2809);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (376,0.71,2809);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (377,1.2,2809);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (378,0.7,2810);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (379,0.7,2810);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (380,0.74,2810);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (381,0.7,2810);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (382,0.8,2810);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (383,0.75,2811);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (384,0.83,2811);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (385,1,2811);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (386,0.99,2811);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (387,0.7,2812);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (388,0.7,2812);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (389,0.7,2812);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (390,0.7,2812);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (391,0.32,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (392,0.32,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (393,0.32,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (394,0.32,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (395,0.32,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (396,0.32,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (397,0.3,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (398,0.3,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (399,0.3,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (400,0.3,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (401,0.3,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (402,0.3,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (403,0.3,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (404,0.32,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (405,0.33,554);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (406,0.29,555);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (407,0.29,555);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (408,0.31,555);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (409,0.34,555);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (410,0.34,555);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (411,0.34,555);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (412,0.34,555);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (413,0.3,555);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (414,0.29,555);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (415,0.35,555);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (416,0.43,555);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (417,0.32,556);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (418,0.36,556);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (419,0.3,556);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (420,0.26,556);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (421,0.7,2812);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (422,0.7,2812);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (423,0.71,2812);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (424,0.99,2812);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (425,0.73,2812);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (426,0.51,2812);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (427,0.91,2813);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (428,0.84,2813);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (429,0.91,2813);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (430,0.76,2814);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (431,0.76,2814);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (432,0.75,2814);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (433,0.55,2815);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (434,0.76,2815);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (435,0.74,2815);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (436,0.7,2815);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (437,0.7,2815);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (438,0.7,2815);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (439,0.7,2815);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (440,0.9,2815);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (441,0.95,2815);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (442,0.89,2815);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (443,0.72,2815);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (444,0.96,2815);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (445,1.02,2815);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (446,0.78,2816);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (447,0.61,2816);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (448,0.71,2816);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (449,0.78,2816);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (450,0.87,2816);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (451,0.83,2816);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (452,0.71,2817);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (453,0.71,2817);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (454,0.71,2817);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (455,0.71,2817);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (456,0.63,2817);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (457,0.71,2817);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (458,0.71,2817);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (459,0.71,2817);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (460,0.71,2817);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (461,0.9,2817);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (462,0.71,2817);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (463,0.7,2818);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (464,0.7,2818);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (465,0.7,2818);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (466,1,2818);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (467,0.86,2818);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (468,0.8,2818);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (469,0.7,2818);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (470,0.7,2818);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (471,0.7,2818);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (472,0.7,2818);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (473,1,2818);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (474,0.72,2819);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (475,0.72,2819);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (476,0.7,2819);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (477,0.86,2819);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (478,0.71,2820);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (479,0.75,2821);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (480,0.73,2821);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (481,0.53,2821);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (482,0.73,2821);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (483,0.73,2821);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (484,0.73,2821);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (485,0.73,2821);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (486,0.73,2821);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (487,0.73,2821);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (488,0.7,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (489,0.72,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (490,0.72,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (491,0.72,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (492,0.7,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (493,0.6,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (494,0.74,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (495,0.73,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (496,0.71,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (497,0.71,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (498,0.7,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (499,0.7,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (500,0.9,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (501,0.71,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (502,0.7,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (503,0.7,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (504,0.7,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (505,0.7,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (506,0.7,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (507,0.7,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (508,0.7,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (509,0.7,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (510,0.7,2822);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (511,0.79,2823);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (512,0.9,2823);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (513,0.71,2823);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (514,0.61,2823);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (515,0.9,2823);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (516,0.71,2823);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (517,0.71,2824);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (518,0.77,2824);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (519,0.74,2824);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (520,0.82,2824);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (521,0.82,2824);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (522,0.71,2825);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (523,0.83,2825);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (524,0.73,2825);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (525,0.83,2825);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (526,1.17,2825);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (527,0.91,2825);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (528,0.73,2826);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (529,0.7,2826);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (530,0.9,2826);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (531,0.7,2826);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (532,0.7,2826);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (533,0.7,2826);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (534,0.9,2826);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (535,0.78,2826);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (536,0.96,2826);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (537,0.7,2827);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (538,0.72,2827);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (539,0.79,2827);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (540,0.7,2827);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (541,0.7,2827);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (542,0.7,2828);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (543,1.01,2828);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (544,0.72,2829);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (545,0.8,2829);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (546,0.59,2829);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (547,0.72,2829);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (548,0.75,2829);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (549,0.8,2829);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (550,0.71,2830);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (551,0.77,2830);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (552,0.97,2830);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (553,0.53,2830);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (554,0.53,2830);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (555,0.8,2830);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (556,0.9,2830);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (557,0.76,2831);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (558,0.72,2831);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (559,0.75,2831);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (560,0.72,2831);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (561,0.79,2831);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (562,0.72,2832);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (563,0.91,2832);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (564,0.71,2832);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (565,0.81,2832);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (566,0.82,2832);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (567,0.71,2832);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (568,0.9,2832);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (569,0.8,2833);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (570,0.56,2833);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (571,0.7,2833);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (572,0.7,2833);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (573,0.61,2833);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (574,0.85,2833);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (575,0.7,2833);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (576,0.8,2834);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (577,0.8,2834);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (578,0.51,2834);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (579,0.53,2834);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (580,0.78,2834);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (581,0.9,2834);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (582,0.9,2834);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (583,0.77,2834);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (584,0.73,2835);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (585,0.63,2835);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (586,0.7,2835);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (587,0.72,2835);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (588,0.72,2835);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (589,0.75,2835);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (590,0.82,2836);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (591,0.71,2836);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (592,0.7,2837);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (593,0.7,2837);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (594,0.71,2838);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (595,0.76,2838);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (596,0.82,2838);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (597,0.72,2838);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (598,0.7,2838);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (599,0.7,2838);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (600,0.7,2838);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (601,0.7,2838);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (602,0.7,2838);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (603,0.7,2838);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (604,0.7,2838);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (605,0.7,2838);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (606,0.74,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (607,0.71,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (608,0.7,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (609,0.71,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (610,0.71,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (611,0.71,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (612,0.71,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (613,0.7,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (614,0.73,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (615,0.7,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (616,0.7,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (617,0.71,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (618,0.71,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (619,0.79,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (620,0.71,2839);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (621,0.77,2840);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (622,0.75,2840);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (623,0.7,2840);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (624,0.71,2840);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (625,0.92,2840);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (626,0.83,2840);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (627,0.7,2840);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (628,0.73,2841);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (629,0.71,2841);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (630,0.73,2841);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (631,0.82,2841);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (632,0.82,2841);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (633,0.82,2841);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (634,0.52,2841);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (635,1,2841);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (636,0.95,2841);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (637,0.73,2841);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (638,0.73,2841);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (639,0.73,2841);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (640,0.8,2842);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (641,0.7,2842);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (642,0.7,2843);
Insert into AOP_D3_DATA_1 (ID,CARAT,PRICE) values (643,0.7,2843);
commit;
