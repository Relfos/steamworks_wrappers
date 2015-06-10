Unit GenUtilities;


{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF}

Interface
Uses SysUtils;

Const
  Tab = #9;
	PathSeparator = '\';
  CrLf = #13#10;

Type
  Stream = Class
    Protected
      _Buffer:PByte;
      _Size:Cardinal;
      _Pos:Cardinal;

      Function GetEOF:Boolean;Virtual;

    Public
      Constructor Create(Const FileName:TERRAString = '');
      Procedure Release; Override;

      Procedure SetBuffer(BufferSize:Integer; Buffer:PByte);

      Procedure Resize(NewSize:Integer);

      Procedure ReadString(Var S:TERRAString; NullTerminated:Boolean = False);
      Procedure ReadLine(Var S:TERRAString);
      Procedure WriteString(S:TERRAString; NullTerminated:Boolean = False);
      Procedure WriteLine(S:TERRAString='');
      Procedure ReadLines(Var S:TERRAString);

      Function Read(Data:Pointer; Length:Cardinal):Cardinal;
      Function Write(Data:Pointer; Length:Cardinal):Cardinal;
      Procedure Truncate;
      Procedure Seek(NewPosition:Cardinal);

      Procedure Save(Const FileName:TERRAString);

      Procedure Copy(Dest:Stream);

      Property Buffer:PByte Read _Buffer;
      Property Position:Cardinal Read _Pos Write Seek;
      Property Size:Cardinal Read _Size;

      Property EOF:Boolean Read GetEOF;
    End;

Function StringExtractNextWord(Var S:TERRAString; Separator:TERRAString=' '):TERRAString;
Procedure ReplaceText(Const Token,Value:TERRAString; Var S:TERRAString);

Function IntToString(Const N:Integer):TERRAString;

Function StringUpper(Const S:TERRAString):TERRAString;

Implementation

Function IntMin(Const A,B:Integer):Integer; {$IFDEF FPC} Inline; {$ENDIF}
Begin
  If A<B Then Result:=A Else Result:=B;
End;

Function IntToString(Const N:Integer):TERRAString;
Var
  S:TERRAString;
Begin
  Str(N,S);
  Result := S;
End;

Function UpCase(Const C:TERRAChar):TERRAChar;
Begin
    If (C>='a')And(C<='z') Then
        Result := TERRAChar(Byte(C) - 32)
    Else
        Result := C;
End;

//Converts a string to upcase
Function StringUpper(Const S:TERRAString):TERRAString;
Var
  I:Integer;
Begin
  Result := S;
  For I:=1 To Length(S) Do
    Result[I] := UpCase(Result[I]);
End;

Procedure ReplaceText(Const Token,Value:TERRAString; Var S:TERRAString);
Var
  I:Integer;
  S2:TERRAString;
Begin
  If (Token = Value) Then
    Exit;

  I := Pos(StringUpper(Token),StringUpper(S));
  If (I>=1) Then
  Begin
    S2 := Copy(S,I+Length(Token),Length(S)-I);
    S := Copy(S,1,(I-1));
    ReplaceText(Token, Value, S2);
    S := S + Value + S2;
  End;
End;

Function StringExtractNextWord(Var S:TERRAString; Separator:TERRAString=' '):TERRAString;
Var
  I:Integer;
Begin
  S := TrimLeft(S);
  If S =  '' Then
  Begin
    Result := '';
    Exit;
  End;

  I := Pos(Separator, S);
  If I<1 Then
  Begin
    Result := S;
    S := '';
  End Else
  Begin
    Result := Copy(S, 1, (I-1));
    S := Copy(S, (I+1), MaxInt);
  End;
  S := TrimLeft(S);
End;

// Stream object
Constructor Stream.Create(Const FileName:TERRAString);
Var
  F:File;
Begin
  _Size := 0;
  _Pos := 0;

  If (FileName <> '') Then
  Begin
    AssignFile(F, FileName);
    Reset(F,1);
    Self.Resize(FileSize(F));
    BlockRead(F, Buffer^, Size);
    CloseFile(F);
  End Else
  Begin
    Self.Resize(1024);
  End;
End;

