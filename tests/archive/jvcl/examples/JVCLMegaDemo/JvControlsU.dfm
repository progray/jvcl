object JvControls: TJvControls
  Left = 0
  Top = 0
  Width = 660
  Height = 461
  HelpContext = 8
  TabOrder = 0
  object JvWaitingGradient1: TJvWaitingGradient
    Left = 0
    Top = 437
    Width = 660
    Height = 24
    Hint = 'Nothing to say'
    Align = alBottom
    Color = clBtnFace
    EndColor = clNavy
    Enabled = True
    GradientWidth = 70
    ParentColor = False
  end
  object Label3: TLabel
    Left = 0
    Top = 424
    Width = 660
    Height = 13
    Align = alBottom
    Caption = '  Here you can see something waiting  ...  a JvWaitingGradient:'
  end
  object Label4: TLabel
    Left = 336
    Top = 64
    Width = 177
    Height = 13
    Caption = 'Here you can see a JvZoom in action'
  end
  object Label5: TLabel
    Left = 477
    Top = 292
    Width = 55
    Height = 13
    Caption = 'Zoom level:'
  end
  object JvShape1: TJvShape
    Left = 367
    Top = 191
    Width = 234
    Height = 197
  end
  object JvGradientCaption1: TJvGradientCaption
    Left = 0
    Top = 0
    Width = 660
    Height = 25
    GradientEndColor = clBlue
    GradientSteps = 30
    GradientStyle = grHorizontal
    LabelCaption = 'I think this JvGradientCaption has a nice gradient ...'
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWhite
    LabelFont.Height = -11
    LabelFont.Name = 'MS Sans Serif'
    LabelFont.Style = []
    LabelAlignment = taLeftJustify
    Align = alTop
    DoubleBuffered = False
  end
  object SpinEdit1: TSpinEdit
    Left = 472
    Top = 400
    Width = 73
    Height = 22
    Increment = 10
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 50
    OnChange = SpinEdit1Change
  end
  object JvZoom1: TJvZoom
    Left = 368
    Top = 192
    Width = 232
    Height = 195
    ZoomLevel = 50
  end
  object JvImageListBox1: TJvImageListBox
    Left = 40
    Top = 192
    Width = 169
    Height = 73
    Color = clScrollBar
    Items = <
      item
        Text = 'With an JvImageListBox'
        ImageIndex = 0
        Indent = 0
      end
      item
        Text = 'you can images'
        ImageIndex = 1
        Indent = 0
      end>
    ButtonStyle = fsLighter
    ImageList = ImageList1
    ItemHeight = 20
    TabOrder = 3
  end
  object JvMultilineListbox1: TJvMultilineListBox
    Left = 40
    Top = 288
    Width = 169
    Height = 73
    ItemHeight = 16
    Items.Strings = (
      'JvMultilineListbox'
      'Allows you to show more than one line per list item. '
      'This is the third item here. '
      'Select the second!')
    TabOrder = 4
  end
  object JvTimeLine1: TJvTimeLine
    Left = 0
    Top = 25
    Width = 660
    Height = 152
    Color = clWhite
    TabOrder = 5
    YearFont.Charset = DEFAULT_CHARSET
    YearFont.Color = clWindowText
    YearFont.Height = -16
    YearFont.Name = 'MS Sans Serif'
    YearFont.Style = [fsBold]
    ShowMonthNames = False
    FirstVisibleDate = 37408.000000000000000000
    Images = ImageList1
    Items = <
      item
        Left = 182
        Top = 105
        Caption = 'Birthday from Mr.X!!!'
        Color = clMenuText
        Date = 37865.000000000000000000
        Hint = 'Very importend I guess'
        ImageIndex = 1
        ImageOffset = 50
        Selected = True
      end
      item
        Left = 7
        Top = 117
        Caption = 'Birthday of Mrs. Y'
        Color = clBlack
        Date = 37421.000000000000000000
        ImageIndex = 1
        Level = 1
        TextColor = clWhite
      end
      item
        Left = 12
        Top = 129
        Caption = 'is over'
        Color = clRed
        Date = 37434.000000000000000000
        ImageIndex = 2
        Level = 2
      end
      item
        Left = 36
        Top = 141
        Caption = 'I guess'
        Color = clYellow
        Date = 37495.000000000000000000
        ImageIndex = 3
        Level = 3
      end>
    HorzSupports = True
  end
  object ImageList1: TImageList
    Left = 312
    Top = 240
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      0000E07FE07FE07FE07FE07F0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000007C007C007C007C
      007C007C007C007C007C007C0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      0000E07FE07FE07FE07FE07F00000000000000000000E003E003000000000000
      000000000000000000000000000000000000000000000000007C007C007C007C
      007C007C007C007C007C007C0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      0000E07FE07FE07FE07FE07F00000000000000000000E003E003E003E0030000
      000000000000000000000000000000000000000000000000007C007C007C007C
      007C007C007C007C007C007C0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      0000E07FE07FE07FE07FE07F00000000000000000000E003E003E003E003E003
      E00300000000000000000000000000000000000000000000007C007C007C007C
      007C007C007C007C007C007C0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      0000E07FE07FE07FE07FE07F00000000000000000000E003E003E003E003E003
      E003E003E003000000000000000000000000000000000000007C007C007C007C
      007C007C007C007C007C007C0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      0000E07FE07FE07FE07FE07F00000000000000000000E003E003E003E003E003
      E003E003E003E003E0030000000000000000000000000000007C007C007C007C
      007C007C007C007C007C007C0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      0000E07FE07FE07FE07FE07F00000000000000000000E003E003E003E003E003
      E003E003E003000000000000000000000000000000000000007C007C007C007C
      007C007C007C007C007C007C0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      0000E07FE07FE07FE07FE07F00000000000000000000E003E003E003E003E003
      E00300000000000000000000000000000000000000000000007C007C007C007C
      007C007C007C007C007C007C0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      0000E07FE07FE07FE07FE07F00000000000000000000E003E003E00300000000
      000000000000000000000000000000000000000000000000007C007C007C007C
      007C007C007C007C007C007C0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      0000E07FE07FE07FE07FE07F00000000000000000000E0030000000000000000
      000000000000000000000000000000000000000000000000007C007C007C007C
      007C007C007C007C007C007C0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      0000E07FE07FE07FE07FE07F0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000007C007C007C007C
      007C007C007C007C007C007C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FFFFFFFFFFFF0000C107FFFFE0070000C107CFFFE0070000C107C3FFE0070000
      C107C0FFE0070000C107C03FE0070000C107C00FE0070000C107C03FE0070000
      C107C0FFE0070000C107C7FFE0070000C107DFFFE0070000C107FFFFE0070000
      FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
end
