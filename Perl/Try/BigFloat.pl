use File::Find;
use Math::BigFloat;
 
 
   
sub compare{		
	if ($_[0]>$_[1]) {$bigger=$_[0];}	
	elsif ($_[0]<$_[1]) {$bigger=$_[1];}	
	else {$bigger="They are equal!";}	
	
	return $bigger;	  
}
	
$x= new Math::BigFloat '99.999999999999999';	
$new= compare ($x,100);
print $new;



