'GitHub Account: GitHub.com/AliRezaJoodi

$regfile = "REG51.dat"
$crystal = 11059200
$baud = 9600
Print "Hello"

Config Lcdpin = Pin , Rs = P1.0 , E = P1.2 , Db4 = P1.4 , Db5 = P1.5 , Db6 = P1.6 , Db7 = P1.7
Config Lcd = 16 * 2
'Cursor On
Cursor Blink
'Cls

Dim Text As String * 17
Dim Command As String * 1

Do
   Input Text
   Command = Mid(text , 1 , 1)
   Text = Mid(text , 2 , 17)
   Print "Hello"

   Locate 1 , 1 : Lcd "                "
   Locate 1 , 1 : Lcd Text

   If Command = "1" Then
      Locate 1 , 1 : Lcd "                "
      Locate 1 , 1 : Lcd Text
   Elseif Command = "2" Then
      Locate 2 , 1 : Lcd "                "
      Locate 2 , 1 : Lcd Text
   End If
Loop

End