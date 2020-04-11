SELECT berikkaliyev_course.name, berikkaliyev_course.hours, berikkaliyev_special.name, berikkaliyev_day.name
FROM berikkaliyev_otdel
INNER JOIN berikkaliyev_special ON berikkaliyev_special.otdel_id = berikkaliyev_otdel.otdel_id
INNER JOIN berikkaliyev_course ON berikkaliyev_course.special_id = berikkaliyev_special.special_id
INNER JOIN berikkaliyev_graduate ON berikkaliyev_graduate.course_id = berikkaliyev_course.course_id
INNER JOIN berik_graduate_time ON berik_graduate_time.graduate_id = berikkaliyev_graduate.graduate_id
INNER JOIN berikkaliyev_day ON berik_graduate_time.day_id = berikkaliyev_day.day_id
WHERE berikkaliyev_otdel.otdel_id = '2' AND (berikkaliyev_day.day_id = '3' OR berikkaliyev_day.day_id = '5')