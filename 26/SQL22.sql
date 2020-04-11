SELECT berikkaliyev_special.* FROM berikkaliyev_special
INNER JOIN berikkaliyev_course ON berikkaliyev_course.special_id = berikkaliyev_special.special_id
INNER JOIN berikkaliyev_graduate ON berikkaliyev_graduate.course_id = berikkaliyev_course.course_id
INNER JOIN berik_graduate_time ON berik_graduate_time.graduate_id = berikkaliyev_graduate.graduate_id
LEFT JOIN berikkaliyev_day ON (berik_graduate_time.day_id = berikkaliyev_day.day_id)
LEFT JOIN berik_lesson_num ON (berik_graduate_time.lesson_num_id = berik_lesson_num.lesson_num_id)
WHERE berik_lesson_num.time_lesson BETWEEN '14:00:00' and '18:00:00' AND (berikkaliyev_day.name = 'Четверг' OR berikkaliyev_day.name = 'Суббота') AND berikkaliyev_day.day_id IS NULL AND berik_lesson_num.lesson_num_id IS NULL