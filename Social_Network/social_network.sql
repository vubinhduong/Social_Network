create database Social_Network;
use Social_Network;


create table Users(
    userID int(11) primary key auto_increment,
    user_name varchar(50) not null unique,
    pass_word varchar(100) not null,
    nameShowed varchar(50) not null,
    following int(11) default 0,
    follower int(11) default 0,
    avatar varchar(50) not null,
    email varchar(50),
    phone varchar(10),
    address nvarchar(100),
    gender int(1) default 0,
    isActivate int(1) not null default 0
)Engine=InnoDB;

drop table if exists Posts;
create table Posts(
    postID int(11) primary key auto_increment,
    userID_posted int not null,
    content text,
    image text,
    timed datetime,
    liked int(11) default 0,
    key post_fk(postID),
    constraint posts_fk foreign key(userID_posted) references Users(userID) on delete cascade on update cascade
)Engine=InnoDB;

drop table if exists Comments;
create table Comments(
    commentID int(11) primary key auto_increment,
    postID int(11) not null,
    userID int(11) not null,
    detail text not null,
    timed datetime,
    key comment_fk_user(userID),
    key comment_fk_post(postID),
    constraint comment_fk_post foreign key(postID) references Posts(postID) on delete cascade on update cascade,
    constraint comment_fk_user foreign key(userID) references Users(userID) on delete cascade on update cascade
)Engine=InnoDB;

