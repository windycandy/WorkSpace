#! /usr/bin/perl


 use LWP::Simple;
 use Encode;
 
 my $targetfile = "C:/Users/Administrator/Desktop/123.txt";
 open(TARGETHANDLE, ">".$targetfile);
 
 my $url='http://www.baidu.com/s?wd=知道';
 my $content = get $url;
 

 
 while($content =~ /(\<h3[^\>]*?\>(.+?)\<\/h3\>)/ig)  #先把h3标签取出来
 {        
 	my $x = $2;    
 	$x =~ s/\<[^\>]*?\>//g;   #再去掉所有的html标签        
 	print  encode("gb2312",$x),"\n";    #剩下的就是标题的内容了
 	#print TARGETHANDLE encode("utf-8",decode("utf-8",$content));
 	#print TARGETHANDLE $content;
}