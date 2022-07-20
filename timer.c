#include<pic.h>
#define _XTAL_FREQ 16000000
__CONFIG(0x3F7A);

unsigned char i;

void interrupt timer()
{
          if(TMR0IF == 1)
          {
                    i++;
                    TMR0IF = 0;
          }
}

void main()
{
          GIE = 1; //Global interrupt enable
          PEIE = 1;          //peripheral interrupt enable
          TMR0IE =1;        //timer0 interrupt enable 
          
          TMR0 = 60; //loading value for 10microsecond delay
          OPTION_REG = 0x07; //enabling register for 1:256 ratio
          
          TRISB = 0x00;
          
         while(1)
         {
                   if(i == 0)
                   {
                             RB0 = 1;
                   }
                   if (i == 100)
                   {
                             RB0 = 0;
                   }
                   if(i == 200)
                   {
                             i=0;
                   }
         }
}