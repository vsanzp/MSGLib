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
    // declaration of three buffers
    void *origin,*route,*dest;
    // messages
    double msg1 = 1;
    double msg2 = 2;
    double msg3 = 3;
    // aux vars
    int i,j;

    // init the buffers
    origin = initBufferR();
    route = initBufferR();
    dest = initBufferR();

    // define the structure of couplings
    // origin -> route -> dest
    coupleR(origin,route);
    coupleR(route,dest);

    // insert msg1 and msg1 in origin
    bputR(msg1,origin,0);
    bputR(msg2,origin,0);
    // insert msg3 in route
    bputR(msg3,route,0);

    printbuffer(origin);
    printbuffer(route);
    printbuffer(dest);
    printf("-------------------------\n");

    // send msgs at origin
    bsendR(origin);

    printbuffer(origin);
    printbuffer(route);
    printbuffer(dest);
    printf("-------------------------\n");

    // send msgs at route
    bsendR(route);

    printbuffer(origin);
    printbuffer(route);
    printbuffer(dest);
    printf("-------------------------\n");

    // delete buffers
    closeBufferR(origin);
    closeBufferR(route);
    closeBufferR(dest);
    return 0;
}
