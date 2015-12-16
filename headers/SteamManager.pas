Unit SteamManager;

Interface
Uses SysUtils, SteamAPI, SteamCallback;

Type
  TSteamAchievement = Class
    Protected
      _ID:AnsiString;
      _Name:AnsiString;
      _Description:AnsiString;
      _Achieved:Boolean;

      Procedure Load();

    Public
      Constructor Create(Const ID:AnsiString);

      Function Unlock():Boolean;

      Property ID:AnsiString Read _ID;
      Property Name:AnsiString Read _Name;
      Property Description:AnsiString Read _Description;
      Property Achieved:Boolean Read _Achieved;
  End;

  TSteamStat = Class
    Protected
      _ID:AnsiString;
      _Value:Integer;

      Procedure Load();

      Procedure SetValue(Const Val:Integer);

    Public
      Constructor Create(Const ID:AnsiString);

      Property Value:Integer Read _Value Write SetValue;
  End;

  TSteamLeaderboard = Class
    Protected
      _ID:AnsiString;

    Public
      Constructor Create(Const ID:AnsiString);

      Procedure Post(Const Value:Integer);
  End;

  TSteamManager = Class
    Protected
      _Loaded:Boolean;
      _Running:Boolean;
      _LoggedOn:Boolean;

      _StatsRequested:Boolean;
      _StoreStats:Boolean;

      _SteamID:AnsiString;
      _AppID:AnsiString;

      _UserName:AnsiString;
      _Language:AnsiString;

      _LicenseResult:SteamUserHasLicenseForAppResult;

      _Achievements:Array Of TSteamAchievement;
      _AchievementCount:Integer;

      _Stats:Array Of TSteamStat;
      _StatCount:Integer;

      Procedure OnUserStats(P:Pointer);

    Public
      Constructor Create();
      Destructor Destroy; Override;

      { CALL THIS METHOD EVERY FRAME!!!}
      Procedure Update;

      Function GetAchievement(Const AchID:AnsiString):TSteamAchievement;
      Function AddAchievement(Const AchID:AnsiString):TSteamAchievement;
      Function UnlockAchievement(Const AchID:AnsiString):Boolean;

      Function GetStat(Const StatID:AnsiString):TSteamStat;
      Function AddStat(Const StatID:AnsiString):TSteamStat;


      Property UserName:AnsiString Read _UserName;
      Property Language:AnsiString Read _Language;
      Property SteamID:AnsiString Read _SteamID;
      Property AppID:AnsiString Read _AppID;

      Property Loaded:Boolean Read _Loaded;
      Property Enabled:Boolean Read _Running;
  End;


Implementation

Var
  _SteamInstance:TSteamManager;

{Utilities}
Function CardinalToString(Const N:Cardinal):AnsiString;
Begin
  Str(N, Result);
End;

Function UInt64ToString(Const N:UInt64):AnsiString;
Begin
  Str(N, Result);
End;

{ Steam }
Constructor TSteamManager.Create();
Var
   CurrentAppID:Cardinal;
Begin
  _SteamInstance := Self;
  _LoggedOn := False;

  //Log.Write(logDebug, 'Steam', 'Trying to load Steam library...');
  _Loaded := LoadSteamAPI();
  If Not _Loaded Then
  Begin
    //Log.Write(logWarning, 'Steam', 'Failed to hook into Steam...');
    _Running := False;
    Exit;
  End;

  _Running := SteamAPI_InitSafe();

  If Not _Running Then
    Exit;

  CurrentAppID := ISteamUtils_GetAppID();
  If (SteamAPI_RestartAppIfNecessary(CurrentAppID)) Then
  Begin
    _Running := False;
    Halt(0);
    Exit;
  End;

  _AppID := CardinalToString(CurrentAppID);
  //Log.Write(logDebug, 'Steam', 'App ID: '+ _AppID);

  _SteamID := UInt64ToString(ISteamUser_GetSteamID());
  //Log.Write(logDebug, 'Steam', 'User ID: '+ _SteamID);

  _UserName := ISteamFriends_GetPersonaName();
  //Log.Write(logDebug, 'Steam', 'Username: '+ _UserName);

  _Language := ISteamApps_GetCurrentGameLanguage();

  //Log.Write(logDebug, 'Steam', 'Language: '+ _Language);

  //_LicenseResult := ISteamGameServer_UserHasLicenseForApp(steamID:SteamID; appID:SteamAppId):
End;

Destructor TSteamManager.Destroy;
Var
  I:Integer;
Begin
  If _Running Then
  Begin
    _Running := False;
    SteamAPI_Shutdown();
  End;


  For I:=0 To Pred(_AchievementCount) Do
    FreeAndNil(_Achievements[I]);

  For I:=0 To Pred(_StatCount) Do
    FreeAndNil(_Stats[I]);

  _SteamInstance := Nil;
End;

Procedure TSteamManager.Update();
Var
   I:Integer;
   controllerState:SteamControllerState;
Begin
  If Not _Running Then
    Exit;

  // Is the user logged on?  If not we can't get stats.
  If _StatsRequested Then
  Begin
    _LoggedOn := ISteamUser_BLoggedOn();

    If (_LoggedOn) Then
    Begin
      SteamCallbackDispatcher.Create(SteamStatsCallbackID , Self.OnUserStats, SizeOf(Steam_UserStatsReceived));
      If ISteamUserStats_RequestCurrentStats() Then
        _StatsRequested := False; 
    End;
  End;

  If _StoreStats Then
  Begin
    // If this failed, we never sent anything to the server, try again later.
    If ISteamUserStats_StoreStats() Then
			_StoreStats := False;
  End;

  SteamAPI_RunCallbacks();

