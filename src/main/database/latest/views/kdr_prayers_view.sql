create or replace force editionable view KDR_PRAYERS_VIEW as
select  pr.prayer_id,
        pr.prayer_name,
        pr.prayer_distance,
        di.distance_name,
        di.distance_name || get_tooltip_icon('kdr_distances','distance_desc',' distance_id', pr.prayer_distance) as distance_tooltip,
        pr.prayer_duration,
        du.duration_name,
        du.duration_name || get_tooltip_icon('kdr_durations','duration_desc',' duration_id', pr.prayer_duration) as duration_tooltip,
        pr.prayer_target,
        pr.prayer_level,
        pr.prayer_desc,
        pr.prayer_divinity_cost,
        pr.deity_code,
        dt.deity_name,
        dt.deity_name || ' <span class="fa fa-question-circle" aria-hidden="true" title="' || dt.deity_desc || '">' || '' || '</span>' as deity_tooltip,
        pr.prayer_usage,
        pr.public_view as prayer_public_view,
        dt.public_view as deity_public_view
  from  kdr_prayers      pr,
        kdr_distances    di,
        kdr_durations    du,
        kdr_deities      dt
 where  pr.deity_code        = dt.deity_code
 and    pr.prayer_distance   = di.distance_id
 and    pr.prayer_duration   = du.duration_id;