#include <cstdio>
#include <cstdlib>

typedef int ElementType;

#define  MAXSIZE 100
typedef struct
{
    ElementType *base;
    int front;
    int rear;
}SeqQueue;

bool InitQueue(SeqQueue &Q);//Initialize the queue
bool EnQueue(SeqQueue &Q, ElementType e);//Put the element in queue
bool DeQueue(SeqQueue  &Q);//Put the element off queue
void Print(SeqQueue Q);//Print the elements in queue

bool InitQueue(SeqQueue &Q)
{//Initialize the queue
    Q.base=(ElementType*)malloc(MAXSIZE*sizeof (ElementType));
    if (!Q.base) exit(1);
    Q.front = Q.rear = 0; 
    return true;
}

bool EnQueue(SeqQueue &Q, ElementType e)
{//Put the element in queue
    if ((Q.rear+1)%MAXSIZE==Q.front)
	    return 0;
    Q.base[Q.rear] = e;
    Q.rear= (Q.rear+1)%MAXSIZE;
    return true;
}

bool DeQueue(SeqQueue  &Q)
{//Put the element off queue
    if(Q.rear==Q.front) return false;   
    Q.front= (Q.front+1)%MAXSIZE;
    return true;
}

void Print(SeqQueue Q)
{//Print the elements in queue
    for(int i=Q.front; i<Q.rear; i++)
        printf("%d ",Q.base[i]);
    printf("\n");
}

int main()
{//test the sequence stack
}
