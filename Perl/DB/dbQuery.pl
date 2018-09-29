#!/usr/bin/perl -w   
use strict;  
use Encode;

use DBI;  
  
my $db_file="data.db";  
 
my $dbh = DBI->connect("dbi:SQLite:dbname=$db_file","","");  



my $ary_ref=$dbh->selectall_arrayref(q{SELECT * FROM users});
  
foreach my $entry (@$ary_ref){  
     print "@$entry\n";      
}  
  
$dbh->disconnect;  














