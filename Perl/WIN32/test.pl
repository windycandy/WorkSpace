#!perl 
use Win32::OLE qw(in with);

my $TxtFile = "C:/Users/Administrator/Desktop/network/network.txt";
my $ExcelFile = "C:/Users/Administrator/Desktop/network/2.xlsx";
my $FileOut = "C:/Users/Administrator/Desktop/network/output.txt";

my $sheet = 1;#µÚ¼¸¸öÒ³

my $Excel = Win32::OLE->GetActiveObject('Excel.Application') || Win32::OLE->new('Excel.Application', 'Quit');
my $BookOut = $Excel->Workbooks->Open($ExcelFile);
my $WorkSheetOut = $BookOut->Worksheets($sheet);


open HANDLEFileOut , ">".$FileOut;

  
print $WorkSheetOut->UsedRange->Rows->Count, "\n";
  
for(my $i;$i<=($WorkSheetOut->UsedRange->Rows->Count);$i++){
	   my $key = (split /\./,$WorkSheetOut->Cells($i,1)->{Value})[0];
       chomp $key;
       $key=~s/^\s+|\s+$//g; 
       #print $key, "\n";
       open HANDLETxtFile , $TxtFile;
       while(<HANDLETxtFile>){  
        	my $line = $_;  
	    	if($line =~/($key)/g){
	    		print $key, "\n";
	    		print $line, "\n";
	    		print HANDLEFileOut $line;
	    	}
    	}	
    	close(HANDLETxtFile);
}

$BookOut->Save();
$BookOut->Close();
$Excel->Quit();
close(HANDLEFileOut);

print "over!";

