use Win32::OLE qw(in with);
use File::Find;
    
@array = qw(
王志利
秦珊珊
向玮
李俊
李道明
何超
唐发庆
黄天送
曾明星
刘朋华
何毅敏
梁振
刘鹏程
陈石慧
邱刚
李刚Gavin
王聪
董银
张吉猛
杨帆
张亚强
田乐
曾锦标
王敏
张艳
张武一
刘洋
肖业
周卫
陈祥
谢喜军
李健
宋阳
陆章柱
吴建兵
徐明
宇文琛
侯健
汤俊
简志威
刘建海
周瑞运
曾科
周游
兰小标
邹健宇
);

%hash=(
);

foreach $k (@array)
{
      print "统计人员 : " , $k,"\n";
      $hash{$k} =0; 
}     
      
      
$file1 = 'C:\Users\user\Desktop\123\7.xls';      
$file2 = 'C:\Users\user\Desktop\123\8.xls';
$file3 = 'C:\Users\user\Desktop\123\9.xls'; 

      
sub sortfun{
        ($filename , $name,  $time) = @_;
		my $file = $filename;
		
		my $sheet = 1;#第几个页
		my $Row = $name;#你要取出的列
		
		my $Excel = Win32::OLE->GetActiveObject('Excel.Application') || Win32::OLE->new('Excel.Application', 'Quit');
		
		my $Book = $Excel->Workbooks->Open($file);
		
		my $WorkSheet = $Book->Worksheets($sheet);
		
		my $minRow = 1;
		my $maxRow = $WorkSheet->UsedRange->Rows->Count; 
		
		#print $maxRow,"\n";
		
		
		my $TempValue;
		foreach my $tempRow ($minRow..$maxRow)
		{
			 $TempValue = $WorkSheet->Cells($tempRow,$Row)->{Value},"\n";#打印值
		     $WorkSheet->Cells($tempRow,$time)->{Value},"\n";#打印值
				foreach $key(sort keys %hash)  
				{   print "debug >>>>>>>>>>>>>  key =" , $key, "\n";
					print "debug >>>>>>>>>>>>>   TempValue= " , $TempValue, "\n";
					if($key eq $TempValue) 
					{
					   print $TempValue , ": ",$WorkSheet->Cells($tempRow,$time)->{Value}, "\n";	
					   #print $hash{$key}  , "\n"; 
					   $hash{$key}  += $WorkSheet->Cells($tempRow,$time)->{Value};
					   #print $hash{$key}  , "\n";		
					}
					
				}    
		}
		
		#$Book->Save();
        $Book->Close();
        $Excel->Quit();
      }   


      sub saveTime{
				my $sheet = 1;#第几个页
				$fileOut = 'C:\Users\user\Desktop\123\sum.xlsx'; 
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
					print $key; 
					print $hash{$key}; 
					print "\n"; 
					
					$WorkSheetOut->Cells($tempRow,1)->{Value} = $key;
					$WorkSheetOut->Cells($tempRow,2)->{Value} = $hash{$key}*24;
					$tempRow ++;
				}  
				
				
				$BookOut->Save();
				$BookOut->Close();
				$Excel->Quit();
      }

      
      
sortfun $file1,3,26; 
sortfun $file2,3,26; 
sortfun $file3,3,26;    
   
foreach $key(sort keys %hash)  
{  
#	print $key; 
#	print $hash{$key}; 
#	print "\n"; 
}  

print "------------saveTime-----------------", "\n"; 

saveTime;


