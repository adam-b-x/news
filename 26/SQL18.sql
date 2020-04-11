SELECT berikkaliyev_user.user_id, berikkaliyev_user.last_name, berikkaliyev_user.first_name, berikkaliyev_gruppa.name, berikkaliyev_special.name
FROM berikkaliyev_user
INNER JOIN berikkaliyev_student ON berikkaliyev_student.user_id = berikkaliyev_user.user_id
INNER JOIN berikkaliyev_gruppa ON berikkaliyev_gruppa.gruppa_id = berikkaliyev_student.gruppa_id
INNER JOIN berikkaliyev_special ON berikkaliyev_special.special_id = berikkaliyev_gruppa.special_id
INNER JOIN berikkaliyev_graduate ON berikkaliyev_graduate.gruppa_id = berikkaliyev_gruppa.gruppa_id
INNER JOIN berikkaliyev_course ON berikkaliyev_graduate.course_id = berikkaliyev_course.course_id AND berikkaliyev_course.hours > '95'