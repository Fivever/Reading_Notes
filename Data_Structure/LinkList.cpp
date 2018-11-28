#include <cstdio>
#include <cstdlib>

typedef int ElementType;

typedef struct node
{//define the structure of link list
    ElementType data;
    struct node *next;
}ListNode;

void Insert(ListNode *L, int i, ElementType x);//Insert a data to link list
ListNode* CreateList();//Create a link list
int FindData(ListNode* L, ElementType e);//To find the position of value e
int GetData(ListNode *L, int i);//get the ith data in link list
void Delete(ListNode *L, ElementType x);//Delete a data in link list
int Length(ListNode *L);//get the length of link list
void Print(ListNode *L);//print the elements of whole link list

void Insert(ListNode *L, int i, ElementType x)
{//Insert a data to link list
    int k=1;
    while(k<i && L!=NULL)
        L=L->next, k++;
    if(k>=i)
    {
        ListNode *p=(ListNode*)malloc(sizeof(ListNode));
        ListNode *q=L->next;
        L->next=p;
        p->next=q;
        p->data=x;
    }
    else
        printf("Insert failed\n");
}

ListNode* CreateList()
{//Create a link list
    int cnt, x;
    ListNode *L=(ListNode*)malloc(sizeof(ListNode));
    printf("Please input the length of the list:");
    scanf("%d",&cnt);
    printf("Please input the elements of the list:");
    for(int i=0;i<cnt;i++)
    {
        scanf("%d",&x);
        Insert(L,i+1,x);
    }
    return L;
}

int FindData(ListNode* L, ElementType e)
{//To find the position of value e
    int i=1;
    while(L->next!=NULL)
        if(L->next->data==e)
            return i;
        else i++, L=L->next;
    printf("Not found\n");
    return -1;
}

int GetData(ListNode *L, int i)
{//get the ith data in link list
    int k=1;
    while(k<=i && L!=NULL)
        L=L->next, k++;
    if(k>i)
        return L->data;
    else
    printf("The ith data doesn't exist\n");
    return -1;
}

void Delete(ListNode *L, ElementType x)
{//Delete a data in link list
    while(L->next!=NULL)
        if(L->next->data==x)
            break;
    if(L->next!=NULL)
    {
        ListNode *p=L->next;
        L->next=p->next;
        free(p);
    }
    else
        printf("The data doexn't exist\n");
}

int Length(ListNode *L)
{//get the length of link list
    int cnt=0;
    while(L->next!=NULL)
        cnt++, L=L->next;
    return cnt;
}

void Print(ListNode *L)
{//print the elements of whole link list
    L=L->next;
    while(L->next!=NULL)
    {
        printf("%d ",L->data);
        L=L->next;
    }
    printf("%d\n",L->data);
}

int main()
{//test the link list
    return 0;
}
