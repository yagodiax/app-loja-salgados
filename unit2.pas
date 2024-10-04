unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, mysql80conn, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus, Grids, ComCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
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
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SQLQuery1: TSQLQuery;
    StringGrid1: TStringGrid;
    procedure Button2Click(Sender: TObject);
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

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin
  StringGrid1.ColCount := 3;
  StringGrid1.Cells[0, 0] := 'Qtd';
  StringGrid1.Cells[1, 0] := 'Produto';
  StringGrid1.Cells[2, 0] := 'Valor';
  TotalValue := 0; // Inicializar o valor total
  Label4.Caption := 'R$ 0.00';
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  // Limpa todas as linhas do StringGrid, exceto a linha do cabeçalho
  StringGrid1.RowCount := 1;

  // Redefine o valor total
  TotalValue := 0;
  Label4.Caption := 'R$ 0.00'
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

  // Adiciona a quantidade
  StringGrid1.Cells[0, RowIndex] := IntToStr(RowIndex);

  // Adiciona o nome
  StringGrid1.Cells[1, RowIndex] := ItemName;

  // Adiciona o valor
  ItemValue := Value;
  StringGrid1.Cells[2, RowIndex] := FormatFloat('R$ 0.00', ItemValue);

  // Atualiza o valor total e exibe na label
  TotalValue := TotalValue + ItemValue;
  Label4.Caption := 'R$ ' + FormatFloat('0.00', TotalValue);
end;

end.

