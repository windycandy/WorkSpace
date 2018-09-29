use Encode;
use Encode::CN; #可写可不写

$dat="测试文本ghkj";
$str=decode("gb2312",$dat);
@chars=split //,$str;
foreach $char (@chars) {
print encode("gb2312",$char),"\n";
print encode("gbk",$char),"\n";
}
