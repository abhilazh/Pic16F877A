#include<pic.h>
#define _XTAL_FREQ 16000000
__CONFIG(0x3F7A);

#define RS RD0
#define RW RD1
#define EN RD2

#define R1 RB3
#define R2 RB4
#define R3 RB5
#define R4 RB6
#define C1 RB0
#define C2 RB1
#define C3 RB2

void lcd_data(unsigned char data)
{
          PORTC = data;
          RS = 1;
          RW =0;
          EN = 1;
          __delay_ms(5);
          EN = 0;
}

void lcd_command(unsigned char command)
{
          PORTC = command;
          RS =0;
          RW =0;
          EN =1;
          __delay_ms(5);
          EN = 0;
}

void lcd_string(unsigned char *string, unsigned char len)
{
          unsigned char i;
          for (i = 0;i<len;i++)
          {
                    lcd_data(string[i]);
          }
}
void lcd_init()
{
          lcd_command(0x38);  //set lcd as 16X2 format
          lcd_command(0x06); //auto incrementing the cursor of led once the current position of lcd printed
          lcd_command(0x0C);  //display cursor off
          lcd_command(0x01);  //clear screen
          

}

void keypad()
{
          C1 =1; C2 =0; C3 =0;
          if (R1==1)
          {
                    lcd_data('1');
                    while(R1==1);
          } 
          
            if(R2==1)
          {
                    lcd_data('4');
                    while(R2==1);
          } 
          
            if(R3==1)
          {
                    lcd_data('7');
                    while(R3==1);
          } 
          
            if(R4==1)
          {
                    lcd_data('*');
                    while(R4==1);
          } 
          C1 =0; C2 =1;C3 =0;
          if(R1==1)
          {
                    lcd_data('2');
                    while(R1==1);
          } 
          
            if(R2==1)
          {
                    lcd_data('5');
                    while(R2==1);
          } 
          
            if(R3==1)
          {
                    lcd_data('8');
                    while(R3==1);
          } 
          
            if(R4==1)
          {
                    lcd_data('0');
                    while(R4==1);
          } 
          
          C1 =0; C2 =0;C3 =1;
          if(R1==1)
          {
                    lcd_data('3');
                    while(R1==1);
          } 
          
            if(R2==1)
          {
                    lcd_data('6');
                    while(R2==1);
          } 
          
            if(R3==1)
          {
                    lcd_data('9');
                    while(R3==1);
          } 
          
            if(R4==1)
          {
                    lcd_data('#');
                    while(R4==1);
          } 
          
       
}
void main()
{
          TRISC = 0x00;
          TRISD = 0x00;
          TRISB = 0xF8;
          
          TRISA0 = 1;
          lcd_init();
          lcd_command(0x80);   //data aligned from 0th column 1st row
          lcd_string("KEYPAD:",7);
          lcd_command(0xC0); //data aligned from 0th column 2nd row
          
          while(1)
          {
                    keypad();
          
          }
}