$number = join('-', (1..1));   


@array = qw(
周瑞运
王志利
秦珊珊
向玮
李俊
郑文土
曾明星
刘朋华
杨昌虎
易星
李道明
何超
吴昌志
唐发庆
何毅敏
梁振
邱刚
邓理贵
李刚Gavin
刘鹏程
解智
董银
张吉猛
曾锦标
王敏
张艳
苏海龙
黄建辉
黄少鹏
张亚强
杨帆
谢喜军
刘洋
肖业
周卫
段祖光
张武一
黄天送
陈石慧
陈祥
田乐
周艳
王聪
李健
陆章柱
宋阳
吴建兵
徐明
宇文琛
侯健
汤俊
简志威
刘建海
曾科
周游
兰小标
);

%hash=(
);

foreach $k (@array)
{
      #print $k,"\n";
      $hash{$k} =0; 
}

foreach $key(sort keys %hash)  
{  
	print $key; 
	print $hash{$key}; 
	print "\n"; 
} 



