
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_CHAR_NAV_MENU_VIEW (LABEL_VALUE, 
TARGET_VALUE) AS 
  select  'Nieuw personage' as label_value,
        'f?p=&APP_ID.:EVENTS:&SESSION.::&DEBUG.::::' as target_value
from    dual;

