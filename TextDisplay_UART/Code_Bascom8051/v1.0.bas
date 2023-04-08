'GitHub Account: GitHub.com/AliRezaJoodi

$regfile = "REG51.dat"
$crystal = 11059200

$baud = 9600

Config Lcdpin = Pin , Rs = P1.0 , E = P1.2 , Db4 = P1.4 , Db5 = P1.5 , Db6 = P1.6 , Db7 = P1.7
Config Lcd = 16 * 2
'Cursor On
Cursor Blink
'Cls

Dim Row As Byte : Row = 1
Dim Column1 As Byte : Column1 = 0
Dim Column2 As Byte : Column2 = 0
Dim Column As Byte : Column = 0
Dim Z As Byte

Gosub Test1

Do
   Inputbin Z
   If Z = 1 Or Z = 2 Then
      Row = Z
      Inputbin Z
      Select Case Z
         Case 8:
            If Row = 1 Then
               If Column1 = 0 Then Column1 = 1
               Column = Column1
               Decr Column1
            End If
            If Row = 2 Then
               If Column2 = 0 Then Column2 = 1
               Column = Column2
               Decr Column2
            End If
            Locate Row , Column : Lcd " ";
            Locate Row , Column
         Case 27:
            If Row = 1 Then
               Column1 = 1 : Column = 1
               Locate Row , Column : Lcd "               "
               Column1 = 0 : Column = 0
            End If
            If Row = 2 Then
               Column2 = 1 : Column = 1
               Locate Row , Column : Lcd "               "
               Column2 = 0 : Column = 0
            End If
         Case 32 To 126:
            If Row = 1 Then
               Incr Column1
               If Column1 = 17 Then Column1 = 16
               Column = Column1
            End If
            If Row = 2 Then
               Incr Column2
               If Column2 = 17 Then Column2 = 16
               Column = Column2
            End If
            Locate Row , Column : Lcd Chr(z)
         End Select
   End If
Loop

End

'******************************************
Test1:
   Cls : Lcd "Typing With USB" : Waitms 500 : Cls : Cursor On
Return