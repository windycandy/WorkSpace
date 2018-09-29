#! /usr/bin/perl

use File::Find;
use File::Copy;

#ubuntu下提取文件
$key = "values"; #需要提取的文件key
$newfolder = "/reslut";

$CurrutPath =`pwd`;
chomp $CurrutPath;
#print "CurrutPath=",$CurrutPath, "\n";
find \&handFolder , $CurrutPath;

sub handFolder{
  	   my $Xfile = $File::Find::name;
  	   if((-f $Xfile)&&($Xfile =~ m /$key/g))
  	   {     	       
  	      $lastFolder = (split /\//,$Xfile)[-2];
		  if($lastFolder =~ /\d/){}#去掉values-sw600dp类似这样的文件
		  else
		  {
			$temp = $Xfile;
			$temp =~ /((?<=$CurrutPath).+)/;
		    print $Xfile, "\n";
			$targetPath = $CurrutPath.$newfolder.$1;
			$targetPath =~ /(.+(?=\/[\w-_]+\.xml$))/;
			`mkdir -p $1`;
			`cp $Xfile $targetPath`;
		  }
  	   }
}
       

print "over!\n";