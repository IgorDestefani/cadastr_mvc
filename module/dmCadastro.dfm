object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 211
  Width = 293
  object connection: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Password=masterkey'
      'Server=127.0.0.1'
      'DriverID=PG')
    Left = 128
    Top = 88
  end
  object cursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 176
    Top = 48
  end
  object link: TFDPhysPgDriverLink
    Left = 32
    Top = 40
  end
end
