object frmDrop: TfrmDrop
  Left = 252
  Top = 150
  ActiveControl = tvFolders
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Select folder'
  ClientHeight = 287
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 8
    Width = 64
    Height = 13
    Caption = 'Select folder:'
  end
  object PathLabel: TLabel
    Left = 14
    Top = 232
    Width = 261
    Height = 13
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
  end
  object btnCancel: TButton
    Left = 202
    Top = 253
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 0
    OnClick = btnCancelClick
  end
  object tvFolders: TTreeView
    Left = 8
    Top = 24
    Width = 273
    Height = 201
    Anchors = [akLeft, akTop, akRight, akBottom]
    HideSelection = False
    Images = ilSmallIcons
    Indent = 19
    TabOrder = 1
    OnChange = tvFoldersChange
    OnDblClick = tvFoldersDblClick
    OnExpanding = tvFoldersExpanding
    OnGetImageIndex = tvFoldersGetImageIndex
    OnGetSelectedIndex = tvFoldersGetSelectedIndex
  end
  object btnOK: TButton
    Left = 120
    Top = 253
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOKClick
  end
  object ilSmallIcons: TImageList
    ShareImages = True
    Left = 16
    Top = 32
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000C055C055C055C055C055C055
      C055C055C055C055C055C055C055000000000000C055C055C055C055C055C055
      C055C055C055C055C055C0550000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C055E97AC055717FE97AE97AE97A
      E97AE97AE97AE97AE97A6466927BC0550000C0552262CA722D7FE97AE97AE97A
      E97AE97AE97AE97A097B6466015E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C055097BC055727F0A7F0A7B0A7F
      0A7B0A7F0A7F0A7F0A7B6466937BC0550000C055A6724462717F0A7F0A7B0A7F
      0A7B0A7F0A7F0A7F0A7B6466B777C05500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0552A7FC055937F4B7F4B7F4B7F
      4B7F4B7F4B7F4B7F4B7F8566B47BC0550000C0552A7FC055937F4B7F4B7F4B7F
      4B7F4B7F4B7F4B7F4B7F8566B777C05500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0554B7FC055B47F6D7F6D7F6D7F
      6D7F6D7F6D7F6D7F6D7F8566B57BC0550000C0554B7F015A50778F7F6D7F6D7F
      6D7F6D7F6D7F6D7F6D7F8566B777E15900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0556D7FC055B47F8E7F8E7F8E7F
      8E7F8E7F8E7F8E7F8E7FA666D57BC0550000C0556D7F856AC96AB27F8E7F8E7F
      8E7F8E7F8E7F8E7F8E7FA666B777B777C0550000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0558E7FC055FF7FD77FD77FD77F
      D77FD77FD77FD77FD77F3073DA7FC0550000C0558E7F4B77025AFF7FD77FD77F
      D77FD77FD77FD77FD77F306FFC7FB87BC0550000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C055AF7FC055C055C055C055C055
      C055C055C055C055C055C055C055C0550000C055AF7FAF7FE159C055C055C055
      C055C055C055C055C055C055C055C055C0550000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C055D07FD07FD07FD07FD07FD07F
      D07FD07FD07FD07FD07FA051000000000000C055D07FD07FD07FD07FD07FD07F
      D07FD07FD07FD07FD07FA0510000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C055FF7FF17FF17FF17FF17FF17F
      F17FF17FF17FF17FF17FA051000000000000C055FF7FF17FF17FF17FF17FF17F
      F17FF17FF17FF17FF17FA0510000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000C055FF7FF17FF17FF17FC055
      C055C055C055C055C05500000000000000000000C055FF7FF17FF17FF17FC055
      C055C055C055C055C05500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C055C055C055C0550000
      00000000000000000000000000000000000000000000C055C055C055C0550000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0080038007000000000001000300000000
      0001000100000000000100010000000000010001000000000001000000000000
      0001000000000000000100000000000000070007000000000007000700000000
      800F800F00000000C3FFC3FF00000000FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
end
