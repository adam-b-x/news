SELECT berikkaliyev_user.user_id, berikkaliyev_user.last_name, berikkaliyev_user.first_name
FROM berikkaliyev_user
INNER JOIN berikkaliyev_student ON berikkaliyev_student.user_id = berikkaliyev_user.user_id
INNER JOIN berikkaliyev_gruppa ON berikkaliyev_student.gruppa_id = berikkaliyev_gruppa.gruppa_id
INNER JOIN berikkaliyev_graduate ON berikkaliyev_graduate.gruppa_id = berikkaliyev_gruppa.gruppa_id
INNER JOIN berik_graduate_time ON berik_graduate_time.graduate_id = berikkaliyev_graduate.graduate_id
INNER JOIN berikkaliyev_day ON berik_graduate_time.day_id = berikkaliev_day.day_id AND berikkaliyev_day.name = 'Пятница'