#!usr/bin/perl -w


use Cwd;
print cwd;
print "\n";


use File::Find;
sub test
{
	if($_ eq "321.txt")
	{
		print "find\n";
		print $File::Find::name,"\n";
		print $File::Find::dir,"\n";
	}
}

find \&test, "C:/Users/Administrator/Desktop";


use File::Copy;
#copy("H:/emailtest.txt","C:/Users/Administrator/Desktop") || die "cause by :$!";'


sub OsName {
  my $os = `set os`;
  print $os;
  if(!defined $os) { 
    $os = "linux";
  } 
  else {
    #die "does not support windows now!!" ;
    $os = "windows";
  }
}


print &OsName;


print my $temp =`perldoc file::find`;
