SELECT
berikkaliyev_day.name, COUNT(*)
FROM berikkaliyev_course
INNER JOIN berikkaliyev_graduate ON berikkaliyev_graduate.course_id = berikkaliyev_course.course_id
INNER JOIN berik_graduate_time ON berik_graduate_time.graduate_id = berikkaliyev_graduate.graduate_id
INNER JOIN berikkaliyev_day ON berik_graduate_time.day_id = berikkaliyev_day.day_id
GROUP BY berikkaliyev_day.day_id