#!perl -w
use File::Find;

my $file = 'C:\Users\USER\Desktop\app\p.txt';
my $Folder = 'C:\Users\USER\Desktop\app';


open(HANDLE, $file);
print "k", "\n";
while(<HANDLE>){
  	print $_, "\n";

    find \&handFolder , $Folder;
	
}

sub handFolder{
  	   my $Xfile = $File::Find::name;


}





close(HANDLE);

print "over", "\n";