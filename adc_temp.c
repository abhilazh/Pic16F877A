#include<pic.h>
#define _XTAL_FREQ 16000000
__CONFIG(0x3F7A);

#define RS RD0
#define RW RD1
#define EN RD2

int adc,a,b,c,d,e,f;
float temperature,adc1;

void lcd_data(unsigned char DATA)
{
          PORTC = DATA;
          RS = 1;
          RW = 0;
          EN = 1;
          __delay_ms(10);
          EN =0;
}
void lcd_string_data(unsigned char *string, unsigned char string_length)
{
          unsigned char i;
          for(i = 0; i<string_length; i++)
          {
                    lcd_data(string[i]);
          }
}
void lcd_command(unsigned char COMMAND)
{
          PORTC = COMMAND;
          RS = 0;
          RW =0;
          EN = 1;
          __delay_ms(10);
          EN = 0;
}
void lcd_init()
{
    lcd_command(0x38);//set led as 16*2 format
    lcd_command(0x06);//auto incrementing the cursor of led  once the current position of lcd printed
    lcd_command(0x0C);//display on cursor off
    lcd_command(0x01);//clear screen      
}
void interrupt adcc()
{
          if (ADIF == 1)
          {
                    __delay_ms(10);
                    adc = (ADRESH<<8);
                    adc = adc + ADRESL;
                    ADIF = 0;
          }
}
void main()
{
          GIE =1;
          PEIE = 1;
          ADIE = 1; //PIE1 register
          
          TRISC = 0x00;
          TRISD = 0x00;
          lcd_init();
          
          lcd_command(0x80);
          lcd_string_data("Temperature:",12);
          
          ADCON0 = 0x41;
          ADCON1 = 0x8E;
          
        //  adc1 = adc/2.046;
                    
          while(1)
          {
                    GO_nDONE =1;
                    __delay_ms(10);
                    
                    adc1 = adc/2.046;
                    temperature = adc1 * 100; //if adc1 =10.23 then 1023
                    lcd_command(0xC0);
                    
                    a = (int) temperature/10;      //1023/10 = 102
                    b = (int)  temperature %10;    //1023%10 = 3
                    c = a%10;                                   // 102%10 = 2
                    d = a/10;                                  // 102/10 = 10
                    e = d%10;                                 // 10%10 = 0
                    f = d/10;                                   // 10/10 = 1
                    lcd_command(0xC0);
                    lcd_data(f+0x30);
                    lcd_data(e+0x30);
                    lcd_data('.');
                    lcd_data(c+0x30);
                    lcd_data(b+0x30);
                    lcd_string_data("degree C",8);
                           }
}