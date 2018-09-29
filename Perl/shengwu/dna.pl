  #!perl 
use Win32::GUI; 
use Win32::GUI qw(CW_USEDEFAULT);
use Win32::GUI::DropFiles; 
use Encode;
use Encode::CN; #��д�ɲ�д
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
              -title    => "������Ϣ��������ϵͳ", 
              -pos      => [400, 300], 
              -size     => [500, 200], 
              -name     => "Window", 
              ); 
#�˻�����
$W->AddTextfield(
    -name => 'zhanghuinput',
    #-text => 25,
    -prompt => [ "�˻�:", 40],
    -pos => [$bein_x,$bein_y],
    -size => [100,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
);
$W->zhanghuinput->SetLimitText($Eidttextlength);

#��������
$W->AddTextfield(
    -name => 'passwordinput',
    #-text => 25,
    -prompt => [ "����:", 40],
    -pos => [$bein_x,$bein_y+30],
    -size => [100,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
);
$W->zhanghuinput->SetLimitText($Eidttextlength);

#ע���˻�
$W->AddButton(
    -name => 'zhuce',
    -text => "ע��",
    -pos => [$bein_x,$bein_y+60],
    -size => [40,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
    -onClick => \&zhuceonClick,
);



#��½
$W->AddButton(
    -name => 'denglu',
    -text => "��½",
    -pos => [$bein_x+50,$bein_y+60],
    -size => [40,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
    -onClick => \&dengluonClick, 
);

#�˳�
$W->AddButton(
    -name => 'exit',
    -text => "�˳�",
    -pos => [$bein_x+100,$bein_y+60],
    -size => [40,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
    -onClick => \&exit, 
);


#��������
$W->AddButton(
    -name => 'jiyinadd',
    -text => "�����������",
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
    -text => "��������ɾ��",
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
    -text => "�����������",
    -pos => [$bein_x+160,$bein_y+60],
    -size => [90,20],
    -align => 'left',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
    -onClick => \&jiyinoutputonClick,
);
#$W->jiyinoutput->Disable();


#ø��ø
$W->AddButton(
    -name => 'mqmadd',
    -text => "ø��ø���",
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
    -text => "ø��øɾ��",
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
    -text => "ø��ø��ʾ�޸�",
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
  
  
#������ʾ  
$W->Show(); 
Win32::GUI::Dialog(); 
sub Window_Terminate { -1 }
 
 
sub denglu{
   my $name = $W->zhanghuinput->GetLine(0);
   my $password = $W->passwordinput->GetLine(0);
   
   if($name.length == 0 || $password.length == 0){
	   my $message="�˺����벻��Ϊ��";
	   my $flags=0;
	   my $title="��ʾ";
	   my $a=Win32::MsgBox($message,$flags,$title);	
	   return;
   }

   &isuserexit;
   print "misuserexit =  ",  $misuserexit , "\n ";	
   if($misuserexit == 0){
   	   my $message="�˺Ų����ڻ����������";
	   my $flags=0;
	   my $title="��ʾ";
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
	   my $message="�˺����벻��Ϊ��";
	   my $flags=0;
	   my $title="��ʾ";
	   my $a=Win32::MsgBox($message,$flags,$title);	
	   return;
   }
	
   &isuserexit;
   print "misuserexit =  ",  $misuserexit , "\n ";	
   if($misuserexit == 1){
   	   my $message="�˺��Ѿ�����";
	   my $flags=0;
	   my $title="��ʾ";
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
 
 
#�˻�����������ļ�>>>>>>>>>>>>>>>>>>>Begin>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
my $db_file="users.db";

sub dbUserCreate{
	print  "dbUserCreate","\n";
	my $db_file="users.db";
	#��������
	my $dbh = DBI->connect("dbi:SQLite:dbname=$db_file","","");
	
	#����
	$dbh->do("CREATE TABLE users(username varchar(100),password varchar(100))"); 
	
	#������ 
	$dbh->do("CREATE INDEX idx_name_users ON users(username)");
	#��������
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
	print  "CreateDBUser �˻�","\n";
	my $dbh = DBI->connect("dbi:SQLite:dbname=users.db","","")or die "�޷��������ݿ�: " . DBI->errstr; ; 

	#��������
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
        print "�˻�����\n";
        $misuserexit = 1;
      }
    }  
}  
  
$dbh->disconnect;  
}
#�˻�����������ļ�>>>>>>>>>>>>>>>>>>>END>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



#�����������
sub jiyinaddonClick{
   
  if($loginname.length == 0){
  	&mustLogin;
  	return;
  } 
  my $file = Win32::GUI::GetOpenFileName(
                   -owner  => $Window,                   
                   -title  => "ѡ����������ļ���txt��ʽ��",          
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
	
	open(SEl_FILE,$selectfile)||die"���ļ�����$!\n";
	open(TAR_FILE, ">>".$targetfile);
	
	while(<SEl_FILE>){
		print TAR_FILE $_;
	}
	close(SEl_FILE);
	close(TAR_FILE);
	&handleok;
}



#��������ɾ��
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
  
   my $message="ȷ��ɾ����";
   my $flags=1;
   my $title="��ʾ";
   my $a=Win32::MsgBox($message,$flags,$title);	
   if($a ==1){
   	unlink $currentPath."/".$loginname."_jiyinxvlie";
   }

}

#�����������
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




#ø��ø���
sub mqmaddonClick{
   
  if($loginname.length == 0){
  	&mustLogin;
  	return;
  } 
  my $file = Win32::GUI::GetOpenFileName(
                   -owner  => $Window,                   
                   -title  => "ѡ����������ļ���txt��ʽ��",          
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
	
	open(SEl_FILE,$selectfile)||die"���ļ�����$!\n";
	open(TAR_FILE, ">>".$targetfile);
	
	while(<SEl_FILE>){
		print TAR_FILE $_;
	}
	close(SEl_FILE);
	close(TAR_FILE);
	&handleok;
}



#ø��øɾ��
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
  
   my $message="ȷ��ɾ����";
   my $flags=1;
   my $title="��ʾ";
   my $a=Win32::MsgBox($message,$flags,$title);	
   if($a ==1){
   	unlink $currentPath."/".$loginname."_mqm";
   }

}

#ø��ø���
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
	   my $message="�����ɹ���";
	   my $flags=0;
	   my $title="��ʾ";
	   my $a=Win32::MsgBox($message,$flags,$title);	
}


sub mustLogin{
	   my $message="���ȵ�½��";
	   my $flags=0;
	   my $title="��ʾ";
	   my $a=Win32::MsgBox($message,$flags,$title);	
}

sub nodata{
	   my $message="û�����ݣ�";
	   my $flags=0;
	   my $title="��ʾ";
	   my $a=Win32::MsgBox($message,$flags,$title);	
}
