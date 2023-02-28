VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Typing on the LCD"
   ClientHeight    =   2190
   ClientLeft      =   3195
   ClientTop       =   3825
   ClientWidth     =   5580
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   12
      Charset         =   178
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2190
   ScaleWidth      =   5580
   ShowInTaskbar   =   0   'False
   Begin VB.ComboBox Combo1 
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   4680
      TabIndex        =   2
      Text            =   "1"
      Top             =   0
      Width           =   855
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   840
      MaxLength       =   16
      TabIndex        =   1
      Top             =   840
      Width           =   3975
   End
   Begin VB.TextBox Text2 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   840
      MaxLength       =   16
      TabIndex        =   0
      Top             =   1320
      Width           =   3975
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   5040
      Top             =   1680
      _ExtentX        =   794
      _ExtentY        =   794
      _Version        =   393216
      DTREnable       =   -1  'True
      InputLen        =   1024
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'GitHub Account: GitHub.com/AliRezaJoodi
Dim CPN As Byte
Dim i As Byte

Private Sub Form_Load()
    MSComm1.Settings = "9600,N,8,1"
    MSComm1.RThreshold = 1
    MSComm1.SThreshold = 1
    MSComm1.InputLen = 1

    Combo1.Clear
    For CPN = 1 To 254
        Combo1.AddItem Str(CPN)
    Next CPN
    Combo1.Text = Combo1.List(0)
End Sub

Private Sub Text1_KeyPress(KeyAscii As Integer)
    If KeyAscii = 27 Then Text1.Text = ""
        CPN = Val(Combo1.Text): MSComm1.CommPort = CPN
        MSComm1.PortOpen = True
        MSComm1.Output = Chr(1) + Chr(KeyAscii)
        MSComm1.PortOpen = False
End Sub

Private Sub Text2_KeyPress(KeyAscii As Integer)
    If KeyAscii = 27 Then Text2.Text = ""
        CPN = Val(Combo1.Text): MSComm1.CommPort = CPN
        MSComm1.PortOpen = True
        MSComm1.Output = Chr(2) + Chr(KeyAscii)
        MSComm1.PortOpen = False
End Sub

