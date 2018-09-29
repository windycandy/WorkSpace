use DBI;

#adb shell input tap x y
#adb shell input keyevent b


$TIME = 10000;
$n =0;

#-----------------------------------------------------------------------------
if(0){
	for($n = 0; $n <= $TIME; ){
		print  "��",$n,"��","\n";
		`adb shell input tap 230 20`;
		
		sleep(1);
		$n ++  
	}
}

#-----------------------------------------------------------------------------

for($n = 0; $n <= $TIME; ){
	
print  "��",$n,"��","\n";
	
`adb shell input tap 192 192`;
sleep(2);
`adb shell input tap 236 780`;
sleep(3);
`adb shell input tap 48 790`;
sleep(1);
`adb shell input tap 48 790`;
sleep(2);
`adb shell input keyevent 3`;

$n ++  
}




