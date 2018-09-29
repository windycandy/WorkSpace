#!perl -w

#monkey测试验证那些activity此手机上存在，那些不能通过验证，即没有
my $source = 'all.txt';
my $target = 'reslut.txt';

open(SOURCEHANDLE, $source);
open(TARGETHANDLE, ">".$target);

print "筛选开始...\n";

while (<SOURCEHANDLE>)
{
	my $line=  $_; 
	#print $line;
	
	my @output =`adb shell monkey -p $line -v 1` ;
	#foreach my $listfile (@output){
	#	print $listfile;	
	#}
	
	#print "output=",@output[$#listfile],"\n";
	
	my $lastline = $output[$#output];
	
	if($#output!=0){
		if($lastline =~ m/No activities found to run/g) 
		{
			print "fail   ","$line";
		}else{
			print "pass   ","$line";
			print  TARGETHANDLE $line;
		}
	}
}

print "完毕!\n";

close SOURCEHANDLE;
close TARGETHANDLE;