use Win32::OLE qw(in with);
use File::Find;
    
@array = qw(
��־��
��ɺɺ
����
�
�����
�γ�
�Ʒ���
������
������
����
������
����
������
��ʯ��
���
���Gavin
����
����
�ż���
�
����ǿ
����
������
����
����
����һ
����
Фҵ
����
����
лϲ��
�
����
½����
�⽨��
����
�����
�
����
��־��
������
������
����
����
��С��
�޽���
);

%hash=(
);

foreach $k (@array)
{
      print "ͳ����Ա : " , $k,"\n";
      $hash{$k} =0; 
}     
      
      
$file1 = 'C:\Users\user\Desktop\123\7.xls';      
$file2 = 'C:\Users\user\Desktop\123\8.xls';
$file3 = 'C:\Users\user\Desktop\123\9.xls'; 

      
sub sortfun{
        ($filename , $name,  $time) = @_;
		my $file = $filename;
		
		my $sheet = 1;#�ڼ���ҳ
		my $Row = $name;#��Ҫȡ������
		
		my $Excel = Win32::OLE->GetActiveObject('Excel.Application') || Win32::OLE->new('Excel.Application', 'Quit');
		
		my $Book = $Excel->Workbooks->Open($file);
		
		my $WorkSheet = $Book->Worksheets($sheet);
		
		my $minRow = 1;
		my $maxRow = $WorkSheet->UsedRange->Rows->Count; 
		
		#print $maxRow,"\n";
		
		
		my $TempValue;
		foreach my $tempRow ($minRow..$maxRow)
		{
			 $TempValue = $WorkSheet->Cells($tempRow,$Row)->{Value},"\n";#��ӡֵ
		     $WorkSheet->Cells($tempRow,$time)->{Value},"\n";#��ӡֵ
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
				my $sheet = 1;#�ڼ���ҳ
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


