#!perl 

#http://zhidao.baidu.com/question/507335809.html?oldq=1#answer-1276499317
my $limit = 85;
my $sourcefile = 'C:\Users\Administrator\Desktop\test.xml';
my $targetfile = 'C:\Users\Administrator\Desktop\reslut.xml';

open(SOURCEHANDLE, $sourcefile)||die"打开文件错误$!\n";;
open(TARGETHANDLE, ">".$targetfile);


while (<SOURCEHANDLE>)
{
   my $string = $_;
   if($string =~ m/((?<=Value=")\d+)/) 
   {    
       #print $1;
       if($1 >= $limit)  
       {      
       	 print  TARGETHANDLE $string;  
       }    
   }    
   else
   {
        print  TARGETHANDLE $string; 
   } 
}

close(SOURCEHANDLE);
close(TARGETHANDLE);

print "over", "\n";