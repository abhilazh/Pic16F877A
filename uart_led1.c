#include<pic.h>
#define _XTAL_FREQ 16000000
__CONFIG(0x3F7A);

void uart_init()
{
          TXSTA = 0x24;
          RCSTA = 0x90;
          SPBRG = 103;
          
}

void  uart_transmit(unsigned char data)
{
                    while(TXIF ==0);
                    TXREG = data;          
}

void uart_string_transmit(unsigned char *string, unsigned int string_length)
{
          for(int i =0; i<string_length; i++)
          {
                  uart_transmit(string[i]);  
          }
}


char  uart_receive()
{
       
       char rec_data;
       if(RCIF ==1)
       {
                 rec_data = RCREG;
                 return rec_data;
                 RCIF = 0;
       }          
       
}

void main()
{
         // GIE = 1;
          //PEIE =1;
          
       //   TRISB = 0x00;
          uart_init();
          while(1)
          {  
                    uart_transmit('a');
                    __delay_ms(1000);
                    uart_receive();
          }          
          
}
