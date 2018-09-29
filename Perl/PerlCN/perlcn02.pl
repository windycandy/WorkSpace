#!perl -w
use strict;

#system("perl perlcn01.pl");


my $string = "123 some how  =  some how";
$string =~ m/(\d+?)/;

print $string,"\n";

print $1,"\n";

print $/,"\n";

print $],"\n";

print $[,"\n";

print $_,"\n";

print $!,"\n";