object frmLog: TfrmLog
  Left = 0
  Top = 0
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Registros de Tempo'
  ClientHeight = 461
  ClientWidth = 790
  Color = clWindow
  Constraints.MaxHeight = 500
  Constraints.MaxWidth = 806
  Constraints.MinHeight = 500
  Constraints.MinWidth = 806
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Roboto'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object pnlTickets: TPanel
    Left = 0
    Top = 0
    Width = 168
    Height = 461
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
      Top = 421
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
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clSkyBlue
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsUnderline]
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
      Height = 381
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
        Height = 379
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 1
        Align = alClient
        BorderStyle = bsNone
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
          end>
      end
    end
  end
  object pnlRecords: TPanel
    Left = 168
    Top = 0
    Width = 622
    Height = 461
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Deletar todos os registros'
    Color = 1973790
    ParentBackground = False
    TabOrder = 1
    object pnlRecordsTitle: TPanel
      Left = 0
      Top = 0
      Width = 622
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
      TabOrder = 0
    end
    object pnlRecordsTotal: TPanel
      Left = 0
      Top = 421
      Width = 622
      Height = 40
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object lblTotalTime: TLabel
        Left = 334
        Top = 10
        Width = 176
        Height = 19
        Caption = 'Tempo Total Registrado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object dbeTotalTime: TDBEdit
        Left = 516
        Top = 6
        Width = 100
        Height = 27
        AutoSelect = False
        DataField = 'TOTAL_TIME'
        DataSource = dsTickets
        ReadOnly = True
        TabOrder = 0
      end
    end
    object pnlRecordsGrid: TPanel
      Left = 0
      Top = 40
      Width = 622
      Height = 381
      Align = alClient
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 2
      object dbgRecords: TDBGrid
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 620
        Height = 379
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
            Width = 167
            Visible = True
          end>
      end
    end
  end
  object fmtTickets: TFDMemTable
    Active = True
    AfterScroll = fmtTicketsAfterScroll
    FieldDefs = <
      item
        Name = 'TICKET'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TOTAL_TIME'
        DataType = ftTime
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
    Left = 24
    Top = 368
    object fmtTicketsTICKET: TStringField
      FieldName = 'TICKET'
    end
    object fmtTicketsTOTAL_TIME: TTimeField
      Alignment = taRightJustify
      FieldName = 'TOTAL_TIME'
      DisplayFormat = 'HH:MM'
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
    Left = 208
    Top = 368
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
  end
  object dsTickets: TDataSource
    DataSet = fmtTickets
    Left = 88
    Top = 368
  end
  object dsRecords: TDataSource
    DataSet = fmtRecords
    Left = 272
    Top = 368
  end
end
