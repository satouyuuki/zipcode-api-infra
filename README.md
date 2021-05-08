config.tfはs3とdynamoができるまでコメントアウト

ssh接続の時は秘密鍵で接続する

ALTER USER 'root'@'localhost' identified BY '#`B:bX`5FOr-`9UG';

CREATE TABLE `test1` (
  `local_code` int(11) NOT NULL,
  `old_zipcode` int(5) NOT NULL,
  `zipcode` int(7) NOT NULL,
  `pref_kana` varchar(50) not null,
  `city_kana` varchar(50) not null,
  `town_kana` varchar(50) not null,
  `prefectures` varchar(50) not null,
  `city` varchar(50) not null,
  `town` varchar(50) not null,
  `multiple_zipcode` tinyint(1) not null,
  `koaza` tinyint(1) not null,
  `tyome` tinyint(1) not null,
  `multiple_town` tinyint(1) not null,
  `update_flag` tinyint(1) not null,
  `update_why` tinyint(1) not null
);

scp -i ~/.ssh/cli-user-ec2 ~/Desktop/utf8_KEN_ALL.csv ec2-user@18.181.85.146:~/

scp -i ~/.ssh/cli-user-ec2 ~/Downloads/13TOKYO.csv ec2-user@18.181.85.146:~/

LOAD DATA LOCAL INFILE "ファイル名"
INTO TABLE テーブル名 
FIELDS TERMINATED BY '区切り文字'
OPTIONALLY ENCLOSED BY '囲み文字';

load data local infile '/home/ec2-user/utf8_KEN_ALL.csv' into table test1 fields terminated by ',' optionally enclosed by '"';

load data local infile '/home/ec2-user/13TOKYO.csv' into table test1 fields terminated by ',' optionally enclosed by '"';

load data local infile "/Users/satouyuuki/Downloads/KEN_ALL.CSV" into table test1 fields terminated by ',' optionally enclosed by '"';

load data local infile "/Users/satouyuuki/Desktop/utf8_13TOKYO.csv" into table test1 fields terminated by ',' optionally enclosed by '"';

set global local_infile=ON;
iconv -f unknown-8bit -t UTF-8 KEN_ALL.CSV > utf-8.csv

alter table test1 add id int not null primary key auto_increment;
