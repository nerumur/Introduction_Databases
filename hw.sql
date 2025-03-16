create database youglish;
use youglish;
create table user_data (
user_ID int primary key not null,
username varchar(255),
email varchar(255),
password_hash varchar(255),
login_time timestamp,
logout_time timestamp
);
select * from user_data;
alter table user_data drop column logout_time; #удаление столбца

insert into user_data (user_ID, username, email, password_hash, login_time) VALUES (
1, 'meow', 'user_1@example.com', 'hashed_password_1', NOW() #возвращает текущее время и дату
);

insert into user_data (user_ID, username, email, password_hash, login_time) VALUES
(2, 'catlover', 'catlover@example.com', 'hashed_password_2', '2023-10-01 12:30:00'),
(3, 'dogfan', 'dogfan@example.com', 'hashed_password_3', '2023-10-01 13:00:00'),
(4, 'birdwatcher', 'birdwatcher@example.com', 'hashed_password_4', '2023-10-01 13:30:00'),
(5, 'fishenthusiast', 'fishenthusiast@example.com', 'hashed_password_5', '2023-10-01 14:00:00'
);

create table words_phrases (
word_id int primary key not null,
word text,
lang_var text
);

insert into words_phrases values
(1, 'Hello', 'British English'),
(2, 'How are you?', 'American English'),
(3, 'Cheers', 'Australian English'),
(4, 'What’s the craic?', 'Irish English'),
(5, 'It’s raining cats and dogs', 'British English');

create table search_data (
user_ID_2 int,
last_query varchar(255),
time_last_query timestamp,
foreign key (user_ID_2) references user_data(user_ID)
);

insert into search_data values
(1, 'how to learn SQL', '2023-10-01 14:30:45'),
(2, 'best restaurants in New York', '2023-10-02 09:15:22'),
(3, 'Python vs JavaScript', '2023-10-03 18:45:10'),
(4, 'weather in London tomorrow', '2023-10-04 07:00:55'),
(5, 'latest Marvel movie reviews', '2023-10-05 22:12:37');

create table word_class (
word_id_2 int,
word_3 text,
pos text,
gender_pron text,
foreign key (word_id_2) references words_phrases(word_id)
);

insert into word_class values
(1, 'table', 'noun', 'male'),
(2, 'moving?', 'verb', 'female'),
(3, 'pretty', 'adjective', 'female'),
(4, 'white', 'adverb', 'male'),
(5, 'they', 'pronoun', 'female');

create table video_metadata (
video_id int primary key not null,  
transcripts varchar(255), 
start_time time,
end_time time,
foreign key (video_id) references words_phrases (word_id)
);

insert into video_metadata values
(1, 'Hello, how are you?', '00:00', '00:04'),
(2, 'What is your name?', '00:05', '00:09'),
(3, 'I am learning SQL.', '00:10', '00:14'),
(4, 'This is a great tutorial!', '00:15', '00:20'),
(5, 'Thank you for watching!', '00:21', '00:25');

delete from video_metadata where video_id >= 4;  #удаление строк
select * from video_metadata;

alter table video_metadata drop column end_time; #удаление столбца
select * from video_metadata;

alter table video_metadata add column end_time time; #добавление столбца
select * from video_metadata;

use youglish;
UPDATE video_metadata 
SET end_time= '00:04'; #меняем существующий столбец

select * from word_class where gender_pron = 'male';
select * from word_class where pos = 'adjective' and gender_pron = 'female';
select * from word_class where pos = 'adjective' or pos = 'noun';
select * from word_class where not gender_pron = 'male';


