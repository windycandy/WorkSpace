#!perl -w

#monkey������֤��Щactivity���ֻ��ϴ��ڣ���Щ����ͨ����֤����û��
my $source = 'all.txt';
my $target = 'reslut.txt';

open(SOURCEHANDLE, $source);
open(TARGETHANDLE, ">".$target);

print "ɸѡ��ʼ...\n";

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

print "���!\n";

close SOURCEHANDLE;
close TARGETHANDLE;