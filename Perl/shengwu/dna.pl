  #!perl 
use Win32::GUI; 
use Win32::GUI qw(CW_USEDEFAULT);
use Win32::GUI::DropFiles; 
use Encode;
use Encode::CN; #可写可不写
use DBI;
use Cwd; 
  
  
my  $bein_x = 30;
my  $bein_y = 30;
my  $Eidttextlength = 10;
  
my  $loginname;
my  $loginpassword;
  
my  $currentPath = getcwd;
my  $misuserexit = 0;
  
$W = new Win32::GUI::Window ( 
              -title    => "生物信息与管理分析系统", 
              -pos      => [400, 300], 
              -size     => [500, 200], 
              -name     => "Window", 
              ); 
#账户输入
$W->AddTextfield(
    -name => 'zhanghuinput',
    #-text => 25,
    -prompt => [ "账户:", 40],
    -pos => [$bein_x,$bein_y],
    -size => [100,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
);
$W->zhanghuinput->SetLimitText($Eidttextlength);

#密码输入
$W->AddTextfield(
    -name => 'passwordinput',
    #-text => 25,
    -prompt => [ "密码:", 40],
    -pos => [$bein_x,$bein_y+30],
    -size => [100,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
);
$W->zhanghuinput->SetLimitText($Eidttextlength);

#注册账户
$W->AddButton(
    -name => 'zhuce',
    -text => "注册",
    -pos => [$bein_x,$bein_y+60],
    -size => [40,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
    -onClick => \&zhuceonClick,
);



#登陆
$W->AddButton(
    -name => 'denglu',
    -text => "登陆",
    -pos => [$bein_x+50,$bein_y+60],
    -size => [40,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
    -onClick => \&dengluonClick, 
);

#退出
$W->AddButton(
    -name => 'exit',
    -text => "退出",
    -pos => [$bein_x+100,$bein_y+60],
    -size => [40,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
    -onClick => \&exit, 
);


#基因序列
$W->AddButton(
    -name => 'jiyinadd',
    -text => "基因序列添加",
    -pos => [$bein_x+160,$bein_y],
    -size => [90,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
    -onClick => \&jiyinaddonClick,
);
#$W->jiyinadd->Disable();


$W->AddButton(
    -name => 'jiyindel',
    -text => "基因序列删除",
    -pos => [$bein_x+160,$bein_y+30],
    -size => [90,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
    -onClick => \&jiyindelonClick,
);
#$W->jiyindel->Disable();

$W->AddButton(
    -name => 'jiyinoutput',
    -text => "基因序列输出",
    -pos => [$bein_x+160,$bein_y+60],
    -size => [90,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
    -onClick => \&jiyinoutputonClick,
);
#$W->jiyinoutput->Disable();


#酶切酶
$W->AddButton(
    -name => 'mqmadd',
    -text => "酶切酶添加",
    -pos => [$bein_x+280,$bein_y],
    -size => [90,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
    -onClick => \&mqmaddonClick,
);



$W->AddButton(
    -name => 'mqmadel',
    -text => "酶切酶删除",
    -pos => [$bein_x+280,$bein_y+30],
    -size => [90,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
    -onClick => \&mqmdelonClick,
);


$W->AddButton(
    -name => 'mqmaoutput',
    -text => "酶切酶显示修改",
    -pos => [$bein_x+280,$bein_y+60],
    -size => [90,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
    -onClick => \&msmoutputonClick,
);


sub dengluonClick{
	print  "dengluonClick",$currentPath."/users.db","\n";
	
	if(-e $currentPath."/users.db"){
		print  "user.db ok","\n";
	}else
	{
		 print  "dbUserCreate","\n";
		 #`perl dbUserCreate.pl`;
		 &dbUserCreate;
	}
	
	&denglu;
}
  
sub zhuceonClick{
	print  "dengluonClick",$currentPath."/users.db","\n";
	
	if(-e $currentPath."/users.db"){
		print  "user.db ok","\n";
	}else
	{
		 print  "dbUserCreate","\n";
		#`perl dbUserCreate.pl`;
		 &dbUserCreate;
	}
	&chuche;
	&CreateUser;
}  
  
sub exit{
	exit;
}   
  
  
#界面显示  
$W->Show(); 
Win32::GUI::Dialog(); 
sub Window_Terminate { -1 }
 
 
sub denglu{
   my $name = $W->zhanghuinput->GetLine(0);
   my $password = $W->passwordinput->GetLine(0);
   
   if($name.length == 0 || $password.length == 0){
	   my $message="账号密码不能为空";
	   my $flags=0;
	   my $title="提示";
	   my $a=Win32::MsgBox($message,$flags,$title);	
	   return;
   }

   &isuserexit;
   print "misuserexit =  ",  $misuserexit , "\n ";	
   if($misuserexit == 0){
   	   my $message="账号不存在或者密码错误";
	   my $flags=0;
	   my $title="提示";
	   my $a=Win32::MsgBox($message,$flags,$title);	
	   return;
   }	
	
   $loginname = $name;
   $loginpassword = $password;
   print "denglu",  "$loginname" , "\n ";
   print "denglu",  "$loginpassword" , "\n ";
   $W->zhanghuinput->Disable();  
   $W->passwordinput->Disable(); 
   $W->zhuce->Disable(); 
   $W->denglu->Disable();
}
 
 
sub chuche{
   my $name = $W->zhanghuinput->GetLine(0);
   my $password = $W->passwordinput->GetLine(0);
   
   if($name.length == 0 || $password.length == 0){
	   my $message="账号密码不能为空";
	   my $flags=0;
	   my $title="提示";
	   my $a=Win32::MsgBox($message,$flags,$title);	
	   return;
   }
	
   &isuserexit;
   print "misuserexit =  ",  $misuserexit , "\n ";	
   if($misuserexit == 1){
   	   my $message="账号已经存在";
	   my $flags=0;
	   my $title="提示";
	   my $a=Win32::MsgBox($message,$flags,$title);	
	   return;
   }	
	
   $loginname = $name;
   $loginpassword = $password;
   print "denglu",  "$loginname" , "\n ";
   print "denglu",  "$loginpassword" , "\n ";
   $W->zhanghuinput->Disable();  
   $W->passwordinput->Disable(); 
   $W->zhuce->Disable(); 
   $W->denglu->Disable();
} 
 
 
#账户密码的数据文件>>>>>>>>>>>>>>>>>>>Begin>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
my $db_file="users.db";

sub dbUserCreate{
	print  "dbUserCreate","\n";
	my $db_file="users.db";
	#建立连接
	my $dbh = DBI->connect("dbi:SQLite:dbname=$db_file","","");
	
	#建表
	$dbh->do("CREATE TABLE users(username varchar(100),password varchar(100))"); 
	
	#建索引 
	$dbh->do("CREATE INDEX idx_name_users ON users(username)");
	#插入数据
	my $sth = $dbh->prepare(q{INSERT INTO users VALUES (?,?)});
	
	#foreach my $i (1,2,3,4){
	$sth->bind_param(1,decode("gb2312","zhanghu"));
	$sth->bind_param(2,"mima");
	$sth->execute or die $dbh->errstr;
	#}
	
	$dbh->disconnect; 
}

sub CreateUser
{	
	print  "CreateDBUser 账户","\n";
	my $dbh = DBI->connect("dbi:SQLite:dbname=users.db","","")or die "无法连接数据库: " . DBI->errstr; ; 

	#插入数据
	my $sth = $dbh->prepare(q{INSERT INTO users VALUES (?,?)});
	$sth->bind_param(1,decode("gb2312",$loginname ));
	$sth->bind_param(2,$loginpassword);
	$sth->execute or die $dbh->errstr;
	$dbh->disconnect; 
}


sub isuserexit{
	
	my $dbh = DBI->connect("dbi:SQLite:dbname=users.db","","");  
    my $ary_ref=$dbh->selectall_arrayref(q{SELECT * FROM users});
    foreach my $entry (@$ary_ref){  
    {  
        print "@$entry\n";	
        if((@$entry[0] == $W->zhanghuinput->GetLine(0))&&(@$entry[1] == $W->passwordinput->GetLine(0))){
        print "账户存在\n";
        $misuserexit = 1;
      }
    }  
}  
  
$dbh->disconnect;  
}
#账户密码的数据文件>>>>>>>>>>>>>>>>>>>END>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



#基因序列添加
sub jiyinaddonClick{
   
  if($loginname.length == 0){
  	&mustLogin;
  	return;
  } 
  my $file = Win32::GUI::GetOpenFileName(
                   -owner  => $Window,                   
                   -title  => "选择基因序列文件（txt格式）",          
                   -filter => [                           
                       'Lis file (*.txt)' => '*.txt',
                       'All files' => '*.*',
                    ],
                   -directory => ".",                     
                   );

  if ($file) {
     &addjiyintofile($file);
  }
  elsif (Win32::GUI::CommDlgExtendedError()) {
     Win32::GUI::MessageBox (0, "ERROR : ".Win32::GUI::CommDlgExtendedError(),
                            "GetOpenFileName Error");
  }
}

sub addjiyintofile{
	my $selectfile = @_[0];
	my $targetfile =$currentPath."/".$loginname."_jiyinxvlie";
	
	open(SEl_FILE,$selectfile)||die"打开文件错误$!\n";
	open(TAR_FILE, ">>".$targetfile);
	
	while(<SEl_FILE>){
		print TAR_FILE $_;
	}
	close(SEl_FILE);
	close(TAR_FILE);
	&handleok;
}



#基因序列删除
sub jiyindelonClick{
  if($loginname.length == 0){
  	&mustLogin;
  	return;
  } 
  
   if(-e $currentPath."/".$loginname."_jiyinxvlie"){
   }else{
   	  &nodata;
   	  return;
   }
  
   my $message="确定删除？";
   my $flags=1;
   my $title="提示";
   my $a=Win32::MsgBox($message,$flags,$title);	
   if($a ==1){
   	unlink $currentPath."/".$loginname."_jiyinxvlie";
   }

}

#基因序列输出
sub jiyinoutputonClick{
   
  if($loginname.length == 0){
  	&mustLogin;
  	return;
  } 
  
   if(-e $currentPath."/".$loginname."_jiyinxvlie"){
   }else{
   	  &nodata;
   	  return;
   }
    
  my $file = $currentPath."/".$loginname."_jiyinxvlie";
  `notepad $file`;
}




#酶切酶添加
sub mqmaddonClick{
   
  if($loginname.length == 0){
  	&mustLogin;
  	return;
  } 
  my $file = Win32::GUI::GetOpenFileName(
                   -owner  => $Window,                   
                   -title  => "选择基因序列文件（txt格式）",          
                   -filter => [                           
                       'Lis file (*.txt)' => '*.txt',
                       'All files' => '*.*',
                    ],
                   -directory => ".",                     
                   );

  if ($file) {
     &addmqmtofile($file);
  }
  elsif (Win32::GUI::CommDlgExtendedError()) {
     Win32::GUI::MessageBox (0, "ERROR : ".Win32::GUI::CommDlgExtendedError(),
                            "GetOpenFileName Error");
  }
}

sub addmqmtofile{
	my $selectfile = @_[0];
	my $targetfile =$currentPath."/".$loginname."_mqm";
	
	open(SEl_FILE,$selectfile)||die"打开文件错误$!\n";
	open(TAR_FILE, ">>".$targetfile);
	
	while(<SEl_FILE>){
		print TAR_FILE $_;
	}
	close(SEl_FILE);
	close(TAR_FILE);
	&handleok;
}



#酶切酶删除
sub mqmdelonClick{
  if($loginname.length == 0){
  	&mustLogin;
  	return;
  } 

   if(-e $currentPath."/".$loginname."_mqm"){
   }else{
   	  &nodata;
   	  return;
   }
  
   my $message="确定删除？";
   my $flags=1;
   my $title="提示";
   my $a=Win32::MsgBox($message,$flags,$title);	
   if($a ==1){
   	unlink $currentPath."/".$loginname."_mqm";
   }

}

#酶切酶输出
sub msmoutputonClick{
   
  if($loginname.length == 0){
  	&mustLogin;
  	return;
  } 
  
   if(-e $currentPath."/".$loginname."_mqm"){
   }else{
   	  &nodata;
   	  return;
   }
     
  my $file = $currentPath."/".$loginname."_mqm";
  `notepad $file`;
}



sub handleok{
	   my $message="操作成功！";
	   my $flags=0;
	   my $title="提示";
	   my $a=Win32::MsgBox($message,$flags,$title);	
}


sub mustLogin{
	   my $message="请先登陆！";
	   my $flags=0;
	   my $title="提示";
	   my $a=Win32::MsgBox($message,$flags,$title);	
}

sub nodata{
	   my $message="没有数据！";
	   my $flags=0;
	   my $title="提示";
	   my $a=Win32::MsgBox($message,$flags,$title);	
}
