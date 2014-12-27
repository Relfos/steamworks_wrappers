Program gensteamheader;

{$APPTYPE CONSOLE}

Uses TERRA_Utils, TERRA_IO, TERRA_FileIO, TERRA_OS;

Const
  UnitName = 'SteamAPI';

Type
  ArgDecl = Record
    IsVar:Boolean;
    Name:AnsiString;
    InitVal:AnsiString;
    ArgType:AnsiString;
  End;

  FunctionDecl = Record
    Name:AnsiString;
    EntryPoint:AnsiString;
    ReturnType:AnsiString;
    Args:Array Of ArgDecl;
    ArgCount:Integer;
  End;

  EnumDecl = Record
    Name:AnsiString;
    Value:AnsiString;
    Comment:AnsiString;
  End;

  FieldDecl = Record
    Name:AnsiString;
    FieldType:AnsiString;
    Comment:AnsiString;
    Count:AnsiString;
  End;

  ConstDecl = Record
    Name:AnsiString;
    ConstType:AnsiString;
    Value:AnsiString;
  End;

Var
  Consts:Array Of ConstDecl;
  ConstCount:Integer;

  Funcs:Array Of FunctionDecl;
  FuncCount:Integer;

  UnitInterface:Stream;
  UnitImplementation:Stream;

Function ConvertType(Const Name:AnsiString):AnsiString;
Var
  S:AnsiString;
Begin
  S := Copy(Name, Length(Name)-1, 2);
  If (S='_t') Then
  Begin
    Result := Copy(Name, 1, Length(Name)-2);
    If Pos('Steam', Result)<=0 Then
      Result := 'Steam' + Result;
    Exit;
  End;

  If (S='[]') Then
  Begin
    S := Copy(Name, 1, Length(Name)-2);
    Result := 'P'+ConvertType(S);
    Exit;
  End;

  If (Pos('Handle', Name)>0) Then
  Begin
    Result := Name;
    If Pos('Steam', Result)<=0 Then
      Result := 'Steam' + Result;
    Exit;
  End;

  If (Pos('_', Name)>0) Then
  Begin
    Result := 'Steam'+Name;
    Exit;
  End;

  If (Name[1]='H') Then
  Begin
    S := Copy(Name, 2, MaxInt);
    Result := S + 'Handle';
    If Pos('Steam', Result)<=0 Then
      Result := 'Steam' + Result;
    Exit;
  End;

  If (Name[1]='E') Then
  Begin
    S := Copy(Name, 2, MaxInt);
    Result := S;
    If Pos('Steam', Result)<=0 Then
      Result := 'Steam' + Result;
    Exit;
  End;

{  If Name = 'DepotId_t' Then
    Result := 'SteamDepotD'
  Else
  If Name = 'AppId_t' Then
    Result := 'SteamAppID'
  Else}
  If Name = 'CSteamID' Then
    Result := 'SteamID'
  Else
  If Name = 'CGameID' Then
    Result := 'SteamGameID'
  Else
  If Name = 'string' Then
    Result := 'PAnsiChar'
  Else
  If Name = 'ulong' Then
    Result := 'UInt64'
  Else
  If Name = 'long' Then
    Result := 'Int64'
  Else
  If Name = 'int' Then
    Result := 'Integer'
  Else
  If Name = 'uint' Then
    Result := 'Cardinal'
  Else
  If Name = 'ushort' Then
    Result := 'Word'
  Else
  If Name = 'short' Then
    Result := 'SmallInt'
  Else
  If Name = 'float' Then
    Result := 'Single'
  Else
  If Name = 'bool' Then
    Result := 'Boolean'
  Else
  If Name = 'byte' Then
    Result := 'Byte'
  Else
  If (Name = 'IntPtr') Then
    Result := 'Pointer'
  Else
    Result := Name;
End;

Procedure GenConsts(Dest:Stream; Const SrcName:AnsiString);
Var
  Tag, Lines:AnsiString;
  S, S2, S3:AnsiString;
  Src:Stream;
  I,J:Integer;
  ConstType,Name, Value:AnsiString;
