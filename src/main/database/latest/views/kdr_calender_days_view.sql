create or replace force view kdr_calender_days_view as
select      y.*, m.*, w.*, d.*
from        kdr_years   y,
            kdr_months  m,
            kdr_days    d,
            kdr_weeks   w;