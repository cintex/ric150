object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Ric150 v1.0.6'
  ClientHeight = 387
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  Scaled = False
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object clbBases: TCheckListBox
    Left = 0
    Top = 205
    Width = 400
    Height = 163
    Align = alClient
    ItemHeight = 13
    PopupMenu = basemenu
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 368
    Width = 400
    Height = 19
    Panels = <>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 400
    Height = 205
    ActivePage = tsAction
    Align = alTop
    TabOrder = 2
    object tsAction: TTabSheet
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      object Bevel1: TBevel
        Left = 291
        Top = 107
        Width = 14
        Height = 62
        Shape = bsLeftLine
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 8
        Width = 386
        Height = 93
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 0
        object btCpReceive: TButton
          Left = 215
          Top = 23
          Width = 150
          Height = 25
          Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1077
          Caption = #1087#1086#1087#1086#1083#1085#1077#1085#1080#1077'+cons'
          Default = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btCpReceiveClick
        end
        object btCpUsrQst: TButton
          Left = 20
          Top = 23
          Width = 135
          Height = 25
          Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' USR '#1080' QST '#1092#1072#1081#1083#1099
          Caption = #1086#1090#1095#1077#1090#1099' '#1080' '#1079#1072#1087#1088#1086#1089#1099
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btCpUsrQstClick
        end
        object dtpFrom: TDateTimePicker
          Left = 169
          Top = 59
          Width = 85
          Height = 21
          Hint = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1082#1072#1082#1086#1081' '#1076#1072#1090#1099' '#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1077
          Date = 39686.577691967590000000
          Time = 39686.577691967590000000
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object dtpTill: TDateTimePicker
          Left = 271
          Top = 59
          Width = 89
          Height = 21
          Hint = #1055#1086' '#1082#1072#1082#1091#1102' '#1076#1072#1090#1091' '#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1077
          Date = 39686.577884004630000000
          Time = 39686.577884004630000000
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object cbRes: TCheckBox
          Left = 34
          Top = 59
          Width = 97
          Height = 17
          Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' Res '#1092#1072#1081#1083
          Caption = 'RES '#1084#1086#1076#1091#1083#1100
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object btCpCons: TButton
          Left = 161
          Top = 23
          Width = 48
          Height = 25
          Caption = 'cons'
          TabOrder = 5
          OnClick = btCpReceiveClick
        end
      end
      object btUpdate: TButton
        Left = 197
        Top = 144
        Width = 75
        Height = 25
        Hint = #1047#1072#1087#1091#1089#1082' '#1087#1088#1086#1094#1077#1089#1089#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btUpdateClick
      end
      object cbExit: TCheckBox
        Left = 23
        Top = 144
        Width = 153
        Height = 17
        Caption = ' '#1087#1086#1089#1083#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1074#1099#1081#1090#1080
        TabOrder = 4
      end
      object btExit: TButton
        Left = 302
        Top = 113
        Width = 75
        Height = 48
        Hint = #1042#1099#1093#1086#1076
        Caption = #1042#1099#1093#1086#1076
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btExitClick
      end
      object cbRunner: TCheckBox
        Left = 23
        Top = 121
        Width = 153
        Height = 17
        Caption = #1089' '#1082#1083#1102#1095#1077#1084' NORUNNER'
        TabOrder = 3
      end
      object btStat: TButton
        Left = 197
        Top = 113
        Width = 75
        Height = 25
        Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
        TabOrder = 5
        OnClick = btStatClick
      end
    end
    object tsFolders: TTabSheet
      Caption = #1050#1072#1090#1072#1083#1086#1075#1080
      ImageIndex = 1
      object lbCons: TLabel
        Left = 8
        Top = 16
        Width = 66
        Height = 13
        Hint = #1050#1072#1090#1072#1083#1086#1075' '#1050#1086#1085#1089#1091#1083#1100#1090#1072#1085#1090#1055#1083#1102#1089
        Caption = #1050#1086#1085#1089#1091#1083#1100#1090#1072#1085#1090
        ParentShowHint = False
        ShowHint = True
      end
      object lbReceive: TLabel
        Left = 13
        Top = 56
        Width = 61
        Height = 13
        Hint = #1050#1072#1090#1072#1083#1086#1075' '#1089' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1077#1084
        Caption = #1055#1086#1087#1086#1083#1085#1077#1085#1080#1077
        ParentShowHint = False
        ShowHint = True
      end
      object lbUsr: TLabel
        Left = 42
        Top = 96
        Width = 32
        Height = 13
        Hint = #1050#1072#1090#1072#1083#1086#1075' '#1074' '#1082#1086#1090#1086#1088#1099#1081' '#1073#1091#1076#1091#1090' '#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100#1089#1103' '#1092#1072#1081#1083#1099' '#1086#1090#1095#1077#1090#1086#1074' (*.usr)'
        Caption = #1054#1090#1095#1077#1090
        ParentShowHint = False
        ShowHint = True
      end
      object lbQst: TLabel
        Left = 31
        Top = 136
        Width = 43
        Height = 13
        Hint = #1050#1072#1090#1072#1083#1086#1075' '#1074' '#1082#1086#1090#1086#1088#1099#1081' '#1073#1091#1076#1091#1090' '#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100#1089#1103' '#1092#1072#1081#1083#1099' '#1079#1072#1087#1088#1086#1089#1086#1074' (*.qst)'
        Caption = #1047#1072#1087#1088#1086#1089#1099
        ParentShowHint = False
        ShowHint = True
      end
      object edPathCons: TEdit
        Left = 80
        Top = 13
        Width = 265
        Height = 21
        Hint = #1050#1072#1090#1072#1083#1086#1075' '#1050#1086#1085#1089#1091#1083#1100#1090#1072#1085#1090#1055#1083#1102#1089
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object btPathCons: TButton
        Left = 343
        Top = 13
        Width = 43
        Height = 22
        Caption = #1054#1073#1079#1086#1088
        TabOrder = 1
        OnClick = btPathConsClick
      end
      object edPathReceive: TEdit
        Left = 80
        Top = 53
        Width = 265
        Height = 21
        Hint = #1050#1072#1090#1072#1083#1086#1075' '#1089' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1077#1084
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object btPathReceive: TButton
        Left = 343
        Top = 53
        Width = 43
        Height = 22
        Caption = #1054#1073#1079#1086#1088
        TabOrder = 3
        OnClick = btPathReceiveClick
      end
      object edPathUsr: TEdit
        Left = 80
        Top = 93
        Width = 265
        Height = 21
        Hint = #1050#1072#1090#1072#1083#1086#1075' '#1074' '#1082#1086#1090#1086#1088#1099#1081' '#1073#1091#1076#1091#1090' '#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100#1089#1103' '#1092#1072#1081#1083#1099' '#1086#1090#1095#1077#1090#1086#1074' (*.usr)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object btPathUsr: TButton
        Left = 343
        Top = 93
        Width = 43
        Height = 22
        Caption = #1054#1073#1079#1086#1088
        TabOrder = 5
        OnClick = btPathUsrClick
      end
      object edPathQst: TEdit
        Left = 80
        Top = 133
        Width = 265
        Height = 21
        Hint = #1050#1072#1090#1072#1083#1086#1075' '#1074' '#1082#1086#1090#1086#1088#1099#1081' '#1073#1091#1076#1091#1090' '#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100#1089#1103' '#1092#1072#1081#1083#1099' '#1079#1072#1087#1088#1086#1089#1086#1074' (*.qst)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
      end
      object btPathQst: TButton
        Left = 343
        Top = 133
        Width = 43
        Height = 22
        Caption = #1054#1073#1079#1086#1088
        TabOrder = 7
        OnClick = btPathQstClick
      end
    end
    object tsOther: TTabSheet
      Caption = #1056#1072#1079#1085#1086#1077
      ImageIndex = 2
      object btReg: TButton
        Left = 3
        Top = 5
        Width = 109
        Height = 25
        Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
        TabOrder = 0
        OnClick = btRegClick
      end
      object btTest: TButton
        Left = 118
        Top = 5
        Width = 115
        Height = 25
        Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1048#1041
        TabOrder = 1
        OnClick = btTestClick
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 34
        Width = 334
        Height = 71
        Caption = 'UIN'
        TabOrder = 2
        object lbPathUin: TLabel
          Left = 25
          Top = 21
          Width = 29
          Height = 13
          Caption = #1055#1091#1090#1100':'
        end
        object edPathUIN: TEdit
          Left = 64
          Top = 17
          Width = 201
          Height = 21
          TabOrder = 0
        end
        object btPathUin: TButton
          Left = 264
          Top = 16
          Width = 50
          Height = 22
          Caption = #1054#1073#1079#1086#1088
          TabOrder = 1
          OnClick = btPathUinClick
        end
        object cbCopyUIN: TCheckBox
          Left = 25
          Top = 44
          Width = 184
          Height = 17
          Caption = #1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1089#1083#1077' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103
          TabOrder = 2
        end
        object btCopyUin: TButton
          Left = 239
          Top = 41
          Width = 75
          Height = 22
          Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
          TabOrder = 3
          OnClick = btCopyUinClick
        end
      end
      object btTestRes: TButton
        Left = 239
        Top = 5
        Width = 129
        Height = 25
        Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077' RES'
        TabOrder = 3
        OnClick = btTestResClick
      end
      object GroupBox3: TGroupBox
        Left = 3
        Top = 111
        Width = 83
        Height = 50
        Caption = 'CONS*.ANS'
        TabOrder = 4
        object btUpdateConsOnly: TButton
          Left = 10
          Top = 19
          Width = 61
          Height = 22
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 0
          OnClick = btUpdateConsOnlyClick
        end
      end
    end
  end
  object basemenu: TPopupMenu
    Left = 264
    Top = 280
    object N1: TMenuItem
      Caption = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1074#1089#1077
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1048#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = N3Click
    end
  end
end
