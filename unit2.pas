unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, mysql80conn, mysql56conn, Forms, Controls,
  Graphics, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, Grids, ComCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DataSource1: TDataSource;
    Image1: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MySQL56Connection1: TMySQL56Connection;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private
    TotalValue: Double;
    procedure AddItem(ItemName: String; Value: Double);
  public

  end;

var
  Form2: TForm2;

implementation

uses
  unit1;

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin
  StringGrid1.ColCount := 3;
  StringGrid1.Cells[0, 0] := 'Qtd';
  StringGrid1.Cells[1, 0] := 'Produto';
  StringGrid1.Cells[2, 0] := 'Valor';
  TotalValue := 0;
  Label4.Caption := 'R$ 0.00';
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  StringGrid1.RowCount := 1;
  TotalValue := 0;
  Label4.Caption := 'R$ 0.00'
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  form2.hide;
  form1.show;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  i: Integer;
  ItemName: String;
  ItemValue: Double;
  CurrentDateTime: TDateTime;
  ValueStr: String;
begin
  try
    for i := 1 to StringGrid1.RowCount - 1 do
    begin
      ItemName := StringGrid1.Cells[1, i];
      ValueStr := StringGrid1.Cells[2, i];
      ItemValue := StrToFloat(StringReplace(ValueStr, 'R$ ', '', [rfReplaceAll]));
      CurrentDateTime := Now;
      with SQLQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO vendas (item, valor, data) VALUES (:salgado, :valor, :data_hora)');
        ParamByName('salgado').AsString := ItemName;
        ParamByName('valor').AsFloat := ItemValue;
        ParamByName('data_hora').AsDateTime := CurrentDateTime;
        ExecSQL;
        SQLTransaction1.Commit;
      end;
    end;

    StringGrid1.RowCount := 1;
    TotalValue := 0;
    Label4.Caption := 'R$ 0.00';

    ShowMessage('Itens inseridos com sucesso!');
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao inserir dados: ' + E.Message);
      SQLTransaction1.Rollback;
    end;
  end;
end;

procedure TForm2.Image1Click(Sender: TObject);
begin
  AddItem('Coxinha', 7.00);
end;

procedure TForm2.Image2Click(Sender: TObject);
begin
  AddItem('Queijo C Presunto', 7.00);
end;

procedure TForm2.Image3Click(Sender: TObject);
begin
  AddItem('Assado Queijo C Presunto', 8.00);
end;

procedure TForm2.Image4Click(Sender: TObject);
begin
  AddItem('Pastel', 7.00);
end;

procedure TForm2.Image5Click(Sender: TObject);
begin
  AddItem('Kibe', 8.00);
end;

procedure TForm2.AddItem(ItemName: String; Value: Double);
var
  RowIndex: Integer;
  ItemValue: Double;
begin
  RowIndex := StringGrid1.RowCount;
  StringGrid1.RowCount := StringGrid1.RowCount + 1;

  StringGrid1.Cells[0, RowIndex] := IntToStr(RowIndex);

  StringGrid1.Cells[1, RowIndex] := ItemName;

  ItemValue := Value;
  StringGrid1.Cells[2, RowIndex] := FormatFloat('R$ 0.00', ItemValue);

  TotalValue := TotalValue + ItemValue;
  Label4.Caption := 'R$ ' + FormatFloat('0.00', TotalValue);
end;

end.

