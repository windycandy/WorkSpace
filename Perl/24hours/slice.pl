#!perl -w


#list slice
my $string ="list slice some how last";
my $qiepian = (split / /,$string )[2];
print "$qiepian","\n";

my($first , $last) = (split / /,$string )[0,-1];
print "$first , $last","\n";



#hash slice
%hash=("aaaa"=>1,"cccc"=>3,"bbbb"=>2,"dddd"=>4); 

my @results = @hash{qw/aaaa bbbb/};   #切片一定是列表，所以得用@
print "@results","\n";


my $temp = 'C:\Users\Administrator\Desktop\SalesTrackernew\Android.mk';
my $foldername = 'SalesTrackernew';
my $qie = (split /$foldername/,$temp)[0];
print "$qie","\n";
