Thank you for downloading APEX Office Print.


Content of the zip file:
- /apex: per Oracle APEX version, the APEX plugins of APEX Office Print (AOP) and a sample APEX application which demonstrates the use of AOP
- /doc: documentation (run index.html)
- /db: sql files to install the back-end database objects (run install.sql)
- /server: the server side component (* for the cloud packages you don’t have this directory)


Pre-requisites:
- Oracle Database 11g or above
- Oracle Application Express (APEX) installed


Quick start guide (AOP Sample App):
- import the AOP Sample APEX application for your APEX version which you find in the /app directory
- make sure you run the supporting objects, and all back-end database objects will be created for you


Quick start: using AOP in your own application:
- Go to SQL Workshop > SQL Scripts and upload (and run) the file aop_db_pkg.sql form the directory /db
  This will create the packages used by the APEX Plugin
- Go to App Builder > Your application > Shared Components > Plug-ins > Import
  Select the file process_type_plugin_be_apexrnd_aop.sql from the directory /apex/<version> (for the Process type plugin)
  Select the file dynamic_action_plugin_be_apexrnd_aop_da.sql from the directory /apex/<version> (for the Dynamic Action type plugin)
- In your Page, create a process and select APEX Office Print (AOP) [Plug-in] (for the process type plugin)
  or create a dynamic action, On click of a button for example and select as the True Action: APEX Office Print (AOP) [Plug-in]


Upgrading the plugin:
- Go to SQL Workshop > SQL Scripts and upload (and run) the file aop_db_pkg.sql form the directory /db
  This will create the packages used by the APEX Plugin
- Go to App Builder > Your application > Shared Components > Plug-ins > Import
  Select the file process_type_plugin_be_apexrnd_aop.sql from the directory /apex/<version> (for the Process type plugin)
  Select the file dynamic_action_plugin_be_apexrnd_aop_da.sql from the directory /apex/<version> (for the Dynamic Action type plugin)


Change API Key:
- Note that by default the AOP Sample App will connect to our AOP Cloud
- To use our AOP Cloud, you need to enter your API key.
- You can obtain your own API key by signing up or logging in at https://www.apexofficeprint.com
- Once you have your own API key, go to Shared Components > Component Settings > APEX Office Print and enter your API key


Install/Upgrade the AOP Server (only with on-premises version)
- Copy the server folder to your server
- Stop the previous version of AOP (in case of upgrade)
  Note: you can run the old and new AOP server next to each other, but on different ports
- Start the AOP executable


Support
- If you need any support for APEX Office Print, please contact support@apexofficeprint.com


APEX Office Print is a commercial product of APEX R&D - Copyright 2015-2018 -
