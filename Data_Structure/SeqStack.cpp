#include <cstdio>
#include <cstdlib>

typedef int ElementType;
#define StackSize 100

typedef struct
{
    ElementType* data;
    int top;
}SeqStack;

void InitStack(SeqStack &S);//Initialize the sequence stack
void Push(SeqStack &S, ElementType x);//push a value to the top of stack
void Pop(SeqStack &S);//delete the top value of stack
ElementType GetTop(SeqStack S);//return the top value of stack
void Print(SeqStack S);//print all the elements of stack

void InitStack(SeqStack &S)
{//Initialize the sequence stack
    S.data=(ElementType*)malloc(StackSize*sizeof(ElementType));
    S.top=-1;
}

void Push(SeqStack &S, ElementType x)
{//push a value to the top of stack
    if(S.top<StackSize)
    {
        S.top++;
        S.data[S.top]=x;
    }
}

void Pop(SeqStack &S)
{//delete the top value of stack
    if(S.top>0)
        S.top--;
}

ElementType GetTop(SeqStack S)
{//return the top value of stack
    return S.data[S.top];
}

void Print(SeqStack S)
{//print all the elements of stack
    for(int i=S.top;i>0;i--)
        printf("%d ",S.data[i]);
    printf("%d\n",S.data[0]);
}

int main()
{//test the sequence stack
}
