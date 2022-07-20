#include<pic.h>
#define __XTAL_FREQ 16000000
__CONFIG_(0x3F7A);

void main()
{
	TRISB = 0x00;
	TRISC0 = 0x00;
	unsingned int seg_array[11] ={0x3F,0x06,0X5B,0X4F,0x66,0x6D,0x7C,0x07,0X6F}; 
	while(1)
	{
		if( RC0 == 1)
		{
			for (int i =0;i<=10;i++)
			{
				PORTB = seg_array[i];
			}
		}
		else
		{
			break;
		}
	}
	}	
			