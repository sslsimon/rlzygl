library ENCC;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes;

{const
  XorKey: array[0..7] of Byte = ($B2, $09, $AA, $55, $93, $6D, $84, $47); //字符串加密用

function enc_simon(Str:String):String;//字符加密函數  這是用的一個異或加密
var
 i,j:Integer;
begin
 Result:='';
 j:=0;
 for i:=1 to Length(Str) do
   begin
     Result:=Result+IntToHex(Byte(Str[i]) xor XorKey[j],2);
     j:=(j+1) mod 8;
   end;
   Result :=Str;
end;
exports
 enc_simon;    

function Dec_simon(Str: pchar): pchar; //已不使用解密函数
var
  i, j: Integer;
begin
  Result := '';
  j := 0;
  for i := 1 to Length(Str) div 2 do
  begin
    Result := pchar(Result + Char(StrToInt('$' + Copy(Str, i * 2 - 1, 2)) xor XorKey[j]));
    j := (j + 1) mod 8;
  end;
end; }

function EncrypKey(Src: string; Key: string): string; //加函数
var
  idx: integer;
  KeyLen: Integer;
  KeyPos: Integer;
  offset: Integer;
  dest: string;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;
begin
  KeyLen := Length(Key);
  if KeyLen = 0 then key := 'Think_simon';
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  Randomize;
  offset := Random(Range);
  dest := format('%1.2x', [offset]);
  for SrcPos := 1 to Length(Src) do
  begin
    SrcAsc := (Ord(Src[SrcPos]) + offset) mod 255;
    if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
    SrcAsc := SrcAsc xor Ord(Key[KeyPos]);
    dest := dest + format('%1.2x', [SrcAsc]);
    offset := SrcAsc;
  end;
  Result := Dest;
end;
exports
 EncrypKey;

function UncrypKey(Src: string; Key: string): string; //解函数
var
  idx: integer;
  KeyLen: Integer;
  KeyPos: Integer;
  offset: Integer;
  dest: string;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;

begin
  KeyLen := Length(Key);
  if KeyLen = 0 then key := 'Think_simon';
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  offset := StrToInt('$' + copy(src, 1, 2));
  SrcPos := 3;
  repeat
    SrcAsc := StrToInt('$' + copy(src, SrcPos, 2));
    if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= offset then
      TmpSrcAsc := 255 + TmpSrcAsc - offset
    else
      TmpSrcAsc := TmpSrcAsc - offset;
    dest := dest + chr(TmpSrcAsc);
    offset := srcAsc;
    SrcPos := SrcPos + 2;
  until SrcPos >= Length(Src);
  Result := Dest;
end;
exports
UncrypKey;


function encsimon( Str: PChar;keys:pchar): PChar; cdecl; export;//用于interbase7.5
var s,b:string;
begin
  s:=string(Str);
  b:=string(keys);
  Result :=StrPCopy(str,EncrypKey(s,b));
end;
exports
encsimon;

function uncsimon( Str: PChar;keys:pchar): PChar; cdecl; export;//用于interbase7.5
var s,b:string;
begin
  s:=string(Str);
   b:=string(keys);
  Result :=StrPCopy(str,UncrypKey(s,b));
end;
exports
 uncsimon;

{ function ENC_UNENC(A:pchar;B:pchar):PChar;cdecl;
begin
  if strpas(A)='' then result:=B else result:=A;
  END;
  exports
  ENC; }

{$R *.res}

begin
end.

 