(*  For I:=0 To 3 Do
  Begin
       If ISteamController_GetControllerState(I, controllerState) Then
       Begin

       End;
  End;*)
End;

Procedure TSteamManager.OnUserStats(P: Pointer);
Var
  Info:PSteam_UserStatsReceived;
  GameID:AnsiString;
  I:Integer;
Begin
  Info := P;
  GameID := UInt64ToString(Info.GameID);

  If GameID<> Self.AppID Then
    Exit;

  //Log.Write(logDebug, 'Steam', 'Received stats, with return code '+CardinalToString(Info.Result));

  // load achievements

  For I:=0 To Pred(_AchievementCount) Do
  Begin
    _Achievements[I].Load();
  End;

	// load stats
  For I:=0 To Pred(_StatCount) Do
  Begin
    _Stats[I].Load();
  End;
End;

{ SteamAchievement }
Constructor TSteamAchievement.Create(const ID: AnsiString);
Begin
  Self._ID := ID;
End;

Procedure TSteamAchievement.Load;
Var
  Ret:Boolean;
Begin
  Ret := ISteamUserStats_GetAchievement(PAnsiChar(_ID), _Achieved);
  If Ret Then
  Begin
    _Name := ISteamUserStats_GetAchievementDisplayAttribute(PAnsiChar(_ID), 'name');
		_Description := ISteamUserStats_GetAchievementDisplayAttribute(PAnsiChar(_ID), 'desc');
  End Else
  Begin
    //Log.Write(logWarning, 'Steam', 'GetAchievement failed for Achievement ' + _ID);
  End;
End;

Function TSteamAchievement.Unlock():Boolean;
Begin
  If (_Achieved) Or (_SteamInstance=Nil) Or (Not _SteamInstance._LoggedOn) Then
  Begin
    Result := False;
    Exit;
  End;

  _Achieved := True;

  // the icon may change once it's unlocked
	//_IconImage := 0;

  // mark it down
  ISteamUserStats_SetAchievement(PAnsiChar(ID));

 // Store stats end of frame
  _SteamInstance._StoreStats := True;

  Result := True;
End;

Function TSteamManager.AddAchievement(const AchID: AnsiString):TSteamAchievement;
Begin
  Result := Self.GetAchievement(AchID);
  If Assigned(Result) Then
    Exit;

  Result := TSteamAchievement.Create(AchID);
  Inc(_AchievementCount);
  SetLength(_Achievements, _AchievementCount);
  _Achievements[Pred(_AchievementCount)] := Result;

  _StatsRequested := True;
End;

Function TSteamManager.GetAchievement(const AchID: AnsiString): TSteamAchievement;
Var
  I:Integer;
Begin
  For I:=0 To Pred(_AchievementCount) Do
  If _Achievements[I]._ID = AchID Then
  Begin
    Result := _Achievements[I];
    Exit;
  End;

  Result := Nil;
End;

Function TSteamManager.UnlockAchievement(const AchID: AnsiString): Boolean;
Var
  Ach:TSteamAchievement;
Begin
  Ach := Self.GetAchievement(AchID);
  If Ach = Nil Then
  Begin
    Result := False;
    Exit;
  End;

  Result := Ach.Unlock();
End;

Function TSteamManager.AddStat(const StatID: AnsiString): TSteamStat;
Begin
  Result := Self.GetStat(StatID);
  If Assigned(Result) Then
    Exit;

  Result := TSteamStat.Create(StatID);
  Inc(_StatCount);
  SetLength(_Stats, _StatCount);
  _Stats[Pred(_StatCount)] := Result;

  _StatsRequested := True;
End;

Function TSteamManager.GetStat(const StatID: AnsiString): TSteamStat;
Var
  I:Integer;
Begin
  For I:=0 To Pred(_StatCount) Do
  If _Stats[I]._ID = StatID Then
  Begin
    Result := _Stats[I];
    Exit;
  End;

  Result := Nil;
End;

{ SteamStat }
Constructor TSteamStat.Create(const ID: AnsiString);
Begin
  Self._ID := ID;
End;

Procedure TSteamStat.Load;
Begin
  ISteamUserStats_GetStatInt(PAnsiChar(_ID), _Value);
  //Log.Write(logDebug, 'Steam', 'Stat '+_ID + ' = ' +  IntegerProperty.Stringify(_Value));
End;


Procedure TSteamStat.SetValue(const Val: Integer);
Begin  
  _Value := Val;

  If (Not _SteamInstance._LoggedOn) Then
    Exit;

  ISteamUserStats_SetStatInt(PAnsiChar(_ID), _Value);
  _SteamInstance._StoreStats := True;
End;

{ SteamLeaderboard }
Constructor TSteamLeaderboard.Create(const ID: AnsiString);
Begin
  Self._ID := ID;

  // TODO
(* SteamAPICall_t hSteamAPICall = SteamUserStats()->FindLeaderboard(pchLeaderboardName);
 m_callResultFindLeaderboard.Set(hSteamAPICall, this,
   &CSteamLeaderboards::OnFindLeaderboard);*)
End;

Procedure TSteamLeaderboard.Post(const Value: Integer);
Begin
  // TODO
End;

End.

