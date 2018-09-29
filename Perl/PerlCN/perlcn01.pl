#!perl -w
use strict;

open (FILE,"C:/Users/Administrator/Desktop/321.txt") or die "Can't open myfile: $!";
my @line =  grep /SJZQ|1065/i, <FILE>;                     #grep

#print @line,"\n";

for my $k (@line)
{
	print $k,"\n";
	print "length =",length $k,"\n";
	$k =~ s/^\s+//;
	$k =~ s/\s+$//;
	print $k,"\n";	
	print "length =",length $k,"\n";
}

close FILE;




for (keys %ENV)
{
	print $_, "=", $ENV{$_},"\n";
}