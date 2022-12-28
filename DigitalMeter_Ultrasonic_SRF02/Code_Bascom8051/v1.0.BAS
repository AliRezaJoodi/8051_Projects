'GitHub Account: GitHub.com/AliRezaJoodi

$regfile = "89c51cc.dat"
$crystal = 11059200
'$crystal = 12000000

Config Lcdpin = Pin , Db4 = P2.4 , Db5 = P2.3 , Db6 = P2.2 , Db7 = P2.1 , E = P2.5 , Rs = P2.7
Config Lcd = 16 * 2
Cursor Off
Cls

Config Scl = P3.5
Config Sda = P3.6
Const Rs02w = &HE0
Const Rs02r = &HE1

Config Debounce = 30

Buzzer Alias P1.0
Reset Buzzer

Dim Lentgh_msb As Byte : Lentgh_msb = 0
Dim Lentgh_lsb As Byte : Lentgh_lsb = 0
Dim Lentgh As Integer : Lentgh = 0
Dim T As Byte : T = 70
Dim Z As Bit : Z = 0

If P3.7 = 0 Then
   Waitms 30
   If P3.7 = 0 Then Z = 1
End If

Sound Buzzer , 200 , 200
Gosub Display_Loading

Do
   Debounce P3.7 , 0 , Get_srf02 , Sub
   If Z = 1 Then
      Gosub Get_srf02
      Waitms 500
   End If
Loop

End

'*************************************************
Display_Loading:
   Locate 1 , 1
   Lcd "Ultrasonic"
   Locate 2 , 1
   Lcd "20CM - 600CM"
   Wait 1
   Cls
   Lcd "Press Key"
Return

'*************************************************
Get_srf02:
   If Z = 0 Then Sound Buzzer , 200 , 200                     '
   I2cstart
   I2cwbyte Rs02w
   I2cwbyte 0
   I2cwbyte &H51
   I2cstop : Waitms T
   I2cstart
   I2cwbyte Rs02w
   I2cwbyte 2
   I2cstop : Waitms T
   I2cstart
   I2cwbyte Rs02r
   I2crbyte Lentgh_msb , Ack
   I2crbyte Lentgh_lsb , Nack
   I2cstop : Waitms T
   Lentgh = Makeint(lentgh_lsb , Lentgh_msb)
   Reset Buzzer
   Gosub Display_Value
Return

'*************************************************
Display_Value:
   Cls
   Lcd "Lentgh= " ; Lentgh ; " CM"
Return
