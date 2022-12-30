'GitHub Account: GitHub.com/AliRezaJoodi

$regfile = "89c51cc.dat"
'$regfile = "89S8253.DAT"

'$crystal = 11059200
$crystal = 8000000

Config Debounce = 30
Key_0 Alias P3.6
Key_1 Alias P3.5
Key_2 Alias P3.4
Key_3 Alias P3.3
Key_4 Alias P1.2
Key_5 Alias P1.1
Key_15 Alias P1.0

Pt2262_te Alias P2.3 : Pt2262_te = 1
Pt2262_d11 Alias P2.4 : Pt2262_d11 = 0
Pt2262_d10 Alias P2.5 : Pt2262_d10 = 0
Pt2262_d9 Alias P2.6 : Pt2262_d9 = 0
Pt2262_d8 Alias P2.7 : Pt2262_d8 = 0

Led Alias P3.7 : Led = 1

Dim T1 As Word : T1 = 500
Dim T2 As Word : T2 = 500

Led = 0 : Waitms T1 : Led = 1

Do
   Debounce Key_0 , 0 , Send_0 , Sub
   Debounce Key_1 , 0 , Send_1 , Sub
   Debounce Key_2 , 0 , Send_2 , Sub
   Debounce Key_3 , 0 , Send_3 , Sub
   Debounce Key_4 , 0 , Send_4 , Sub
   Debounce Key_5 , 0 , Send_5 , Sub
   Debounce Key_15 , 0 , Send_15 , Sub
   Pt2262_te = 1
Loop

End

'*******************************************
Send_0:
   Pt2262_d11 = 0 : Pt2262_d10 = 0 : Pt2262_d9 = 0 : Pt2262_d8 = 0
   Pt2262_te = 0 : Led = 0
   Waitms T1
   Pt2262_te = 1 : Led = 1
   Waitms T2
Return

'*******************************************
Send_1:
   Pt2262_d11 = 1 : Pt2262_d10 = 0 : Pt2262_d9 = 0 : Pt2262_d8 = 0
   Pt2262_te = 0 : Led = 0
   Waitms T1
   Pt2262_te = 1 : Led = 1
   Waitms T2
Return

'*******************************************
Send_2:
   Pt2262_d11 = 0 : Pt2262_d10 = 1 : Pt2262_d9 = 0 : Pt2262_d8 = 0
   Pt2262_te = 0 : Led = 0
   Waitms T1
   Pt2262_te = 1 : Led = 1
   Waitms T2
Return

'*******************************************
Send_3:
   Pt2262_d11 = 1 : Pt2262_d10 = 1 : Pt2262_d9 = 0 : Pt2262_d8 = 0
   Pt2262_te = 0 : Led = 0
   Waitms T1
   Pt2262_te = 1 : Led = 1
   Waitms T2
Return

'*******************************************
Send_4:
   Pt2262_d11 = 0 : Pt2262_d10 = 0 : Pt2262_d9 = 1 : Pt2262_d8 = 0
   Pt2262_te = 0 : Led = 0
   Waitms T1
   Pt2262_te = 1 : Led = 1
   Waitms T2
Return

'*******************************************
Send_5:
   Pt2262_d11 = 1 : Pt2262_d10 = 0 : Pt2262_d9 = 1 : Pt2262_d8 = 0
   Pt2262_te = 0 : Led = 0
   Waitms T1
   Pt2262_te = 1 : Led = 1
   Waitms T2
Return

'*******************************************
Send_15:
   Pt2262_d11 = 1 : Pt2262_d10 = 1 : Pt2262_d9 = 1 : Pt2262_d8 = 1
   Pt2262_te = 0 : Led = 0
   Waitms T1
   Pt2262_te = 1 : Led = 1
   Waitms T2
Return