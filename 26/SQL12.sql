SELECT berikkaliyev_user.user_id, berikkaliyev_user.last_name, berikkaliyev_user.first_name
FROM berikkaliyev_user
INNER JOIN berikkaliyev_student ON berikkaliyev_student.user_id = berikkaliyev_user.user_id
INNER JOIN berikkaliyev_gruppa ON berikkaliyev_student.gruppa_id = berikkaliyev_gruppa.gruppa_id
INNER JOIN berikkaliyev_graduate ON berikkaliyev_graduate.gruppa_id = berikkaliyev_gruppa.gruppa_id
INNER JOIN berik_graduate_time ON berik_graduate_time.graduate_id = berikkaliyev_graduate.graduate_id
INNER JOIN berik_lesson_num ON berik_graduate_time.lesson_num_id = berik_lesson_num.lesson_num_id AND berik_lesson_num.time_lesson BETWEEN '10:30:00' AND '18:30:00' AND berikkaliyev_user.gender_id='2'