#! /usr/bin/perl

use File::Find;
use File::Copy;

#ubuntu����ȡ�ļ�
$key = "values"; #��Ҫ��ȡ���ļ�key
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
		  }
  	   }
}
       

print "over!\n";