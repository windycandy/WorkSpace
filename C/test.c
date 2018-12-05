

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{

   char *description;

   description = (char *)malloc( 200 * sizeof(char) );
   if( description == NULL )
   {
      fprintf(stderr, "Error - unable to allocate required memory\n");
   }
   else
   {
      strcpy( description, "Zara ali a DPS student in class 10th");
   }

   printf("Description: %s\n", description );
}
