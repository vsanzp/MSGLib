#include "msglib.c"
#include <stdio.h>


// prints the content of the buffer b in one line
void printbuffer(void *b){
    int i;
    printf("b (%p) = [",b);
    for(i=1;i<bsizeR(b)+1;i++)
	printf("%lf;",breadR(b,i));
    printf("]\n");
    

}

int main(int argc, char**argv){
    // declaration of the buffers
    void *b1,*b2;
    // messages
    double msg;
    // aux vars
    int i,j;

    // init the buffers
    b1 = initBufferR();
    b2 = initBufferR();

    // insert msg1 into b1
    bputR(1,b1,0);
    
    printbuffer(b1);
    printbuffer(b2);
    printf("-------------------------\n");

    // modify the value of the msg in b1 from (1,2) to (3,4)
    bwriteR(b1,2,1);
     
    printbuffer(b1);
    printbuffer(b2);
    printf("-------------------------\n");

    // read the position 1 from the msg in b1
    msg = breadR(b1,1);
    // get position 2 from the msg in b1, and delete it
    // insert msg2, with its new values, into b2
    bputR(msg,b2,0);
    
    printbuffer(b1);
    printbuffer(b2);
    printf("-------------------------\n");

    // insert msg1 into b2
    bputR(3,b2,0);
    
    printbuffer(b1);
    printbuffer(b2);
    printf("-------------------------\n");

    // delete buffers
    closeBufferR(b1);
    closeBufferR(b2);
    return 0;
}
