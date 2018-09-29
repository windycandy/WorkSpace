#!perl 
use Win32::OLE qw(in with);

my $src = "C:/Users/USER/Desktop/123/stringTable.xls";
my $out = "C:/Users/USER/Desktop/123/Output_VT65_0609_all.xls";

my $sheet = 4;

my $Excel = Win32::OLE->GetActiveObject('Excel.Application') || Win32::OLE->new('Excel.Application', 'Quit');

my $Booksrc = $Excel->Workbooks->Open($src);

my $WorkSheetsrc = $Booksrc->Worksheets($sheet);

my $minRow = 2;
print ">>>> get ROW\n";
my $maxRowsrc = $WorkSheetsrc->UsedRange->Rows->Count; 




print ">>>>", $maxRowsrc, "\n";

my $Row1 = 2;#路径
my $Row2 = 3;#文件名
my $Row3 = 7;#文件名

my $path;
my $file;
my $id;
foreach my $tempRow ($minRow..$maxRowsrc)
{
	$path = $WorkSheetsrc->Cells($tempRow,$Row1)->{Value},"\n";
	$path =~ /(\/.+)/g; 
	$file = $WorkSheetsrc->Cells($tempRow,$Row2)->{Value},"\n";
	#生成
	$newfile = "C:/Users/USER/Desktop/123/out".$1."/".$file;
    $newpath = "C:/Users/USER/Desktop/123/out".$1;
    $newpath =~ s/\//\\/g;
    print 'newpath = ', $newpath, "\n";
    `md $newpath`; 
	$id = $WorkSheetsrc->Cells($tempRow,$Row3)->{Value},"\n";
	
	print $newfile, "\n";
	print $id, "\n";
    $newfile =~ s/\//\\/g;
    
    if(-e $newfile){
    	
    }else{
	`type nul>$newfile`;
    }
    open(TAR_FILE, ">>".$newfile);
	print TAR_FILE $id,"\n";
	close(TAR_FILE);
}



$Booksrc->Save();
$Booksrc->Close();
$Excel->Quit();