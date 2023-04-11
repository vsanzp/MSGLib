/*******************************************************************************************
 Author: 
        Victorino Sanz 
        Dpto. Informática y Automática, UNED
        Juan del Rosal, 16
        28040, Madrid
        Spain
        Email: vsanz@dia.uned.es
        http://www.euclides.dia.uned.es/vsanz

 Licensed by Victorino Sanz under the LGPL-3.0 or later
 Copyright © 2023, Victorino Sanz.

This program is free software: you can redistribute it and/or modify it under the terms of 
the GNU Leaser General Public License as published by the Free Software Foundation, either 
version 3 of the License, or  any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
See the GNU Leaser General Public License for more details.

You should have received a copy of the GNU Leaser General Public License along with this 
program. If not, see <https://www.gnu.org/licenses/>.
*********************************************************************************************/

#ifndef MSGLIB
#define MSGLIB

#define LEN 10 // length of the arrays that represent each message
#define INITMAXSIZE 20 // initial maximum number of messages per buffer (can be reallocated) 
#define INITNDEST 5  // initial maximum number of destinations per buffer

#include <string.h>
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
//#include <ModelicaUtilities.h>
 

typedef struct{
    int max_size; // maximum number of messages (can be extended, only used in reallocs)
    int size; // number of messages stored in the buffer
    double * msgs; // messages
    int ndest; // number of destinations
    void ** dest; // destinations
} bufferR;

// msg node for arrays of msgs
typedef struct msgA{
    int msglen;
    double *msg;
    struct msgA *prev;
    struct msgA *next;
}msgA;

typedef struct{
    int size; // number of messages stored in the buffer
    msgA *msgs; // array of messages
    msgA *last; // reference to last msg
    int ndest; // number of destinations
    void ** dest; // destinations
} bufferA;

/*********************************************************************************/
// constructor functions to initialize a buffer (one function per type) for msgs
// returns void * required by Modelica for external objects

void * initBufferR(){
    bufferR* b = (bufferR*)malloc(sizeof(bufferR));
    b->ndest = 0;
    b->dest = (void**)malloc(INITNDEST*sizeof(void*));
    b->max_size = INITMAXSIZE;
    b->msgs = (double *)malloc(b->max_size*sizeof(double));
    b->size = 0;
    return (void*) b;
}

void * initBufferA(){
    bufferA* b = (bufferA*)malloc(sizeof(bufferA));
    b->ndest = 0;
    b->dest = (void**)malloc(INITNDEST*sizeof(void*));
    b->msgs = NULL;
    b->last = NULL;
    b->size = 0;
    return (void*) b;
}

/*********************************************************************************/
// number of messages stored in the buffer

int bsizeR(void* o){
    bufferR* b = (bufferR*) o;
    return b->size;
}

int bsizeA(void* o){
    bufferA* b = (bufferA*) o;
    return b->size;
}


/*********************************************************************************/
// function to couple two buffers in the direction from o to d (origin to destination)
// d becomes a destination for msgs inserted in o
// each void * references external object


void coupleR(void* o, void* d){
    bufferR* b = (bufferR*) o;
    b->ndest++;
    if (b->ndest > INITNDEST){ // initially allocated memory for five destinations in initBuffer
	b->dest = (void**)realloc(b->dest,b->ndest*sizeof(void*));	
    }
    b->dest[b->ndest-1] = d;
}

void coupleA(void* o, void* d){
    bufferA* b = (bufferA*) o;
    b->ndest++;
    if (b->ndest > INITNDEST){ // initially allocated memory for five destinations in initBuffer
	b->dest = (void**)realloc(b->dest,b->ndest*sizeof(void*));	
    }
    b->dest[b->ndest-1] = d;
}

/*********************************************************************************/
// insert a new msg in the buffer o at a given position mindex (midexes start at 1)
// midex == 0 or negative forces the insertion at the end of the buffer 


void bputR(const double msg, void* o, int mindex){
    bufferR* b = (bufferR*) o;
    int i;
    int index = mindex -1; //modelica first index == 1

    // store msg locally	
    if (b->size == b->max_size){
	b->max_size = b->max_size*2;
	b->msgs = (double*)realloc(b->msgs,b->max_size*sizeof(double));
    }	
    b->size++;
    if (index < 0 || index > b->size-2){ // out of bounds, msg to the end of the buffer
	b->msgs[b->size-1] = msg;
    }else{ // msg to a middle position
	for(i=b->size-1;i>index;i--)
	    b->msgs[i] = b->msgs[i-1];
	b->msgs[index] = msg;
    }
    //    free(r);
}

