use File::Find;
$path = 'Z:/pro/xs01b_s12a/vendor/mediatek/ckt92_we_jb9/artifacts/out/target/product/ckt92_we_jb9/data/media';
$file = '.keep_list';

$loadPath = '/data/media/0/';#根据实际情况

open(HANDLE, ">".$file);

find \&handFolder , $path;
print HANDLE '/data/.layout_version';

close HANDLE;
print "over\n";  
 
  
sub handFolder{
  
  	   $temp = $File::Find::name;
	   
  	   if(-f $temp)
  	   {
  	   	  $temp =~ /((?<=\/media\/).+)/;
  	      print $loadPath.$1, "\n";
		  print HANDLE $loadPath.$1, "\n";
  	   } 
  }
  
