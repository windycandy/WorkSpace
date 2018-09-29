#!


$radius =50;
$area = 3.14*($radius**2);

print $area ,"\n";

##############################################

if ('leon' =~ /\bleon\b/) {
print ("I am leon!\n");
}
else {
print ("who am i?\n");

}

##############################################

$a = 'hello world ';
$b = "fuck u";

print  $a+$b, "\n";
print  $a.$b, "\n";

##############################################

$name = "leon";
$astring = 'my name is $name';
$bstring = "my name is $name";
$cstring = "my name is \$name";

print  $astring, "\n";
print  $bstring, "\n";
print  $cstring, "\n";

##############################################

$mstring = "fuck " x 10;
print $mstring,"\n";

print $Ustring = uc(leon), "\n";
print lc($Ustring), "\n"; 
print rand(), "\n"; 

$instring = "zzz";
$instring++;
print $instring, "\n"; 

$instring--;            #what???
print $instring, "\n"; 











































