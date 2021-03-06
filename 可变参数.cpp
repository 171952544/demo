#include <stdio.h>
#include <stdarg.h>
#include <string.h>

#include <stdlib.h>
#ifndef TSET_C
    #define TEST_C 1
#endif
/*可变参数函数获取参数字符串*/
void test(char *i,...)
{
    // char strlog[5000] = {0};
    char *strlog;
    strlog = (char *)malloc(5000*sizeof(char));
    va_list pArgs;
    va_start(pArgs, i);
    vsprintf(strlog, i, pArgs);
	va_end(pArgs);

    printf("%s\n",strlog);
    free(strlog);
}
int main(void) { 
    void (*p)(char *i,...) = test;

    int i = 12;
    char j[] = "asd";
    char *k = "qwe";
    printf("strlen=%d,sizeof=%d\n",strlen(j),sizeof(j));
	p("%d %s %s",i,j,k);

    /*预定义宏*/
    printf("File :%s\n", __FILE__ );
    printf("Date :%s\n", __DATE__ );
    printf("Time :%s\n", __TIME__ );
    printf("Line :%d\n", __LINE__ );
    printf("ANSI :%d\n", __STDC__ );
	return 0;
}



// /*线性表的顺序实现*/
// #define LIST_INIT_SIZE 100  //初始分配量
// #define LIST_INCREMENT 10   //增量
// #define LIST_TYPE int       //存储类型

// typedef struct strSequenceLinerList
// {
//     LIST_TYPE *elem;        //存储空间基址
//     unsigned int length;    //当前长度
//     unsigned int listSize;  //当前存储容量
// }SequnceLinerList;

// static enum Status
// {
//     OK,
//     FAILED,
//     OVERFLOW
// };

// /* 线性表初始化 */
// Status initSequenceLinerList(SequnceLinerList& list)
// {
//     list.elem = (LIST_TYPE *)malloc(sizeof(LIST_TYPE)*LIST_INIT_SIZE);
//     if (!list.elem)
//     {
//         return OVERFLOW;
//     }
//     list.length = 0;
//     list.listSize = LIST_INIT_SIZE;
//     return OK;
// }




/*strstr 实现*/

// char* mystrstr(const char* dest, const char* src) {
// 	char* tdest = dest;
// 	char* tsrc = src;
	
// 	while (*tdest)
// 	{
// 		char* flag = tdest;//设置标志位，方便回滚。
// 		while (*tdest == *tsrc && *tdest!='\0') {//开始进行比较，如果第一个字符相等，继续循环比较下一个字符。
// 			tdest++;
// 			tsrc++;
// 		}
// 		//上面循环完毕，有如下3种情况
// 		if (!*tsrc) {
// 			//tsrc已经到达\0位置，说明在dest中已经找到 子字符串，唯一找到字串的出口。
// 			return flag;//返回找到子串的起始位置。
// 		}
// 		if(!*tdest){
// 			//走到这里，tdest到达\0 而tsrc没有到达\0，没有找到
// 			return NULL;
// 		}
// 		//走到这里，没有匹配成功，继续从下一位开始匹配整个子串
// 		tdest++;
// 	}
// 	return NULL;
