#!perl -w
use Win32::OLE qw(in with);

my $file = "C:/Users/Administrator/Desktop/input.xls";
my $fileOut = "C:/Users/Administrator/Desktop/output.xls";

my $sheet = 1;#第几个页
my $Row_bugID = 5;#bug id

my $Excel = Win32::OLE->GetActiveObject('Excel.Application') || Win32::OLE->new('Excel.Application', 'Quit');

my $Book = $Excel->Workbooks->Open($file);
my $BookOut = $Excel->Workbooks->Open($fileOut);

my $WorkSheet = $Book->Worksheets($sheet);
my $WorkSheetOut = $BookOut->Worksheets($sheet);

my $minRow = 1;
my $maxRow = $WorkSheet->UsedRange->Rows->Count; 

print $maxRow,"\n";


my $TempValue;
foreach my $tempRow ($minRow..$maxRow)
{
	print $TempValue = $WorkSheet->Cells($tempRow,$Row)->{Value},"\n";#打印值
	$WorkSheetOut->Cells($tempRow,$Row)->{Value} = $TempValue;
}

$Book->Save();
$Book->Close();

$BookOut->Save();
$BookOut->Close();
$Excel->Quit();
