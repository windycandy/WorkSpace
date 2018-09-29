


$i = 5000;


for ($j=0; $j<=$i;$j++){
	
	if($j%2==0){
	   `adb shell input tap 155 200`;
	}
	else{
	    `adb shell input tap 155 1000`;
	}

	
	sleep 1;
	
	
	`adb shell input tap 347 1175`;
	
	print $j, "\n";
	
	sleep 1;

	
}