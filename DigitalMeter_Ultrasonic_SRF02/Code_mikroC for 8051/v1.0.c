// GitHub Account:  GitHub.com/AliRezaJoodi

// LCD module connections
sbit LCD_RS at P2_7_bit;
sbit LCD_EN at P2_5_bit;
sbit LCD_D4 at P2_4_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_2_bit;
sbit LCD_D7 at P2_1_bit;

// Software I2C connections
sbit Soft_I2C_Scl at P3_5_bit;
sbit Soft_I2C_Sda at P3_6_bit;

// Button connections
sbit Button_Pin at P3_7_bit;


// Sound connections
//sbit Sound_Play_Pin at P1_0_bit;

unsigned char RS02w = 0xE0;
unsigned char RS02r = 0xE1;
unsigned char Lentgh_MSB = 0;
unsigned char Lentgh_LSB = 0;
 int Lentgh= 0;
bit oldstate;
bit z;
char buffer[7];

void Init_Main() {
     //Soft_I2C_Init();
     //Lcd_Init();
     //Lcd_Cmd(_LCD_CURSOR_OFF);
     //oldstate = 0;
}

void Satrt_Text(){
     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Out(1, 1, "Ultrasonic");
     Lcd_Out(2, 1, "20CM - 600CM");
     Delay_ms(2000);
     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Out(1, 1, "Press Key");
}
void Read_Lentgh_SRF02(){
     Lentgh = 0; Lentgh_MSB = 0; Lentgh_LSB = 0;
     Soft_I2C_Start();
     Soft_I2C_Write(RS02w);
     Soft_I2C_Write(0);
     Soft_I2C_Write(0x51);
     Soft_I2C_Stop();
     //Soft_I2C_Break();
     Delay_ms(70);
     Soft_I2C_Start();
     Soft_I2C_Write(RS02w);
     Soft_I2C_Write(2);
     Soft_I2C_Stop();
     //Soft_I2C_Break();
     Delay_ms(70);
     Soft_I2C_Start();
     Soft_I2C_Write(RS02r);
     Lentgh_Msb = Soft_I2C_Read(1);
     Lentgh_Lsb = Soft_I2C_Read(0);
     Soft_I2C_Stop();
     //Soft_I2C_Break();
     Delay_ms(70);
     Lentgh=(Lentgh_MSB*256)+Lentgh_LSB;
     IntToStr(Lentgh, buffer);
     //Lentgh=21;
}

void Display_Lentgh(){
  //Lcd_Cmd(_LCD_CLEAR);
  //Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Out(1, 1, "Lentgh= ");
  Lcd_Out(1, 12, " CM ");
  Lcd_Chr(1,9, ((Lentgh / 100)  % 10) + 48);
  Lcd_Chr(1,10, ((Lentgh / 10)   % 10) + 48);
  Lcd_Chr(1,11, (Lentgh % 10)          + 48);
  Lcd_Out_CP("CM ");
}

Sound1(){
         P1=1; Delay_ms(300); P1=0;
}
//void Tone1() {
  //Sound_Play(659, 250);   // Frequency = 659Hz, duration = 250ms
//}

void main(){
     Lcd_Init();
     Lcd_Cmd(_LCD_CURSOR_OFF);
     Soft_I2C_Init();
     oldstate = 0;
     z=0;

     if (Button(1, 0)){
        Delay_ms(30);
        if (Button(1, 0)) z = 1;
     }

  Sound1();
  Satrt_Text();

  while(1){
           if (Button(1, 1)) oldstate = 1;
           if (oldstate && Button(1, 0)) {
              Sound1();
              Read_Lentgh_SRF02();
              Display_Lentgh();
              oldstate = 0;
              }
           if (z==1){
              Read_Lentgh_SRF02();
              Display_Lentgh();
              Delay_ms(500);
              }
           }
}