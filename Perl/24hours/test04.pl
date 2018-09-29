#!
$s = 'test';
@array1 = ("apple", "orange", 80, $s);
@array2 = qw(apple orange 80 $s);

print $#array1,"\n";  
print "@array1","\n";  #good
print @array1,"\n";
print @array2,"\n";

###########################################
&test;

#上下文的概念
sub test{
	$i=0;
	$array1[4] = "shit";
	for($i;$i<($size=@array1);$i++)   #($size=@array1)
	{
		print @array1[$i],"\n";
	}
	
	if($array1[4] == $array1[-1])
    {
    	print "equal","\n";
    } 
    
	foreach $k (@array1) #迭代
	{
		print $k,"\n";
	}
}


$a = @array1;
print $a,"\n";        #数组元素个数

print $#array1,"\n";  #最后索引号

#上下文的概念对比
print localtime,"\n"; 
print scalar(localtime),"\n"; 
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime;

###########################################

#scalar(localtime) 的值：Mon Oct 29 20:29:41 2012
@arraytime = split(/ /,scalar(localtime));  #/ / 分割模式，即正则表达式
print $num = @arraytime,"\n";
print "@arraytime","\n";

###########################################

@array3 = (
            "zhangshan,18",
            "lisi,19",
            "wangwu,20"
           );
           
print $size=@array3,"\n";
$i = 0;
for $str (@array3)
{   
	print "test","\n";
    ($name, $age) = split(/,/,$str);
    print $name,"\n";
    print $age,"\n";
}

###########################################

$number = join('-', (1..10));   
print $number,"\n";               #1-2-3-4-5-6-7-8-9-10

$temp = 'just testing';
$number1 = join('-', split(//,$temp)); 
print $number1,"\n";


print  $number2 = join('-', sort split(//,$temp)),"\n"; 
print  $number2 = join('-', reverse sort split(//,$temp)),"\n"; 
###########################################


