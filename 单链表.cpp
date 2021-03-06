#include<stdio.h>
#include <cstdlib>
 /*单链表*/
struct Node{
    int data;           //数据域
    struct Node* next;  //指针域
};

//创建链表
struct Node* createList()
{
    struct Node* headNode = (struct Node*)malloc(sizeof(struct Node));
    //结构体指针创建内存，使指针变成变量
    //初始化
    headNode->data = 1;
    headNode->next = NULL;
    return headNode;
}
//创建节点
struct Node* createNode(int data)
{
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}
//打印链表
void printList(struct Node* headNode)
{
    struct Node* pMove = headNode->next;
    while (pMove)
    {
        printf("%d",pMove->data);
        pMove = pMove->next;
    }
    printf("\n");
}
//插入链表,头插法
void insertNodeByHead(struct Node* headNode, int data)
{
    //1.创建插入节点
    struct Node* newNode = createNode(data);
    newNode->next = headNode->next;
    headNode->next = newNode;
}


int main()
{
    struct Node* list = createList();
    insertNodeByHead(list, 1);
    insertNodeByHead(list, 3);
    insertNodeByHead(list, 2);
    printList(list);
    return 0;
}