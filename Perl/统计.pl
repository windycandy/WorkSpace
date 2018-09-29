#! /usr/bin/perl
use LWP::Simple;
use Encode;
use Win32::OLE qw(in with);

#使用Excel，不支持wps


#bugzilla 账户要统计的联系人
@array = qw(
yin.dong
zuguang.duan
wuyi.zhang
faqing.tang
ke.zeng
penghua.liu
changzhi.wu

jun.li
);

$cf_subprj  = "RLC01A-S00A_M";#TOUCH01A-S00A;
$product="RLC01A_M";

$cf_subprj  = "TOUCH01A-S00A";
$product="TOUCH01A";


$cf_subprj  = "RLC05A-S00H";#TOUCH01A-S00A;
$product="RLC05A_M";

sub getbug{
	$key = @_[0];
	#print $key,"\n";   
	
	$total = 0, $fixed = 0;
	$TotalUrl="http://10.240.3.155/bugzilla/buglist.cgi?cf_subprj=$cf_subprj&list_id=224872&bug_severity=%E4%B8%80%E8%88%AC&bug_severity=%E4%B8%A5%E9%87%8D&bug_severity=%E8%87%B4%E5%91%BD&bug_severity=%E8%BD%BB%E5%BE%AE&classification=smartphone&emailtype1=substring&emailassigned_to1=1&query_format=advanced&bug_status=New&bug_status=Assigned&bug_status=Open&bug_status=Pending&bug_status=Feedback&bug_status=In-Progress&bug_status=Reopen&bug_status=RESOLVED&bug_status=VERIFIED&bug_status=Close&bug_status=FB-Close&email1=$key%40ck-telecom.com&product=$product";
	#$TotalUrl="http://10.240.3.155/bugzilla/buglist.cgi?cf_subprj=&list_id=224872&bug_severity=%E4%B8%80%E8%88%AC&bug_severity=%E4%B8%A5%E9%87%8D&bug_severity=%E8%87%B4%E5%91%BD&bug_severity=%E8%BD%BB%E5%BE%AE&emailtype1=substring&emailassigned_to1=1&query_format=advanced&bug_status=New&bug_status=Assigned&bug_status=Open&bug_status=Pending&bug_status=Feedback&bug_status=In-Progress&bug_status=Reopen&bug_status=RESOLVED&bug_status=VERIFIED&bug_status=Close&bug_status=FB-Close&email1=$key&product=RLC01A_M";
	my $Totalcontent = get $TotalUrl;
	#print $Totalcontent,"\n";  	 
	 
	while($Totalcontent =~ /((?<=<span class="bz_result_count">)\d+)/g) {        
	 	$total = $1; 
	}
	while($Totalcontent =~ /(.+One bug found.)/g) {        
	 	$total = 1;   
	}
	
	my $FixedUrl = "http://10.240.3.155/bugzilla/buglist.cgi?cf_subprj=$cf_subprj&list_id=224874&bug_severity=%E4%B8%80%E8%88%AC&bug_severity=%E4%B8%A5%E9%87%8D&bug_severity=%E8%87%B4%E5%91%BD&bug_severity=%E8%BD%BB%E5%BE%AE&classification=smartphone&emailtype1=substring&emailassigned_to1=1&query_format=advanced&bug_status=RESOLVED&bug_status=VERIFIED&bug_status=Close&bug_status=FB-Close&email1=$key%40ck-telecom.com&product=$product";
	#my $FixedUrl = "http://10.240.3.155/bugzilla/buglist.cgi?cf_subprj=RLC01A-S00A_M&list_id=224874&bug_severity=%E4%B8%80%E8%88%AC&bug_severity=%E4%B8%A5%E9%87%8D&bug_severity=%E8%87%B4%E5%91%BD&bug_severity=%E8%BD%BB%E5%BE%AE&emailtype1=substring&emailassigned_to1=1&query_format=advanced&bug_status=RESOLVED&bug_status=VERIFIED&bug_status=Close&bug_status=FB-Close&email1=$key&product=RLC01A_M";
	
	my $Fixedcontent = get $FixedUrl;   
	 
	while($Fixedcontent =~ /((?<=<span class="bz_result_count">)\d+)/g) {        
	 	$fixed = $1;   
	}	
	while($Fixedcontent =~/(.+One bug found.)/g) {        
	 	$fixed = 1;
	}	
	
	
	print $key, " " x 10, $total , "  ", $fixed, "\n";   
}



foreach $k (@array) 
{
	getbug $k;
}
