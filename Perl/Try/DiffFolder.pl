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

  #�Ƚ������ļ��еĲ��죬��ȡ��ѹ����zip��
  ###################################################################################
  use File::Find;
  #use Text::Diff;
  use Archive::Zip qw( :ERROR_CODES :CONSTANTS );

  my $OldFolder ='C:\Users\Administrator\Desktop\SalesTracker1';  #���ļ���·��
  my $NewFolder ='C:\Users\Administrator\Desktop\SalesTrackernew';  #���ļ���·��

  
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
  	   	    if (-f $temp)  #ֻ�����ļ��������ļ���
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
  	   
  	   if(($ifnewfile == 0) and (-f $temp))  #����������ļ�
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
  	 	#�����ѹ�����Ĵ�����ô�ã���\\Users\Administrator\Desktop\SalesTrackernew��ǰ�����Щ·��Ҳ���ȥ��
  	 	#my $file_member = $zip->addFile($_);
  	 	#���������޸����¾ͺ��ˣ�ŶҲ
  	 	my $file_member = $zip->addFile($_,  $achive_path);
  	 	
  	 	print $_,"\n";
  	 }
  	 
  	    #zip��·��
  	   unless ( $zip->writeToFileNamed('C:\Users\Administrator\Desktop\NewZip.zip') == AZ_OK ) 
  	   {
         die 'write error';
       }
  	 
  }
  else  #�����ͬ
  {
  	 print "All files same\n";
  }
  print "OVER!", "\n";
  
    