Begin
  Src := MemoryStream.Create(SrcName);
  Src.ReadLines(Lines);
  Src.Destroy;

  Dest.WriteLine('Const');

  ConstCount := 0;

  Tag := 'public const ';
  I := Pos(Tag, Lines);
  While I>0 Do
  Begin
    Lines := Copy(Lines, I + Length(Tag), MaxInt);

    ConstType := TrimLeft(TrimRight(GetNextWord(Lines, ' ')));
    Name := GetNextWord(Lines, '=');
    Value := GetNextWord(Lines, ';');

    S2 := ConvertType(ConstType);

    ReplaceText('PAnsiChar', 'String', S2);
    
    ReplaceText('"', '''', Value);
    ReplaceText('0x', '$', Value);

    If (Pos('Int',S2)>0) Then
      S2 := '';

    S := Name;

    If S2<>'' Then
      S := S +':'+S2;

    S := S+' = '+Value;

    Inc(ConstCount);
    SetLength(Consts, ConstCount);
    Consts[Pred(ConstCount)].Name := Name;
    Consts[Pred(ConstCount)].ConstType := ConstType;
    Consts[Pred(ConstCount)].Value := Value;

    Dest.WriteLine('  '+S+';');

    I := Pos(Tag, Lines);
  End;

  Dest.WriteLine();
End;

Procedure GenEnums(Dest:Stream; Const SrcName:AnsiString);
Var
  Tag, Lines:AnsiString;
  S, S2, S3:AnsiString;
  Src:Stream;
  I,J:Integer;
  Enums:Array Of EnumDecl;
  EnumCount:Integer;
Begin
  Src := MemoryStream.Create(SrcName);
  Src.ReadLines(Lines);
  Src.Destroy;

  Dest.WriteLine('Type');

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
    Dest.WriteLine('  '+S+' = (');

{    If S = 'MatchMakingServerResponse' Then
      IntToString(2);}

    GetNextWord(Lines, '{');
    I := Pos('}', Lines);
    S := Copy(Lines, 1, Pred(I));
    Lines := Copy(Lines, I + 1, MaxInt);

    EnumCount := 0;
    S := TrimLeft(S);
    While S<>'' Do
    Begin
      S2 := Copy(S, 1, 2);
      If (S2='//') Then
      Begin
        I := Pos(CrLf, S);
        S2 := Copy(S, 1, Pred(I));
        S := Copy(S, Succ(I), MaxInt);

        If EnumCount>0 Then
          Enums[Pred(EnumCount)].Comment := S2;
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

        ReplaceText('0x', '$', S2);
        ReplaceText('>>', 'Shr', S2);
        ReplaceText('<<', 'Shl', S2);
        ReplaceText('|', 'Or', S2);
        ReplaceText('&', 'And', S2);

        S2 := TrimRight(TrimLeft(S2));
        If S2 = '' Then
          S2 := IntToString(EnumCount);

        Inc(EnumCount);
        SetLength(Enums, EnumCount);
        Enums[Pred(EnumCount)].Name := TrimRight(TrimLeft(S3));
        Enums[Pred(EnumCount)].Value := TrimRight(TrimLeft(S2));
      End;

      S := TrimLeft(S);
    End;

    For I:=0 To Pred(EnumCount) Do
    Begin
      S2 := Enums[I].Name+' = ' + Enums[I].Value;
      If I<Pred(EnumCount) Then
        S2 := S2 + ',';

      S2 := S2 + Enums[I].Comment;

      Dest.WriteLine(#9#9+S2);
    End;

    Dest.WriteLine('  );');
    Dest.WriteLine();

    I := Pos(Tag, Lines);
  End;
End;

Procedure GenStructs(Dest:Stream; Const SrcName:AnsiString);
Var
  Tag, Lines:AnsiString;
  S, S2, S3:AnsiString;
  Src:Stream;
  I,J,K,W:Integer;
  Fields:Array Of FieldDecl;
  FieldCount:Integer;
  NextCount:AnsiString;
Begin
  Src := MemoryStream.Create(SrcName);
  Src.ReadLines(Lines);
  Src.Destroy;

  Dest.WriteLine('Type');

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


    If S='SteamMatchMakingKeyValuePair' Then
      IntToString(2);
    Dest.WriteLine('  '+S+' = Packed Record');

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

    FieldCount := 0;
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

        If FieldCount>0 Then
          Fields[Pred(FieldCount)].Comment := S2;
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

          Inc(FieldCount);
          SetLength(Fields, FieldCount);
          Fields[Pred(FieldCount)].FieldType := ConvertType(TrimRight(TrimLeft(GetNextWord(S2, ' ')))); // get type
          Fields[Pred(FieldCount)].Name := TrimRight(TrimLeft(GetNextWord(S2, ';'))); // get name
          Fields[Pred(FieldCount)].Count := NextCount;
          NextCount := '';

          If Fields[Pred(FieldCount)].Name[2] = '_' Then
            Fields[Pred(FieldCount)].Name := Copy(Fields[Pred(FieldCount)].Name, 4, MaxInt);
        End;

      End;
      S := TrimLeft(S);
    End;

    For I:=0 To Pred(FieldCount) Do
    Begin
      If Fields[I].Name='File' Then
        Fields[I].Name := 'FileHandle';

      S2 := Fields[I].Name;

      If Fields[I].Count<>'' Then
        S2 := S2 + ':Array[0..Pred('+Fields[I].Count+')] Of Char'
      Else
        S2 := S2 + ':' + Fields[I].FieldType;

      S2 := S2 +';';
      If Fields[I].Comment<>'' Then
        S2 := S2 + #9+ Fields[I].Comment;

      Dest.WriteLine(#9#9+S2);
    End;

    Dest.WriteLine('  End;');
    Dest.WriteLine();

    I := Pos(Tag, Lines);
  End;
End;

Function GetArgList(Const Func:FunctionDecl):AnsiString;
Var
  S:AnsiString;
  I:Integer;
Begin
  For I:=0 To Pred(Func.ArgCount) Do
  Begin
    If I>0 Then
      S := S + '; ';
    If Func.Args[I].IsVar Then
      S := S + 'Var ';
    S := S + Func.Args[I].Name+':'+ ConvertType(Func.Args[I].ArgType);

    If Func.Args[I].InitVal<>'' Then
      S := S  + ' = ' + Func.Args[I].InitVal;
  End;

  Result := S;
End;

Procedure ExportFuncDecl(Dest:Stream; Const Func:FunctionDecl);
Var
  S, Ext:AnsiString;
  I:Integer;
Begin
  Ext := ' CDecl; External SteamWrapperName';

  If (Func.EntryPoint<>Func.Name) Then
    Ext := Ext +' Name '''+Func.EntryPoint+'''';

  Ext := Ext  + ';';

  If Func.ReturnType = 'void' Then
    S := 'Procedure'
  Else
    S := 'Function';

  S := S +' ' +Func.Name +'(';

  S := S + GetArgList(Func);

  S := S + ')';

  If Func.ReturnType<>'void' Then
    S := S +':' + Func.ReturnType;

  S := S+';' + Ext;


  Inc(FuncCount);
  SetLength(Funcs, FuncCount);

  Funcs[Pred(FuncCount)] := Func;

  Dest.WriteLine(S);
End;

Function ReadNextDecl(Var Lines:AnsiString; Var Func:FunctionDecl):Boolean;
Var
  S, S2, S3, Tag:AnsiString;
  I,J,K:Integer;
Begin
  Tag := 'EntryPoint = "';
  I := Pos(Tag, Lines);
  If I<=0 Then
  Begin
    Func.EntryPoint := '';
  End Else
  Begin
    Lines := Copy(Lines, I + Length(Tag), MaxInt);
    Func.EntryPoint := GetNextWord(Lines, '"');
  End;

  Tag := 'public static extern ';
  I := Pos(Tag, Lines);
  If I<=0 Then
  Begin
    Result := False;
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

  Func.ReturnType := GetNextWord(S, ' ');
  Func.Name := GetNextWord(S, '(');

  If Func.EntryPoint='' Then
    Func.EntryPoint := Func.Name;

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

  Func.ArgCount := 0;
  While S2<>'' Do
  Begin
    S3 := GetNextWord(S2, ',');
    Inc(Func.ArgCount);
    SetLength(Func.Args, Func.ArgCount);

    Func.Args[Pred(Func.ArgCount)].ArgType := GetNextWord(S3, ' ');

    Func.Args[Pred(Func.ArgCount)].IsVar := (Func.Args[Pred(Func.ArgCount)].ArgType='out');
    If (Func.Args[Pred(Func.ArgCount)].IsVar) Then
      Func.Args[Pred(Func.ArgCount)].ArgType := GetNextWord(S3, ' ');

    Func.Args[Pred(Func.ArgCount)].Name := TrimLeft(TrimRight(GetNextWord(S3, '=')));

    If Pos('"', S3)>0 Then
      S3 := '';

    //ReplaceText('"', '''', S3);

    Func.Args[Pred(Func.ArgCount)].InitVal := S3;
  End;

  Func.ReturnType := ConvertType(TrimLeft(TrimRight(Func.ReturnType)));

  If (Func.ArgCount=0) And (Pos('_', Func.Name)<=0) And (Func.ReturnType='Pointer') Then
    Func.Name := 'Get'+Func.Name;

  Result := True;
End;

Procedure ExportRegion(Var Lines:AnsiString; Dest:Stream);
Var
  Tag:AnsiString;
  S, RegionName:AnsiString;
  I,J,K:Integer;
  Func:FunctionDecl;
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

  Dest.WriteLine('// '+RegionName);
  While ReadNextDecl(S, Func) Do
  Begin
    ExportFuncDecl(Dest, Func);
  End;
  Dest.WriteLine();
End;

Procedure GenClass(Name:AnsiString);
Var
  Dest:Stream;
  S, S2:AnsiString;
  Tag:AnsiString;
  I:Integer;
  Func:FunctionDecl;
Begin
  Dest := UnitInterface;
  Dest.WriteLine('  '+Name+' = Class');
  Dest.WriteLine('    Protected');
  Dest.WriteLine('      _Handle:');
  Dest.WriteLine('    Public');

  Tag := 'I'+Name+'_';

  For I:=0 To Pred(FuncCount) Do
  If (Pos(Tag, Funcs[I].Name)>0) Then
  Begin
    Func := Funcs[I];

    If Func.ReturnType = 'void' Then
      S := 'Procedure'
    Else
      S := 'Function';

    S2 := Func.Name;
    ReplaceText(Tag, '', S2);

    S := S +' ' +S2 +'(';

    S := S + GetArgList(Func);

    S := S + ')';

    If Func.ReturnType<>'void' Then
      S := S +':' + Func.ReturnType;

    S := S+';';

    ReplaceText('PAnsiChar', 'String', S);

    Dest.WriteLine(#9#9#9+S);

  End;
  Dest.WriteLine('  End;');
End;

Procedure DeclareType(Dest:Stream; Name, TType:AnsiString);
Begin
  Dest.WriteLine('  '+Name+' = '+TType+';');
  Dest.WriteLine('  P'+Name+' = ^'+Name+';');
End;

Procedure DeclareHandle(Dest:Stream; Name:AnsiString);
Begin
  Dest.WriteLine('  '+Name+' = Integer;');
End;

Var
  Src, Output:Stream;
  Tag, Tag2, Lines, S, S2, Def:AnsiString;
  I,J:Integer;
Begin
  Src := MemoryStream.Create('NativeMethods.cs');
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

  UnitInterface := MemoryStream.Create(1024);
  UnitImplementation := MemoryStream.Create(1024);


  UnitInterface.WriteLine();
  UnitInterface.WriteLine('Const');
  UnitInterface.WriteLine('{$IFDEF MSWINDOWS}');
  UnitInterface.WriteLine('  SteamWrapperName = ''CSteamworks.dll'';');
  UnitInterface.WriteLine('{$ENDIF}');
  UnitInterface.WriteLine();
  UnitInterface.WriteLine('{$IFDEF OSX}');
  UnitInterface.WriteLine('  SteamWrapperName = ''libsteam_api.dylib'';');
  UnitInterface.WriteLine('{$ENDIF}');
  UnitInterface.WriteLine();
  UnitInterface.WriteLine('{$IFDEF LINUX}');
  UnitInterface.WriteLine('  SteamWrapperName = ''libsteam_api.so'';');
  UnitInterface.WriteLine('{$ENDIF}');
  UnitInterface.WriteLine();
  UnitInterface.WriteLine('Type');
  DeclareType(UnitInterface, 'SteamID', 'UInt64');
  DeclareType(UnitInterface, 'SteamAppID','Cardinal');
  DeclareType(UnitInterface, 'SteamAccountID','Cardinal');
  DeclareType(UnitInterface, 'SteamDepotID','Cardinal');
  DeclareType(UnitInterface, 'SteamGameID','UInt64');
  DeclareType(UnitInterface, 'SteamAPICall','UInt64');
  DeclareType(UnitInterface, 'SteamPublishedFileId','UInt64');
  DeclareType(UnitInterface, 'SteamSNetSocket', 'Cardinal');
  DeclareType(UnitInterface, 'SteamSNetListenSocket', 'Cardinal');
  DeclareType(UnitInterface, 'SteamLeaderboard', 'UInt64');
  DeclareType(UnitInterface, 'SteamLeaderboardEntries', 'UInt64');
  UnitInterface.WriteLine();

  DeclareHandle(UnitInterface, 'SteamPipeHandle');
  DeclareHandle(UnitInterface, 'SteamUserHandle');
  DeclareHandle(UnitInterface, 'SteamAuthTicketHandle');
  DeclareHandle(UnitInterface, 'SteamHTTPRequestHandle');
  DeclareHandle(UnitInterface, 'SteamHTMLBrowserHandle');
  DeclareHandle(UnitInterface, 'SteamServerListRequestHandle');
  DeclareHandle(UnitInterface, 'SteamServerQueryHandle');
  DeclareHandle(UnitInterface, 'SteamUGCHandle');
  DeclareHandle(UnitInterface, 'SteamUGCUpdateHandle');
  DeclareHandle(UnitInterface, 'SteamUGCQueryHandle');
  DeclareHandle(UnitInterface, 'SteamUGCFileWriteStreamHandle');
  DeclareHandle(UnitInterface, 'SteamPublishedFileUpdateHandle');
  DeclareHandle(UnitInterface, 'SteamScreenshotHandle');
  DeclareHandle(UnitInterface, 'SteamClientUnifiedMessageHandle');
  UnitInterface.WriteLine();

  GenConsts(UnitInterface, 'SteamConstants.cs');
  GenEnums(UnitInterface, 'SteamEnums.cs');
  GenStructs(UnitInterface, 'SteamStructs.cs');

  UnitInterface.WriteLine('  SteamGameType = (');
  UnitInterface.WriteLine('    SteamGameIDTypeApp = 0,');
  UnitInterface.WriteLine('    SteamGameIDTypeGameMod = 1,');
  UnitInterface.WriteLine('    SteamGameIDTypeShortcut = 2,');
  UnitInterface.WriteLine('    SteamGameIDTypeP2P = 3');
  UnitInterface.WriteLine('  );');
  UnitInterface.WriteLine();

  UnitInterface.WriteLine('  SteamAPIWarningMessageHook = Procedure (nSeverity:Integer; pchDebugText:PAnsiChar); Cdecl; ');
  UnitInterface.WriteLine('  SteamAPI_PostAPIResultInProcess = Procedure(callHandle:SteamAPICall; pUnknown:Pointer; unCallbackSize:Cardinal; iCallbackNum:Integer); Cdecl; ');
  UnitInterface.WriteLine('  SteamAPI_CheckCallbackRegistered = Procedure(iCallbackNum:Integer); Cdecl; ');
  UnitInterface.WriteLine();

(*  UnitInterface.WriteLine('  SteamControllerState = Packed Record');
  UnitInterface.WriteLine('    // If packet num matches that on your prior call, then the controller state hasn''t been changed since');
  UnitInterface.WriteLine('    // your last call and there is no need to process it');
  UnitInterface.WriteLine('    unPacketNum:Cardinal;');
  UnitInterface.WriteLine('    // bit flags for each of the buttons');
  UnitInterface.WriteLine('    ulButtons:UInt64;');
  UnitInterface.WriteLine('    // Left pad coordinates');
  UnitInterface.WriteLine('    sLeftPadX:SmallInt;');
  UnitInterface.WriteLine('    sLeftPadY:SmallInt;');
  UnitInterface.WriteLine('    // Right pad coordinates');
  UnitInterface.WriteLine('    sRightPadX:SmallInt;');
  UnitInterface.WriteLine('    sRightPadY:SmallInt;');
	UnitInterface.WriteLine('  End;');
  UnitInterface.WriteLine();

  UnitInterface.WriteLine('  SteamFriendGameInfo = Packed Record');
  UnitInterface.WriteLine('    gameID:SteamGameID;');
  UnitInterface.WriteLine('    gameIP:Cardinal;');
  UnitInterface.WriteLine('    GamePort:Word;');
  UnitInterface.WriteLine('    QueryPort:Word;');
  UnitInterface.WriteLine('    steamIDLobby:SteamID;');
	UnitInterface.WriteLine('  End;');
	UnitInterface.WriteLine();

	UnitInterface.WriteLine('  SteamP2PSessionState = Packed Record');
  UnitInterface.WriteLine('    ConnectionActive:Boolean;		// true if we''ve got an active open connection');
  UnitInterface.WriteLine('    Connecting:Boolean;			// true if we''re currently trying to establish a connection');
  UnitInterface.WriteLine('    P2PSessionError:Byte;		// last error recorded (see enum above)');
  UnitInterface.WriteLine('    UsingRelay:Boolean;			// true if it''s going through a relay server (TURN)');
  UnitInterface.WriteLine('    BytesQueuedForSend:Integer;');
  UnitInterface.WriteLine('    PacketsQueuedForSend:Integer;');
  UnitInterface.WriteLine('    RemoteIP:Cardinal;				// potential IP:Port of remote host. Could be TURN server.');
  UnitInterface.WriteLine('    RemotePort:Word;			// Only exists for compatibility with older authentication api''s');
  UnitInterface.WriteLine('  End;');*)


  Tag := '#region ';

  Repeat
    I := Pos(Tag, Lines);
    If I<=0 Then
      Break;

    Lines := Copy(Lines, I + Length(Tag), MaxInt);
    ExportRegion(Lines, UnitInterface);
  Until False;

  {UnitInterface.WriteLine('Type');
  GenClass('SteamFriends');
  UnitInterface.WriteLine();}


  UnitInterface.Truncate();
  UnitImplementation.Truncate();

  Output := FileStream.Create('..\headers\'+UnitName+'.pas');

  Output.WriteLine('Unit '+UnitName+';');
  Output.WriteLine();
  Output.WriteLine('{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}');
  Output.WriteLine();
  Output.WriteLine('Interface');
  UnitInterface.Seek(0);
  UnitInterface.Copy(Output);
  Output.WriteLine();

  Output.WriteLine('Implementation');
  UnitImplementation.Seek(0);
  UnitImplementation.Copy(Output);
  Output.WriteLine();
  Output.WriteLine();
  Output.WriteLine('End.');

  Output.Destroy;

  UnitInterface.Destroy;
  UnitImplementation.Destroy;

End.
