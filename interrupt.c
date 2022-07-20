#include<pic.h>
#define _XTAL_FREQ 16000000
__CONFIG(0x3F7A);

void interrupt button_activity()
{
          if(INTF == 1)
          {
                   RC1 = 1;
                   __delay_ms(1000);
                   RC1 = 0;
                    INTF = 0;
                  
          }
}

void main()
{
          
          GIE = 1;
          PEIE = 1;
          INTE = 1;
         INTEDG = 1;
         
         TRISC = 0x00;
      
          while(1)
          {
                    RC0 = 1;
                    
                    
          }
}