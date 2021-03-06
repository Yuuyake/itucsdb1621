DROP TABLE IF EXISTS images;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS notifications;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS upload;
DROP TABLE IF EXISTS directmessages;


CREATE TABLE IF NOT EXISTS images(
    image_id serial primary key,
    user_id int ,
    path text ,
    time date ,
    text text
);

CREATE TABLE IF NOT EXISTS users(
    ID serial primary key,
    username VARCHAR(50) NOT NULL,
    password text NOT NULL,
    photo_path text,
    email text NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS notifications(
    notification_id serial primary key,
    user_id int,
    notifier_id int,
    notifier_name text,
    icon text,
    details text,
    read_status boolean,
    follow_status boolean
);
CREATE TABLE IF NOT EXISTS comments (
    comment_id serial primary key,
    user_id int,
    image_id int,
    time date,
    comment text
);

CREATE TABLE IF NOT EXISTS directmessages (
    dmessage_id serial primary key,
    sender_id int,
    receiver_id int,
    time date,
    dmessage text
);

CREATE TABLE IF NOT EXISTS upload(
    ID INTEGER,
    time date,
    description text
);

insert into images (user_id, path, time, text) values (1, 'sample.jpg', now(), 'hello world #1');

insert into users (UserName, Password, photo_path, email) values ('sailormoon', 'abc999', '/photo.jpg', 'sailor@gmail.com' );

insert into notifications(user_id, notifier_id, notifier_name, icon, details, read_status, follow_status) values (1, 2, 'some_company' ,'notific_sample.jpg', 'Thanks for all followers!' , FALSE, TRUE);

insert into comments(user_id,image_id,time,comment) values (1,1,now(),'Hey! This photo is awesome');

insert into directmessages(sender_id,receiver_id,time,dmessage) values (1,1,now(),'So long mans dirty hand does not interfere, there is no true uncleanliness or ugliness in anything.');
insert into directmessages(sender_id,receiver_id,time,dmessage) values (1,1,now(),'Selam!');


insert into upload(time, description) values (now(), 'You should know that all your strength lies in sincerity and truth');
