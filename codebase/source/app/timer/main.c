
#include "8052.h"
#include "def.h"
#include "isr.h"


/*******************************************************************************
* 函 数 名:    main
* 函数功能:    主函数
* 输    入:    无
* 输.   出:    无
*******************************************************************************/
void main()
{
	led0 = 0;
	led1 = 1;
	Timer0Init();  //定时器0初始化
	while (1);		
}
