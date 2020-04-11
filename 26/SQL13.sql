SELECT berikkaliyev_course.course_id, berikkaliyev_course.name
FROM berikkaliyev_course
INNER JOIN berikkaliyev_graduate ON berikkaliyev_graduate.course_id=berikkaliyev_course.course_id
INNER JOIN berik_graduate_time ON berik_graduate_time.graduate_id=berikkaliyev_graduate.graduate_id
INNER JOIN berik_lesson_num ON berik_graduate_time.lesson_num_id=berik_lesson_num.lesson_num_id AND berik_lesson_num.time_lesson BETWEEN '12:30:00' AND '18:30:00'