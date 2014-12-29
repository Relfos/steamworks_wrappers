Unit SteamworksProcessor;

{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF}

Interface

Type
  FunctionArgumentDecl = Class
    IsVar:Boolean;
    Name:AnsiString;
    InitVal:AnsiString;
    ArgumentType:AnsiString;
  End;

  FunctionDecl = Class
    Name:AnsiString;
    EntryPoint:AnsiString;
    ReturnType:AnsiString;

    Arguments:Array Of FunctionArgumentDecl;
    ArgumentCount:Integer;

    Function AddArgument():FunctionArgumentDecl;
  End;

  EnumFieldDecl = Class
    Name:AnsiString;
    Value:AnsiString;
    Comment:AnsiString;
  End;

  EnumDecl = Class
    Name:AnsiString;
    Decls:Array Of EnumFieldDecl;
    DeclCount:Integer;

    Constructor Create(Const Name:AnsiString);
    Function AddDecl():EnumFieldDecl;
  End;

  StructFieldDecl = Class
    Name:AnsiString;
    FieldType:AnsiString;
    Comment:AnsiString;
    Count:AnsiString;
  End;

  StructDecl = Class
    Public
      Name:AnsiString;
      Fields:Array Of StructFieldDecl;
      FieldCount:Integer;

      Constructor Create(Const Name:AnsiString);
      Function AddField():StructFieldDecl;
  End;

  ConstDecl = Record
    Name:AnsiString;
    ConstType:AnsiString;
    Value:AnsiString;
  End;

  RegionDecl = Class
    Name:AnsiString;

    Functions:Array Of FunctionDecl;
    FunctionCount:Integer;

    Constructor Create(Const Name:AnsiString);
    Procedure AddFunction(Func:FunctionDecl);
  End;

  SteamDeclarations = Class
    Protected
      Procedure LoadConsts(Const SrcName:AnsiString);
      Procedure LoadEnums(Const SrcName:AnsiString);
      Procedure LoadStructs(Const SrcName:AnsiString);

      Procedure LoadRegion(Var Lines:AnsiString);

      Function ReadNextDecl(Var Lines:AnsiString):FunctionDecl;

    Public
      Consts:Array Of ConstDecl;
      ConstCount:Integer;

      Enums:Array Of EnumDecl;
      EnumCount:Integer;

      Structs:Array Of StructDecl;
      StructCount:Integer;

      Regions:Array Of RegionDecl;
      RegionCount:Integer;

      Constructor Create();

      Function AddRegion(Const Name:AnsiString):RegionDecl;
      Function AddEnum(Const Name:AnsiString):EnumDecl;
  End;

Implementation

Uses SysUtils, GenUtilities;

Function IsPointer(Const TypeName:AnsiString):Boolean;
Begin
  Result := (Copy(TypeName, Length(TypeName) - 3, 3) = 'Ptr');
End;

{ SteamDeclarations }
Constructor SteamDeclarations.Create;
Var
  Src, Output:Stream;
  Tag, Tag2, Lines, S, S2, Def:AnsiString;
  I,J:Integer;
Begin
  ConstCount := 0;
  EnumCount := 0;
  StructCount := 0;

  LoadConsts('SteamConstants.cs');
  LoadEnums('SteamEnums.cs');
  LoadStructs('SteamStructs.cs');

  Src := Stream.Create('NativeMethods.cs');
  Src.ReadLines(Lines);
  Src.Destroy;

  Tag := '#if ';
  Tag2 := '#endif';
  I := Pos(Tag, Lines);
  While I>0 Do
  Begin
    S := Copy(Lines, 1, Pred(I));
    Lines := Copy(Lines, I+Length(Tag), MaxInt);

    I := Pos(CrLf, Lines);
    J := Pos(' ', Lines);

    If (J>0) And ((J<I) Or (I<=0)) Then
      I := J;

    Def := Copy(Lines, 1, Pred(I));
    Lines := Copy(Lines, Succ(I), MaxInt);


    I := Pos(Tag2, Lines);
    Lines := Copy(Lines, I+Length(Tag2), MaxInt);

    Lines := S + CrLf + Lines;
    I := Pos(Tag, Lines);
  End;

  Tag := '#region ';
  Repeat
    I := Pos(Tag, Lines);
    If I<=0 Then
      Break;

    Lines := Copy(Lines, I + Length(Tag), MaxInt);
    LoadRegion(Lines);
  Until False;
End;


Procedure SteamDeclarations.LoadConsts(Const SrcName:AnsiString);
Var
  Tag, Lines:AnsiString;
  S, S2, S3:AnsiString;
  Src:Stream;
  I,J:Integer;
  ConstType,Name, Value:AnsiString;
