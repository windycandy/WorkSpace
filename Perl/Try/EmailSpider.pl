#!perl -w


#��ȡ��һ���ļ������е�email
my $sourcefile = "H:/emailtest.txt";
my $targetfile = "H:/resultfile.txt";

open(SOURCEHANDLE, $sourcefile);
open(TARGETHANDLE, ">".$targetfile);


while (<SOURCEHANDLE>)
{
	 $line=  $_;
	
	while($line =~ m/(?<email>([\w.]+)\@[\w-]+\.[\w.]+)/g)  
	{
		print TARGETHANDLE $+{email}, "\n";
	}
	
}

close(SOURCEHANDLE);
close(TARGETHANDLE);

print "over", "\n";