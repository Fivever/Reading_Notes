#include <cstdio>
#include <cstdlib>

typedef int ElementType;

typedef struct Node
{   ElementType data;
    struct Node *next;
}LinkNode;

typedef struct
{   LinkNode *top;
    int length;
}LinkStack;

void InitStack(LinkStack &S);//Initialize the sequence stack
void Push(LinkStack &S, ElementType x);//push a value to the top of stack
bool Pop(LinkStack &S);//delete the top value of stack
ElementType GetTop(LinkStack S);//return the top value of stack
void Print(LinkStack S);//print all the elements of stack

void InitStack(LinkStack &S)
{//Initialize the sequence stack
    S.top = NULL;
    S.length = 0;
}

void Push(LinkStack &S, ElementType e)
{//push a value to the top of stack
    LinkNode *p = (LinkNode*)malloc(sizeof(LinkNode));
    if(!p) exit(1);
    p -> data = e;
    p -> next = S.top;
    S.top = p;
    ++S.length;
}

bool Pop (LinkStack &S)
{//delete the top value of stack
    if (!S.top)
        return false;
    else
    {
        LinkNode *q = S.top;
        S.top = S.top->next;
        --S.length;
        delete q;
        return true;
    }
}

ElementType GetTop(LinkStack S)
{//return the top value of stack
    if(S.top==NULL)
        return 0;
    return S.top->data;
}

void Print(LinkStack S)
{//print all the elements of stack
    LinkNode *p = S.top;
    while(p!=NULL)
    {
        printf("%d ",p->data);
        p=p->next;
    }
    printf("\n");
}

int main()
{//test the sequence stack
}
