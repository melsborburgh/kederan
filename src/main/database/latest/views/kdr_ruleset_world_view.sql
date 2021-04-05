set define off
create or replace view kdr_ruleset_world_view as
select null as lvl,
       'Kortoga' as label,
       'f?p=&APP_ALIAS.:KORTOGA:&SESSION.::&DEBUG.::::' as target,
       null as attribute1,
       null as attribute2,
       null as attribute3,
       null as attribute4,
       '<i class="flaticon-pirate big_icon"></i>' as attribute5,
       'custom-list-class' as attribute6,
       'custom-a-tag-attr' as attribute7
from dual
union all
select null as lvl,
       'Terra Nova Fertilis' as label,
       'f?p=&APP_ALIAS.:TERRANOVAFERTILIS:&SESSION.::&DEBUG.::::' as target,
       null as attribute1,
       null as attribute2,
       null as attribute3,
       null as attribute4,
       '<i class="flaticon-robin-hood big_icon"></i>' as attribute5,
       null as attribute6,
       null as attribute7
from dual
union all
select null as lvl,
       'Lost Plains' as label,
       'f?p=&APP_ALIAS.:LOSTPLAINS:&SESSION.::&DEBUG.::::' as target,
       null as attribute1,
       null as attribute2,
       null as attribute3,
       null as attribute4,
       '<i class="flaticon-werewolf-1 big_icon"></i>' as attribute5,
       null as attribute6,
       null as attribute7
from dual
union all
select null as lvl,
       'Neovare' as label,
       'f?p=&APP_ALIAS.:NEOVARE:&SESSION.::&DEBUG.::::' as target,
       null as attribute1,
       null as attribute2,
       null as attribute3,
       null as attribute4,
       '<i class="flaticon-dragon-2 big_icon"></i>' as attribute5,
       null as attribute6,
       null as attribute7
from dual
union all
select null as lvl,
       'Dark Peaks' as label,
       'f?p=&APP_ALIAS.:DARKPEAKS:&SESSION.::&DEBUG.::::' as target,
       null as attribute1,
       null as attribute2,
       null as attribute3,
       null as attribute4,
       '<i class="flaticon-castle big_icon"></i>' as attribute5,
       null as attribute6,
       null as attribute7
from dual
union all
select null as lvl,
       'Dark Dannings' as label,
       'f?p=&APP_ALIAS.:DARKDANNINGS:&SESSION.::&DEBUG.::::' as target,
       null as attribute1,
       null as attribute2,
       null as attribute3,
       null as attribute4,
       '<i class="flaticon-dead big_icon"></i>' as attribute5,
       null as attribute6,
       null as attribute7
from dual
union all
select null as lvl,
       'Kingdom of Aurum' as label,
       'f?p=&APP_ALIAS.:AURUM:&SESSION.::&DEBUG.::::' as target,
       null as attribute1,
       null as attribute2,
       null as attribute3,
       null as attribute4,
       '<i class="flaticon-king big_icon"></i>' as attribute5,
       null as attribute6,
       null as attribute7
from dual
union all
select null as lvl,
       'Mystic Forest' as label,
       'f?p=&APP_ALIAS.:MYSTICFOREST:&SESSION.::&DEBUG.::::' as target,
       null as attribute1,
       null as attribute2,
       null as attribute3,
       null as attribute4,
       '<i class="flaticon-faun big_icon"></i>' as attribute5,
       null as attribute6,
       null as attribute7
from dual
order by label
/