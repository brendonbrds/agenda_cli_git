object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '.: Lista de Pacientes :.'
  ClientHeight = 436
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 370
    Align = alClient
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    object grid_listaPaciente: TDBGrid
      Left = 0
      Top = 0
      Width = 688
      Height = 370
      Align = alClient
      BorderStyle = bsNone
      Color = clBtnHighlight
      DrawingStyle = gdsGradient
      GradientEndColor = 15790320
      GradientStartColor = 15790320
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clTeal
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'field_codigo'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 251
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'field_paciente'
          Title.Alignment = taCenter
          Title.Caption = 'Paciente'
          Width = 216
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'field_telefone'
          Title.Alignment = taCenter
          Title.Caption = 'Telefone'
          Width = 220
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 370
    Width = 688
    Height = 66
    Align = alBottom
    BevelOuter = bvNone
    Color = clGradientActiveCaption
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    object slabel: TLabel
      Left = 8
      Top = 11
      Width = 55
      Height = 13
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9870674
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object search_paciente_edit: TEdit
      Left = 8
      Top = 30
      Width = 673
      Height = 21
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
end
