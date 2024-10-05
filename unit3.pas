unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, DBGrids;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel5: TPanel;
    SQLQueryTopItems: TSQLQuery;
    Label10: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    tdata: TEdit;
    tdata1: TEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }


procedure TForm3.Button1Click(Sender: TObject);
var
  startDate, endDate, comboBoxText: String;
  totalValue: Double;
  recordCount: Integer;
  topItems: TStringList;
begin
  startDate := tdata.Text;
  endDate := tdata1.Text;
  comboBoxText := ComboBox1.Text;

  SQLQuery1.Close;

  // Verifica se os campos de data estão preenchidos
  if (startDate = '') or (endDate = '') then
  begin
    ShowMessage('Por favor, preencha ambos os campos de data.');
    Exit;
  end;

  // Define a consulta com os parâmetros necessários
  SQLQuery1.SQL.Text := 'SELECT * FROM vendas WHERE data BETWEEN :startDate AND :endDate';

  if comboBoxText <> '' then
  begin
    SQLQuery1.SQL.Add(' AND item = :comboBoxText');
    SQLQuery1.Params.ParamByName('comboBoxText').AsString := comboBoxText;
  end;

  SQLQuery1.Params.ParamByName('startDate').AsDate := StrToDate(startDate);
  SQLQuery1.Params.ParamByName('endDate').AsDate := StrToDate(endDate);

  // Executa a consulta no DBGrid
  SQLQuery1.Open;

  // Verifica se há registros retornados
  if SQLQuery1.IsEmpty then
  begin
    ShowMessage('Nenhum dado encontrado.');
    Label6.Caption := 'R$ 0,00';
    Label7.Caption := '0';
    Label10.Caption := 'Nenhum item vendido.';
    Exit;
  end;

  // Conta os registros retornados e soma os valores
  totalValue := 0;
  recordCount := 0;
  SQLQuery1.First;
  while not SQLQuery1.EOF do
  begin
    totalValue := totalValue + SQLQuery1.FieldByName('valor').AsFloat;
    recordCount := recordCount + 1;
    SQLQuery1.Next;
  end;

  // Exibe o total de valores em Label6
  Label6.Caption := 'R$ ' + FormatFloat('0.00', totalValue);

  // Exibe o número total de registros em Label7
  Label7.Caption := IntToStr(recordCount);

  // Se algo estiver escrito no ComboBox, cancela a lista dos mais vendidos
  if comboBoxText <> '' then
  begin
    Label10.Caption := '';
    Exit;
  end;

  // Usar um segundo TSQLQuery para a consulta dos itens mais vendidos
  SQLQueryTopItems.Close;
  SQLQueryTopItems.SQL.Text := 'SELECT item, COUNT(*) AS quantidade FROM vendas ' +
                        'WHERE data BETWEEN :startDate AND :endDate ' +
                        'GROUP BY item ORDER BY quantidade DESC LIMIT 5';

  SQLQueryTopItems.Params.ParamByName('startDate').AsDate := StrToDate(startDate);
  SQLQueryTopItems.Params.ParamByName('endDate').AsDate := StrToDate(endDate);

  // Executa a consulta
  SQLQueryTopItems.Open;

  topItems := TStringList.Create;
  try
    SQLQueryTopItems.First;
    while not SQLQueryTopItems.EOF do
    begin
      topItems.Add(SQLQueryTopItems.FieldByName('item').AsString + ' - ' + SQLQueryTopItems.FieldByName('quantidade').AsString + ' vendidos');
      SQLQueryTopItems.Next;
    end;

    // Exibe os 5 itens mais vendidos em Label10
    Label10.Caption := topItems.Text;
  finally
    topItems.Free;
  end;
end;
end.