Procedure Stream.Release;
Begin
  FreeMem(_Buffer);
  _Size := 0;
  _Buffer := Nil;
End;

Function Stream.Read(Data:Pointer; Length:Cardinal):Cardinal;
Var
  P, P2:PByte;
  I:Integer;
Begin
  Result := 0;

  If (Length=0) Then
  Begin
    Exit;
  End;

  //Log(logDebug,'FileIO', 'Reading '+IntToString(Length)+' bytes from '+Self._Name);

  If Not Assigned(_Buffer) Then
  Begin
    Exit;
  End;

  If (_Pos>=_Size) Then
  Begin
    {$IFDEF PC}
    RaiseError('Cannot read from memory in '+Self._Name+' ('+IntToString(_Pos)+'/'+IntToString(_Size)+')');
    {$ENDIF}
    FillChar(Data^, Length, 0);
    Result := 0;
    Exit;
  End;

  If (_Pos+Length>_Size)Then
    Length:=_Size-_Pos;

  If (Length<=0) Then
    Exit;
    
  P := _Buffer;
  Inc(P, _Pos);
  P2 := PByte(Data);
  For I:=0 To (Length-1) Do
  Begin
    P2^ := P^;
    Inc(P2);
    Inc(P);
  End;

  Inc(_Pos,Length);
  Result := Length;
End;

Function Stream.Write(Data:Pointer; Length:Cardinal):Cardinal;
Var
  I:Integer;
  P,P2:PByte;
  NewSize:Integer;
Begin
  Result := 0;

  If (_Pos+Length>_Size) Then
  Begin
    NewSize := _Size + Length;
    Resize(NewSize);
  End;

  If Not Assigned(_Buffer) Then
  Begin
    Exit;
  End;

  If (_Pos+Length>_Size)Then
    Length := _Size-_Pos;

  If (Length<=0) Then
    Exit;

  P := _Buffer;
  Inc(P, _Pos);
  P2 := PByte(Data);
  For I:=0 To (Length-1) Do
  Begin
    P^ := P2^;
    Inc(P2);
    Inc(P);
  End;
  Inc(_Pos, Length);
  Result:=Length;
End;

Procedure Stream.Seek(NewPosition:Cardinal);
Begin
  If NewPosition>_Size Then
  Begin
    Exit;
  End;

  _Pos := NewPosition;
End;

Procedure Stream.Truncate;
Var
  Temp:PByte;
Begin
  Temp := _Buffer;

  GetMem(_Buffer, _Pos);
  Move(Temp^, _Buffer^, _Pos);
  FreeMem(Temp);
  
  _Size := _Pos;
End;

Procedure Stream.Resize(NewSize:Integer);
Var
  I, Min:Integer;
  Src, Dest:PByte;
  Ptr:Pointer;
Begin
  If (NewSize = Self.Size) Then
    Exit;

  GetMem(Ptr, NewSize);

  If (Assigned(_Buffer)) And (NewSize>0) Then
  Begin
    Src := _Buffer;
    Dest := Ptr;

    If (_Size<NewSize) Then
      Min := _Size
    Else
      Min := NewSize;

    For I:=0 To Pred(Min) Do
    Begin
      Dest^ := Src^;
      Inc(Dest);
      Inc(Src);
    End;

    FreeMem(_Buffer, _Size);
  End;

  _Size := NewSize;
  _Buffer := Ptr;
End;

Procedure Stream.SetBuffer(BufferSize:Integer;Buffer:PByte);
Begin
  _Size := BufferSize;
  _Buffer := Buffer;
  _Pos := 0;
End;


Function Stream.GetEOF: Boolean;
Begin
  Result := (Position>=Size);
End;

Procedure Stream.ReadLines(Var S:TERRAString);
Var
  S2:TERRAString;
Begin
  S := '';
  S2 := '';
  While Not Self.EOF Do
  Begin
    Self.ReadLine(S2);
    S := S + S2 + CrLf;
  End;
End;


Procedure Stream.ReadString(Var S:TERRAString; NullTerminated:Boolean = False);
Var
{$IFDEF OXYGENE}
  C:TERRAChar;
  I:Integer;
{$ENDIF}
  Len:Word;
  N:Byte;
