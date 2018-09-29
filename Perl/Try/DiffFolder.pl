#! /usr/bin/perl -w

    use Win32::Sound;
    Win32::Sound::Volume('100%');
    Win32::Sound::Play("C:/sound.wav");
    Win32::Sound::Stop();

    
  use Win32::Shortcut;
  $LINK = Win32::Shortcut->new();
  $LINK->{'Path'} = 'C:\Perl\bin\perl.exe';
  $LINK->{'Description'} = "Target executable";
  $LINK->Save('C:\Users\Administrator\Desktop\perl.lnk');
  $LINK->Close();

  #use Text::Diff;
  #my $diff = diff 'D:\CTK_workspace\TestPl\111.txt', 'D:\CTK_workspace\TestPl\222.txt', { STYLE => "Context" };

  #比较两个文件夹的差异，提取出压缩成zip包
  ###################################################################################
  use File::Find;
  #use Text::Diff;
  use Archive::Zip qw( :ERROR_CODES :CONSTANTS );

  my $OldFolder ='C:\Users\Administrator\Desktop\SalesTracker1';  #旧文件夹路径
  my $NewFolder ='C:\Users\Administrator\Desktop\SalesTrackernew';  #新文件夹路径

  
  my @OldFolderList;

  my @diffList;
  
  
  my $OldFolderName = (split /\\/,$OldFolder)[-1];
  my $NewFolderName = (split /\\/,$NewFolder)[-1];
  
  #print "$OldFolderName", "\n";
  #print "$NewFolderName", "\n";
  
  find \&handOldFolder , $OldFolder;
  sub handOldFolder{
  	   my $temp = $File::Find::name;
  	   $temp =~ s/\//\\/g;
  	   if (-f $temp)
  	   {
  	   	  
  	      push @OldFolderList, $temp;
  	   }
  }
  
  #print "@OldFolderList", "\n";
  
  find \&handNewFolder , $NewFolder;
  sub handNewFolder{
  	
  	   my $temp = $File::Find::name;
  	   $temp =~ s/\//\\/g;
  	    
  	   my $ifnewfile = 0;

  	   
  	   for (@OldFolderList)
  	   {
  	   	    if (-f $temp)  #只处理文件，忽略文件夹
  	   	    {  
  	   	    	my $a =(split /$OldFolderName/,$_)[-1];
  	   	    	my $b =(split /$NewFolderName/,$temp)[-1];
  	   	    	#print "$a", "\n";
  	   	    	#print "$b", "\n";
  	   	    	
  	   	    	if((split /$OldFolderName/,$_)[-1] eq (split /$NewFolderName/,$temp)[-1])
  	   	    	{   
  	   	    		$ifnewfile = 1;
  	   	    		#my $diff = diff $_, $temp, { STYLE => "Context" };
  	   	    		#print $diff,"\n";
  	   	    		#if(length $diff)
  	   	    		{
  	   	    			push @diffList, $temp;
  	   	    		}
  	   	    	}
  	   	    }
  	   }
  	   
  	   if(($ifnewfile == 0) and (-f $temp))  #如果是新增文件
  	   {
  	   	  print "new file\n";
  	   	  push @diffList, $temp;
  	   }
  	   
  }  
  

  if($#diffList +1)
  {
  	 
  	 my $zip = Archive::Zip->new();
   
  	 for (@diffList)
  	 {
  	 	my  $achive_path =(split /$NewFolderName\\/,$_)[-1];
  	 	#print  $achive_path,"\n";
  	 	#这个的压缩包的处理不怎么好，把\\Users\Administrator\Desktop\SalesTrackernew，前面的那些路径也搞进去了
  	 	#my $file_member = $zip->addFile($_);
  	 	#上面问题修改如下就好了，哦也
  	 	my $file_member = $zip->addFile($_,  $achive_path);
  	 	
  	 	print $_,"\n";
  	 }
  	 
  	    #zip包路径
  	   unless ( $zip->writeToFileNamed('C:\Users\Administrator\Desktop\NewZip.zip') == AZ_OK ) 
  	   {
         die 'write error';
       }
  	 
  }
  else  #如果相同
  {
  	 print "All files same\n";
  }
  print "OVER!", "\n";
  
    