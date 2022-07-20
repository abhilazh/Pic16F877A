#include<pic.h>
#define _XTAL_FREQ 16000000
__CONFIG(0x3F7A);
void main()
{
 TRISB = 0x00;
 while(1)
 {
PORTB = 0x01;
  __delay_ms(1000);
  PORTB = 0x02;
  __delay_ms(1000);
 }
} 