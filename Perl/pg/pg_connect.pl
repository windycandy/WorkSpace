use strict;


use Data::Dumper;           ## --用于select返回数据集  
use DBI;


my $driver="Pg";
my $database_name = "test";
my $host = "localhost";    #--"IP adrress"
my $port= "5432";
my $database ="dbi:$driver:dbname=$database_name;host=$host;port=$port";   #-- 构造
my $db_user = "postgres";       # --用户名   
my $db_passwd = "123123";   #--密码


## 连接.
my $dbh;

sub db_init{
	if($dbh eq ''){
		$dbh=DBI->connect($database,$db_user,$db_passwd) or die "can''t connect!";   # -- 使用构造的database来连接数据库，AutoCommit默认为1
		if ($dbh)
		{          print "pgconnect ok! \n";
		           print "my $dbh->port(); \n";
		}else{
		
		          print "pgconnect false! \n";
		           print "my $dbh->port(); \n";
		}
	}
}



my $sth = $dbh->prepare("select * from app_list where id = 'D22211' " )or die "Syntax error:$!\n";   #-- 查询
$sth->execute();          # --执行

while(my @data = $sth->fetchrow_array()){
  
  foreach my $i (@data){
  	print $i, ' '
  }
  print "\n";
}





#my $sth = $dbh->prepare("insert into student values(3,'zhang','m') " )or die "Syntax error:$!\n"; #--插入数据
#$sth->execute();

#my $sth = $dbh->prepare(qq{delete from student where id = 3})or die "Syntax error:$!\n";  # --删除数据
#$sth->execute();

$dbh->disconnect();    #--关闭数据库