
#ifndef __ISR_H__
#define __ISR_H__

extern void Timer0Init();
extern void Timer0() __interrupt 1;
extern void delay(int num);

#endif