Begin
  Src := Stream.Create(SrcName);
  Src.ReadLines(Lines);
  Src.Destroy;

  Tag := 'public const ';
  I := Pos(Tag, Lines);
  While I>0 Do
  Begin
    Lines := Copy(Lines, I + Length(Tag), MaxInt);

    ConstType := TrimLeft(TrimRight(GetNextWord(Lines, ' ')));
    Name := GetNextWord(Lines, '=');
    Value := GetNextWord(Lines, ';');

    Inc(ConstCount);
    SetLength(Consts, ConstCount);
    Consts[Pred(ConstCount)].Name := TrimLeft(TrimRight(Name));
    Consts[Pred(ConstCount)].ConstType := ConstType;
    Consts[Pred(ConstCount)].Value := Value;

    I := Pos(Tag, Lines);
  End;
End;

Procedure SteamDeclarations.LoadEnums(Const SrcName:AnsiString);
Var
  Tag, Lines:AnsiString;
  S, S2, S3:AnsiString;
  Src:Stream;
  I,J:Integer;

  CurrentEnum:EnumDecl;
  CurrentDecl:EnumFieldDecl;
Begin
  Src := Stream.Create(SrcName);
  Src.ReadLines(Lines);
  Src.Destroy;

  CurrentEnum := Nil;

  Tag := 'public enum ';
  I := Pos(Tag, Lines);
  While I>0 Do
  Begin
    Lines := Copy(Lines, I + Length(Tag), MaxInt);

    S := GetNextWord(Lines, ' ');
    If S[1] = 'E' Then
      S := Copy(S, 2, MaxInt);

    If Pos('Steam', S)<=0 Then
      S := 'Steam' + S;

{    If S = 'MatchMakingServerResponse' Then
      IntToString(2);}

    CurrentEnum := Self.AddEnum(S);
    CurrentDecl := Nil;

    GetNextWord(Lines, '{');
    I := Pos('}', Lines);
    S := Copy(Lines, 1, Pred(I));
    Lines := Copy(Lines, I + 1, MaxInt);

    S := TrimLeft(S);
    While S<>'' Do
    Begin
      S2 := Copy(S, 1, 2);
      If (S2='//') Then
      Begin
        I := Pos(CrLf, S);
        S2 := Copy(S, 1, Pred(I));
        S := Copy(S, Succ(I), MaxInt);

        S2 := TrimLeft(S2);
        GetNextWord(S2, ' ');

        If Assigned(CurrentDecl) Then
          CurrentDecl.Comment := S2;
      End Else
      Begin
        I := Pos(',', S);
        J := Pos('//', S);
        If (J>0) And (J<I) Then
        Begin
          S2 := Copy(S, 1, Pred(J));
          S := TrimLeft(Copy(S, J, MaxInt));
        End Else
        If (I<=0) Then
        Begin
          S2 := S;
          S := '';
        End Else
        Begin
          S2 := Copy(S, 1, Pred(I));
          S := TrimLeft(Copy(S, Succ(I), MaxInt));
        End;

        S3 := GetNextWord(S2, '=');

        ReplaceText('k_E', 'Steam', S3);
        ReplaceText('k_E', 'Steam', S2);

        S2 := TrimRight(TrimLeft(S2));
        If S2 = '' Then
          S2 := IntToString(EnumCount);

        CurrentDecl := CurrentEnum.AddDecl();
        CurrentDecl.Name := TrimRight(TrimLeft(S3));
        CurrentDecl.Value := TrimRight(TrimLeft(S2));
      End;

      S := TrimLeft(S);
    End;

    I := Pos(Tag, Lines);
  End;
End;


Procedure SteamDeclarations.LoadStructs(Const SrcName:AnsiString);
Var
  Tag, Lines:AnsiString;
  S, S2, S3:AnsiString;
  Src:Stream;
  I,J,K,W:Integer;
  NextCount:AnsiString;

  Struct:StructDecl;
  CurrentField:StructFieldDecl;