void bputA(double *msg, size_t len, void* o, int mindex){
    bufferA* b = (bufferA*) o;
    int i,k;
    int index = mindex -1; //modelica first index == 1
    msgA *newm;
    msgA *aux;

    // generate new msgA	
    newm = malloc(sizeof(msgA));
    newm->msglen = len;
    newm->msg = malloc(len*sizeof(double));
    for(i=0;i<len;i++)
	newm->msg[i] = msg[i];
    newm->prev = NULL;
    newm->next = NULL;

    b->size++;
    if (b->size == 1){ // first msg in the buffer
	b->msgs = newm;
	b->last = newm;
    }else{
	if (index == 0){ // msg to the beginning of the buffer
	    b->msgs->prev = newm;
	    newm->next = b->msgs;
	    b->msgs = newm;
	    //b->last = newm;
	}else if (index < 0 || index >= b->size-1){ // out of bounds, msg to the end of the buffer
	    b->last->next = newm;
	    newm->prev = b->last;
	    b->last = newm;
	}else{// msg to a middle position
	    aux = b->msgs;
	    for(i=0;i<index;i++)
		aux = aux->next;
	    aux->prev->next = newm;
	    newm->prev = aux->prev;
	    newm->next = aux;
	    aux->prev = newm;
	}
    }
}




/*************************************************************************************************/
// extract a message from buffer o located at position mindex (mindexes start at 1)
// msg extracted is removed from the buffer

double bgetR(void* o, int mindex){
    bufferR* b = (bufferR*) o;
    double out;
    int i;
    int index = mindex -1;

    if (index >= 0 && index < b->size){
	out = b->msgs[index];
	// reorder msgs in the buffer
	for(i=index;i<b->size;i++){
	    b->msgs[i] = b->msgs[i+1];
	}
	b->size--;
	return out;
    }else
	return 0;
}

double bgetposA(void* o, int mpos, int mindex){
    bufferA* b = (bufferA*) o;
    msgA *out;
    double outpos;
    int i;
    int index = mindex -1;
    int pos = mpos -1;
    
    if (index >= 0 && index < b->size){ // not out of bounds
	if (index == 0){ // first msg
	    out = b->msgs;
	    b->msgs = out->next;
	    out->next = NULL;
	}else if (index == b->size-1){ // last msg
	    out = b->last;
	    b->last = out->prev;
	    b->last->next = NULL;
	    out->prev = NULL;
	}else{ // middle msg
	    out = b->msgs;
	    for(i=0;i<index;i++)
		out = out->next;
	    out->prev->next = out->next;
	    out->next->prev = out->prev;
	    out->next = NULL;
	    out->prev = NULL;
	    
	}
	b->size--;
	outpos = out->msg[pos];
	free(out->msg);
	free(out);
	return outpos;
    }else
	return 0;
}


/******************************************************************************************************/
// read the value of the msg located at mindex in the buffer o
// msgs is not deleted in this case
// in Array buffers only one position of the msg (mpos) is returned

double breadR(void* o, int mindex){
    bufferR* b = (bufferR*) o;
    double out;
    int i;
    int index = mindex -1;

    if (index >= 0 && index < b->size){
	out = b->msgs[index];
    }else{
	out = 0;
    }
    return out;
       
}

double breadposA(void* o, int mpos, int mindex){
    bufferA* b = (bufferA*) o;
    int i;
    int index = mindex -1;
    int pos = mpos -1;
    msgA *out;

    if (index >= 0 && index < b->size){ // not out of bounds
	if (index == 0){ // first msg
	    return b->msgs->msg[pos];
	}else if (index == b->size-1){ // last msg
	    return b->last->msg[pos];
	}else{ // middle msg
	    out = b->msgs;
	    for(i=0;i<index;i++)
		out = out->next;
	    return out->msg[pos];	    
	}
    }else
	return 0;
}

/******************************************************************************************************/
// modify the content of a msg stored in buffer o
// in array buffers, only the mpos position of the msg is modified

double bwriteR(void* o, double newval,int mindex){
    bufferR* b = (bufferR*) o;
    double out;
    int i;
    int index = mindex -1;
    
    if (index >= 0 && index < b->size){
	out = b->msgs[index];
	b->msgs[index] = newval;
    }else{
	out = -1;
    }
    return out;
       
}

