unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
const
  XorKey: array[0..7] of Byte = ($B2, $09, $AA, $55, $93, $6D, $84, $47); //字符串加密用

  implementation

{$R *.dfm}
function encsimon( Str: PChar;keys:pchar): PChar;stdcall;
external 'ENCC.dll';

function EncrypKey( Str: STRING;keys:STRING): STRING;stdcall;
external 'ENCC.dll';

{Function   EncrypKey   (Src:String;   Key:String):string;
  var
  idx   :integer;
  KeyLen   :Integer;
  KeyPos   :Integer;
  offset   :Integer;   
  dest   :string;
  SrcPos   :Integer;   
  SrcAsc   :Integer;   
  TmpSrcAsc   :Integer;   
  Range   :Integer;
    
  begin   
  KeyLen:=Length(Key);   
  if   KeyLen   =   0   then   key:='Think   Space';
  KeyPos:=0;   
  SrcPos:=0;   
  SrcAsc:=0;   
  Range:=256;
    
  Randomize;   
  offset:=Random(Range);   
  dest:=format('%1.2x',[offset]);
  for   SrcPos   :=   1   to   Length(Src)   do   
  begin   
  SrcAsc:=(Ord(Src[SrcPos])   +   offset)   MOD   255;   
  if   KeyPos   <   KeyLen   then   KeyPos:=   KeyPos   +   1   else   KeyPos:=1;
  SrcAsc:=   SrcAsc   xor   Ord(Key[KeyPos]);   
  dest:=dest   +   format('%1.2x',[SrcAsc]);   
  offset:=SrcAsc;   
  end;
  Result:=Dest;   
  end;   
    
  //解密函数
  Function   UncrypKey   (Src:String;   Key:String):string;   
  var   
  idx   :integer;   
  KeyLen   :Integer;
  KeyPos   :Integer;   
  offset   :Integer;   
  dest   :string;   
  SrcPos   :Integer;
  SrcAsc   :Integer;   
  TmpSrcAsc   :Integer;   
  Range   :Integer;   

  begin   
  KeyLen:=Length(Key);   
  if   KeyLen   =   0   then   key:='Think   Space';   
  KeyPos:=0;
  SrcPos:=0;   
  SrcAsc:=0;   
  Range:=256;
  offset:=StrToInt('$'+   copy(src,1,2));   
  SrcPos:=3;
  repeat
  SrcAsc:=StrToInt('$'+   copy(src,SrcPos,2));
  if   KeyPos   <   KeyLen   Then   KeyPos   :=   KeyPos   +   1   else   KeyPos   :=   1;
  TmpSrcAsc   :=   SrcAsc   xor   Ord(Key[KeyPos]);
  if   TmpSrcAsc   <=   offset   then
  TmpSrcAsc   :=   255   +   TmpSrcAsc   -   offset
  else
  TmpSrcAsc   :=   TmpSrcAsc   -   offset;
  dest   :=   dest   +   chr(TmpSrcAsc);
  offset:=srcAsc;
  SrcPos:=SrcPos   +   2;
  until   SrcPos   >=   Length(Src);
  Result:=Dest;
  end;

function enc_simon(Str:pchar):pchar;//字符加密函數  這是用的一個異或加密
var
i,j:Integer;
begin
Result:='';
j:=0;
for i:=1 to Length(Str) do
begin
Result:=PChar(Result+IntToHex(Byte(Str[i]) xor XorKey[j],2));
j:=(j+1) mod 8;
end;
end;

function Dec_simon(Str:pchar):pchar;//字符解密函數
var
i,j:Integer;
begin
Result:='';
j:=0;
for i:=1 to Length(Str) div 2 do
begin
Result:=PChar(Result+Char(StrToInt('$'+Copy(Str,i*2-1,2)) xor XorKey[j]));
j:=(j+1) mod 8;
end;
end;        }

procedure TForm1.Button1Click(Sender: TObject);
begin
//MEMO2.Text :=EncrypKey(Memo1.Text,Edit1.Text);

  Memo2.Text :=EncrypKey(Memo1.Text,'aa');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
//Memo1.Text :=UncrypKey(Memo2.Text,Edit1.Text);
end;

end.
