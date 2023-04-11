#include "msglib.c"
#include <stdio.h>


// prints the content of the buffer b in one line
void printbuffer(void *b){
    int i;
    printf("b (%p) = [",b);
    for(i=1;i<bsizeA(b)+1;i++)
	printf("(%lf,%lf);",breadposA(b,1,i),breadposA(b,2,i));
    printf("]\n");
    

}

int main(int argc, char**argv){
    // declaration of the buffers
    void *b1,*b2;
    // messages
    double msg1[2] = {1,2};
    double msg2[2];
    // aux vars
    int i,j;

    // init the buffers
    b1 = initBufferA();
    b2 = initBufferA();

    // insert msg1 into b1
    bputA(msg1,2,b1,0);
    
    printbuffer(b1);
    printbuffer(b2);
    printf("-------------------------\n");

    // modify the value of the msg in b1 from (1,2) to (3,4)
    bwriteposA(b1,3,1,1);
    bwriteposA(b1,4,2,1);
    
    printbuffer(b1);
    printbuffer(b2);
    printf("-------------------------\n");

    // read the position 1 from the msg in b1
    msg2[0] = breadposA(b1,1,1);
    // get position 2 from the msg in b1, and delete it
    msg2[1] = bgetposA(b1,2,1);
    // insert msg2, with its new values, into b2
    bputA(msg2,2,b2,0);
    
    printbuffer(b1);
    printbuffer(b2);
    printf("-------------------------\n");

    // insert msg1 into b2
    bputA(msg1,2,b2,0);
    
    printbuffer(b1);
    printbuffer(b2);
    printf("-------------------------\n");

    // delete buffers
    closeBufferA(b1);
    closeBufferA(b2);
    return 0;
}
