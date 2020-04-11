SELECT berikkaliyev_user.user_id, berikkaliyev_user.last_name, berikkaliyev_user.first_name, berikkaliyev_otdel.name
FROM berikkaliyev_user
INNER JOIN berikkaliyev_teacher ON berikkaliyev_teacher.user_id = berikkaliyev_user.user_id
INNER JOIN berikkaliyev_otdel ON berikkaliyev_teacher.otdel_id = berikkaliyev_otdel.otdel_id
INNER JOIN berikkaliyev_graduate ON berikkaliyev_graduate.user_id = berikkaliyev_teacher.user_id
INNER JOIN berik_graduate_time ON berik_graduate_time.graduate_id = berikkaliyev_graduate.graduate_id
INNER JOIN berikkaliyev_day ON berik_graduate_time.day_id = berikkaliyev_day.day_id AND berikkaliyev_day.name = 'Суббота'