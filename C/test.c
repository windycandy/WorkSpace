

#include "stdio.h"
#include "stdbool.h"
#include "string.h"
#define LEN  1000

void main(){
	char a[LEN],b[LEN];
	int len;
	
	inputNumber(a);
	len = strlen(a);
	printf("strlen a = %d\n", len);
	
    inputNumber(b);	
	len = strlen(b);
	printf("strlen b = %d\n", len);
	
	//if(strlen(a)>strlen(b))
	//add(a,b);
    //else
	//add(b,a);	

    scanf("%d",&len);
}

add(char aArray[], char bArray[]){
	    int i;
		for(i = 0 ; i < strlen(bArray); i++ ){
			aArray[i]=aArray[i]-'0'+bArray[i]-'0';
		}
		for(i = strlen(bArray) ; i < strlen(aArray); i++ ){
			aArray[i]=aArray[i]-'0';
		}
		
		int c[strlen(aArray)+1];
		for(i = 0 ; i < strlen(aArray)+1; i++ )c[i]=0;	     
     	
		printf("strlen = %d\n",(int)(strlen(aArray)));
		
		
		
        for(i = 0 ; i < strlen(aArray); i++ )c[i]= aArray[i];		
		
	     for(i = 0 ; i < strlen(aArray)+1; i++ ) 
     	 printf("c = %d\n", c[i]);
		
		
		for(i = 0 ; i < strlen(aArray); i++ ){
			//printf("add %d\n", aArray[i]);	
            if(c[i]<9){
				c[i] = c[i];
			}else{
				printf(">>> i = %d\n", i);
				printf(">>> %d\n", c[i]);
				
				c[i+1]=c[i+1] + c[i]/10;
				c[i] = c[i]%10;
			}			
		}
        outputReslut(c, strlen(aArray)+1);
}


outputReslut(int c[], int length){
	 int n = 0 ,i;
     while(c[length - n -1] ==0)n++;
	 printf("n = %d\n", n);
	 for(i = 0 ; i < length; i++ ) 
	 printf("%d", c[i]);
	 
	 printf("\n");
	 
	 for(i = 0 ; i < length-n; i++ ) 
	 printf("%d", c[length-n-i-1]);
 
     printf("\n");
}


inputNumber(char cArray[]){
	int i =0;
	char input[LEN];
	scanf("%s",input);
	
	printf("strlen cArray = %d\n", (int)strlen(cArray));
	printf("strlen input = %d\n", (int)strlen(input));
	
	for(i; i < strlen(input);i++){
		cArray[i] = input[strlen(input)-1-i];
	}
	printf("strlen cArray = %d\n", (int)strlen(cArray));
}
