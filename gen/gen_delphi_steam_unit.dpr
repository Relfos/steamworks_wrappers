Program gensteamheader;

{$APPTYPE CONSOLE}

Uses SteamworksProcessor, GenUtilities;

Const
  UnitName = 'SteamAPI';

Var
  I,J,K:Integer;
  Steamworks:SteamDeclarations;

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

Procedure DeclareType(Dest:Stream; Name, TType:AnsiString);
Begin
  Dest.WriteLine(Tab+Name+' = '+TType+';');
  Dest.WriteLine(Tab+'P'+Name+' = ^'+Name+';');
End;

Procedure DeclareHandle(Dest:Stream; Name:AnsiString);
Begin
  Dest.WriteLine(Tab+Name+' = Integer;');
End;

Procedure GenConsts(Dest:Stream);
Var
  I:Integer;
  S, Value, TypeName:AnsiString;
Begin
  Dest.WriteLine('Const');

  For I:=0 To (Steamworks.ConstCount - 1)  Do
  Begin
    Value := Steamworks.Consts[I].Value;

    TypeName := Steamworks.Consts[I].ConstType;

    ReplaceText('"', '''', Value);
    ReplaceText('0x', '$', Value);

    TypeName := ConvertType(TypeName);

    If (Pos('Int', TypeName)>0) Then
      TypeName := '';

    S := Steamworks.Consts[I].Name;

    If TypeName<>'' Then
      S := S +':'+TypeName;

    S := S+' = '+Value;

    Dest.WriteLine(Tab+S+';');
  End;


  Dest.WriteLine();
End;

Procedure GenEnums(Dest:Stream);
Var
  I, J:Integer;
  S, S2, Value, TypeName:AnsiString;
  Decl:EnumFieldDecl;
Begin
  Dest.WriteLine('Type');

  For I:=0 To (Steamworks.EnumCount - 1) Do
  Begin
    S := Steamworks.Enums[I].Name;

    //ReplaceText('k_E', 'Steam', S);

    If Pos('Steam', S)<=0 Then
      S := 'Steam' + S;

    Dest.WriteLine(Tab+S+' = (');

    For J:=0 To (Steamworks.Enums[I].DeclCount - 1) Do
    Begin
      Decl := Steamworks.Enums[I].Decls[J];
      S2 := Decl.Name;
      ReplaceText('k_E', 'Steam', S2);

      S := Tab+Tab+ S2;

      S2 := Decl.Value;
      If (S2<>'') Then
      Begin
        ReplaceText('0x', '$', S2);
        ReplaceText('>>', 'Shr', S2);
        ReplaceText('<<', 'Shl', S2);
        ReplaceText('|', 'Or', S2);
        ReplaceText('&', 'And', S2);

        S := S + ' = ' +S2;
      End;

      // if not the last one, add a comman
      If (J < (Steamworks.Enums[I].DeclCount - 1)) Then
        S := S + ',';

      If Decl.Comment<>'' Then
        S := S + Tab+ '// '+Decl.Comment;

      Dest.WriteLine(S);
    End;
    Dest.WriteLine(Tab+');');
  End;

  Dest.WriteLine();
End;

Procedure GenStructs(Dest:Stream);
Var
  I, J:Integer;
  S, Value, FieldName, TypeName:AnsiString;
  Field:StructFieldDecl;
Begin
  Dest.WriteLine('Type');

  For I:=0 To (Steamworks.StructCount - 1) Do
  Begin
    Dest.WriteLine(Tab + Steamworks.Structs[I].Name+ ' = Packed Record');
    For J:=0 To (Steamworks.Structs[I].FieldCount - 1) Do
    Begin
      Field := Steamworks.Structs[I].Fields[J];
      TypeName := Field.FieldType;
      FieldName := Field.Name;

      // File is reserved word in Pascal!
      If FieldName = 'File' Then
        FieldName := 'FileHandle';

      S := Tab + FieldName;

      If Field.Count<>'' Then
        S := S + ':Array[0..Pred('+Field.Count+')] Of AnsiChar'
      Else
        S := S + ':' + ConvertType(Field.FieldType);

      S := S +';';
      If Field.Comment<>'' Then
        S := S + Tab+ '// '+Field.Comment;

      Dest.WriteLine(Tab+Tab+S);
    End;
    Dest.WriteLine(Tab + 'End;');
    Dest.WriteLine();
  End;
End;

Function GetFunctionArgumentList(Const Func:FunctionDecl):AnsiString;
Var
  S:AnsiString;
  I:Integer;
Begin
  S := '';

  For I:=0 To Pred(Func.ArgumentCount) Do
  Begin
    If I>0 Then
      S := S + '; ';

    If Func.Arguments[I].IsVar Then
      S := S + 'Var ';

    S := S + Func.Arguments[I].Name+':'+ ConvertType(Func.Arguments[I].ArgumentType);

    If Func.Arguments[I].InitVal<>'' Then
      S := S  + ' = ' + Func.Arguments[I].InitVal;
  End;

  Result := S;
End;

Procedure GenFunctionDecls(Dest:Stream);
Var
  I, J:Integer;
  S, Ext:AnsiString;
  Func:FunctionDecl;
Begin
  For I:=0 To (Steamworks.RegionCount - 1) Do
  Begin
    Dest.WriteLine('// '+ Steamworks.Regions[I].Name);
    Dest.WriteLine('Var');

    For J:=0 To (Steamworks.Regions[I].FunctionCount - 1) Do
    Begin
      Func := Steamworks.Regions[I].Functions[J];
      Ext := ' CDecl';

      {If (Func.EntryPoint<>Func.Name) Then
        Ext := Ext +' Name '''+Func.EntryPoint+'''';}

      Ext := Ext  + ';';

      If Func.ReturnType = 'void' Then
        S := 'Procedure'
      Else
        S := 'Function';

      S := Tab+ Func.Name + ': ' + S +'(';

      S := S + GetFunctionArgumentList(Func);

      S := S + ')';

      If Func.ReturnType<>'void' Then
        S := S +':' + ConvertType(Func.ReturnType);

      S := S+';' + Ext;

      Dest.WriteLine(S);
    End;

    Dest.WriteLine();
  End;
End;

Procedure GenFunctionInits(Dest:Stream);
Var
  I, J:Integer;
  Func:FunctionDecl;
Begin
  For I:=0 To (Steamworks.RegionCount - 1) Do
  Begin
    For J:=0 To (Steamworks.Regions[I].FunctionCount - 1) Do
    Begin
      Func := Steamworks.Regions[I].Functions[J];
      Dest.WriteLine(Tab+Func.Name+' := GetProcAddress(SteamHandle, ''' +Func.EntryPoint+ ''');');
    End;
  End;
End;


Var
  UnitInterface:Stream;
  UnitImplementation:Stream;
  Output:Stream;

Begin
  Steamworks := SteamDeclarations.Create();

  UnitInterface := Stream.Create();
  UnitImplementation := Stream.Create();


  UnitInterface.WriteLine();
  UnitInterface.WriteLine('Const');
  UnitInterface.WriteLine('{$IFDEF MSWINDOWS}');
  UnitInterface.WriteLine('  SteamWrapperName = ''CSteamworks.dll'';');
  UnitInterface.WriteLine('{$ENDIF}');
  UnitInterface.WriteLine();
  UnitInterface.WriteLine('{$IFDEF DARWIN}');
  UnitInterface.WriteLine('  SteamWrapperName = ''CSteamworks.bundle/Contents/MacOS/CSteamworks'';');
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

  GenConsts(UnitInterface);
  GenEnums(UnitInterface);
  GenStructs(UnitInterface);

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

  GenFunctionDecls(UnitInterface);

  //GenClassDecls(UnitInterface);

  UnitInterface.WriteLine('Function LoadSteamAPI():Boolean;');
  UnitInterface.WriteLine();

  UnitImplementation.WriteLine();
  UnitImplementation.WriteLine('Var');
  UnitImplementation.WriteLine('  SteamHandle:{$IFDEF MSWINDOWS}THandle{$ELSE}TLibHandle{$ENDIF};');
  UnitImplementation.WriteLine();
  UnitImplementation.WriteLine('Function LoadSteamAPI():Boolean; ');
  UnitImplementation.WriteLine('Begin');
  UnitImplementation.WriteLine('  If SteamHandle<>0 Then');
  UnitImplementation.WriteLine('  Begin');
  UnitImplementation.WriteLine('    Result := True;');
  UnitImplementation.WriteLine('    Exit;');
  UnitImplementation.WriteLine('  End;');
  UnitImplementation.WriteLine();
  UnitImplementation.WriteLine('  SteamHandle := LoadLibrary(PAnsiChar(SteamWrapperName));');
  UnitImplementation.WriteLine('  If SteamHandle=0 Then');
  UnitImplementation.WriteLine('  Begin');
  UnitImplementation.WriteLine('    Result := False;');
  UnitImplementation.WriteLine('    Exit;');
  UnitImplementation.WriteLine('   End;');
  UnitImplementation.WriteLine();

  GenFunctionInits(UnitImplementation);

  UnitImplementation.WriteLine();
  UnitImplementation.WriteLine('  Result := True;');
  UnitImplementation.WriteLine('End;');


  UnitInterface.Truncate();
  UnitImplementation.Truncate();

  Output := Stream.Create();

  Output.WriteLine('Unit '+UnitName+';');
  Output.WriteLine();
  Output.WriteLine('{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}');
  Output.WriteLine();
  Output.WriteLine('Interface');

  Output.WriteLine('Uses {$IFDEF MSWINDOWS}Windows{$ELSE}DynLibs{$ENDIF};');

  UnitInterface.Seek(0);
  UnitInterface.Copy(Output);
  Output.WriteLine();

  Output.WriteLine('Implementation');
  UnitImplementation.Seek(0);
  UnitImplementation.Copy(Output);
  Output.WriteLine();
  Output.WriteLine();
  Output.WriteLine('End.');

  Output.Save('..\headers\'+UnitName + '.pas');

  Output.Destroy;

  UnitInterface.Destroy;
  UnitImplementation.Destroy;

  Steamworks.Destroy();
End.

