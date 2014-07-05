Preparation
===========

Preparation of "Enjoy Development!"

##enjoydev.dbの作り方
```bundle install```をしてから以下の作業をしてください.

カレントディレクトリに以下のファイルを作ります.

```SQL:import.sql
create table lists (
	id integer primary key,
	title,
	level,
	desc
);
```

次にターミナル上で```sqlite3 enjoydev.db```と打ち込んでください.

```
SQLite version 3.7.13 2012-07-17 17:46:21
Enter ".help" for instructions
Enter SQL statements terminated with a ";"
sqlite>
```

こんなかんじに出たら```sqlite>```のとなりに```.read import.sql```と打ち込んだら完成です.

確認のために```.schema```と打ち込んでください.以下の用に表示されれば大丈夫です.

```
CREATE TABLE "lists" (
	id integer primary key, 
	title, 
	level, 
	desc
);
```

確認ができたら```.exit```と入力してsqlite3を終了させて下さい.