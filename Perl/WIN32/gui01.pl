  #!perl 
 use Win32::GUI; 
 use Win32::GUI qw(CW_USEDEFAULT);
 use Win32::GUI::DropFiles; 
  
  my  $bein_x = 30;
  my  $bein_y = 30;
  
  $W = new Win32::GUI::Window ( 
              -title    => "Lis文件分析工具", 
              -pos      => [450, 300], 
              -size     => [400, 250], 
              -name     => "Window", 
              ); 

$W->AddTextfield(
    -name => 'inputsize',
    -text => 25,
    -prompt => [ "RAM/ROM限值(k):", 90],
    -pos => [$bein_x,$bein_y],
    -size => [40,20],
    -align => 'right',
    -limit => 3,
    -number => 1,
    -maxlength => 3,
);
$W->inputsize->SetLimitText(4);


#得到当前选的那个选项
#print $W->inputsize->GetLine(0),"\n"; 
 
$W->AddLabel(
    -name => 'chooselabel',
    -left => $bein_x,
    -top  => $W->inputsize->Top()+53,
    -text => "选择类型："
); 
 
$W->AddCombobox(
    -name => 'tpyechoose',
    -dropdownlist => 1,
    -left => $W->chooselabel->Left()+ $W->chooselabel->Width()+10,
    -top  => $W->inputsize->Top()+50,
    -width => 60,
    -height => 100,
);
$W->tpyechoose->Add('ROM', 'RAM');
$W->tpyechoose->Select(0);   
   
#得到当前选的那个选项
#print $W->tpyechoose->GetCurSel(),"\n";
   	
   	
# Add a load button.
$W->AddButton (
    -name    => "Load",
    -left => $W->chooselabel->Left(),
    -top  => $W->chooselabel->Top() + $W->chooselabel->Height +30,
    -text    => "选择lis文件",
    -default => 1,
    -tabstop => 1,
    -group   => 1,                        # You can use :
    -onClick => \&LoadLisFile,            #  a reference sub
    #-onClick  => 'LoadLisFile',           #  a string name sub
);   


$W->AddLabel(
    -name => 'Prompt',
    -left => $bein_x,
    -top  => $W->Load->Top()+53,
    -text => "lis文件目录下的同名.txt文件即结果"
); 

sub LoadLisFile {
  	
  # Use GetOpenFile for search a lis file
  my $file = Win32::GUI::GetOpenFileName(
                   -owner  => $Window,                    # Main window for modal dialog
                   -title  => "选择lis文件",          # Dialog title
                   -filter => [                           # Filter file
                       'Lis file (*.lis)' => '*.lis',
                       'All files' => '*.*',
                    ],
                   -directory => ".",                     # Use current directory
                   );

  # Have select a file ?
  if ($file) {
     # Load file to animation control   do what u want
     &listfile($file);
  }
  # Or an error messagebox with error.
  elsif (Win32::GUI::CommDlgExtendedError()) {
     Win32::GUI::MessageBox (0, "ERROR : ".Win32::GUI::CommDlgExtendedError(),
                            "GetOpenFileName Error");
  }
}


sub listfile{
	
    my %aaa;
    my @ram;
    my @rom;
	my $file = @_[0];
	
	my $value = $W->inputsize->GetLine(0)*1024;
	my $type  = $W->tpyechoose->GetCurSel();
	
	#print $file,"\n"; 
	#print $value,"\n"; 
	print "处理中...","\n";
	
	open(LIS_FILE,"<".$file)||die"打开$file文件错误$!\n";
	#print "dongyin","\n";	
	my $begin;
	while(<LIS_FILE>)
	{
		
		if(/Local Symbols/)
		{
			$begin=1;	
		}
		if($begin)
		{
			if(/\s+.+\s+0x[\da-fA-F]+\s+(.+?)\s+(\d+)\s+(.+)/)
			{
				my $type=$1;
				my $size=$2;
				my $other=$3;
				if(
					(
					   ($type eq "Data")  
					|| ($type eq "Data   RW") 
					|| ($type eq "Dbug   RW") 
					|| ($type eq "Number")
					|| ($type eq "Zero   RW")
					)
					&&
					(
						!($other=~/\(.constdata\)/)
					)
				  )
				{	
					if($size>$value)
					{
						my $sizeK=int($size/1024);
						my $temp=sprintf "%-4dK $_",${sizeK};
						push @ram,"$temp";
					}
				}
				else
				{
				
					if($size>$value)
					{
						my $sizeK=int($size/1024);
						my $temp=sprintf "%-4dK $_",${sizeK};
						push @rom,"$temp";
					}
					
				}
			}
		}
		if(/Memory Map of the image/)
		{
			last;
		}
		
	}
	
    my $savefile = $file;
	$savefile =~ s/.lis$/.txt/;
	open(SAVE_FILE,">".$savefile)||die"打开$savefile文件错误$!\n";
		
	if($type == 1) #ram
	{
		print "[ram]\n";
		foreach (sort {$b<=>$a} @ram)
		{
			print SAVE_FILE "$_";
		}
	}
	
	if($type == 0) #rom
	{
		print "[rom]\n";
		foreach (sort {$b<=>$a} @rom)
		{
			print SAVE_FILE "$_";
		}
	} 
	
   close(LIS_FILE);
   close(SAVE_FILE);
   
   print "处理完毕！结果如下：$savefile","\n";
}
   
  
 $W->Show(); 
 Win32::GUI::Dialog(); 
 sub Window_Terminate { -1 }