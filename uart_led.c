#include<pic.h>
#define _XTAL_FREQ 16000000
__CONFIG(0x3F7A);

void uart_init()
{
          TXSTA = 0x24;
          RCSTA = 0x90;
          SPBRG = 103;
}

void uart_send_data(unsigned char data)
{
          while(TXIF==0);
          
                TXREG = data;
                TXIF = 0;
          
          
}

char uart_recieve_data()
{
          unsigned char DATA;
          while(RCIF)
          {
                    DATA = RCREG;
                     return DATA;
                    RCIF = 0;
          }
         
}

void uart_string_send_data(unsigned char *string, unsigned int string_length)
{
          unsigned int i ;
          for(i =0; i<string_length; i++)
          {
                    uart_send_data(string[i]);
          }
}



void wait(unsigned char cmd)
{
          char value;
          do
          {
                    while(RCIF==0);
                    RCIF = 1;
                    value = RCREG;
          }while(value!=cmd);
          
         
}

void main()
{
          unsigned char rec_data, send_data;
          TRISB = 0x00;
          TRISC = 0x80;
          GIE = 1;
          PEIE = 1;
          uart_init();
          RB1 =1;
          RB2 = 1;
          while(1)
          {
                  //  uart_send_data('a');
                    wait('a');
                    RB1 =0;
                    RB2 =0;
                    
                    wait('b');
                    RB1 =1;
                    RB2 = 1;
                
          }
          
          
}    