#include<pic.h>
#define _XTAL_FREQ 16000000
__CONFIG(0x3F7A);

//defining the default port and functions
#define RS  RD0
#define RW  RD1
#define EN  RD2

void lcd_data(unsigned char data)
{
          PORTC = data;       //send data to the PORT C  as it is connected to display
          RS = 1;
          RW =0;
          EN = 1;
          __delay_ms(5);
          EN = 0;
}
void lcd_command(unsigned char command)
{
          PORTC = command;       //send commands to the PORT C  as it is connected to display
          RS = 0;
          RW =0;
          EN = 1;
          __delay_ms(5);
          EN = 0;

}
void lcd_string(const unsigned char *string, unsigned char string_length)
{
          unsigned char i;
          for(i =0; i<string_length; i++)
          {
                    lcd_data(string[i]);
          }
}
void lcd_init()
{
          lcd_command(0x38);  //set the lcd as 16X2 format
          lcd_command(0x06);  //auto incrementing the cursor of lcd once current position of lcd printed
          lcd_command(0x0C);  //Display on cursor off
          lcd_command(0x01);  //clear screen
          
}
void main()
{
          TRISC = 0x00;
          TRISD = 0x00;
          lcd_init();
          while(1)
          {
                    lcd_command(0x83);        //print in the first row and 3rd column
                    lcd_string("Embedded",8);
                    lcd_command(0xC3);        //second column 3rd row
                    lcd_string("Systems",7);
                    
                    
          
        }
          
          

}
	