SELECT berikkaliyev_otdel.name
From berikkaliyev_otdel
Inner Join berikkaliyev_teacher ON berikkaliyev_teacher.otdel_id = berikkaliyev_otdel.otdel_id
Inner Join berikkaliyev_graduate ON berikkaliyev_graduate.user_id = berikkaliyev_teacher.user_id
Inner Join berik_graduate_time ON berik_graduate_time.graduate_id = berikkaliyev_graduate.graduate_id
Inner Join berikkaliyev_day ON berik_graduate_time.day_id = berikkaliyev_day.day_id AND berikkaliyev_day.name = 'Вторник'
Inner Join berik_lesson_num ON berik_graduate_time.lesson_num_id = berik_lesson_num.lesson_num_id AND berik_lesson_num.time_lesson BETWEEN '09:00:00' AND '12:00:00'