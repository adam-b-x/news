SELECT berikkaliyev_day.*
FROM berikkaliyev_day
LEFT JOIN berik_graduate_time ON (berikkaliyev_day.day_id = berik_graduate_time.day_id)
WHERE berik_graduate_time.graduate_time_id IS NULL