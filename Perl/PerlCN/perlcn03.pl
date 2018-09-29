#!perl -w
use strict;

my $DEBUG = 1;

sub ParseMemDevLst
{
	 
	my $memdlst = '';
	my ($tool) = @_;
	my $toolsdir = "$tool\\MemoryDeviceList";
	print $toolsdir,"\n" if ($DEBUG);
	opendir DIR, $toolsdir or die "$!";
	foreach my $xlsfile (readdir DIR)
	{
		print $xlsfile,"\n" if ($DEBUG);
        ########    原来是这个查找会按照名字来
		#if($xlsfile =~ /^(MemoryDeviceList_\w+?_.*?_MMAA.*?.xls)$/)
		if($xlsfile =~ /^(MemoryDeviceList_Since\w+.xls)$/)
		{
			$memdlst  = $1;
			print $memdlst,"\n" if ($DEBUG);
		}
		
		my $temp = "$toolsdir\\$memdlst"; 
		print "size=",(-s $temp),"\n";		
	}
	closedir DIR;
	return $memdlst;
	 
}


print "reslut=" , ParseMemDevLst "E:/VIVI_MARSHAL/tools";

my $a = "MemoryDeviceList_Since10AW1033.xls";
my $b = "MemoryDeviceList_Since10AW1033.xls";

if($a eq $b)
{
	print "reslut=";
}
else
{
	print "reslut!=";
}
