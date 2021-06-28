
#include "8052.h"
#include "def.h" 


static u16 counter = 0;

/*******************************************************************************
* 函 数 名         : Timer0Init
* 函数功能         : 定时器0初始化
* 输    入         : 无
* 输    出         : 无
*******************************************************************************/
void Timer0Init()
{
	TMOD |= 0X01;//选择为定时器0模式，工作方式1，仅用TR0打开启动。
	TH0 = 0XFC;	//给定时器赋初值，定时1ms
	TL0 = 0X18;	
	ET0 = 1;//打开定时器0中断允许
	EA = 1;//打开总中断
	TR0 = 1;//打开定时器

    return;			
}

/*******************************************************************************
* 函 数 名         : void Timer0() interrupt 1
* 函数功能         : 定时器0中断函数
* 输    入         : 无
* 输    出         : 无
*******************************************************************************/
void Timer0() __interrupt 1
{
	TH0 = 0XFC;	//给定时器赋初值，定时1ms
	TL0 = 0X18;

	counter++;
	if (counter == 500)
	{
		counter = 0;
		led0 = !led0;	
		led1 = !led1;	
	}

    return;
}

