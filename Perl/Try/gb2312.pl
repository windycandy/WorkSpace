use Encode;
use Encode::CN; #��д�ɲ�д

$dat="�����ı�ghkj";
$str=decode("gb2312",$dat);
@chars=split //,$str;
foreach $char (@chars) {
print encode("gb2312",$char),"\n";
print encode("gbk",$char),"\n";
}
