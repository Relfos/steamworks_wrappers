Program export_template;

{$IFNDEF FPC}
{$APPTYPE CONSOLE}
{$ENDIF}

Uses SteamworksProcessor;

Var
  I,J,K:Integer;
  Steamworks:SteamDeclarations;

Begin
  Steamworks := SteamDeclarations.Create();

  WriteLn('**************Constant list**************');
  For I:=0 To (Steamworks.ConstCount - 1)  Do
  Begin
    WriteLn(Steamworks.Consts[I].Name, ' = ', Steamworks.Consts[I].Value);
  End;

  WriteLn('**************Enums list**************');
  For I:=0 To (Steamworks.EnumCount - 1) Do
  Begin
    WriteLn(Steamworks.Enums[I].Name, ' = (');
    For J:=0 To (Steamworks.Enums[I].DeclCount - 1) Do
    Begin
      WriteLn(' ',Steamworks.Enums[I].Decls[J].Name,' = ', Steamworks.Enums[I].Decls[J].Value);
    End;
    WriteLn(')');
  End;


  WriteLn('**************Structs list**************');
  For I:=0 To (Steamworks.StructCount - 1) Do
  Begin
    WriteLn(Steamworks.Structs[I].Name, ' = (');
    For J:=0 To (Steamworks.Structs[I].FieldCount - 1) Do
    Begin
      WriteLn(' ',Steamworks.Structs[I].Fields[J].Name,' -> ', Steamworks.Structs[I].Fields[J].FieldType);
    End;
    WriteLn(')');
  End;

  WriteLn('**************Regions list**************');
  For I:=0 To (Steamworks.RegionCount - 1) Do
  Begin
    WriteLn(Steamworks.Regions[I].Name);
    For J:=0 To (Steamworks.Regions[I].FunctionCount - 1) Do
    Begin
      WriteLn(' ',Steamworks.Regions[I].Functions[J].Name,' -> ', Steamworks.Regions[I].Functions[J].ReturnType);

      For K:=0 To (Steamworks.Regions[I].Functions[J].ArgumentCount - 1) Do
      Begin
        WriteLn('   ',Steamworks.Regions[I].Functions[J].Arguments[K].Name,' -> ', Steamworks.Regions[I].Functions[J].Arguments[K].ArgumentType);
      End;

      WriteLn;
    End;
  End;

  Steamworks.Destroy();
End.
