#include <cstdio>
#include <cstdlib>
#include <cstring>
using namespace std;

const int EdgesNum = 50;
const int VerticesNum = 10;
typedef int VertexData;
typedef int EdgeData;

typedef struct
{//Using a matrix to implement a graph
    EdgeData Edge[VerticesNum][VerticesNum];
    bool visited[VerticesNum];
    int v, e;
}MTGraph;       

typedef struct node
{//each adjacent list
    VertexData v;
    EdgeData cost;
    struct node *next;
}EdgeNode;
 
typedef struct
{//Using a adjacent list to implement a graph
    EdgeNode *VexList[VerticesNum];
    bool visited[VerticesNum];
    int v, e;
}AdjGraph;

void CreateGraph(AdjGraph &AG, MTGraph &MG)
{//Initialize both of adjacent graph and matrix graph
    int ta,tb,wt;
    scanf("%d%d",&AG.v,&AG.e);
    MG.e=AG.e, MG.v=AG.v;
    memset(MG.Edge,0,sizeof(MG.Edge));
    for(int i=0;i<AG.v;i++)
    {
        AG.VexList[i]=(EdgeNode*)malloc(sizeof(EdgeNode));
        AG.VexList[i]->next=NULL, AG.VexList[i]->v=i;
        AG.visited[i]=false;
        MG.visited[i]=false;
    }
    for(int i=0;i<MG.e;i++)
    {
        scanf("%d%d%d",&ta,&tb,&wt);
        MG.Edge[ta][tb]=wt;   
        EdgeNode *p=AG.VexList[ta];
        p->v=ta, p->cost=0;
        while(p->next!=NULL)
            p=p->next;
        p->next=(EdgeNode*)malloc(sizeof(EdgeNode));
        p->next->v=tb, p->cost=wt;
        p->next->next=NULL;
    }
}

void DFS_MTGraph(MTGraph &MG, int v0)
{//depth first search on matrix graph
    MG.visited[v0]=true;
    printf("->%d",v0);
    for(int j=0;j<MG.v;j++)
    {
        if(MG.Edge[v0][j] && !MG.visited[j])
        {
            MG.visited[j]=true;
            DFS_MTGraph(MG, j);
        }
    }
}

void DFS_AdjGraph(AdjGraph &AG, int v0)
{//depth first search on adjacent graph
    EdgeNode *p=AG.VexList[v0];
    while(p!=NULL)
    {
        if(!AG.visited[p->v])
        {
            printf("->%d",p->v);
            AG.visited[p->v]=true;
            DFS_AdjGraph(AG, p->v);
        }
        else
            p=p->next;
    }
}

void BFS_MTGraph(MTGraph &MG)
{//breadth first search on matrix graph
    int q[MG.v+1];
    int head=0, tail=0;
    q[tail++]=0, MG.visited[0]=true;
    while(head<tail)
    {
        int v=q[head++];
        printf("->%d",v);
        for(int j=0;j<MG.v;j++)
            if(MG.Edge[v][j] && !MG.visited[j])
                q[tail++]=j, MG.visited[j]=true;
    }
}

void BFS_AdjGraph(AdjGraph &AG)
{//breadth first search on adjacent graph
    int q[AG.v+1];
    int head=0, tail=0;
    q[tail++]=0, AG.visited[0]=true;
    while(head<tail)
    {
        int v=q[head++];
        printf("->%d",v);
        EdgeNode *p=AG.VexList[v];
        while(p!=NULL)
        {
            if(!AG.visited[p->v])
                q[tail++]=p->v, AG.visited[p->v]=true;
            p=p->next;
        }
    }
}

void Print_AdjGraph(AdjGraph AG)
{//Print the adjacent graph
    for(int i=0;i<AG.v;i++)
    {
        EdgeNode *p=AG.VexList[i];
        while(p!=NULL)
        {
            printf("->%d",p->v);
            p=p->next;
        }
        printf("\n");
    }
}

void Print_MTGraph(MTGraph MG)
{//Print the matrix graph
    for(int i=0;i<MG.v;i++)
    {
        printf("->%d",i);
        for(int j=0;j<MG.v;j++)
        {
            if(MG.Edge[i][j])
                printf("->%d",j);
        }
        printf("\n");
    }
}

void Prim_MTGraph(MTGraph &MG)
{//prim algorithm implement based on matrix graph
    int minn, t=0;
    bool ok;
    for(int i=t;i<MG.v;i++)
    {
        i=t,ok=false;
        MG.visited[i]=true;
        minn = 0x3f3f3f;
        for(int j=0;j<MG.v;j++)
        {
            if(MG.Edge[i][j] && MG.Edge[i][j]<minn && !MG.visited[j])
                minn=MG.Edge[i][j], t=j, ok=true;
        }
        if(ok)
            printf("(%d,%d,%d) ",i,t,minn);
        else
        {
            printf("\n");
            return;
        }
    }
}

int main()
{//test both of adjacent graph and matrix graph
    AdjGraph AG;
    MTGraph MG;
    /*To test dfs and bfs algorithm, Sample Input:
    9 8 0 3 1 0 2 1 0 1 1 1 4 1 4 6 1 2 5 1 5 7 1 7 8 1
    To test prim algorithm: Sample Input:
    7 18 0 1 28 1 2 16 2 3 12 0 5 10 5 4 25 4 3 22 1 6 14 3 6 18 4 6 24 
        1 0 28 2 1 16 3 2 12 5 0 10 4 5 25 3 4 22 6 1 14 6 3 18 6 4 24*/
    CreateGraph(AG,MG);
}
