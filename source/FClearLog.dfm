object frmClearLog: TfrmClearLog
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Limpar Registros'
  ClientHeight = 131
  ClientWidth = 399
  Color = 1973790
  Constraints.MaxHeight = 170
  Constraints.MaxWidth = 415
  Constraints.MinHeight = 170
  Constraints.MinWidth = 415
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -13
  Font.Name = 'Roboto'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 399
    Height = 131
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlTitle: TPanel
      Left = 0
      Top = 0
      Width = 399
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Como voc'#234' deseja limpar os registros?'
      Color = 3947580
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object pnlOptions: TPanel
      Left = 0
      Top = 50
      Width = 399
      Height = 81
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object lblSelectedTicket: TLabel
        Left = 289
        Top = 48
        Width = 51
        Height = 15
        Caption = '(TICKET)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object lblCurrentTicket: TLabel
        Left = 278
        Top = 17
        Width = 51
        Height = 15
        Caption = '(TICKET)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object btnDeleteAllExceptCurrent: TSpeedButton
        Left = 0
        Top = 10
        Width = 399
        Height = 30
        Align = alTop
        Caption = #9654' Deletar todos exceto o ticket atual                          '
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSkyBlue
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        OnClick = btnDeleteAllExceptCurrentClick
        ExplicitTop = 0
      end
      object DeleteSelectedOnly: TSpeedButton
        Left = 0
        Top = 40
        Width = 399
        Height = 30
        Align = alTop
        Caption = #9654' Deletar apenas o ticket selecionado                       '
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSkyBlue
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        OnClick = DeleteSelectedOnlyClick
        ExplicitTop = 30
      end
      object pnlSpaceUp: TPanel
        Left = 0
        Top = 0
        Width = 399
        Height = 10
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
      end
      object pnlSpaceBottom: TPanel
        Left = 0
        Top = 71
        Width = 399
        Height = 10
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
  end
end
