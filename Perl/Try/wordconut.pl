#!perl -w


use Archive::Zip;
my %hash;

open(WORDHANDLE, "C:/Users/Administrator/Desktop/word.txt");
open(SHANDLE, "C:/Users/Administrator/Desktop/123.txt");
#open(RESULTHANDLE, ">"."C:/Users/Administrator/Desktop/ͳ�ƽ��.txt");

my @word = <WORDHANDLE>;
for (@word)
{
    chomp($_); #ȥ���س�
 	$hash{$_} = 0;
}

#print keys %hash,"\n";



my @wenzhang = <SHANDLE>;

for my $keyword(keys %hash)
{ 
	#print $keyword, "\n";
	for (@wenzhang)
	{
	     chomp($_); #ȥ���س�
	     my $line = $_;
	     if ($line =~ m/$keyword/)
	     {
	     	#print $line, "\n"
	     }
	}
}


################test
my $test  = "mediatek source packages FMRadio res values strings.xml FMRadio";
my $keywork = "FMRadio";
     if($test =~ m/(?<label>$keywork)/)
     {
     	print  $+{label}, "\n";
     }


	my $line = '123@gmail.com; 123125456; 456@gmail.com,9999';
	
	while($line =~ m/(?<email>([\w.]+)\@[\w-]+\.[\w.]+)/g)  
	{
		print $+{email}, "\n";
	}
	
	






