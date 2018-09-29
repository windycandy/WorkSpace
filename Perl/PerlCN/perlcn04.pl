#!usr/bin/perl -w 
use strict;


print 5x4.9, "\n";
print 5*4.9, "\n";
print "yes".123456, "\n";


print  ord('b'), "\n";
print  chr(98), "\n";



$_ = 123;
print;
print "\n";


my $str = "0x080187c4   0x0000002c   Code   RO        74677    i.MSMc_start        msm_env.obj(obigo03cfwlib.lib)";
if($str =~/\s+.+\s+0x[\da-fA-F]+\s+(.+?)\s+(\d+)\s+(.+)/)
{
	
			print "debug   ","\$0= " ,$0,"\n";
			print "debug   ","\$1= " ,$1,"\n";
			print "debug   ","\$2= " ,$2,"\n"; 
			print "debug   ","\$3= " ,$3,"\n"; 

}

if("0x08018A7E4 "=~/(0x[\da-f]+\b)/i)
{
			print "debug eq","\n";
			print "debug   ","\$0= " ,$0,"\n";
			print "debug   ","\$1= " ,$1,"\n";
}











