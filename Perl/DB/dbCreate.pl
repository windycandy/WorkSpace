#!/usr/bin/perl -w
use strict;
use Encode;
use Encode::CN; #��д�ɲ�д
use DBI;

my $db_file="data.db";
#��������
my $dbh = DBI->connect("dbi:SQLite:dbname=$db_file","","");

#����
$dbh->do("CREATE TABLE users(
username varchar(255),
password varchar(100),
born date,
test1 date,
test2 varchar(500),
test3 varchar(500),
urlt varchar(500))"); 

#������ 

$dbh->do("CREATE INDEX idx_name_users ON users(username)");
#��������
my $sth = $dbh->prepare(q{INSERT INTO users VALUES (?,?,?,?,?,?,?)});

foreach my $i (1,2,3,4){
$sth->bind_param(1,decode("gb2312","ѧ��$i"));
$sth->bind_param(2,"passwd");
$sth->bind_param(3,20090102);
$sth->bind_param(4,20090102);
$sth->bind_param(5,"none");
$sth->bind_param(6,"none");
$sth->bind_param(7,"http://www.supersun.biz");
$sth->execute or die $dbh->errstr;
}

$dbh->disconnect; 



















