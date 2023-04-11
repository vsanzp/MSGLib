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
    // declaration of three buffers
    void *origin,*route,*dest;
    // messages
    double msg1[2] = {1,2};
    double msg2[2] = {3,4};
    double msg3[2] = {5,6};
    // aux vars
    int i,j;

    // init the buffers
    origin = initBufferA();
    route = initBufferA();
    dest = initBufferA();

    // define the structure of couplings
    // origin -> route -> dest
    coupleA(origin,route);
    coupleA(route,dest);

    // insert msg1 and msg1 in origin
    bputA(msg1,2,origin,0);
    bputA(msg2,2,origin,0);
    // insert msg3 in route
    bputA(msg3,2,route,0);

    printbuffer(origin);
    printbuffer(route);
    printbuffer(dest);
    printf("-------------------------\n");

    // send msgs at origin
    bsendA(origin);

    printbuffer(origin);
    printbuffer(route);
    printbuffer(dest);
    printf("-------------------------\n");

    // send msgs at route
    bsendA(route);

    printbuffer(origin);
    printbuffer(route);
    printbuffer(dest);
    printf("-------------------------\n");

    // delete buffers
    closeBufferA(origin);
    closeBufferA(route);
    closeBufferA(dest);
    return 0;
}
