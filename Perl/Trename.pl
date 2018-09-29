use File::Find;

my $src = 'C:\Users\USER\Desktop\shutdownanimation\part4';

my $out = 'C:\Users\USER\Desktop\5555555';

my $num = 175;


find \&handFolder , $src;




sub handFolder{
  
  	   $temp = $File::Find::name;
	   
  	   if(-f $temp)
  	   {
  	      print $temp,"\n";
         
          $outpath = $out."\\"."0".($num).".png";
          print $outpath,"\n";
          `cp $temp $outpath`;
          
          $num = $num -1;;
          
  	   } 
  }
  