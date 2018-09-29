#! /usr/bin/perl -w 
use strict; 
  
my $text; 
my $regex = '(\d+):(\d+)'; 
my $replace = '$2-$1'; 
  
$text = '09:31'; 
$text =~ s/$regex/$2-$1/; 
print $text, "\n";    # �������ֵ31-09 
  
$text = '11:59'; 
$text =~ s/$regex/$replace/; 
print $text, "\n";    # ���$2-$1


$text = '11:59';  
eval("\$text =~ s/$regex/$replace/;");
print $text, "\n";    # ���59-11