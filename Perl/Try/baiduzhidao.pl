#! /usr/bin/perl


 use LWP::Simple;
 use Encode;
 
 my $targetfile = "C:/Users/Administrator/Desktop/123.txt";
 open(TARGETHANDLE, ">".$targetfile);
 
 my $url='http://www.baidu.com/s?wd=֪��';
 my $content = get $url;
 

 
 while($content =~ /(\<h3[^\>]*?\>(.+?)\<\/h3\>)/ig)  #�Ȱ�h3��ǩȡ����
 {        
 	my $x = $2;    
 	$x =~ s/\<[^\>]*?\>//g;   #��ȥ�����е�html��ǩ        
 	print  encode("gb2312",$x),"\n";    #ʣ�µľ��Ǳ����������
 	#print TARGETHANDLE encode("utf-8",decode("utf-8",$content));
 	#print TARGETHANDLE $content;
}