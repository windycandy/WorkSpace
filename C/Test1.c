

#include <stdio.h>
#include <sys/types.h>


int main(int argc,char** argv)
{
    int i ;
    int code_gid1[7][10] = {
                                {11,22,33},
							    {0x42,0x50,0x3F},
							    {0x20,0x40,0x4F},
							    {0x42,0x50,0x7F},
							    {0x20,0x40,0x4F},
							    {0x42,0x50,0x8F},
							    {0x20,0x60,0x1F},
	                            };


	int code_gid1_var[7][10] = {{0x2F},
							    {0x26},
							    {0x26},
							    {0x26},
							    {0x26},
							    {0x2F},
							    {0x2F},
	                            };


	 //for(i = 0; i < 7; ++i)
	 	{
	 		// if (memcmp(code, code_gid1[i], code_len)==0
			// 	&& memcmp(gid1, code_gid1_var[i], 1)==0)
	 		 {
	 		    printf("code_gid1 = %d\n ", code_gid1[0][0]);
               //s printf("code_gid1_var = %d\n ", code_gid1_var[i]);

	 		 	//printf("lock release~~~~");
	 		 }
	 	}


    printf("OVER!");
	return 0;
}
