#include <cstdio>
#include <cstdlib>

typedef int ElementType;
#define STACKSIZE 100
#define STACKINCREMENT 10

typedef struct
{
    ElementType *top, *base;
    int StackSize;
}SeqStack;

void InitStack(SeqStack &S);//Initialize the sequence stack
bool Push(SeqStack &S, ElementType x);//push a value to the top of stack
bool Pop(SeqStack &S);//delete the top value of stack
ElementType GetTop(SeqStack S);//return the top value of stack
void Print(SeqStack S);//print all the elements of stack

void InitStack(SeqStack &S)
{//Initialize the sequence stack
    S.base=(ElementType*)malloc(STACKSIZE*sizeof(ElementType));
    S.top=S.base;
    S.StackSize = STACKSIZE;
}

bool Push(SeqStack &S, ElementType x)
{//push a value to the top of stack
    if (S.top-S.base>=S.StackSize)
    {
        S.base=(ElementType*)realloc(S.base,(S.StackSize+STACKINCREMENT)*sizeof(ElementType));  
        if(!S.base) exit(-1);
        S.top=S.base+S.StackSize;
        S.StackSize+=STACKINCREMENT;
    }
    *S.top++=x;
    return true;
}

bool Pop(SeqStack &S)
{//delete the top value of stack
    if (S.top == S.base)
        return false;  
    --S.top;
    return true;
}

ElementType GetTop(SeqStack S)
{//return the top value of stack
    return *(S.top-1);
}

void Print(SeqStack S)
{//print all the elements of stack
    for(ElementType *i=S.top-1; i!=S.base; i--)
        printf("%d ",*i);
    printf("%d\n",*S.base);
}

int main()
{//test the sequence stack
}
