'GitHub Account: GitHub.com/AliRezaJoodi

$regfile = "89c51cc.dat"
'$regfile = "89S8253.DAT"
$crystal = 8000000

Relay_1 Alias P0.4 : Relay_1 = 0
Relay_2 Alias P0.3 : Relay_2 = 0
Relay_3 Alias P0.2 : Relay_3 = 0
Relay_4 Alias P0.1 : Relay_4 = 0
Relay_5 Alias P0.0 : Relay_5 = 0

Pt2272_vt Alias P2.0
Led Alias P3.7 : Led = 1

Dim Command As Byte : Command = 0
Dim Status As Bit : Status = 0

Do
   If Pt2272_vt = 1 And Status = 0 Then
      Status = 1
      Led = 0
      Command = P2 : Command = Command And &B11110000
      Select Case Command
         Case &B00000000 : P0 = &B00000000
         Case &B00010000 : Relay_1 = Not Relay_1
         Case &B00100000 : Relay_2 = Not Relay_2
         Case &B00110000 : Relay_3 = Not Relay_3
         Case &B01000000 : Relay_4 = Not Relay_4
         Case &B01010000 : Relay_5 = Not Relay_5
         Case &B11110000 : P0 = &B00011111
      End Select
      Waitms 500
   End If
   If Pt2272_vt = 0 Then Status = 0
   Led = Not Pt2272_vt
Loop

End