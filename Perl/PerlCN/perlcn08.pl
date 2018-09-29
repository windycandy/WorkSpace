#! /usr/bin/perl -w

#分组捕获，很牛x啊

use strict;
my $string = "abc r=3 def r=3 test r=3 over";
print $string , "\n";

$string =~ s/(?<=def r=)\d/5/;  #?<=  	匹配exp后面的位置
print $string , "\n";


$string = "abc r=3 def r=3 test r=3 over";  #?=  匹配exp前面的位置
$string =~ s/\d(?= def)/5/;
print $string , "\n";


$string = "abc r=3 def r=3 test r=3 over";  #?!  匹配后面跟的不是exp的位置
$string =~ s/\d(?! def)/5/;
print $string , "\n";

$string = "abc r=3 def r=3 test r=3 over";  #?<!  匹配前面不是exp的位置
$string =~ s/(?<! def)\d/5/;
print $string , "\n";

