#!usr/bin/perl 

#hash

%hash1=("aaaa"=>1,"cccc"=>3,"bbbb"=>2,"dddd"=>4,"aaaa"=>11111);  

foreach $key(sort keys %hash1)  
{  
	print $key; 
	print $hash1{$key}; 
	print "\n"; 
}  

%hash2 = %hash1;

print %hash2; 
print "\n";
print keys %hash2; 
print "\n";
print values %hash2; 
print "\n";
print reverse %hash2; 
print "\n";
print  $hash2{aaaa};
print "\n";

print "sort", "\n";

@arraykeys = values %hash2;

for $k (@arraykeys)
{
	print $k;
}

print "sort1",  "\n";

foreach (sort {$b<=>$a} @arraykeys)  #{$b<=>$a} Êý×ÖÅÅÐò
{
	print "$_";
}

print "sort2",  "\n";

foreach (sort {$a<=>$b} @arraykeys)
{
	print "$_";
}


#########################################
print "\n", "local,my our" ,"\n";

sub changenumber
{
     $foo = 100;	
}

sub main
{
	my $foo = 0;
	&changenumber;
	print '$foo=', $foo;
}

&main;





