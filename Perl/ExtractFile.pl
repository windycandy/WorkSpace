#! /usr/bin/perl  dongyin

use File::Find;
use File::Copy;

#��ȡubuntu���������xml�ļ�
$key = "values"; #��Ҫ��ȡ���ļ�key
$newfolder = "/reslut";

$CurrutPath =`pwd`;
chomp $CurrutPath;
#print "CurrutPath=",$CurrutPath, "\n";
find \&handFolder , $CurrutPath;

$string = "data_connection_progress_message";


sub handFolder{
  	   my $Xfile = $File::Find::name;
  	   if((-f $Xfile)&&((  $Xfile =~ m /values/g)#ru_RU
))
  	   {     	       
  	      $lastFolder = (split /\//,$Xfile)[-2];
		  if($lastFolder =~ /\d/){}#ȥ��values-sw600dp�����������ļ�
		  else
		  {
			$temp = $Xfile;
			$temp =~ /((?<=$CurrutPath).+)/;
		    print $Xfile, "\n";
			$targetPath = $CurrutPath.$newfolder.$1;
			$targetPath =~ /(.+(?=\/[\w-_]+\.xml$))/;
			`mkdir -p $1`;
			`cp $Xfile $targetPath`;
			
			
			open(SOURCEHANDLE, $Xfile);
            open(TARGETHANDLE, ">".$targetPath);

			while (<SOURCEHANDLE>)
			{
				 $line=  $_;
	
				while($line =~ m/(?<email>($string)/g)  
				{
					print TARGETHANDLE $line, "\n";
				}
	
			}

			close(SOURCEHANDLE);
			close(TARGETHANDLE);
			
			
			
			
		  }
  	   }
}
       

print "over!\n";