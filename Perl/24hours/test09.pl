#!usr/bin/perl -w

$string = "onefish, two fish , three fish";
$start = -1;

while (($start = index($string, "fish",$start))!= -1)
{
	print $start;
	print "\n";
	$start++;
}

print  index($string, "fish");
print "\n";

print  rindex($string, "fish");
print "111111\n";


print substr($string ,4), "\n";
print substr($string ,4, 4), "\n";
print substr($string ,4,-1), "\n";
print substr($string ,-10), "\n";

print "replace\n";            #Ìæ»»
substr($string ,0,0) = "some";
print $string, "\n";


#$string =~ s/'//g;
$string =~ s/fish/dog/g;
print $string;