drop table if exists Messenger;
create table Messenger(
  messageID int(11) primary key auto_increment,
  userID_send int(11) not null,
  userID_recv int(11) not null,
  message text not null,
  time_send datetime,
  key message_ibfk_1(userID_send),
  key message_ibfk_2(userID_recv),
  CONSTRAINT message_ibfk_1 FOREIGN KEY (userID_send) REFERENCES Users (userID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT message_ibfk_2 FOREIGN KEY (userID_recv) REFERENCES Users (userID) ON DELETE CASCADE ON UPDATE CASCADE
)Engine=InnoDB;

drop table if exists following;
create table following(
    userID_1 int(11) not null,
    userID_2 int(11) not null,
    primary key(userID_1,userID_2),
    key fl_fk_1(userID_1),
    key fl_2(userID_2),
    constraint fl_fk_1 foreign key(userID_1) references Users(userID) on delete cascade on update cascade,
    constraint fl_fk_2 foreign key(userID_2) references Users(userID) on delete cascade on update cascade
)Engine=InnoDB;

drop table if exists post_like;
create table post_like(
    postID int(11) not null,
    userID int(11) not null,
    primary key(postID,userID),
    key pl_fk_1(postID),
    key pl_fk_2(userID),
    constraint frship_fk_1 foreign key(postID) references Posts(postID) on delete cascade on update cascade,
    constraint frship_fk_2 foreign key(userID) references Users(userID) on delete cascade on update cascade
)Engine=InnoDB;

drop table if exists trending;
create table trending(
    content varchar(20) not null,
    num int(11) default 0,
    primary key(content)
)Engine=InnoDB;

drop table if exists trending_post;
create table trending_post(
    content varchar(20) not null,
    postID int(11),
    dated date,
    primary key(content, postID),
    constraint tp_fk_1 foreign key(postID) references Posts(postID) on delete cascade on update cascade
)Engine=InnoDB;

drop table if exists notification;
create table notification(
	notifiID int(11) not null auto_increment,
    postID int(11) not null,
    userID int(11) not null,
    act int(1),
    timed datetime,
    primary key(notifiID),
    constraint nf_fk_1 foreign key(postID) references Posts(postID) on delete cascade on update cascade,
    constraint nf_fk_2 foreign key(userID) references Users(userID) on delete cascade on update cascade
)Engine=InnoDB;

drop trigger if exists after_like;
create trigger after_like
after insert on post_like
for each row
    update Posts
    set liked = liked + 1
    where Posts.postID = NEW.postID;

drop trigger if exists after_dislike;
create trigger after_dislike
after delete on post_like
for each row
    update Posts
    set liked = liked - 1
    where Posts.postID = OLD.postID;

drop trigger if exists after_follow;
create trigger after_follow
after insert on following
for each row
    update Users
    set Users.following = Users.following + 1
    where Users.userID = NEW.userID_1;

drop trigger if exists after_follow_2;
create trigger after_follow_2
after insert on following
for each row
    update Users
    set Users.follower = Users.follower + 1
    where Users.userID = NEW.userID_2;


INSERT INTO `social_network`.`users` (`user_name`, `pass_word`, `nameShowed`, `avatar`, `email`) VALUES ('duong', 'duong123', 'Vũ Bình Dương', '/resources/images/avatar.jpg', 'vubinhduong261100@gmail.com');
INSERT INTO `social_network`.`users` (`user_name`, `pass_word`, `nameShowed`, `avatar`, `phone`) VALUES ('giang', 'giang123', 'Nguyễn Đức Giang', '/resources/images/avatar2.jpg', '097645238');
INSERT INTO `social_network`.`users` (`user_name`, `pass_word`, `nameShowed`, `avatar`, `address`) VALUES ('duong2', 'duong123', 'Tùng Dương', '/resources/images/avatar3.jpg', 'Hà Nội');
INSERT INTO `social_network`.`users` (`user_name`, `pass_word`, `nameShowed`, `avatar`) VALUES ('duong3', 'duong123', 'Trịnh Hồng Dương', '/resources/images/avatar4.jpg');
INSERT INTO `social_network`.`users` (`user_name`, `pass_word`, `nameShowed`, `avatar`, `address`) VALUES ('user1', 'duong123', 'Nguyễn Tuấn Anh', '/resources/images/avatar5.jpg', 'Thái Bình');
INSERT INTO `social_network`.`users` (`user_name`, `pass_word`, `nameShowed`, `avatar`, `address`) VALUES ('user2', 'duong123', 'Bùi Thu Trang', '/resources/images/avatar6.jpg', 'Bắc Ninh');
INSERT INTO `social_network`.`users` (`user_name`, `pass_word`, `nameShowed`, `avatar`, `address`) VALUES ('user3', 'duong123', 'Thái Văn Cảnh', '/resources/images/avatar7.jpg', 'Đà Nẵng');
INSERT INTO `social_network`.`users` (`user_name`, `pass_word`, `nameShowed`, `avatar`, `address`) VALUES ('user4', 'duong123', 'Lê Thái Dương', '/resources/images/avatar8.jpg', 'Cao Bằng');
INSERT INTO `social_network`.`users` (`user_name`, `pass_word`, `nameShowed`, `avatar`, `address`) VALUES ('user5', 'duong123', 'Hoàng Hoài Lâm', '/resources/images/avatar9.jpg', 'Nghệ An');
INSERT INTO `social_network`.`users` (`user_name`, `pass_word`, `nameShowed`, `avatar`, `address`, `gender`) VALUES ('user6', 'duong123', 'Trần Thị Ngọc', '/resources/images/avatar10.jpg', 'Sơn La', '1');


INSERT INTO `social_network`.`following` (`userID_1`, `userID_2`) VALUES ('1', '2');
INSERT INTO `social_network`.`following` (`userID_1`, `userID_2`) VALUES ('1', '3');
INSERT INTO `social_network`.`following` (`userID_1`, `userID_2`) VALUES ('2', '3');
INSERT INTO `social_network`.`following` (`userID_1`, `userID_2`) VALUES ('2', '4');
INSERT INTO `social_network`.`following` (`userID_1`, `userID_2`) VALUES ('3', '1');
INSERT INTO `social_network`.`following` (`userID_1`, `userID_2`) VALUES ('4', '1');


INSERT INTO `social_network`.`posts` (`userID_posted`, `content`, `image`, `timed`) VALUES ('1', 'Something interesting...', '/resources/images/post-image-1.jpg', '2021-05-23 20:21:17');
INSERT INTO `social_network`.`posts` (`userID_posted`, `content`, `image`, `timed`) VALUES ('1', '#Sắn bách khoa:3', '/resources/images/post-image-2.jpg', '2021-05-25 21:57:43');
INSERT INTO `social_network`.`posts` (`userID_posted`, `content`, `image`, `timed`) VALUES ('3', '#XSTK Ai giúp em đề này với ạ', '/resources/images/post-image-3.jpg', '2021-04-22 21:57:43');
INSERT INTO `social_network`.`posts` (`userID_posted`, `content`, `image`, `timed`) VALUES ('5', '#VLDC Câu này đáp án nào vậy ạ', '/resources/images/post-image-4.jpg', '2021-04-28 21:57:43');
INSERT INTO `social_network`.`posts` (`userID_posted`, `content`, `image`, `timed`) VALUES ('6', '#HUST', '/resources/images/post-image-5.jpg', '2021-05-30 06:57:43');


INSERT INTO `social_network`.`post_like` (`postID`, `userID`) VALUES ('1', '2');
INSERT INTO `social_network`.`post_like` (`postID`, `userID`) VALUES ('1', '3');
INSERT INTO `social_network`.`post_like` (`postID`, `userID`) VALUES ('2', '1');
INSERT INTO `social_network`.`post_like` (`postID`, `userID`) VALUES ('2', '2');
INSERT INTO `social_network`.`post_like` (`postID`, `userID`) VALUES ('2', '3');
INSERT INTO `social_network`.`post_like` (`postID`, `userID`) VALUES ('2', '4');


INSERT INTO `social_network`.`comments` (`postID`, `userID`, `detail`, `timed`) VALUES ('1', '4', 'Đã xem và không like=))', '2021-05-23 20:24:53');
INSERT INTO `social_network`.`comments` (`postID`, `userID`, `detail`, `timed`) VALUES ('2', '2', 'Xinhhhhhhhh', '2021-05-25 21:59:43');
INSERT INTO `social_network`.`comments` (`postID`, `userID`, `detail`, `timed`) VALUES ('2', '3', 'Mặt hàng này còn không shop', '2021-05-25 22:01:43');
INSERT INTO `social_network`.`comments` (`postID`, `userID`, `detail`, `timed`) VALUES ('4', '7', 'A nhé', '2021-05-20 22:01:43');


INSERT INTO `social_network`.`notification` (`notifiID`, `postID`, `userID`, `act`, `timed`) VALUES ('1', '1', '2', '0', '2021-05-23 20:22:17');
INSERT INTO `social_network`.`notification` (`postID`, `userID`, `act`, `timed`) VALUES ('1', '3', '0', '2021-05-24 22:22:17');
INSERT INTO `social_network`.`notification` (`postID`, `userID`, `act`, `timed`) VALUES ('1', '4', '1', '2021-05-23 22:22:17');


INSERT INTO `social_network`.`trending` (`content`, `num`) VALUES ('San', '1');
INSERT INTO `social_network`.`trending` (`content`, `num`) VALUES ('XSTK', '1');
INSERT INTO `social_network`.`trending` (`content`, `num`) VALUES ('VLDC', '1');
INSERT INTO `social_network`.`trending` (`content`, `num`) VALUES ('HUST', '1');


INSERT INTO `social_network`.`trending_post` (`content`, `postID`, `dated`) VALUES ('San', '2', '2021-04-25');
INSERT INTO `social_network`.`trending_post` (`content`, `postID`, `dated`) VALUES ('XSTK', '3', '2021-04-22');
INSERT INTO `social_network`.`trending_post` (`content`, `postID`, `dated`) VALUES ('VLDC', '4', '2021-04-28');
INSERT INTO `social_network`.`trending_post` (`content`, `postID`, `dated`) VALUES ('HUST', '5', '2021-04-27');




