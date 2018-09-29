#!/usr/bin/perl -w 
##
#open(HANDLE, "jinli.txt") || die ("cause by :$!");
#
#$string = <HANDLE>;
#
#print $string, "\n";
#
#@str = <HANDLE>;
#
#while(<HANDLE>)
#{
#	#print $_;
#}
#
#close(HANDLE);


open(MYHANDLE, "jinli.txt");

@str = <MYHANDLE>;

#$string = <MYHANDLE>;

while(<MYHANDLE>)
{
 #print $_;
}

#print "@str";



for $k (@str)
{
	print $k;
}

open(HANDLE, ">jinli123.txt") || die (" cause by  test2: $!");

print(HANDLE @str);

close(MYHANDLE);
close(HANDLE);
 

