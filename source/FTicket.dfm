object frmTicket: TfrmTicket
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Ticket'
  ClientHeight = 275
  ClientWidth = 400
  Color = 1973790
  Font.Charset = ANSI_CHARSET
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
    Width = 400
    Height = 275
    Align = alClient
    BevelOuter = bvNone
    Color = 1973790
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 416
    ExplicitHeight = 234
    object pnlTicket: TPanel
      Left = 0
      Top = 50
      Width = 400
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      Color = 1973790
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 416
      object edtTicket: TEdit
        Left = 100
        Top = 15
        Width = 200
        Height = 33
        Alignment = taCenter
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 0
        OnChange = edtTicketChange
        OnKeyDown = edtTicketKeyDown
        OnKeyPress = edtTicketKeyPress
        OnKeyUp = edtTicketKeyUp
      end
    end
    object pnlTitle: TPanel
      Left = 0
      Top = 0
      Width = 400
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Em qual ticket voc'#234' est'#225' trabalhando?'
      Color = 3947580
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 416
    end
    object pnlOptions: TPanel
      Left = 0
      Top = 225
      Width = 400
      Height = 50
      Align = alBottom
      BevelOuter = bvNone
      Color = 3947580
      ParentBackground = False
      TabOrder = 2
      ExplicitTop = 248
      ExplicitWidth = 416
      object imgConfirm: TImage
        Left = 350
        Top = 0
        Width = 50
        Height = 50
        Cursor = crHandPoint
        Align = alRight
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF40000000473424954080808087C0864880000000970
          485973000000EC000000EC01792871BD0000001974455874536F667477617265
          007777772E696E6B73636170652E6F72679BEE3C1A000003514944415478DABD
          97494C136114C7DF9B2EAC856A50310AAE314A5C488CDE54C003A18516CAAA18
          2F0A7AE6A28488A28890108D8989010EDE308A14A1029118128D0A82D160D4C4
          B8D4C841910B8B34D076E6F34D6D0B484B876EFFA6E1B57DF3FD7FF3BE651E08
          12A5EBD4A9EC0297CD31962100EE43103603A0FADFAF6C826233052314F7CB64
          D0DDA5EF9A96322EFA4AC86C37AC97215F4D8927E963B4445E0BE5B77232D640
          205FFC0228BC5F186551CC55828015941523B552FFC946EFEB42A4F562AFA677
          4E3200957B3BCFA391C23D7E1A2F1683973239335035C67C02683A7253699E1F
          3380B541317733C02802A7E93674BCF70A20DEB9C0E38B609B2F70FB21E3D8C1
          85957003A4DD498B8C898F1FA0303524E6F31AA03591EE5A136E006D87EE3230
          BC106273D75DD73F327456BA01C4AD2607FE7300AB7DA5B20A8829BD790FBF3A
          003446FD6D0ACE86C9DCA5966E43673966F564C571B3CA9F20FD90F129A457C1
          0E0370C8C1BD4F6D9E9318CC44F3CA44A46D770C196B0DA679D9DE53A0DB960D
          16BB058A4DA5E4C53C33201663B651DF423F9F0EB6B95DB043DDAB0618FA35EC
          FD02C69A5163CC1D426007C26EEEB80606516BD48F539C106E7327C06F11403C
          1094DE06BE91DEE818B466A016A6ADD31E735CE636C1065707AFC1EBB13752D9
          E77C02DC3A7A1336C525C3B74933543DAF5E0411A0B91B60D9295047A8A1EED0
          154856258179F2BB0362CA3AE577D9974C819445E809A264675140E64E00C722
          6CA6B8CC57F2EAC85504510B1B633738A641A554F95BF6856A22005D09B1DC95
          92BDB01281DCF9BC581152EB156B915BC5A33856CA2562254EA494C2D3D16730
          32FE2E006FE7512CC6C13C0DA503B0E6EEFCAE330E00670FF891424598ECE738
          B9B0CBA43399E71B12A3BE9EFE9C0B13401D3D8AABC4C00DB0BFA95C91B866EC
          098587436A4D1DB21065CD58D29289A2A95867E77198BE4C0A89F9724DA94B5A
          63DE6E06424FD021C89CE3058DA9C0F461F1D71E9463CA49E06DF8808EDB2341
          315FC93F262E51AB16219B555EA2ED59015E1E561264A57763B45D59D356D466
          F55C181FD2B6E76F05B49FA7BB38BE82AEF90FEDF3564EC1EAC5ADB65CA24F00
          97C413734661D350FF984130A988B085AAA3760E32C1189819C25B7AB0F5DB62
          667BFA32FB66A48CFB17C72281EEF814CB4F0000000049454E44AE426082}
        OnClick = imgConfirmClick
        ExplicitLeft = 0
      end
      object imgCancel: TImage
        Left = 0
        Top = 0
        Width = 50
        Height = 50
        Cursor = crHandPoint
        Align = alLeft
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF4000000017352474200AECE1CE90000000467414D41
          0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000003
          D64944415478DAC597594C134118C7BFAFAC9C85A2B20B6A3C50A48A9417128D
          21D226C6233E1AD1C4372F12A3268A57A2E1C57844E5089298783D19630CFAA0
          3131E1696B109E2D842822A278A45D91564485B41DBFD91ED2C276176CE3D76C
          663A3B33FFDF7E33DFB7B308FFD9D06847E67008CA70703303DC4883D653D362
          BAE6D325D03542D700437C81C01E8B56A913DBDA024901F09439CC4C8013C858
          2DFD5D6090D7C3001A27CC13AD8BBBBA7ECD1AC063B3D750D13203E1781B02C4
          3AC9253F9C1100ABAC9CA34C981BA97A6496C231D3D1EF92D8E3AC27B1A02E00
          ABA949535E2BF780B15D49109FA4840F4497BC3B1E620A80526EBFCE100E2655
          FCAF2F2E4A3DCEB39A00EEF2EAED88F82825E261048A949A42971CD5880228D6
          AA5C364718A096821402701B1A1BC5D2E241F9770C80A7C27E865C74416B1466
          670166644070C49B7076CCCBE5CF096CF487B61B104E15BA9C57A300A124C33E
          5355D412B75CBFAC4EEEDB774C1382DFCFBFD9A802786B8F2782708BABA4453C
          59A900EE72FB264468D7EA6D9A9B0F963BCD20941483BFFFDDB410A6FC3CB0DC
          680061752904DE0F81772FF551BE6ABBCA841BA49772870A4009E71AE8C47C22
          0853BE052CF4E4C2AA12080C92F83E1D71EE2D640DA2EBF9C90880938A6AD031
          15E27613082B9743E0DD07123A0A100882E5168997AE302C1EB64EA9DB591501
          705321191915EF09BEDE2AD0DB41F0EE27F1E11123D3707313405104608C8A6C
          A323277B829BEA0D2EAE0C1B9D82DB380164AA005F6CF6F13480F4D902F8DF0C
          806F7F9D6E88C6D94F02C88978E023158B0C89F30DC7C569CD272F81BFEF6D08
          C2EB330A3044004B420015D51D941DAAF4C529D46E36A9BB3D1209DC229BD0FF
          AA1F7CB51CE2BBBE3C830E7A2F6C08E5019BBD892AC712F5C75CB39A648435D6
          680404BF7E0BDDE30988E700BA671482F4AE88DDCED3610F38B6922B9F69760E
          6738A1ACD45022F2F7F68532E1F7D1440CDB68099E8552715959BA92260E82C6
          C907CD396A2A3659F2629E7C5A2FDDA0142F08E03D40003E4D2F7CA254BC349A
          8AB929367B3D9DE3CE697A21271B303D3D292F23EA552F75CBE7C34B11B2E192
          757981ACCC5E30180DFF609F8298612D72B58FC50070A3BDB083E8DB5228AE7D
          208942D8AA9BA9F9682AD4232FA098B62988B4A1693FDCA7EACEE48AC3DD02AB
          B427FE8365FA63394150766CD0CB0D868D618BD823D7193A964FB6F021B595AA
          0B6729ED26B7D792DB9F687A466F06353AB2330F935B0ECD0044A1FECD10C456
          A9574E148F33F838A564E53115386831B72083B534721935F31334FFF61BA765
          EBA50F535710D39E16CE634E9465BF91790D03A4CAFE00504DAA303F406E7700
          00000049454E44AE426082}
        OnClick = imgCancelClick
        ExplicitLeft = 8
      end
      object lblCancel: TPLabel
        Left = 50
        Top = 0
        Width = 51
        Height = 50
        Cursor = crHandPoint
        Align = alLeft
        Alignment = taCenter
        Caption = 'Cancelar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        OnClick = lblCancelClick
        ExplicitHeight = 15
      end
      object lblConfirm: TPLabel
        Left = 292
        Top = 0
        Width = 58
        Height = 50
        Cursor = crHandPoint
        Align = alRight
        Alignment = taCenter
        Caption = 'Confirmar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        OnClick = lblConfirmClick
        ExplicitLeft = 293
        ExplicitHeight = 15
      end
    end
    object gbType: TGroupBox
      AlignWithMargins = True
      Left = 10
      Top = 115
      Width = 380
      Height = 75
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      TabOrder = 3
      ExplicitTop = 112
      object rbAnalysis: TPRadioButton
        Left = 11
        Top = 12
        Width = 59
        Height = 17
        Caption = 'An'#225'lise'
        TabOrder = 0
        LabelSpacing = 0
      end
      object rbDevelopment: TPRadioButton
        Left = 11
        Top = 31
        Width = 117
        Height = 17
        Caption = 'Desenvolvimento'
        TabOrder = 1
        LabelSpacing = 0
      end
      object rbTest: TPRadioButton
        Left = 11
        Top = 50
        Width = 50
        Height = 17
        Caption = 'Teste'
        TabOrder = 2
        LabelSpacing = 0
      end
      object rbFix: TPRadioButton
        Left = 195
        Top = 12
        Width = 53
        Height = 17
        Caption = 'Ajuste'
        TabOrder = 3
        LabelSpacing = 0
      end
      object rbHelp: TPRadioButton
        Left = 195
        Top = 31
        Width = 55
        Height = 17
        Caption = 'Aux'#237'lio'
        TabOrder = 4
        LabelSpacing = 0
      end
    end
    object pnlType: TPanel
      Left = 150
      Top = 105
      Width = 100
      Height = 20
      BevelOuter = bvNone
      Caption = 'Registrar como:'
      TabOrder = 4
    end
    object pnlShortcuts: TPanel
      Left = 0
      Top = 200
      Width = 400
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      Caption = '[ENTER] Confirma - [ESC] Cancela - [TAB] Seleciona tipo'
      Color = 1973790
      Font.Charset = ANSI_CHARSET
      Font.Color = 9868950
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      ExplicitTop = 272
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnMessage = ApplicationEventsMessage
    Left = 184
    Top = 232
  end
end
