#! /usr/bin/perl -w

#���鲶�񣬺�ţx��

use strict;
my $string = "abc r=3 def r=3 test r=3 over";
print $string , "\n";

$string =~ s/(?<=def r=)\d/5/;  #?<=  	ƥ��exp�����λ��
print $string , "\n";


$string = "abc r=3 def r=3 test r=3 over";  #?=  ƥ��expǰ���λ��
$string =~ s/\d(?= def)/5/;
print $string , "\n";


$string = "abc r=3 def r=3 test r=3 over";  #?!  ƥ�������Ĳ���exp��λ��
$string =~ s/\d(?! def)/5/;
print $string , "\n";

$string = "abc r=3 def r=3 test r=3 over";  #?<!  ƥ��ǰ�治��exp��λ��
$string =~ s/(?<! def)\d/5/;
print $string , "\n";

