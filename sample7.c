#include<pic.h>
#define _XTAL_FREQ 16000000
__CONFIG(0x3F7A);

void main()
{
	TRISC0 = 1;
	TRISB = 0x00;
	unsigned int seg_array[10] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
	while(1)
	{
        	        if(RC0 == 1)
        	        {
                	              
		for(int i=0;i<10;i++)
		{
        		                   __delay_ms(1000);
			PORTB = seg_array[i];
			__delay_ms(1000);
		}
		}
        
		else
		{
        		     RC0 == 0;
                                             }      		     
		
	}
}
			