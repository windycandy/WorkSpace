#!perl
#ȥ��xml�ļ�������ظ���ID

my $file = 'C:\Users\Administrator\Desktop\values-sv\mtk-strings.xml';
my $targetfile = 'C:\Users\Administrator\Desktop\values-sv\strings.xml'; #ȥ�����ļ����ظ�ID



my $temp = 'C:\Users\Administrator\Desktop\temp.xml';
`copy $targetfile $temp`;
`del $targetfile`;

open(TARGETHANDLE, $temp);
open(WHANDLE, ">".$targetfile);

while (<TARGETHANDLE>)
{
	$key;
	$find = 0;
	$line= $_;
	if($line =~ m/((?<=<string name=")\w+)/g){
		$key = $1;
		open(HANDLE, $file);
		while (<HANDLE>){
	  	    $line2 = $_;
	   	    if($line2 =~ m/$key/g){
			    $find =1;
			    print "�ظ���", "$key", "\n";
	     	}
		}	
		close HANDLE;
	}
	
	if($find == 0){
		print WHANDLE $line;
	}
}

close WHANDLE;
close TARGETHANDLE;
`del $temp`;
print "over";
