#! /usr/bin/perl -w

#Ҫ��x%�Ǵ���0%,С��100%

my $s = "20%";
my $num= (split(/%/,$s))[0];

if(($num > 0)  and ($num < 100))
{
	print "lalala\n";
}


my $parten = "���������ַ�";
if("���������ַ�"  !~ /$parten/)
{
	print "no\n";
}
else
{
	print "yes\n";
}