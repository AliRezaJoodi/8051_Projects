'GitHub Account: GitHub.com/AliRezaJoodi

$regfile = "89c51cc.dat"
$crystal = 11059200

Dim K1 As Bit , K2 As Bit

Relay Alias P3.4
Sensor_left Alias P0.2
Sensor_riht Alias P2.5

P3.4 = 0
Reset Relay

Do
   If Sensor_left = 1 And Sensor_riht = 0 Then
      Set Relay
   Elseif Sensor_left = 0 And Sensor_riht = 1 Then
      Reset Relay
   End If
Loop

End