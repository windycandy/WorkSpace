#!usr/bin/perl
use File::Find;

my $Folder = 'C:\Users\Administrator\Desktop\res';

$lintD = '    <string name="numeric_date_format">dd/MM/yyyy</string>';

find \&handFolder , $Folder;

open(SHANDLE, "C:\Users\Administrator\Desktop\dongyin.txt");

sub handFolder{
  	my $temp = $File::Find::name;

    if (-f $temp   &&  ($temp =~ m/donottranslate-cldr\.xml/g)   )  #只处理文件，忽略文件夹
    {
    	
    	open(SOURCEHANDLE, $temp);
    	$newfile = $temp;
    	substr($newfile ,31,3) = "resnew";
    	print $newfile, "\n";
    	`type nul>$newfile`;
    	open(HANDLE, ">".$newfile);
    	
    	while(<SOURCEHANDLE>)
		{
			$line=  $_;
			if($line =~ m/numeric_date_format/g)  
			{
				print HANDLE $lintD, "\n";
			}
			else{
				print HANDLE $line;
			}
			
		}
		close SOURCEHANDLE;
		close HANDLE;
    }

}