object frmLog: TfrmLog
  Left = 0
  Top = 0
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Registros de Tempo'
  ClientHeight = 561
  ClientWidth = 784
  Color = clWindow
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Roboto'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object pnlTickets: TPanel
    Left = 0
    Top = 0
    Width = 168
    Height = 561
    Align = alLeft
    BevelOuter = bvNone
    Color = 3947580
    ParentBackground = False
    TabOrder = 0
    object pnlTicketsTitle: TPanel
      Left = 0
      Top = 0
      Width = 168
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Tickets'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object pnlClearLog: TPanel
      Left = 0
      Top = 521
      Width = 168
      Height = 40
      Align = alBottom
      BevelOuter = bvNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object btnClearLog: TSpeedButton
        Left = 0
        Top = 0
        Width = 168
        Height = 40
        Align = alClient
        Caption = 'Limpar Registros'
        ImageIndex = 0
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clSkyBlue
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E000000000000000000003C3C3C3C3C3C
          3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C
          3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C
          3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C
          3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C
          3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C543E3FA84649CA4E50CE
          5352D05754D25C57D46159D6665BD86A5ED76D5F8F59503C3C3C3C3C3C3C3C3C
          3C3C3C503E3FBD4B4D7244443E3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C
          3C49403FDD7B653C3C3C3C3C3C3C3C3C473D3DB74D4E7A47463C3C3C3C3C3C3C
          3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3CE4846A3C3C3C3C3C3C423C3C
          AF4E4E864A493C3C3C3C3C3C3C3C3C3C3C3CBD655A644A45644B46C3725F3C3C
          3C3C3C3CE88C6E3C3C3C3C3C3C894A489C514E3C3C3C3C3C3C3C3C3C3C3C3C3C
          3C3C654B46D37763D47C65664F483C3C3C3C3C3CEC95723C3C3C3C3C3C8B4E4A
          9F56503C3C3C3C3C3C3C3C3C3C3C3C3C3C3C664D47D67F67D883696751493C3C
          3C3C3C3CEF9D763C3C3C3C3C3C423D3DB862588C574F3C3C3C3C3C3C3C3C3C3C
          3C3CC67A63665048675149CB85693C3C3C3C3C3CF3A57A3C3C3C3C3C3C3C3C3C
          48403FC7705F81574E3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C
          3C3C3C3CF7AD7E3C3C3C3C3C3C3C3C3C3C3C3C534542D57F677A594E3F3D3D3C
          3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C4B4441F6B3803C3C3C3C3C3C3C3C3C
          3C3C3C3C3C3C594A45C37F66EA9773EF9D76F1A178F4A67BF6AB7DF8AF7FFAB4
          82F7B682A180633C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C
          3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C
          3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C
          3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C
          3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C}
        ParentFont = False
        OnClick = btnClearLogClick
        ExplicitLeft = 72
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlTicketsGrid: TPanel
      Left = 0
      Top = 40
      Width = 168
      Height = 481
      Align = alClient
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 2
      object dbgTickets: TDBGrid
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 167
        Height = 455
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 1
        Align = alClient
        BorderStyle = bsNone
        Ctl3D = True
        DataSource = dsTickets
        DefaultDrawing = False
        DrawingStyle = gdsGradient
        GradientEndColor = 15790320
        GradientStartColor = 15790320
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = []
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Roboto'
        TitleFont.Style = []
        OnDrawColumnCell = dbgTicketsDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'TICKET'
            Title.Alignment = taCenter
            Title.Caption = 'Ticket'
            Width = 167
            Visible = True
          end
          item
            Expanded = False
            Visible = False
          end>
      end
      object pnlTicketsSubtitle: TPanel
        Left = 0
        Top = 457
        Width = 168
        Height = 24
        Align = alBottom
        BevelOuter = bvNone
        Color = 4934475
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Roboto'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object lblSubtitle: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 48
          Height = 14
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          Caption = 'Legenda:'
          Layout = tlCenter
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 45
          ExplicitHeight = 13
        end
        object pnlSubtitleTicket: TPanel
          AlignWithMargins = True
          Left = 58
          Top = 5
          Width = 110
          Height = 14
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 5
          Align = alRight
          BevelOuter = bvNone
          Caption = 'Ticket atual'
          Color = 16774111
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Roboto'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          ExplicitLeft = 51
        end
      end
    end
  end
  object pnlRecords: TPanel
    Left = 168
    Top = 0
    Width = 616
    Height = 561
    Align = alClient
    BevelOuter = bvNone
    Color = 1973790
    ParentBackground = False
    TabOrder = 1
    object pnlRecordsTotal: TPanel
      Left = 0
      Top = 521
      Width = 616
      Height = 40
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object lblTotalTime: TLabel
        Left = 436
        Top = 11
        Width = 95
        Height = 19
        Caption = 'Tempo Total:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object lblTotalTimeFix: TLabel
        Left = 190
        Top = 11
        Width = 153
        Height = 19
        Caption = 'Tempo Total (Ajuste):'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object dbeTotalTime: TDBEdit
        Left = 536
        Top = 6
        Width = 75
        Height = 27
        AutoSelect = False
        DataField = 'TOTAL_TIME'
        DataSource = dsTickets
        ReadOnly = True
        TabOrder = 0
      end
      object dbeTotalTimeFix: TDBEdit
        Left = 348
        Top = 6
        Width = 75
        Height = 27
        AutoSelect = False
        DataField = 'TOTAL_TIME_FIX'
        DataSource = dsTickets
        ReadOnly = True
        TabOrder = 1
      end
    end
    object pnlRecordsGrid: TPanel
      Left = 0
      Top = 40
      Width = 616
      Height = 481
      Align = alClient
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 1
      object dbgRecords: TDBGrid
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 614
        Height = 455
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        BorderStyle = bsNone
        DataSource = dsRecords
        DefaultDrawing = False
        DrawingStyle = gdsGradient
        GradientEndColor = 15790320
        GradientStartColor = 15790320
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = []
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Roboto'
        TitleFont.Style = []
        OnDrawColumnCell = dbgRecordsDrawColumnCell
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATE'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Width = 150
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TIME_START'
            Title.Alignment = taCenter
            Title.Caption = 'Hora In'#237'cio'
            Width = 150
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TIME_END'
            Title.Alignment = taCenter
            Title.Caption = 'Hora Fim'
            Width = 150
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TOTAL_TIME'
            Title.Alignment = taCenter
            Title.Caption = 'Tempo Total'
            Width = 161
            Visible = True
          end>
      end
      object pnlRecordsSubtitle: TPanel
        Left = 0
        Top = 457
        Width = 616
        Height = 24
        Align = alBottom
        BevelOuter = bvNone
        Color = 4934475
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Roboto'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 3
        object pnlSubtitleHelp: TPanel
          AlignWithMargins = True
          Left = 493
          Top = 5
          Width = 117
          Height = 14
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Aux'#237'lio'
          Color = 16443612
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Roboto'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          ExplicitLeft = 371
          ExplicitHeight = 15
        end
        object pnlSubtitleFix: TPanel
          AlignWithMargins = True
          Left = 371
          Top = 5
          Width = 117
          Height = 14
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Ajuste'
          Color = 14474490
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Roboto'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          ExplicitLeft = 348
          ExplicitHeight = 15
        end
        object pnlSubtitleTest: TPanel
          AlignWithMargins = True
          Left = 249
          Top = 5
          Width = 117
          Height = 14
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Teste'
          Color = 14479610
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Roboto'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          ExplicitHeight = 15
        end
        object pnlSubtitleDevelopment: TPanel
          AlignWithMargins = True
          Left = 127
          Top = 5
          Width = 117
          Height = 14
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Desenvolvimento'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Roboto'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
          ExplicitHeight = 15
        end
        object pnlSubtitleAnalysis: TPanel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 117
          Height = 14
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'An'#225'lise'
          Color = 16244715
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Roboto'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
          ExplicitHeight = 15
        end
      end
    end
    object pnlRecordsTitle: TPanel
      Left = 0
      Top = 0
      Width = 616
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Registros'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object fmtTickets: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'TICKET'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TOTAL_TIME'
        DataType = ftTime
      end
      item
        Name = 'DAYS'
        DataType = ftInteger
      end
      item
        Name = 'TOTAL_TIME_FIX'
        DataType = ftTime
      end
      item
        Name = 'DAYS_FIX'
        DataType = ftInteger
      end
      item
        Name = 'CURRENT'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 72
    Top = 448
    object fmtTicketsTICKET: TStringField
      FieldName = 'TICKET'
    end
    object fmtTicketsTOTAL_TIME: TTimeField
      FieldName = 'TOTAL_TIME'
      OnGetText = fmtTicketsTOTAL_TIMEGetText
      DisplayFormat = 'HH:MM'
    end
    object fmtTicketsDAYS: TIntegerField
      FieldName = 'DAYS'
    end
    object fmtTicketsTOTAL_TIME_FIX: TTimeField
      FieldName = 'TOTAL_TIME_FIX'
      OnGetText = fmtTicketsTOTAL_TIME_FIXGetText
      DisplayFormat = 'HH:MM'
    end
    object fmtTicketsDAYS_FIX: TIntegerField
      FieldName = 'DAYS_FIX'
    end
    object fmtTicketsCURRENT: TBooleanField
      FieldName = 'CURRENT'
    end
  end
  object fmtRecords: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'TICKET'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATE'
        DataType = ftDate
      end
      item
        Name = 'TIME_START'
        DataType = ftTime
      end
      item
        Name = 'TIME_END'
        DataType = ftTime
      end
      item
        Name = 'TOTAL_TIME'
        DataType = ftTime
      end
      item
        Name = 'TYPE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    IndexFieldNames = 'TICKET'
    MasterSource = dsTickets
    MasterFields = 'TICKET'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 680
    Top = 448
    object fmtRecordsTICKET: TStringField
      FieldName = 'TICKET'
    end
    object fmtRecordsDATE: TDateField
      FieldName = 'DATE'
    end
    object fmtRecordsTIME_START: TTimeField
      FieldName = 'TIME_START'
      DisplayFormat = 'HH:MM'
    end
    object fmtRecordsTIME_END: TTimeField
      FieldName = 'TIME_END'
      DisplayFormat = 'HH:MM'
    end
    object fmtRecordsTOTAL_TIME: TTimeField
      FieldName = 'TOTAL_TIME'
      DisplayFormat = 'HH:MM'
    end
    object fmtRecordsTYPE: TStringField
      FieldName = 'TYPE'
      Size = 1
    end
  end
  object dsTickets: TDataSource
    DataSet = fmtTickets
    Left = 128
    Top = 448
  end
  object dsRecords: TDataSource
    DataSet = fmtRecords
    Left = 736
    Top = 448
  end
end
