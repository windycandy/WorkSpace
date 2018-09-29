#!usr/bin/perl -w

#$file = "jinli.txt";
#print system("notepad $file");

@array1 = qw(aa bb cc dd);
@array2 = qw(11 22 33 44);

sub sortfun{
	($arraytemp1 , $arraytemp2) = @_;
	
	print "\@arraytemp1=", @$arraytemp1,"\n";
	print "\@arraytemp2=", @$arraytemp2,"\n";
	
	@$arraytemp1 = reverse @$arraytemp1;
	
	print "\@arraytemp1=", @$arraytemp1,"\n";
	print "\@arraytemp2=", @$arraytemp2,"\n";
}


sortfun \@array1,\@array2;

print "\@array1=",@array1,"\n";
print "\@array2=",@array2,"\n";