#! /usr/bin/perl -w

#要求x%是大于0%,小于100%

my $s = "20%";
my $num= (split(/%/,$s))[0];

if(($num > 0)  and ($num < 100))
{
	print "lalala\n";
}


my $parten = "我是中文字符";
if("我是中文字符"  !~ /$parten/)
{
	print "no\n";
}
else
{
	print "yes\n";
}