Begin
  Src := Stream.Create(SrcName);
  Src.ReadLines(Lines);
  Src.Destroy;

  Tag := 'public struct ';
  I := Pos(Tag, Lines);
  While I>0 Do
  Begin
    Lines := Copy(Lines, I + Length(Tag), MaxInt);

    S := GetNextWord(Lines, ' ');
    If Pos('_t', S)>Length(S)-2 Then
      S := Copy(S, 1,  Length(S)-2);

    If Pos('Steam', S)<=0 Then
      S := 'Steam' + S;

    {If S='SteamMatchMakingKeyValuePair' Then
      IntToString(2);}

    Inc(StructCount);
    SetLength(Structs, StructCount);

    Struct := StructDecl.Create(S);
    Structs[Pred(StructCount)] := Struct;
    CurrentField := Nil;

    GetNextWord(Lines, '{');
    I := Pos(Tag, Lines);
    If I<=0 Then
    Begin
      S := Lines;
      Lines := '';
    End Else
    Begin
      S := Copy(Lines, 1, Pred(I));
      Lines := Copy(Lines, I, MaxInt);
    End;

    NextCount := '';
    S := TrimLeft(S);
    While S<>'' Do
    Begin
      S2 := Copy(S, 1, 2);

      If (Pos('}', S2)>0) Then
        Break;

      If (S2='//') Then
      Begin
        I := Pos(CrLf, S);
        S2 := Copy(S, 1, Pred(I));
        S := Copy(S, Succ(I), MaxInt);

        S2 := TrimLeft(S2);
        GetNextWord(S2, ' ');

        If Assigned(CurrentField) Then
          CurrentField.Comment := S2;
      End Else
      Begin
        I := Pos(';', S);
        J := Pos('//', S);
        K := Pos(CrLf, S);
        W := Pos('{', S);

        If (W>0) And ((W<I) Or (I<=0)) And ((W<J) Or (J<=0)) And ((W<K) Or (K<=0)) Then
        Begin
          I := Pos('}', S);
          S := TrimLeft(Copy(S, Succ(I), MaxInt));
          Continue;
        End Else
        If (K>0) And ((K<I) Or (I<=0)) And ((K<J) Or (J<=0)) Then
        Begin
          S2 := Copy(S, 1, Pred(K));
          S := TrimLeft(Copy(S, K, MaxInt));
        End Else
        If (J>0) And (J<I) Then
        Begin
          S2 := Copy(S, 1, Pred(J));
          S := TrimLeft(Copy(S, J, MaxInt));
        End Else
        If (I<=0) Then
        Begin
          S2 := S;
          S := '';
        End Else
        Begin
          S2 := Copy(S, 1, Pred(I));
          S := TrimLeft(Copy(S, Succ(I), MaxInt));
        End;

        S2 := TrimLeft(S2);

        If Pos('[Marshal',S2)>0 Then
        Begin
          If Pos('ByValTStr', S2)>0 Then
          Begin
            GetNextWord(S2, '=');
            NextCount := GetNextWord(S2, ')');

            ReplaceText('Constants.', '', NextCount);
          End;
        End Else
        If Pos('{',S2)>0 Then
        Begin
          GetNextWord(S, '}');
        End Else
        Begin
          GetNextWord(S2, ' '); // public

          CurrentField := Struct.AddField();
          CurrentField.FieldType := TrimRight(TrimLeft(GetNextWord(S2, ' '))); // get type
          CurrentField.Name := TrimRight(TrimLeft(GetNextWord(S2, ';'))); // get name
          CurrentField.Count := NextCount;
          NextCount := '';

          If CurrentField.Name[2] = '_' Then
          Begin
            ReplaceText('m_un', '', CurrentField.Name);
            ReplaceText('m_us', '', CurrentField.Name);

            ReplaceText('m_', '', CurrentField.Name);
          End;

        End;

      End;
      S := TrimLeft(S);
    End;

    I := Pos(Tag, Lines);
  End;
End;

Function SteamDeclarations.ReadNextDecl(Var Lines:AnsiString):FunctionDecl;
Var
  S, S2, S3, Tag:AnsiString;
  I,J,K:Integer;
  EntryPoint:AnsiString;
  CurrentArg:FunctionArgumentDecl;
