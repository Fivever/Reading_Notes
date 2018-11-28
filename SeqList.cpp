#include <cstdio>
#include <cstdlib>

#define ListSize 100
typedef int ElementType;

typedef struct list
{//define the structure of sequence list
    ElementType *data;
    int length;
    const void operator=(const struct list L)
    {
        length=L.length;
        data = (ElementType*)malloc(ListSize*sizeof(ElementType));
        for(int i=0;i<length;i++)
            data[i]=L.data[i];
    }
}SeqList;

void InitList(SeqList &L);//Initialize the sequence list
int FindData(SeqList L, ElementType e);//To find the position of a value
int GetData(SeqList L, int i);//get the ith data in sequence list
void Insert(SeqList &L, int i, ElementType x);//Insert a data to sequence list
void Delete(SeqList &L, ElementType x);//Delete a data in sequence list
void Print(SeqList L);//print the elements of whole sequence
void Union(SeqList &L1, SeqList L2);//return the union of two sequence list
void Intersection(SeqList &L1, SeqList L2);//return the intersection of two sequence list

void InitList(SeqList &L)
{//Initialize the sequence list
    L.data = (ElementType*)malloc(ListSize*sizeof(ElementType));
    if(L.data==NULL)
        printf("Initialize the sequence list failed\n");
    L.length = 0;
}

int FindData(SeqList L, ElementType e)
{//To find the position of a value
    for(int i=0; i<L.length; i++)
        if(L.data[i]==e)
            return i;
    printf("Not found\n");
    return -1;
}

int GetData(SeqList L, int i)
{//get the ith data in sequence list
    if(i<L.length)
        return L.data[i];
    return -1;
}

void Insert(SeqList &L, int i, ElementType x)
{//Insert a data to sequence list
    if(L.length+1<=ListSize && i>=0 && i <=L.length)
    {
        for(int k=L.length-1; k>=i;k--)
            L.data[k+1]=L.data[k];
        L.data[i]=x;
        L.length++;
    }
}

void Delete(SeqList &L, ElementType x)
{//Delete a data in sequence list
    int i=FindData(L,x);
    if(i!=-1)
    {
        for(int k=i; k<L.length-1;k++)
            L.data[k]=L.data[k+1];
            L.length--;
    }
}

void Print(SeqList L)
{//print the elements of whole sequence
    printf("Now the sequence list is:");
    if(L.length>0)
    {
        for(int i=0;i<L.length-1;i++)
            printf("%d ",L.data[i]);
        printf("%d\n",L.data[L.length-1]);
    }
    else printf("The sequence list is empty\n");
}

void Union(SeqList &L1, SeqList L2)
{//return the union of two sequence list
    for(int i=0;i<L2.length;i++)
    {
        int x=GetData(L2,i);
        if(FindData(L1,x)==-1)
        {
            Insert(L1,L1.length,x);
            Print(L1);
        }
    }
}

void Intersection(SeqList &L1, SeqList L2)
{//return the intersection of two sequence list
    for(int i=0;i<L1.length;i++)
    {
        int m=GetData(L1,i);
        if(FindData(L2,m)==-1)
        {
            Delete(L1,m);
            i=-1;
        }
    }
}

int main()
{//test the sequence list data structure
    return 0;
}