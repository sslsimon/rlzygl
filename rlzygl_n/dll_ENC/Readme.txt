DELPHI DLL函数说明

function EncrypKey(Src: string; Key: string): string; //加密函数
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

function UncrypKey(Src: string; Key: string): string; //解密函数
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


function encsimon( Str: PChar;keys:pchar): PChar; cdecl; export;
var s,b:string;
begin
  s:=string(Str);
  b:=string(keys);
  Result :=StrPCopy(str,EncrypKey(s,b));
end;
exports
encsimon;

function uncsimon( Str: PChar;keys:pchar): PChar; cdecl; export;
var s,b:string;
begin
  s:=string(Str);
   b:=string(keys);
  Result :=StrPCopy(str,UncrypKey(s,b));
end;
exports
 uncsimon;



IB中引用定义

DECLARE EXTERNAL FUNCTION encsimon
CSTRING (4000),CSTRING (256)
RETURNS CSTRING (4000) free_it
ENTRY_POINT 'encsimon' MODULE_NAME 'ENCC.dll';

DECLARE EXTERNAL FUNCTION uncsimon
CSTRING (4000),CSTRING (256)
RETURNS CSTRING (4000) free_it
ENTRY_POINT 'uncsimon' MODULE_NAME 'ENCC.dll';



如发现不能全表更新，是因为表结构字段长度不够的问题，10个中文的字段长度需要变更为VARCHAR(50)
,加密后内容会变长，因此需要变更原字段长度

IB SQL测试
select encsimon(ry_name,'') from ryxx

select uncsimon(ry_name,'') from ryxx


update ry_name set bmmc=encsimon(ry_name,'')

update ry_name set bmmc=uncsimon(ry_name,'')

select uncsimon(encsimon(ry_name,''),'') from ryxx