Begin
  If (Not NullTerminated) Then
  Begin
    Read(@N, 1);
    If N=255 Then
      Read(@Len, 2)
    Else
      Len:=N;

    {$IFDEF OXYGENE}
    If (Len>0) Then
        S := new String('0', Len)
    Else
        S := nil;
    For I:=0 To (Len-1) Do
    Begin
        Read(@C, 1);
        S[I] := C;
    End;
    {$ELSE}
    SetLength(S,Len);
    If Len>0 Then
      Read(@(S[1]),Len);
    {$ENDIF}
  End Else
  Begin
    S := '';
    Repeat
      Read(@N, 1);
      If (N=0) Then
        Break;
      S := S + Chr(N);
    Until (False);
  End;
End;

Procedure Stream.WriteString(S:TERRAString; NullTerminated:Boolean = False);
Var
  Len:Word;
  N:Byte;
{$IFDEF OXYGENE}
  I:Integer;
  C:TERRAChar;
{$ENDIF}
Begin
  Len := Length(S);
  If (NullTerminated) Then
  Begin
    {$IFDEF OXYGENE}
    For I:=0 To (Len-1) Do
    Begin
        C := S[I];
        Write(Pointer(@C), 1);
    End;
    {$ELSE}
    Write(@S[1], Len);
    {$ENDIF}
    N := 0;
    Write(Pointer(@N), 1);
  End Else
  Begin
    If Len<255 Then
      N:=Len
    Else
      N:=255;
    Write(Pointer(@N), 1);

    If Len>=255 Then
      Write(Pointer(@Len), 2);

    {$IFDEF OXYGENE}
    For I:=0 To (Len-1) Do
    Begin
        C := S[I];
        Write(Pointer(@C), 1);
    End;
    {$ELSE}
    If Len>0 Then
      Write(@S[1], Len);
    {$ENDIF}
  End;
End;

Procedure Stream.ReadLine(Var S:TERRAString);
Var
  C:TERRAChar;
Begin
  S:='';
  C:=#0;
  While (C<>#10)And(Position<Size) Do
  Begin
    Read(@C, 1);
    If (C<>#10)Or(C<>#13) Then
    S:=S+C;
  End;
  S := TrimRight(S);
End;

Procedure Stream.WriteLine(S:TERRAString);
{$IFDEF OXYGENE}
Var
  C:TERRAChar;
  I:Integer;
{$ENDIF}
Begin
  S:=S+#13#10;
  {$IFDEF OXYGENE}
  For I:=0 To (S.Length-1) Do
  Begin
    C := S[I];
    Write(Pointer(@C), 1);
  End;
  {$ELSE}
  Write(@S[1],Length(S));
  {$ENDIF}
End;

Procedure Stream.Save(const FileName: TERRAString);
Var
  F:File;
Begin
  Self.Truncate();
  
  AssignFile(F, FileName);
  Rewrite(F,1);
  BlockWrite(F, Buffer^, Size);
  CloseFile(F);
End;

Procedure Stream.Copy(Dest:Stream);
Var
 Count,BytesRead:Integer;
 Buffer:PByte;
 BufferSize:Integer;
 BlockSize:Integer;
 A,B:Integer;
Begin
  Seek(0);
  Count := Self.Size;

  BufferSize:=65534;
  If Count<BufferSize Then
    BufferSize:=Count;

  {$IFDEF OXYGENE}
  Buffer := new Byte[BufferSize];
  {$ELSE}
  GetMem(Buffer,BufferSize);
  {$ENDIF}

  BytesRead:=0;
  While BytesRead<Count Do
  Begin
    A := Self.Size-Self.Position;
    B := Dest.Size-Dest.Position;
    B := A;

    BlockSize:=IntMin(IntMin(BufferSize,Count-BytesRead), IntMin(A,B));
    Read(Buffer, BlockSize);

    Dest.Write(Pointer(Buffer), BlockSize);
    Inc(BytesRead,BlockSize);
  End;

  {$IFDEF OXYGENE}
  Buffer := Nil;
  {$ELSE}
  FreeMem(Buffer,BufferSize);
  {$ENDIF}
End;

End.
