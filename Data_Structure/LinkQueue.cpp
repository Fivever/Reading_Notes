#include <cstdio>
#include <cstdlib>

typedef int ElementType;

typedef struct Node
{
    ElementType data;
    struct Node *next;
}QueueNode;

typedef struct
{
	QueueNode *front;
    QueueNode *rear;
}LinkQueue;

void InitQueue(LinkQueue &Q);//initialize the queue
void DestroyQueue(LinkQueue &Q);//destroy the link queue
void EnQueue(LinkQueue &Q, ElementType x);//push the element to the end of queue
void DeQueue(LinkQueue &Q);//pop the first element in the queue
ElementType GetFront(LinkQueue Q);//return the first element in the queue
void Print(LinkQueue Q);//print all the elements of link queue

void InitQueue(LinkQueue &Q)
{//initialize the queue
    Q.front=Q.rear=(QueueNode*)malloc(sizeof(QueueNode));  
     if (!Q.front) exit(0);
           Q.front->next=NULL;
}

void DestroyQueue(LinkQueue &Q)
{//destroy the link queue
    while(Q.front)
    {
        Q.rear = Q.front->next;
        free(Q.front);
	    Q.front = Q.rear;   
    }
}

void EnQueue(LinkQueue &Q, ElementType x)
{//push the element to the end of queue
    QueueNode *p=(QueueNode*)malloc(sizeof(QueueNode));
    p->next=NULL;
    Q.rear->next=p;
    p->data=x;
    Q.rear=p;
}

void DeQueue(LinkQueue &Q)
{//pop the first element in the queue
    QueueNode *p=Q.front->next;
    Q.front->next=p->next;
    free(p);
}

ElementType GetFront(LinkQueue Q)
{//return the first element in the queue
    if(Q.rear!=Q.front)
        return Q.front->next->data;
}

void Print(LinkQueue Q)
{//print all the elements of link queue
    QueueNode *p=Q.front;
    while(p->next->next!=NULL)
    {
        p=p->next;
        printf("%d ",p->data);
    }
    printf("%d\n",p->next->data);
}

int main()
{//test the link queue
}