Begin
  Tag := 'EntryPoint = "';
  I := Pos(Tag, Lines);
  If I<=0 Then
  Begin
    EntryPoint := '';
  End Else
  Begin
    Lines := Copy(Lines, I + Length(Tag), MaxInt);
    EntryPoint := GetNextWord(Lines, '"');
  End;

  Tag := 'public static extern ';
  I := Pos(Tag, Lines);
  If I<=0 Then
  Begin
    Result := Nil;
    Exit;
  End;

  Lines := Copy(Lines, I + Length(Tag), MaxInt);
  I := Pos(';', Lines);
  If I<=0 Then
  Begin
    S := Lines;
    Lines := '';
  End Else
  Begin
    S := Copy(Lines, 1, Pred(I));
    Lines := Copy(Lines, I, MaxInt);
  End;

  Result := FunctionDecl.Create();

  Result.ReturnType := GetNextWord(S, ' ');
  Result.Name := GetNextWord(S, '(');

  If EntryPoint<>'' Then
    Result.EntryPoint := EntryPoint
  Else
    Result.EntryPoint := Result.Name;

  I := Pos('[MarshalAs', S);
  While (I>0) Do
  Begin
    S2 := Copy(S, 1, Pred(I));
    S := Copy(S, I+5, MaxInt);
    GetNextWord(S, ']');
    S := S2+' '+S;
    I := Pos('[MarshalAs', S);
  End;

  S2 := GetNextWord(S, ')');

  Result.ArgumentCount := 0;
  While S2<>'' Do
  Begin
    S3 := GetNextWord(S2, ',');


    CurrentArg := Result.AddArgument();

    CurrentArg.ArgumentType := GetNextWord(S3, ' ');

    CurrentArg.IsVar := (CurrentArg.ArgumentType='out');
    
    If (CurrentArg.IsVar) Then
      CurrentArg.ArgumentType := GetNextWord(S3, ' ');

    CurrentArg.Name := TrimLeft(TrimRight(GetNextWord(S3, '=')));

    If Pos('"', S3)>0 Then
      S3 := '';

    //ReplaceText('"', '''', S3);

    CurrentArg.InitVal := S3;
  End;

  Result.ReturnType := TrimLeft(TrimRight(Result.ReturnType));

  If (Result.ArgumentCount=0) And (Pos('_', Result.Name)<=0) And (IsPointer(Result.ReturnType)) Then
    Result.Name := 'Get'+Result.Name;
End;

Procedure SteamDeclarations.LoadRegion(Var Lines:AnsiString);
Var
  Tag:AnsiString;
  S, RegionName:AnsiString;
  I,J,K:Integer;
  Func:FunctionDecl;
  CurrentRegion:RegionDecl;
Begin
  I := Pos(CrLf, Lines);
  J := Pos(' ', Lines);

  If (J>0) And ((J<I) Or (I<=0)) Then
    I := J;

  RegionName := Copy(Lines, 1, Pred(I));
  Lines := Copy(Lines, Succ(I), MaxInt);

  Tag := '#endregion';
  I := Pos(Tag, Lines);
  S := Copy(Lines, 1, Pred(I));
  Lines := Copy(Lines, I + Length(Tag), MaxInt);

  CurrentRegion := Self.AddRegion(RegionName);

  Repeat
    Func := ReadNextDecl(S);
    If Func = Nil Then
      Break
    Else
      CurrentRegion.AddFunction(Func);
  Until False;
End;

Function SteamDeclarations.AddRegion(const Name: AnsiString):RegionDecl;
Begin
  Result := RegionDecl.Create(Name);

  Inc(RegionCount);
  SetLength(Regions, RegionCount);
  Regions[Pred(RegionCount)] := Result;
End;

Function SteamDeclarations.AddEnum(const Name: AnsiString): EnumDecl;
Begin
  Result := EnumDecl.Create(Name);

  Inc(EnumCount);
  SetLength(Enums, EnumCount);
  Enums[Pred(EnumCount)] := Result;
End;

{ StructDecl }
Function StructDecl.AddField: StructFieldDecl;
Begin
  Result := StructFieldDecl.Create();
  Inc(FieldCount);
  SetLength(Fields, FieldCount);
  Fields[Pred(FieldCount)] := Result
End;

Constructor StructDecl.Create(const Name: AnsiString);
Begin
  Self.Name := Name;
  Self.FieldCount := 0;
End;

{ FunctionDecl }

Function FunctionDecl.AddArgument:FunctionArgumentDecl;
Begin
  Result := FunctionArgumentDecl.Create();
  Inc(ArgumentCount);
  SetLength(Arguments, ArgumentCount);
  Arguments[Pred(ArgumentCount)] := Result;
End;

{ RegionDecl }
Constructor RegionDecl.Create(const Name: AnsiString);
Begin
  Self.Name := Name;
  Self.FunctionCount := 0;
End;

Procedure RegionDecl.AddFunction(Func: FunctionDecl);
Begin
  Inc(FunctionCount);
  SetLength(Functions, FunctionCount);
  Functions[Pred(FunctionCount)] := Func;
End;

{ EnumDecl }
Constructor EnumDecl.Create(const Name: AnsiString);
Begin
  Self.Name := Name;
  Self.DeclCount := 0;
End;

Function EnumDecl.AddDecl: EnumFieldDecl;
Begin
  Result := EnumFieldDecl.Create();
  Inc(DeclCount);
  SetLength(Decls, DeclCount);
  Decls[Pred(DeclCount)] := Result;
End;

End.