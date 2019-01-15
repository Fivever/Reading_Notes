#include <cstdio>
#include <cstdlib>

typedef int ElementType;

typedef struct node
{
    ElementType data;                          
    struct node *prior, *next;     
} DblNode;

DblNode* CreateDblList (DblNode *first)
{//Create the first node of Bidirectional circular linked list
    first = (DblNode*)malloc(sizeof(DblNode));
    if (first == NULL)
    {
        printf("ERROR!\n");
        exit (1);
    }
    first->prior = first->next = first;
    return first;
}

int getLength(DblNode *first)
{//Get the length of list
    DblNode *p = first->next;
    int count = 0;
    while (p != first) 
    {
        p = p->next;
        count++;
    }
    return count;
}

DblNode* Locate(DblNode *first, int i)
{//Locate the ith position in list
    DblNode *p = first->next;
    while(p != first && i)
    {
        p=p->next;
        i--;
    }
    return p;
}

bool Insert (DblNode *first, int i, ElementType x)
{//Insert the x to ith position in list
    DblNode *p = Locate(first, i-1);   
    if (p == first && i != 1) return false;
    DblNode * q = (DblNode*) malloc(sizeof(DblNode));
    q->data = x;
    q->next = p;
    q->prior = p->prior;
    p->prior->next = q;
    p->prior = q;
    return true;
}

bool Delete(DblNode *first, int i)
{//Delete the element in ith position
    DblNode *p = Locate(first,i-1);   
    if (p == first) return 0;
    p->next->prior = p->prior;
    p->prior->next = p->next; 
    free (p);
    return true;
}

void Print(DblNode *first)
{//Print the whole list
    DblNode *p=first->next;
    while(p!=first)
    {
        printf("%d ",p->data);
        p=p->next;
    }
    printf("\n");
}

int main()
{//test the Bidirectional circular linked list
    return 0;
}
