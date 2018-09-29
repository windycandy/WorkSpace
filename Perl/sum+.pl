use Win32::OLE qw(in with);
use File::Find;
use Win32::GUI; 
use Win32::GUI qw(CW_USEDEFAULT);
use Win32::GUI::DropFiles; 
  
$bein_x = 30;
$bein_y = 30; 
$Max = 300;  
  
  
%hash=(
);  
           
  
@arraybumen = qw(
APP开发部
All
软件项目部
硬件部
软件部
软件测试部
BSP开发部
品管部
生产计划部
射频部
流程部
硬件测试部
技术工程部
基带部
结构部
ID部
IT部
PCB部
项目管理部
设计一部
设计二部
技术支持部
业务拓展部
测试软件开发组
人力资源部
生产支持组
行政部
总经办
质量管理部
);
  
$W = new Win32::GUI::Window ( 
              -title    => "加班统计", 
              -pos      => [450, 300], 
              -size     => [350, 300], 
              -name     => "Window", 
              ); 
              
  
$W->AddCombobox(
    -name => 'tpyechoose',
    -dropdownlist => 3,
    -left => $bein_x,
    -top  => $bein_y,
    -width => 200,
    -height => 100,    
);        
         

foreach $k (@arraybumen) #迭代
{
	#print $k, "\n"; 
	$W->tpyechoose->Add($k);
}         

$W->tpyechoose->Select(0);            
         
          
                           
$W->AddButton (
    -name    => "Load",
    -left => $bein_x,
    -top  => $bein_y+150,
    -width => 200,
    -height => 50,
    -text    => "选择Excel文件目录",
    -default => 1,
    -tabstop => 1,
    -group   => 1,                        # You can use :
    -onClick => \&LoadLisFile,            #  a reference sub
    #-onClick  => 'LoadLisFile',           #  a string name sub
);   
              
              
sub LoadLisFile {                   
      $folder = Win32::GUI::BrowseForFolder();               
	  if ($folder) {
	     &listfile($folder);
	  }
	  elsif (Win32::GUI::CommDlgExtendedError()) {
	     Win32::GUI::MessageBox (0, "ERROR : ".Win32::GUI::CommDlgExtendedError(),
	                            "GetOpenFileName Error");
	  }
}    


sub listfile{ 
   $folder = @_[0];	  
   find \&handFolderN , $folder;
   find \&handFolder , $folder;
}



sub sortfun{
        ($filename , $name,  $time) = @_;
        #print "sortfun",$filename, "\n";
        
		my $file = $filename;
		
		my $sheet = 1;#第几个页
		my $Row = $name;#你要取出的列
		
		my $Excel = Win32::OLE->GetActiveObject('Excel.Application') || Win32::OLE->new('Excel.Application', 'Quit');
		
		my $Book = $Excel->Workbooks->Open($file);
		
		my $WorkSheet = $Book->Worksheets($sheet);
		
		my $minRow = 6;########
		my $maxRow = $WorkSheet->UsedRange->Rows->Count; 
				
		#init
		foreach my $tempRow ($minRow..$maxRow)
		{
			        
					if($WorkSheet->Cells($tempRow,2)->{Value} eq @arraybumen[$W->tpyechoose->GetCurSel()]
					   || @arraybumen[$W->tpyechoose->GetCurSel()] eq "All") 
					{
						#print "key ==== ",@arraybumen[$W->tpyechoose->GetCurSel()],"\n"; 
					    $key = $WorkSheet->Cells($tempRow,$name)->{Value};
						$hash{$key} = $hash{$key} + 0;		
					}
   
		}		
				
				
		my $TempValue;
		foreach my $tempRow ($minRow..$maxRow)
		{
			 $TempValue = $WorkSheet->Cells($tempRow,$Row)->{Value},"\n";#打印值
		     $WorkSheet->Cells($tempRow,$time)->{Value},"\n";#打印值
				foreach $key(sort keys %hash)  
				{  
					if($key eq $TempValue) 
					{
					  # print $TempValue , "\n";	
					  # print $hash{$key}  , "\n";
					  #  print $tempRow , "  " ,$time , "\n";	
					  #  print "Time is : ",$WorkSheet->Cells($tempRow,$time)->{Value}*24  , "\n";	
					   $hash{$key}  += $WorkSheet->Cells($tempRow,$time)->{Value};
					  #  print $hash{$key}  , "\n";		
					}
					
				}    
		}
		
		#$Book->Save();
        $Book->Close();
        $Excel->Quit();
}   



sub saveTime{
				my $sheet = 1;#第几个页
				
				$fileOut = 'C:\Users\USER\Desktop\Sum.xls';
				`type null > $fileOut`;
				# print "saveTime", "\n";
				my $Excel = Win32::OLE->GetActiveObject('Excel.Application') || Win32::OLE->new('Excel.Application', 'Quit');			
				my $BookOut = $Excel->Workbooks->Open($fileOut);
				my $WorkSheetOut = $BookOut->Worksheets($sheet);
				
				my $minRow = 1;
				my $maxRow = 8; 
				
				#print $maxRow,"\n";
				
				
				my $TempValue;

				$tempRow =1;
				
				foreach my $key ( sort { $hash{$b} <=> $hash{$a} } keys %hash )
				{  
					#print $key; 
					#print $hash{$key}; 
					#print "\n"; 
					
					$WorkSheetOut->Cells($tempRow,1)->{Value} = $key;
					$WorkSheetOut->Cells($tempRow,2)->{Value} = $hash{$key}*24;
					$tempRow ++;
				}  
				
				
				$BookOut->Save();
				$BookOut->Close();
				$Excel->Quit();
}

$file_N =0;
$file_n =0;
sub handFolderN{
  	   $temp = $File::Find::name;
  	   if(-f $temp)
  	   {
  	   	  $temp =~ s/\//\\/g;
  	   	  $temp =~ /(.+xls)/;
  	   	  if($1){
  	      $file_N ++;}
  	   } 
}


sub handFolder{
  	   $temp = $File::Find::name;
  	   if(-f $temp)
  	   {
  	   	  $temp =~ s/\//\\/g;
  	   	  $temp =~ /(.+xls)/;
  	   	  if($1){
	  	      sortfun $temp, 3,23;
	  	      $file_n ++ ;
	  	      if($file_n == $file_N){
	  	      	saveTime;
	  	      	print "结果请见桌面上的Sum.xls文件！";
	  	      }
  	   	  }
  	   } 
}




 $W->Show(); 
 Win32::GUI::Dialog(); 
 sub Window_Terminate { -1 }


    
    