double bwriteposA(void* o, double newval, int mpos, int mindex){
    bufferA* b = (bufferA*) o;
    msgA * out;
    int i;
    int index = mindex -1;
    int pos = mpos -1;
    double preval;

    if (index >= 0 && index < b->size){ // not out of bounds
	if (index == 0){ // first msg
	    preval = b->msgs->msg[pos];
	    b->msgs->msg[pos] = newval;
	}else if (index == b->size-1){ // last msg
	    preval =  b->last->msg[pos];
	    b->last->msg[pos] = newval;
	}else{ // middle msg
	    out = b->msgs;
	    for(i=0;i<index;i++)
		out = out->next;
	    preval = out->msg[pos];
	    out->msg[pos] = newval;	    
	}
	return preval;
    }else
	return 0;

    
}



/*********************************************************************************/
// sends msgs stored in buffer o to its destinations
// destinations are defined using the couple function

void bsendR(void* o){
    bufferR* b = (bufferR*) o;
    bufferR* d;
    int i,j,k;
    int rindex;
    //    int index = mindex -1; //modelica first index == 1
    int rmax = 10;
    bufferR** r = (bufferR**)malloc(rmax*sizeof(bufferR*)); // list of destination buffers that also have destinations (for coupled models).
    double *msgs;
    int bsize;

    bsize = bsizeR(o);
    msgs = (double *)malloc(bsize*sizeof(double));
    for (i=0;i<bsize;i++)
	msgs[i] = bgetR(o,1);
    if (b->ndest > 0){// send msg to destinations
	rindex = 0;
	j = 0;
	r[0] = b;
	while(j <= rindex){ // for each buffer in the routing list
	    for (i = 0;i<r[j]->ndest;i++){ // for each destination in the current buffer
		d = (bufferR*)r[j]->dest[i];
		if (d->ndest > 0){// include buffer in routing
		    rindex++;
		    if (rindex == rmax){ // realloc r if index reaches max
			rmax = rmax*2;
			r = (bufferR**)realloc(r,rmax*sizeof(bufferR*));
		    }
		    r[rindex] = d;
		}else // copy message in real destination (not routing)
		    for (k = 0;k<bsize;k++)
			bputR(msgs[k],d,0);		
	    }
	    j++;
	}
    }
    free(msgs);
    free(r);
}

void bsendA(void* o){
    bufferA* b = (bufferA*) o;
    bufferA* d;
    int i,j,k;
    int rindex;
    int rmax = 10;
    bufferA** r = (bufferA**)malloc(rmax*sizeof(bufferA*)); // list of destination buffers that also have destinations (for coupled models).
    double **msgs;
    int *msgsize;
    int bsize;
    msgA *aux;
    
    bsize = bsizeA(o);
    msgs = (double **)malloc(bsize*sizeof(double*));
    msgsize = (int *)malloc(bsize*sizeof(int));
    aux = b->msgs;
    for (i=0;i<bsize;i++){
	msgsize[i] = aux->msglen;
	msgs[i] = (double*)malloc(msgsize[i]*sizeof(double));
	for(j=0;j<msgsize[i]-1;j++){
	    msgs[i][j] = breadposA(o,j+1,1); // read positions of the array
	}
	msgs[i][j] = bgetposA(o,j+1,1); // get last position and remove msg from buffer
	aux = b->msgs;
    }
    
    if (b->ndest > 0){ // send msg to destinations
	rindex = 0;
	j = 0;
	r[0] = b;
	while(j <= rindex){ // for each buffer in the routing list
	    for (i = 0;i<r[j]->ndest;i++){ // for each destination in the current buffer
		d = (bufferA*)r[j]->dest[i];
		if (d->ndest > 0){// include buffer in routing
		    rindex++;
		    if (rindex == rmax){ // realloc r if index reaches max
			rmax = rmax*2;
			r = (bufferA**)realloc(r,rmax*sizeof(bufferA*));
		    }
		    r[rindex] = d;
		}else{ // copy messages to the real destination (not routing)
		    for (k = 0;k<bsize;k++)
			bputA(msgs[k],msgsize[k],d,0);		
		}
	    }
	    j++;
	}
    }
    for(i=0;i<bsize;i++)
	free(msgs[i]);
    free(msgs);
    free(msgsize);
    free(r);
}


/*********************************************************************************/
// destructor function for the buffer
// call from Modelica, passing void * as a reference to external object

void closeBufferR(void* o){
	bufferR* b = (bufferR*) o;
	free(b->msgs);
	free(b->dest);
	free(b);
}

void closeBufferA(void* o){
    int i,n;
    
    bufferA* b = (bufferA*) o;
    n = bsizeA(o);
    for(i=0;i<n;i++)
	bgetposA(o,1,1);
    free(b->dest);
    free(b);
}






#endif










