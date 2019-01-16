#include <cstdio>
#include <cstdlib>

typedef int ElementType;

typedef struct node
{
    ElementType data; 
    struct node *leftChild, *rightChild;
} BinTreeNode;

void PreOrder (BinTreeNode *T)
{//前序遍历
    if (T != NULL)
    {
        printf("%d ",T->data);
        PreOrder(T->leftChild);
        PreOrder(T->rightChild);
    }
}

void InOrder (BinTreeNode *T)
{//中序遍历
    if (T != NULL)
    {
        InOrder (T->leftChild);
        printf("%d ",T->data);
        InOrder(T->rightChild);
    }
}
void PostOrder(BinTreeNode *T)
{//后序遍历
    if (T != NULL)
    {
        PostOrder(T->leftChild);
        PostOrder(T->rightChild);
        printf("%d ",T->data);
    }
}

BinTreeNode* CreateBinTree(BinTreeNode *T)
{//Create binary tree
    int x;
    scanf("%d",&x);
    if (x==0) T=NULL;
    else
    {
        T=(BinTreeNode*)malloc(sizeof(BinTreeNode));
        T->data = x;
        T->leftChild=CreateBinTree(T->leftChild);
        T->rightChild=CreateBinTree(T->rightChild);
    }
   return T;
}

int Node_Count (BinTreeNode *T)
{//count the number of nodes
    if (T == NULL) return 0;
    else
        return 1 + Node_Count(T->leftChild) + Node_Count(T->rightChild);
}

int Leaf_Count(BinTreeNode *T)
 {//count the number of leaves
	if(!T) return 0;
 	else if(!T->leftChild && !T->rightChild) return 1;
    else return Leaf_Count(T->leftChild)+Leaf_Count(T->rightChild);
}

int getHeight(BinTreeNode *T) 
{//get the height of tree
    if ( T == NULL ) return 0;
    else
    {
	    int m = getHeight(T->leftChild);
	    int n = getHeight(T->rightChild); 
	    return (m > n) ? m+1 : n+1;
	} 
}

BinTreeNode* Copy( BinTreeNode * T ) 
{//copy the same tree
	if ( T == NULL ) return NULL;
	BinTreeNode *Temp=(BinTreeNode *)malloc(sizeof(BinTreeNode)); 
	Temp->data=T->data;
	Temp->leftChild = Copy(T->leftChild); 
	Temp->rightChild = Copy(T->rightChild);
    return Temp;
}

bool isEqual( BinTreeNode *a, BinTreeNode *b)
{//compare twe binary trees
     if (a == NULL && b == NULL) return 1;
     if (a != NULL && b != NULL && a->data==b->data 
        && isEqual( a->leftChild, b->leftChild)
	    && isEqual( a->rightChild, b->rightChild)) 
	    return true;
    return false;
}

int main()
{//test the binary tree
}
