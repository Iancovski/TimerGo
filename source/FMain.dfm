object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'TimerGo'
  ClientHeight = 45
  ClientWidth = 155
  Color = clBtnFace
  Constraints.MaxHeight = 45
  Constraints.MaxWidth = 155
  Constraints.MinHeight = 45
  Constraints.MinWidth = 155
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlReposition: TPanel
    Left = 0
    Top = 0
    Width = 8
    Height = 45
    Cursor = crSizeAll
    Hint = 'Mover'
    Align = alLeft
    BevelOuter = bvNone
    Color = 3947580
    ParentBackground = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnMouseDown = pnlRepositionMouseDown
  end
  object pnlBackground: TPanel
    Left = 8
    Top = 0
    Width = 147
    Height = 45
    Align = alClient
    BevelOuter = bvNone
    Color = 1973790
    ParentBackground = False
    TabOrder = 1
    object pnlPlayPause: TPanel
      Left = 0
      Top = 0
      Width = 40
      Height = 45
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object imgPause: TImage
        Left = 0
        Top = 0
        Width = 40
        Height = 45
        Cursor = crHandPoint
        Hint = 'Pausar registro de tempo'
        Align = alClient
        Center = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          0020100400000089E36E3C0000000467414D410000B18F0BFC61050000000262
          4B47440000AA8D23320000000970485973000000600000006000F06B42CF0000
          000774494D4507E6060B120B0E4F66A34C0000014E4944415478DAED97BD2E44
          511485F7A5D48861428F1251F20CC44FC2250A1341C133109E418244E8FC25C4
          7807F5840E0FE09F48B41CDFC92D64B8FB9C292414FB24DF4A2677AF75D6E436
          7727F2ED38A94717610E3AE00E8E61451279965A8E9302BA0C2350846BD88435
          323EAA66936A631DBA076339B13EA40FC363E4727FE119B4E73CDD8749329C56
          6002DD0DC46F63988914D841A703132919075A81537420607E83464CEFCAE5FE
          F5BD424320A38C7F482B50417B247C8A981E94022DE87DC45FC1DFAB153847BB
          22016D986E9502ADE84DC47F81BFDB0A58012B6005AC8015B00256C00A58817F
          5BE0CF3FCBCBE860C0FC1B8BC909FE61AD402AD96EA89D2D0CB3C1FFE758DF44
          4A818971320EB502FEA7DF0DD31CE325F433F11429D02CD972DA99F3D4674FE9
          CB6916E037E4059897AFF5FC0856197E915A8E9326740946255BCFAF6003D67F
          ACE79F2D8FCE21223FFD220000002574455874646174653A6372656174650032
          3032322D30362D31315431383A31313A31342B30303A3030477B5CDB00000025
          74455874646174653A6D6F6469667900323032322D30362D31315431383A3131
          3A31342B30303A30303626E4670000000049454E44AE426082}
        ShowHint = True
        Visible = False
        OnClick = imgPlayClick
        ExplicitLeft = -6
        ExplicitHeight = 50
      end
      object imgPlay: TImage
        Left = 0
        Top = 0
        Width = 40
        Height = 45
        Cursor = crHandPoint
        Hint = 'Registrar tempo'
        Align = alClient
        Center = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          0020100400000089E36E3C0000000467414D410000B18F0BFC61050000000262
          4B47440000AA8D23320000000970485973000000600000006000F06B42CF0000
          000774494D4507E6060B120A15DC185BE1000001664944415478DADD974F2B44
          6114C6CF2D0B4B167C1136BE847C02F9D314612564A1D494DD6CA661C1122B65
          852C442C2CED2C3549A1341A62247FAEDFF17A4B733531735FA7E6A9DF5B77E6
          BCE7799AE6DEFB9E48AA144B37EB1A74C00ECC4B2467124A5132C0316BCFB74F
          9E6016F214C76103C49F971568FDA1F40006A9380F19A085F5A546F93D4CB169
          D92A80D72E0CB3F9D22A80AA0CE33458B70AE0B501A3342A5905505D4386665B
          5601DC6E911598A4E9834500AFA2B8DBF5D02A80EA1D0A308DC1B34500AF53E8
          C7E4C42A80EA1572308759B2F73F04F0DA875E0C1FAD02A896301CB30C708761
          9B65803286ED96010A184E5805D8833E8B3FA1F65B802C666F896F9BF54164FA
          28D697D1008D8F7E55DD2CAFE32B710792ED3FEF4CE9483642A3DB7A7EB64602
          DC7C196FD665DC60001DD93216C7F2E08349ADD14C1FA543545CA4669E08E042
          540FA71A680616C30FA72E4017EB2A7482DE563A9E175337F6FA008B828421D3
          D2E2990000002574455874646174653A63726561746500323032322D30362D31
          315431383A31303A32312B30303A3030740E1FA1000000257445587464617465
          3A6D6F6469667900323032322D30362D31315431383A31303A32312B30303A30
          300553A71D0000000049454E44AE426082}
        ShowHint = True
        OnClick = imgPlayClick
        ExplicitLeft = -6
        ExplicitHeight = 50
      end
    end
    object pnlMain: TPanel
      Left = 40
      Top = 0
      Width = 87
      Height = 45
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object lblTicket: TLabel
        Left = 0
        Top = 27
        Width = 87
        Height = 18
        Cursor = crHandPoint
        Hint = 'Ticket'
        Align = alClient
        Caption = '000000000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = 13158600
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = lblTicketClick
        ExplicitWidth = 84
        ExplicitHeight = 15
      end
      object pnlTimer: TPanel
        Left = 0
        Top = 0
        Width = 87
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblTimer: TLabel
          Left = 0
          Top = 0
          Width = 53
          Height = 27
          Hint = 'Tempo percorrido'
          Align = alLeft
          Caption = '00:00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Layout = tlBottom
          ExplicitHeight = 25
        end
        object imgRecording: TImage
          AlignWithMargins = True
          Left = 56
          Top = 5
          Width = 8
          Height = 12
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 10
          Align = alLeft
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000080000
            00080806000000C40FBE8B000000017352474200AECE1CE90000000467414D41
            0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000000
            904944415478DA63640082FFFFFFAB03A9762076668080BD405CC1C8C8788B11
            2A791088DB80781154413C480110DB8314AC03320E00F11D209E0B55900AC4CA
            406C0752F011C89007E2EB402C0155F01C88B581F8014C8102105F4353A003C4
            F7400AD642DD700F886701312310A703B11210DB8014A8411574A039B21CEC06
            A837D5A0DE74812AD80DC495406FDE0600B157337CB2862F1F0000000049454E
            44AE426082}
          Visible = False
          ExplicitTop = 7
          ExplicitHeight = 8
        end
      end
    end
    object pnlSettings: TPanel
      Left = 127
      Top = 0
      Width = 20
      Height = 45
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object imgLog: TImage
        Left = 0
        Top = 21
        Width = 20
        Height = 24
        Cursor = crHandPoint
        Hint = 'Ver registros de tempo'
        Margins.Left = 5
        Align = alBottom
        Center = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
          00101004000000E56AEBA90000000467414D410000B18F0BFC61050000000262
          4B47440000AA8D23320000000970485973000000600000006000F06B42CF0000
          000774494D4507E6060B11303659904AB3000001064944415478DA636480021B
          867A205906C45C0CE8E03F832590D46738CA300BCC43068C20C29E8187E12FC3
          47208B89011B0019C0C8301F489F616061486438C8F007DD0009A001CF197001
          98010C0C1A40F646063E867086ED0C3F4931C01648C603152B40F91B80DE994A
          BC010C0C3B809AE6031523FCCFCCB019E8951FC41A80099819248106BCC034E0
          3FD07F8C0CEF70683303E2564206DC060A7EC2618004104BE337800118550C0C
          1F7018200BC4EA840C4807E2F758B5333218025D5849C8002A05E23F60AA6462
          5804141127D5005820B202B12E0334A9106F00995EC09F9930C13FA001FC4003
          BE20DC67CD500BE4543060CBCEC8E03FC35720D901CC0B2D603E0079B76411B7
          90FB940000002574455874646174653A63726561746500323032322D30362D31
          315431373A34383A35342B30303A30306903009C000000257445587464617465
          3A6D6F6469667900323032322D30362D31315431373A34383A35342B30303A30
          30185EB8200000000049454E44AE426082}
        ShowHint = True
        OnClick = imgLogClick
        ExplicitTop = 26
      end
      object imgClose: TImage
        Left = 0
        Top = 0
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Hint = 'Fechar'
        Align = alTop
        Center = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D494844520000000A0000
          000A08060000008D32CFBD000000017352474200AECE1CE90000000467414D41
          0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000000
          A54944415478DA6D90410E02210C456DE40A9C06AEC1C28CE3C6782D66266E8C
          9943B080AB0077D00C16CC90DAD80D2DBCFCFE0F68ADCBE15B0F21C4E89C7BD7
          C118738C31CE0070AE3310B0C352CA42A11D5CF0BC10F8594A792134903B0B75
          454AC9329896F5DEDF60F783F084ED4809549E4308576CB70EE69C177C1898DA
          8A9E4F3520F0747FAAC1A094BAFFA403985059301B2BFF9E661CB7000F48C106
          55E32460873F589A5A4DD4DBAA150000000049454E44AE426082}
        ShowHint = True
        OnClick = imgCloseClick
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Top = 40
  end
end
