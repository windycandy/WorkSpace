 #!perl -w
 
 my %hash_a;
 my %hash_b;
 
 $a = "D:/CTK_workspace/TestPl/perlcn05/a.txt";
 $b = "D:/CTK_workspace/TestPl/perlcn05/b.txt";
 $c = "D:/CTK_workspace/TestPl/perlcn05/c.txt";
 
 open (HANDLE_A ,$a);
 open (HANDLE_B ,$b);
 open (HANDLE_C ,">".$c);
 
 @content_a  = <HANDLE_A>;
 @content_b  = <HANDLE_B>;
 
 
 for (@content_a)
 {
    chomp($_); #去掉回车
    my @aArr = split;
 	$hash_a{$aArr[0]} = $_;
 }
 
 for (@content_b)
 {
    chomp($_); #去掉回车
    my @bArr = split;
 	
 	if(exists $hash_a{$bArr[0]}){
    print HANDLE_C $hash_a{$bArr[0]}." ".$bArr[1]."\n";
 }
 }
 
 close HANDLE_A;
 close HANDLE_B;
 close HANDLE_C; 
  
  
 
 
 