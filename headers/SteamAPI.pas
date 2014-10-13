Unit SteamAPI;

Interface

Const
{$IFDEF MSWINDOWS}
  SteamWrapperName = 'CSteamworks.dll';
{$ENDIF}

{$IFDEF OSX}
  SteamWrapperName = 'libsteam_api.dylib';
{$ENDIF}

{$IFDEF LINUX}
  SteamWrapperName = 'libsteam_api.so';
{$ENDIF}

Type
  SteamAppID = Cardinal;
  SteamPipe = Integer;

  SteamServerMode = (
    SteamServerModeInvalid = 0, // DO NOT USE
    SteamServerModeNoAuthentication = 1, // Don't authenticate user logins and don't list on the server list
    SteamServerModeAuthentication = 2, // Authenticate users, list on the server list, don't run VAC on clients that connect
    SteamServerModeAuthenticationAndSecure = 3 // Authenticate users, list on the server list and VAC protect clients
  );

// steam_api.h
Procedure SteamAPI_Shutdown(); CDecl; External SteamWrapperName Name 'Shutdown';
Function SteamAPI_IsSteamRunning():Boolean; CDecl; External SteamWrapperName Name 'IsSteamRunning';
Function SteamAPI_RestartAppIfNecessary(unOwnAppID:SteamAppID):Boolean; CDecl; External SteamWrapperName Name 'RestartAppIfNecessary';
Procedure SteamAPI_WriteMiniDump(uStructuredExceptionCode:Cardinal; pvExceptionInfo:Pointer; uBuildID:Cardinal); CDecl; External SteamWrapperName Name 'WriteMiniDump';
Procedure SteamAPI_SetMiniDumpComment(pchMsg:PChar); CDecl; External SteamWrapperName Name 'SetMiniDumpComment';
Function SteamClient():Pointer; CDecl; External SteamWrapperName Name 'SteamClient_';
Function SteamAPI_InitSafe():Boolean; CDecl; External SteamWrapperName Name 'InitSafe';
Procedure SteamAPI_RunCallbacks(); CDecl; External SteamWrapperName Name 'RunCallbacks';
Procedure SteamAPI_RegisterCallback(pCallback:Pointer; iCallback:Integer); CDecl; External SteamWrapperName Name 'RegisterCallback';
Procedure SteamAPI_UnregisterCallback(pCallback:Pointer); CDecl; External SteamWrapperName Name 'UnregisterCallback';
Procedure SteamAPI_RegisterCallResult(pCallback:Pointer; hAPICall:Int64); CDecl; External SteamWrapperName Name 'RegisterCallResult';
Procedure SteamAPI_UnregisterCallResult(pCallback:Pointer; hAPICall:Int64); CDecl; External SteamWrapperName Name 'UnregisterCallResult';
Procedure Steam_RunCallbacks(hSteamPipe:SteamPipe; bGameServerCallbacks:Boolean); CDecl; External SteamWrapperName Name 'Steam_RunCallbacks_';
Procedure Steam_RegisterInterfaceFuncs(hModule:Pointer); CDecl; External SteamWrapperName Name 'Steam_RegisterInterfaceFuncs_';
Function Steam_GetHSteamUserCurrent():Integer; CDecl; External SteamWrapperName Name 'Steam_GetHSteamUserCurrent_';
Function SteamAPI_GetSteamInstallPath():Integer; CDecl; External SteamWrapperName Name 'GetSteamInstallPath';
Function SteamAPI_GetHSteamPipe():Integer; CDecl; External SteamWrapperName Name 'GetHSteamPipe_';
Procedure SteamAPI_SetTryCatchCallbacks(bTryCatchCallbacks:Boolean); CDecl; External SteamWrapperName Name 'SetTryCatchCallbacks';
Function SteamAPI_GetHSteamUser():Integer; CDecl; External SteamWrapperName Name 'GetHSteamUser_';
Procedure SteamAPI_UseBreakpadCrashHandler(pchVersion:PChar; pchDate:PChar; pchTime:PChar; bFullMemoryDumps:Boolean; pvContext:Pointer; m_pfnPreMinidumpCallback:Pointer); CDecl; External SteamWrapperName Name 'UseBreakpadCrashHandler';
Function SteamUser():Pointer; CDecl; External SteamWrapperName;
Function SteamFriends():Pointer; CDecl; External SteamWrapperName;
Function SteamUtils():Pointer; CDecl; External SteamWrapperName;
Function SteamMatchmaking():Pointer; CDecl; External SteamWrapperName;
Function SteamUserStats():Pointer; CDecl; External SteamWrapperName;
Function SteamApps():Pointer; CDecl; External SteamWrapperName;
Function SteamNetworking():Pointer; CDecl; External SteamWrapperName;
Function SteamMatchmakingServers():Pointer; CDecl; External SteamWrapperName;
Function SteamRemoteStorage():Pointer; CDecl; External SteamWrapperName;
Function SteamScreenshots():Pointer; CDecl; External SteamWrapperName;
Function SteamHTTP():Pointer; CDecl; External SteamWrapperName;
Function SteamUnifiedMessages():Pointer; CDecl; External SteamWrapperName;
Function SteamController():Pointer; CDecl; External SteamWrapperName;
Function SteamUGC():Pointer; CDecl; External SteamWrapperName;
Function SteamAppList():Pointer; CDecl; External SteamWrapperName;
Function SteamMusic():Pointer; CDecl; External SteamWrapperName;
Function SteamMusicRemote():Pointer; CDecl; External SteamWrapperName;

// steam_gameserver.h
Function SteamGameServer_InitSafe(unIP:Cardinal; usSteamPort:Word; usGamePort:Word; usQueryPort:Word; eServerMode:SteamServerMode; pchVersionString:PChar):Boolean; CDecl; External SteamWrapperName Name 'GameServer_InitSafe';
Procedure SteamGameServer_Shutdown(); CDecl; External SteamWrapperName Name 'GameServer_Shutdown';
Procedure SteamGameServer_RunCallbacks(); CDecl; External SteamWrapperName Name 'GameServer_RunCallbacks';
Function SteamGameServer_BSecure():Boolean; CDecl; External SteamWrapperName Name 'GameServer_BSecure';
Function SteamGameServer_GetSteamID():Int64; CDecl; External SteamWrapperName Name 'GameServer_GetSteamID';
Function SteamGameServer_GetHSteamPipe():Integer; CDecl; External SteamWrapperName Name 'GameServer_GetHSteamPipe';
Function SteamGameServer_GetHSteamUser():Integer; CDecl; External SteamWrapperName Name 'GameServer_GetHSteamUser';
Function SteamClientGameServer():Pointer; CDecl; External SteamWrapperName;
Function SteamGameServer():Pointer; CDecl; External SteamWrapperName;
Function SteamGameServerUtils():Pointer; CDecl; External SteamWrapperName;
Function SteamGameServerNetworking():Pointer; CDecl; External SteamWrapperName;
Function SteamGameServerStats():Pointer; CDecl; External SteamWrapperName;
Function SteamGameServerHTTP():Pointer; CDecl; External SteamWrapperName;

// steamencryptedappticket.h
Function BDecryptTicket(rgubTicketEncrypted:PByte; cubTicketEncrypted:Cardinal; rgubTicketDecrypted:PByte; Var pcubTicketDecrypted:Cardinal; rgubKey:PByte; cubKey:Integer):Boolean; CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_BDecryptTicket';
Function BIsTicketForApp(rgubTicketDecrypted:PByte; cubTicketDecrypted:Cardinal; nAppID:SteamAppID):Boolean; CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_BIsTicketForApp';
Function GetTicketIssueTime(rgubTicketDecrypted:PByte; cubTicketDecrypted:Cardinal):Cardinal; CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_GetTicketIssueTime';
Procedure GetTicketSteamID(rgubTicketDecrypted:PByte; cubTicketDecrypted:Cardinal; Var psteamID:CSteamID); CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_GetTicketSteamID';
Function GetTicketAppID(rgubTicketDecrypted:PByte; cubTicketDecrypted:Cardinal):Cardinal; CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_GetTicketAppID';
Function BUserOwnsAppInTicket(rgubTicketDecrypted:PByte; cubTicketDecrypted:Cardinal; nAppID:SteamAppID):Boolean; CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_BUserOwnsAppInTicket';
Function BUserIsVacBanned(rgubTicketDecrypted:PByte; cubTicketDecrypted:Cardinal):Boolean; CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_BUserIsVacBanned';
Function GetUserVariableData(rgubTicketDecrypted:PByte; cubTicketDecrypted:Cardinal; Var pcubUserData:Cardinal):Pointer; CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_GetUserVariableData';

// SteamAppList
Function ISteamAppList_GetNumInstalledApps():Cardinal; CDecl; External SteamWrapperName;
Function ISteamAppList_GetInstalledApps(pvecAppID:AppId_t[]; unMaxAppIDs:Cardinal):Cardinal; CDecl; External SteamWrapperName;
Function ISteamAppList_GetAppName(nAppID:SteamAppID; pchName:Pointer; cchNameMax:Integer):Integer; CDecl; External SteamWrapperName;
Function ISteamAppList_GetAppInstallDir(nAppID:SteamAppID; pchDirectory:Pointer; cchNameMax:Integer):Integer; CDecl; External SteamWrapperName;
Function ISteamAppList_GetAppBuildId(nAppID:SteamAppID):Integer; CDecl; External SteamWrapperName;

// SteamApps
Function ISteamApps_BIsSubscribed():Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_BIsLowViolence():Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_BIsCybercafe():Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_BIsVACBanned():Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_GetCurrentGameLanguage():PChar; CDecl; External SteamWrapperName;
Function ISteamApps_GetAvailableGameLanguages():PChar; CDecl; External SteamWrapperName;
Function ISteamApps_BIsSubscribedApp(appID:SteamAppID):Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_BIsDlcInstalled(appID:SteamAppID):Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_GetEarliestPurchaseUnixTime(nAppID:SteamAppID):Cardinal; CDecl; External SteamWrapperName;
Function ISteamApps_BIsSubscribedFromFreeWeekend():Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_GetDLCCount():Integer; CDecl; External SteamWrapperName;
Function ISteamApps_BGetDLCDataByIndex(iDLC:Integer; Var pAppID:SteamAppID; Var pbAvailable:Boolean; pchName:Pointer; cchNameBufferSize:Integer):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamApps_InstallDLC(nAppID:SteamAppID); CDecl; External SteamWrapperName;
Procedure ISteamApps_UninstallDLC(nAppID:SteamAppID); CDecl; External SteamWrapperName;
Procedure ISteamApps_RequestAppProofOfPurchaseKey(nAppID:SteamAppID); CDecl; External SteamWrapperName;
Function ISteamApps_GetCurrentBetaName(pchName:Pointer; cchNameBufferSize:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_MarkContentCorrupt(bMissingFilesOnly:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_GetInstalledDepots(appID:SteamAppID; pvecDepots:DepotId_t[]; cMaxDepots:Cardinal):Cardinal; CDecl; External SteamWrapperName;
Function ISteamApps_GetAppInstallDir(appID:SteamAppID; pchFolder:Pointer; cchFolderBufferSize:Cardinal):Cardinal; CDecl; External SteamWrapperName;
Function ISteamApps_BIsAppInstalled(appID:SteamAppID):Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_GetAppOwner():Int64; CDecl; External SteamWrapperName;
Function ISteamApps_GetLaunchQueryParam(pchKey:PChar):PChar; CDecl; External SteamWrapperName;

// SteamClient
Function ISteamClient_CreateSteamPipe():Integer; CDecl; External SteamWrapperName;
Function ISteamClient_BReleaseSteamPipe(hSteamPipe:SteamPipe):Boolean; CDecl; External SteamWrapperName;
Function ISteamClient_ConnectToGlobalUser(hSteamPipe:SteamPipe):Integer; CDecl; External SteamWrapperName;
Function ISteamClient_CreateLocalUser(Var phSteamPipe:SteamPipe; eAccountType:EAccountType):Integer; CDecl; External SteamWrapperName;
Procedure ISteamClient_ReleaseUser(hSteamPipe:SteamPipe; hUser:HSteamUser); CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamUser(hSteamUser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamGameServer(hSteamUser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Procedure ISteamClient_SetLocalIPBinding(unIP:Cardinal; usPort:Word); CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamFriends(hSteamUser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamUtils(hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamMatchmaking(hSteamUser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamMatchmakingServers(hSteamUser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamGenericInterface(hSteamUser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamUserStats(hSteamUser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamGameServerStats(hSteamuser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamApps(hSteamUser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamNetworking(hSteamUser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamRemoteStorage(hSteamuser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamScreenshots(hSteamuser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Procedure ISteamClient_RunFrame(); CDecl; External SteamWrapperName;
Function ISteamClient_GetIPCCallCount():Cardinal; CDecl; External SteamWrapperName;
Procedure ISteamClient_SetWarningMessageHook(pFunction:SteamAPIWarningMessageHook_t); CDecl; External SteamWrapperName;
Function ISteamClient_BShutdownIfAllPipesClosed():Boolean; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamHTTP(hSteamuser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamUnifiedMessages(hSteamuser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamController(hSteamUser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamUGC(hSteamUser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamAppList(hSteamUser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamMusic(hSteamuser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamMusicRemote(hSteamuser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamHTMLSurface(hSteamuser:HSteamUser; hSteamPipe:SteamPipe; pchVersion:PChar):Pointer; CDecl; External SteamWrapperName;
Procedure ISteamClient_Set_SteamAPI_CPostAPIResultInProcess(func:SteamAPI_PostAPIResultInProcess_t); CDecl; External SteamWrapperName;
Procedure ISteamClient_Remove_SteamAPI_CPostAPIResultInProcess(func:SteamAPI_PostAPIResultInProcess_t); CDecl; External SteamWrapperName;
Procedure ISteamClient_Set_SteamAPI_CCheckCallbackRegisteredInProcess(func:SteamAPI_CheckCallbackRegistered_t); CDecl; External SteamWrapperName;

// SteamController
Function ISteamController_Init(pchAbsolutePathToControllerConfigVDF:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamController_Shutdown():Boolean; CDecl; External SteamWrapperName;
Procedure ISteamController_RunFrame(); CDecl; External SteamWrapperName;
Function ISteamController_GetControllerState(unControllerIndex:Cardinal; Var pState:SteamControllerState_t):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamController_TriggerHapticPulse(unControllerIndex:Cardinal; eTargetPad:ESteamControllerPad; usDurationMicroSec:Word); CDecl; External SteamWrapperName;
Procedure ISteamController_SetOverrideMode(pchMode:PChar); CDecl; External SteamWrapperName;

// SteamFriends
Function ISteamFriends_GetPersonaName():PChar; CDecl; External SteamWrapperName;
Function ISteamFriends_SetPersonaName(pchPersonaName:PChar):Int64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetPersonaState():EPersonaState; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendCount(iFriendFlags:EFriendFlags):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendByIndex(iFriend:Integer; iFriendFlags:EFriendFlags):Int64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendRelationship(steamIDFriend:CSteamID):EFriendRelationship; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendPersonaState(steamIDFriend:CSteamID):EPersonaState; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendPersonaName(steamIDFriend:CSteamID):PChar; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendGamePlayed(steamIDFriend:CSteamID; Var pFriendGameInfo:FriendGameInfo_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendPersonaNameHistory(steamIDFriend:CSteamID; iPersonaName:Integer):PChar; CDecl; External SteamWrapperName;
Function ISteamFriends_GetPlayerNickname(steamIDPlayer:CSteamID):PChar; CDecl; External SteamWrapperName;
Function ISteamFriends_HasFriend(steamIDFriend:CSteamID; iFriendFlags:EFriendFlags):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanCount():Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanByIndex(iClan:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanName(steamIDClan:CSteamID):PChar; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanTag(steamIDClan:CSteamID):PChar; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanActivityCounts(steamIDClan:CSteamID; Var pnOnline:Integer; Var pnInGame:Integer; Var pnChatting:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_DownloadClanActivityCounts(psteamIDClans:CSteamID[]; cClansToRequest:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendCountFromSource(steamIDSource:CSteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendFromSourceByIndex(steamIDSource:CSteamID; iFriend:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamFriends_IsUserInSource(steamIDUser:CSteamID; steamIDSource:CSteamID):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamFriends_SetInGameVoiceSpeaking(steamIDUser:CSteamID; bSpeaking:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamFriends_ActivateGameOverlay(pchDialog:PChar); CDecl; External SteamWrapperName;
Procedure ISteamFriends_ActivateGameOverlayToUser(pchDialog:PChar; steamID:CSteamID); CDecl; External SteamWrapperName;
Procedure ISteamFriends_ActivateGameOverlayToWebPage(pchURL:PChar); CDecl; External SteamWrapperName;
Procedure ISteamFriends_ActivateGameOverlayToStore(nAppID:SteamAppID; eFlag:EOverlayToStoreFlag); CDecl; External SteamWrapperName;
Procedure ISteamFriends_SetPlayedWith(steamIDUserPlayedWith:CSteamID); CDecl; External SteamWrapperName;
Procedure ISteamFriends_ActivateGameOverlayInviteDialog(steamIDLobby:CSteamID); CDecl; External SteamWrapperName;
Function ISteamFriends_GetSmallFriendAvatar(steamIDFriend:CSteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetMediumFriendAvatar(steamIDFriend:CSteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetLargeFriendAvatar(steamIDFriend:CSteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_RequestUserInformation(steamIDUser:CSteamID; bRequireNameOnly:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_RequestClanOfficerList(steamIDClan:CSteamID):Int64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanOwner(steamIDClan:CSteamID):Int64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanOfficerCount(steamIDClan:CSteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanOfficerByIndex(steamIDClan:CSteamID; iOfficer:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetUserRestrictions():Cardinal; CDecl; External SteamWrapperName;
Function ISteamFriends_SetRichPresence(pchKey:PChar; pchValue:PChar):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamFriends_ClearRichPresence(); CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendRichPresence(steamIDFriend:CSteamID; pchKey:PChar):PChar; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendRichPresenceKeyCount(steamIDFriend:CSteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendRichPresenceKeyByIndex(steamIDFriend:CSteamID; iKey:Integer):PChar; CDecl; External SteamWrapperName;
Procedure ISteamFriends_RequestFriendRichPresence(steamIDFriend:CSteamID); CDecl; External SteamWrapperName;
Function ISteamFriends_InviteUserToGame(steamIDFriend:CSteamID; pchConnectString:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_GetCoplayFriendCount():Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetCoplayFriend(iCoplayFriend:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendCoplayTime(steamIDFriend:CSteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendCoplayGame(steamIDFriend:CSteamID):Cardinal; CDecl; External SteamWrapperName;
Function ISteamFriends_JoinClanChatRoom(steamIDClan:CSteamID):Int64; CDecl; External SteamWrapperName;
Function ISteamFriends_LeaveClanChatRoom(steamIDClan:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanChatMemberCount(steamIDClan:CSteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetChatMemberByIndex(steamIDClan:CSteamID; iUser:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamFriends_SendClanChatMessage(steamIDClanChat:CSteamID; pchText:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanChatMessage(steamIDClanChat:CSteamID; iMessage:Integer; prgchText:Pointer; cchTextMax:Integer; Var peChatEntryType:EChatEntryType; Var psteamidChatter:CSteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_IsClanChatAdmin(steamIDClanChat:CSteamID; steamIDUser:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_IsClanChatWindowOpenInSteam(steamIDClanChat:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_OpenClanChatWindowInSteam(steamIDClanChat:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_CloseClanChatWindowInSteam(steamIDClanChat:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_SetListenForFriendsMessages(bInterceptEnabled:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_ReplyToFriendMessage(steamIDFriend:CSteamID; pchMsgToSend:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendMessage(steamIDFriend:CSteamID; iMessageID:Integer; pvData:Pointer; cubData:Integer; Var peChatEntryType:EChatEntryType):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFollowerCount(steamID:CSteamID):Int64; CDecl; External SteamWrapperName;
Function ISteamFriends_IsFollowing(steamID:CSteamID):Int64; CDecl; External SteamWrapperName;
Function ISteamFriends_EnumerateFollowingList(unStartIndex:Cardinal):Int64; CDecl; External SteamWrapperName;

// SteamGameServer
Function ISteamGameServer_InitGameServer(unIP:Cardinal; usGamePort:Word; usQueryPort:Word; unFlags:Cardinal; nGameAppId:SteamAppID; pchVersionString:PChar):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetProduct(pszProduct:PChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetGameDescription(pszGameDescription:PChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetModDir(pszModDir:PChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetDedicatedServer(bDedicated:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_LogOn(pszToken:PChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_LogOnAnonymous(); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_LogOff(); CDecl; External SteamWrapperName;
Function ISteamGameServer_BLoggedOn():Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServer_BSecure():Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServer_GetSteamID():Int64; CDecl; External SteamWrapperName;
Function ISteamGameServer_WasRestartRequested():Boolean; CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetMaxPlayerCount(cPlayersMax:Integer); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetBotPlayerCount(cBotplayers:Integer); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetServerName(pszServerName:PChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetMapName(pszMapName:PChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetPasswordProtected(bPasswordProtected:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetSpectatorPort(unSpectatorPort:Word); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetSpectatorServerName(pszSpectatorServerName:PChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_ClearAllKeyValues(); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetKeyValue(pKey:PChar; pValue:PChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetGameTags(pchGameTags:PChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetGameData(pchGameData:PChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetRegion(pszRegion:PChar); CDecl; External SteamWrapperName;
Function ISteamGameServer_SendUserConnectAndAuthenticate(unIPClient:Cardinal; pvAuthBlob:PByte; cubAuthBlobSize:Cardinal; Var pSteamIDUser:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServer_CreateUnauthenticatedUserConnection():Int64; CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SendUserDisconnect(steamIDUser:CSteamID); CDecl; External SteamWrapperName;
Function ISteamGameServer_BUpdateUserData(steamIDUser:CSteamID; pchPlayerName:PChar; uScore:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServer_GetAuthSessionTicket(pTicket:PByte; cbMaxTicket:Integer; Var pcbTicket:Cardinal):Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServer_BeginAuthSession(pAuthTicket:PByte; cbAuthTicket:Integer; steamID:CSteamID):EBeginAuthSessionResult; CDecl; External SteamWrapperName;
Procedure ISteamGameServer_EndAuthSession(steamID:CSteamID); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_CancelAuthTicket(hAuthTicket:HAuthTicket); CDecl; External SteamWrapperName;
Function ISteamGameServer_UserHasLicenseForApp(steamID:CSteamID; appID:SteamAppID):EUserHasLicenseForAppResult; CDecl; External SteamWrapperName;
Function ISteamGameServer_RequestUserGroupStatus(steamIDUser:CSteamID; steamIDGroup:CSteamID):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamGameServer_GetGameplayStats(); CDecl; External SteamWrapperName;
Function ISteamGameServer_GetServerReputation():Int64; CDecl; External SteamWrapperName;
Function ISteamGameServer_GetPublicIP():Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServer_HandleIncomingPacket(pData:PByte; cbData:Integer; srcIP:Cardinal; srcPort:Word):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServer_GetNextOutgoingPacket(pOut:PByte; cbMaxOut:Integer; Var pNetAdr:Cardinal; Var pPort:Word):Integer; CDecl; External SteamWrapperName;
Procedure ISteamGameServer_EnableHeartbeats(bActive:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetHeartbeatInterval(iHeartbeatInterval:Integer); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_ForceHeartbeat(); CDecl; External SteamWrapperName;
Function ISteamGameServer_AssociateWithClan(steamIDClan:CSteamID):Int64; CDecl; External SteamWrapperName;
Function ISteamGameServer_ComputeNewPlayerCompatibility(steamIDNewPlayer:CSteamID):Int64; CDecl; External SteamWrapperName;

// SteamGameServerHTTP
Function ISteamGameServerHTTP_CreateHTTPRequest(eHTTPRequestMethod:EHTTPMethod; pchAbsoluteURL:PChar):HTTPRequestHandle; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_SetHTTPRequestContextValue(hRequest:HTTPRequestHandle; ulContextValue:Int64):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_SetHTTPRequestNetworkActivityTimeout(hRequest:HTTPRequestHandle; unTimeoutSeconds:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_SetHTTPRequestHeaderValue(hRequest:HTTPRequestHandle; pchHeaderName:PChar; pchHeaderValue:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_SetHTTPRequestGetOrPostParameter(hRequest:HTTPRequestHandle; pchParamName:PChar; pchParamValue:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_SendHTTPRequest(hRequest:HTTPRequestHandle; Var pCallHandle:SteamAPICall_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_SendHTTPRequestAndStreamResponse(hRequest:HTTPRequestHandle; Var pCallHandle:SteamAPICall_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_DeferHTTPRequest(hRequest:HTTPRequestHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_PrioritizeHTTPRequest(hRequest:HTTPRequestHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_GetHTTPResponseHeaderSize(hRequest:HTTPRequestHandle; pchHeaderName:PChar; Var unResponseHeaderSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_GetHTTPResponseHeaderValue(hRequest:HTTPRequestHandle; pchHeaderName:PChar; pHeaderValueBuffer:PByte; unBufferSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_GetHTTPResponseBodySize(hRequest:HTTPRequestHandle; Var unBodySize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_GetHTTPResponseBodyData(hRequest:HTTPRequestHandle; pBodyDataBuffer:PByte; unBufferSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_GetHTTPStreamingResponseBodyData(hRequest:HTTPRequestHandle; cOffset:Cardinal; pBodyDataBuffer:PByte; unBufferSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_ReleaseHTTPRequest(hRequest:HTTPRequestHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_GetHTTPDownloadProgressPct(hRequest:HTTPRequestHandle; Var pflPercentOut:float):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_SetHTTPRequestRawPostBody(hRequest:HTTPRequestHandle; pchContentType:PChar; pubBody:PByte; unBodyLen:Cardinal):Boolean; CDecl; External SteamWrapperName;

// SteamGameServerNetworking
Function ISteamGameServerNetworking_SendP2PPacket(steamIDRemote:CSteamID; pubData:PByte; cubData:Cardinal; eP2PSendType:EP2PSend; nChannel:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_IsP2PPacketAvailable(Var pcubMsgSize:Cardinal; nChannel = 0:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_ReadP2PPacket(pubDest:PByte; cubDest:Cardinal; Var pcubMsgSize:Cardinal; Var psteamIDRemote:CSteamID; nChannel:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_AcceptP2PSessionWithUser(steamIDRemote:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_CloseP2PSessionWithUser(steamIDRemote:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_CloseP2PChannelWithUser(steamIDRemote:CSteamID; nChannel:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_GetP2PSessionState(steamIDRemote:CSteamID; Var pConnectionState:P2PSessionState_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_AllowP2PPacketRelay(bAllow:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_CreateListenSocket(nVirtualP2PPort:Integer; nIP:Cardinal; nPort:Word; bAllowUseOfPacketRelay:Boolean):Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_CreateP2PConnectionSocket(steamIDTarget:CSteamID; nVirtualPort:Integer; nTimeoutSec:Integer; bAllowUseOfPacketRelay:Boolean):Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_CreateConnectionSocket(nIP:Cardinal; nPort:Word; nTimeoutSec:Integer):Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_DestroySocket(hSocket:SNetSocket_t; bNotifyRemoteEnd:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_DestroyListenSocket(hSocket:SNetListenSocket_t; bNotifyRemoteEnd:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_SendDataOnSocket(hSocket:SNetSocket_t; pubData:Pointer; cubData:Cardinal; bReliable:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_IsDataAvailableOnSocket(hSocket:SNetSocket_t; Var pcubMsgSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_RetrieveDataFromSocket(hSocket:SNetSocket_t; pubDest:Pointer; cubDest:Cardinal; Var pcubMsgSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_IsDataAvailable(hListenSocket:SNetListenSocket_t; Var pcubMsgSize:Cardinal; Var phSocket:SNetSocket_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_RetrieveData(hListenSocket:SNetListenSocket_t; pubDest:Pointer; cubDest:Cardinal; Var pcubMsgSize:Cardinal; Var phSocket:SNetSocket_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_GetSocketInfo(hSocket:SNetSocket_t; Var pSteamIDRemote:CSteamID; Var peSocketStatus:Integer; Var punIPRemote:Cardinal; Var punPortRemote:Word):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_GetListenSocketInfo(hListenSocket:SNetListenSocket_t; Var pnIP:Cardinal; Var pnPort:Word):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_GetSocketConnectionType(hSocket:SNetSocket_t):ESNetSocketConnectionType; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_GetMaxPacketSize(hSocket:SNetSocket_t):Integer; CDecl; External SteamWrapperName;

// SteamGameServerStats
Function ISteamGameServerStats_RequestUserStats(steamIDUser:CSteamID):Int64; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_GetUserStat(steamIDUser:CSteamID; pchName:PChar; Var pData:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_GetUserStat_(steamIDUser:CSteamID; pchName:PChar; Var pData:float):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_GetUserAchievement(steamIDUser:CSteamID; pchName:PChar; Var pbAchieved:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_SetUserStat(steamIDUser:CSteamID; pchName:PChar; nData:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_SetUserStat_(steamIDUser:CSteamID; pchName:PChar; fData:float):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_UpdateUserAvgRateStat(steamIDUser:CSteamID; pchName:PChar; flCountThisSession:float; dSessionLength:double):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_SetUserAchievement(steamIDUser:CSteamID; pchName:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_ClearUserAchievement(steamIDUser:CSteamID; pchName:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_StoreUserStats(steamIDUser:CSteamID):Int64; CDecl; External SteamWrapperName;

// SteamGameServerUtils
Function ISteamGameServerUtils_GetSecondsSinceAppActive():Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetSecondsSinceComputerActive():Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetConnectedUniverse():EUniverse; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetServerRealTime():Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetIPCountry():PChar; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetImageSize(iImage:Integer; Var pnWidth:Cardinal; Var pnHeight:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetImageRGBA(iImage:Integer; pubDest:PByte; nDestBufferSize:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetCSERIPPort(Var unIP:Cardinal; Var usPort:Word):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetCurrentBatteryPower():byte; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetAppID():Cardinal; CDecl; External SteamWrapperName;
Procedure ISteamGameServerUtils_SetOverlayNotificationPosition(eNotificationPosition:ENotificationPosition); CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_IsAPICallCompleted(hSteamAPICall:SteamAPICall_t; Var pbFailed:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetAPICallFailureReason(hSteamAPICall:SteamAPICall_t):ESteamAPICallFailure; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetAPICallResult(hSteamAPICall:SteamAPICall_t; pCallback:Pointer; cubCallback:Integer; iCallbackExpected:Integer; Var pbFailed:Boolean):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamGameServerUtils_RunFrame(); CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetIPCCallCount():Cardinal; CDecl; External SteamWrapperName;
Procedure ISteamGameServerUtils_SetWarningMessageHook(pFunction:SteamAPIWarningMessageHook_t); CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_IsOverlayEnabled():Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_BOverlayNeedsPresent():Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_ShowGamepadTextInput(eInputMode:EGamepadTextInputMode; eLineInputMode:EGamepadTextInputLineMode; pchDescription:PChar; unCharMax:Cardinal; pchExistingText:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetEnteredGamepadTextLength():Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetEnteredGamepadTextInput(pchText:Pointer; cchText:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetSteamUILanguage():PChar; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_IsSteamRunningInVR():Boolean; CDecl; External SteamWrapperName;

// SteamHTMLSurface
Function ISteamHTMLSurface_Init():Boolean; CDecl; External SteamWrapperName;
Function ISteamHTMLSurface_Shutdown():Boolean; CDecl; External SteamWrapperName;
Function ISteamHTMLSurface_CreateBrowser(pchUserAgent:PChar; pchUserCSS:PChar):Int64; CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_RemoveBrowser(unBrowserHandle:HHTMLBrowser); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_LoadURL(unBrowserHandle:HHTMLBrowser; pchURL:PChar; pchPostData:PChar); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_SetSize(unBrowserHandle:HHTMLBrowser; unWidth:Cardinal; unHeight:Cardinal); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_StopLoad(unBrowserHandle:HHTMLBrowser); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_Reload(unBrowserHandle:HHTMLBrowser); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_GoBack(unBrowserHandle:HHTMLBrowser); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_GoForward(unBrowserHandle:HHTMLBrowser); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_AddHeader(unBrowserHandle:HHTMLBrowser; pchKey:PChar; pchValue:PChar); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_ExecuteJavascript(unBrowserHandle:HHTMLBrowser; pchScript:PChar); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_MouseUp(unBrowserHandle:HHTMLBrowser; eMouseButton:EHTMLMouseButton); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_MouseDown(unBrowserHandle:HHTMLBrowser; eMouseButton:EHTMLMouseButton); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_MouseDoubleClick(unBrowserHandle:HHTMLBrowser; eMouseButton:EHTMLMouseButton); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_MouseMove(unBrowserHandle:HHTMLBrowser; x:Integer; y:Integer); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_MouseWheel(unBrowserHandle:HHTMLBrowser; nDelta:Integer); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_KeyDown(unBrowserHandle:HHTMLBrowser; nNativeKeyCode:Cardinal; eHTMLKeyModifiers:EHTMLKeyModifiers); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_KeyUp(unBrowserHandle:HHTMLBrowser; nNativeKeyCode:Cardinal; eHTMLKeyModifiers:EHTMLKeyModifiers); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_KeyChar(unBrowserHandle:HHTMLBrowser; cUnicodeChar:Cardinal; eHTMLKeyModifiers:EHTMLKeyModifiers); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_SetHorizontalScroll(unBrowserHandle:HHTMLBrowser; nAbsolutePixelScroll:Cardinal); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_SetVerticalScroll(unBrowserHandle:HHTMLBrowser; nAbsolutePixelScroll:Cardinal); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_SetKeyFocus(unBrowserHandle:HHTMLBrowser; bHasKeyFocus:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_ViewSource(unBrowserHandle:HHTMLBrowser); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_CopyToClipboard(unBrowserHandle:HHTMLBrowser); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_PasteFromClipboard(unBrowserHandle:HHTMLBrowser); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_Find(unBrowserHandle:HHTMLBrowser; pchSearchStr:PChar; bCurrentlyInFind:Boolean; bReverse:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_StopFind(unBrowserHandle:HHTMLBrowser); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_GetLinkAtPosition(unBrowserHandle:HHTMLBrowser; x:Integer; y:Integer); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_SetCookie(pchHostname:PChar; pchKey:PChar; pchValue:PChar; pchPath = "/":PChar; nExpires = 0:Cardinal; bSecure = false:Boolean; bHTTPOnly = false:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_SetPageScaleFactor(unBrowserHandle:HHTMLBrowser; flZoom:float; nPointX:Integer; nPointY:Integer); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_AllowStartRequest(unBrowserHandle:HHTMLBrowser; bAllowed:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_JSDialogResponse(unBrowserHandle:HHTMLBrowser; bResult:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_FileLoadDialogResponse(unBrowserHandle:HHTMLBrowser; pchSelectedFiles:Pointer); CDecl; External SteamWrapperName;

// SteamHTTP
Function ISteamHTTP_CreateHTTPRequest(eHTTPRequestMethod:EHTTPMethod; pchAbsoluteURL:PChar):HTTPRequestHandle; CDecl; External SteamWrapperName;
Function ISteamHTTP_SetHTTPRequestContextValue(hRequest:HTTPRequestHandle; ulContextValue:Int64):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_SetHTTPRequestNetworkActivityTimeout(hRequest:HTTPRequestHandle; unTimeoutSeconds:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_SetHTTPRequestHeaderValue(hRequest:HTTPRequestHandle; pchHeaderName:PChar; pchHeaderValue:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_SetHTTPRequestGetOrPostParameter(hRequest:HTTPRequestHandle; pchParamName:PChar; pchParamValue:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_SendHTTPRequest(hRequest:HTTPRequestHandle; Var pCallHandle:SteamAPICall_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_SendHTTPRequestAndStreamResponse(hRequest:HTTPRequestHandle; Var pCallHandle:SteamAPICall_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_DeferHTTPRequest(hRequest:HTTPRequestHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_PrioritizeHTTPRequest(hRequest:HTTPRequestHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_GetHTTPResponseHeaderSize(hRequest:HTTPRequestHandle; pchHeaderName:PChar; Var unResponseHeaderSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_GetHTTPResponseHeaderValue(hRequest:HTTPRequestHandle; pchHeaderName:PChar; pHeaderValueBuffer:PByte; unBufferSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_GetHTTPResponseBodySize(hRequest:HTTPRequestHandle; Var unBodySize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_GetHTTPResponseBodyData(hRequest:HTTPRequestHandle; pBodyDataBuffer:PByte; unBufferSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_GetHTTPStreamingResponseBodyData(hRequest:HTTPRequestHandle; cOffset:Cardinal; pBodyDataBuffer:PByte; unBufferSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_ReleaseHTTPRequest(hRequest:HTTPRequestHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_GetHTTPDownloadProgressPct(hRequest:HTTPRequestHandle; Var pflPercentOut:float):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_SetHTTPRequestRawPostBody(hRequest:HTTPRequestHandle; pchContentType:PChar; pubBody:PByte; unBodyLen:Cardinal):Boolean; CDecl; External SteamWrapperName;

// SteamMatchmaking
Function ISteamMatchmaking_GetFavoriteGameCount():Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetFavoriteGame(iGame:Integer; Var pnAppID:SteamAppID; Var pnIP:Cardinal; Var pnConnPort:Word; Var pnQueryPort:Word; Var punFlags:Cardinal; Var pRTime32LastPlayedOnServer:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_AddFavoriteGame(nAppID:SteamAppID; nIP:Cardinal; nConnPort:Word; nQueryPort:Word; unFlags:Cardinal; rTime32LastPlayedOnServer:Cardinal):Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_RemoveFavoriteGame(nAppID:SteamAppID; nIP:Cardinal; nConnPort:Word; nQueryPort:Word; unFlags:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_RequestLobbyList():Int64; CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_AddRequestLobbyListStringFilter(pchKeyToMatch:PChar; pchValueToMatch:PChar; eComparisonType:ELobbyComparison); CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_AddRequestLobbyListNumericalFilter(pchKeyToMatch:PChar; nValueToMatch:Integer; eComparisonType:ELobbyComparison); CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_AddRequestLobbyListNearValueFilter(pchKeyToMatch:PChar; nValueToBeCloseTo:Integer); CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable(nSlotsAvailable:Integer); CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_AddRequestLobbyListDistanceFilter(eLobbyDistanceFilter:ELobbyDistanceFilter); CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_AddRequestLobbyListResultCountFilter(cMaxResults:Integer); CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter(steamIDLobby:CSteamID); CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyByIndex(iLobby:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_CreateLobby(eLobbyType:ELobbyType; cMaxMembers:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_JoinLobby(steamIDLobby:CSteamID):Int64; CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_LeaveLobby(steamIDLobby:CSteamID); CDecl; External SteamWrapperName;
Function ISteamMatchmaking_InviteUserToLobby(steamIDLobby:CSteamID; steamIDInvitee:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetNumLobbyMembers(steamIDLobby:CSteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyMemberByIndex(steamIDLobby:CSteamID; iMember:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyData(steamIDLobby:CSteamID; pchKey:PChar):PChar; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_SetLobbyData(steamIDLobby:CSteamID; pchKey:PChar; pchValue:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyDataCount(steamIDLobby:CSteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyDataByIndex(steamIDLobby:CSteamID; iLobbyData:Integer; pchKey:Pointer; cchKeyBufferSize:Integer; pchValue:Pointer; cchValueBufferSize:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_DeleteLobbyData(steamIDLobby:CSteamID; pchKey:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyMemberData(steamIDLobby:CSteamID; steamIDUser:CSteamID; pchKey:PChar):PChar; CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_SetLobbyMemberData(steamIDLobby:CSteamID; pchKey:PChar; pchValue:PChar); CDecl; External SteamWrapperName;
Function ISteamMatchmaking_SendLobbyChatMsg(steamIDLobby:CSteamID; pvMsgBody:PByte; cubMsgBody:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyChatEntry(steamIDLobby:CSteamID; iChatID:Integer; Var pSteamIDUser:CSteamID; pvData:PByte; cubData:Integer; Var peChatEntryType:EChatEntryType):Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_RequestLobbyData(steamIDLobby:CSteamID):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_SetLobbyGameServer(steamIDLobby:CSteamID; unGameServerIP:Cardinal; unGameServerPort:Word; steamIDGameServer:CSteamID); CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyGameServer(steamIDLobby:CSteamID; Var punGameServerIP:Cardinal; Var punGameServerPort:Word; Var psteamIDGameServer:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_SetLobbyMemberLimit(steamIDLobby:CSteamID; cMaxMembers:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyMemberLimit(steamIDLobby:CSteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_SetLobbyType(steamIDLobby:CSteamID; eLobbyType:ELobbyType):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_SetLobbyJoinable(steamIDLobby:CSteamID; bLobbyJoinable:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyOwner(steamIDLobby:CSteamID):Int64; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_SetLobbyOwner(steamIDLobby:CSteamID; steamIDNewOwner:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_SetLinkedLobby(steamIDLobby:CSteamID; steamIDLobbyDependent:CSteamID):Boolean; CDecl; External SteamWrapperName;

// SteamMatchmakingServers
Function ISteamMatchmakingServers_RequestInternetServerList(iApp:SteamAppID; ppchFilters:Pointer; nFilters:Cardinal; pRequestServersResponse:Pointer):Pointer; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_RequestLANServerList(iApp:SteamAppID; pRequestServersResponse:Pointer):Pointer; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_RequestFriendsServerList(iApp:SteamAppID; ppchFilters:Pointer; nFilters:Cardinal; pRequestServersResponse:Pointer):Pointer; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_RequestFavoritesServerList(iApp:SteamAppID; ppchFilters:Pointer; nFilters:Cardinal; pRequestServersResponse:Pointer):Pointer; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_RequestHistoryServerList(iApp:SteamAppID; ppchFilters:Pointer; nFilters:Cardinal; pRequestServersResponse:Pointer):Pointer; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_RequestSpectatorServerList(iApp:SteamAppID; ppchFilters:Pointer; nFilters:Cardinal; pRequestServersResponse:Pointer):Pointer; CDecl; External SteamWrapperName;
Procedure ISteamMatchmakingServers_ReleaseRequest(hServerListRequest:HServerListRequest); CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_GetServerDetails(hRequest:HServerListRequest; iServer:Integer):Pointer; CDecl; External SteamWrapperName;
Procedure ISteamMatchmakingServers_CancelQuery(hRequest:HServerListRequest); CDecl; External SteamWrapperName;
Procedure ISteamMatchmakingServers_RefreshQuery(hRequest:HServerListRequest); CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_IsRefreshing(hRequest:HServerListRequest):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_GetServerCount(hRequest:HServerListRequest):Integer; CDecl; External SteamWrapperName;
Procedure ISteamMatchmakingServers_RefreshServer(hRequest:HServerListRequest; iServer:Integer); CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_PingServer(unIP:Cardinal; usPort:Word; pRequestServersResponse:Pointer):Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_PlayerDetails(unIP:Cardinal; usPort:Word; pRequestServersResponse:Pointer):Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_ServerRules(unIP:Cardinal; usPort:Word; pRequestServersResponse:Pointer):Integer; CDecl; External SteamWrapperName;
Procedure ISteamMatchmakingServers_CancelServerQuery(hServerQuery:HServerQuery); CDecl; External SteamWrapperName;

// SteamMusic
Function ISteamMusic_BIsEnabled():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusic_BIsPlaying():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusic_GetPlaybackStatus():AudioPlayback_Status; CDecl; External SteamWrapperName;
Procedure ISteamMusic_Play(); CDecl; External SteamWrapperName;
Procedure ISteamMusic_Pause(); CDecl; External SteamWrapperName;
Procedure ISteamMusic_PlayPrevious(); CDecl; External SteamWrapperName;
Procedure ISteamMusic_PlayNext(); CDecl; External SteamWrapperName;
Procedure ISteamMusic_SetVolume(flVolume:float); CDecl; External SteamWrapperName;
Function ISteamMusic_GetVolume():float; CDecl; External SteamWrapperName;

// SteamMusicRemote
Function ISteamMusicRemote_RegisterSteamMusicRemote(pchName:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_DeregisterSteamMusicRemote():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_BIsCurrentMusicRemote():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_BActivationSuccess(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_SetDisplayName(pchDisplayName:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_SetPNGIcon_64x64(pvBuffer:PByte; cbBufferLength:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_EnablePlayPrevious(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_EnablePlayNext(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_EnableShuffled(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_EnableLooped(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_EnableQueue(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_EnablePlaylists(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_UpdatePlaybackStatus(nStatus:AudioPlayback_Status):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_UpdateShuffled(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_UpdateLooped(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_UpdateVolume(flValue:float):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_CurrentEntryWillChange():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_CurrentEntryIsAvailable(bAvailable:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_UpdateCurrentEntryText(pchText:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds(nValue:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_UpdateCurrentEntryCoverArt(pvBuffer:PByte; cbBufferLength:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_CurrentEntryDidChange():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_QueueWillChange():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_ResetQueueEntries():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_SetQueueEntry(nID:Integer; nPosition:Integer; pchEntryText:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_SetCurrentQueueEntry(nID:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_QueueDidChange():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_PlaylistWillChange():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_ResetPlaylistEntries():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_SetPlaylistEntry(nID:Integer; nPosition:Integer; pchEntryText:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_SetCurrentPlaylistEntry(nID:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_PlaylistDidChange():Boolean; CDecl; External SteamWrapperName;

// SteamNetworking
Function ISteamNetworking_SendP2PPacket(steamIDRemote:CSteamID; pubData:PByte; cubData:Cardinal; eP2PSendType:EP2PSend; nChannel:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_IsP2PPacketAvailable(Var pcubMsgSize:Cardinal; nChannel = 0:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_ReadP2PPacket(pubDest:PByte; cubDest:Cardinal; Var pcubMsgSize:Cardinal; Var psteamIDRemote:CSteamID; nChannel:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_AcceptP2PSessionWithUser(steamIDRemote:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_CloseP2PSessionWithUser(steamIDRemote:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_CloseP2PChannelWithUser(steamIDRemote:CSteamID; nChannel:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_GetP2PSessionState(steamIDRemote:CSteamID; Var pConnectionState:P2PSessionState_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_AllowP2PPacketRelay(bAllow:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_CreateListenSocket(nVirtualP2PPort:Integer; nIP:Cardinal; nPort:Word; bAllowUseOfPacketRelay:Boolean):Cardinal; CDecl; External SteamWrapperName;
Function ISteamNetworking_CreateP2PConnectionSocket(steamIDTarget:CSteamID; nVirtualPort:Integer; nTimeoutSec:Integer; bAllowUseOfPacketRelay:Boolean):Cardinal; CDecl; External SteamWrapperName;
Function ISteamNetworking_CreateConnectionSocket(nIP:Cardinal; nPort:Word; nTimeoutSec:Integer):Cardinal; CDecl; External SteamWrapperName;
Function ISteamNetworking_DestroySocket(hSocket:SNetSocket_t; bNotifyRemoteEnd:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_DestroyListenSocket(hSocket:SNetListenSocket_t; bNotifyRemoteEnd:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_SendDataOnSocket(hSocket:SNetSocket_t; pubData:Pointer; cubData:Cardinal; bReliable:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_IsDataAvailableOnSocket(hSocket:SNetSocket_t; Var pcubMsgSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_RetrieveDataFromSocket(hSocket:SNetSocket_t; pubDest:Pointer; cubDest:Cardinal; Var pcubMsgSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_IsDataAvailable(hListenSocket:SNetListenSocket_t; Var pcubMsgSize:Cardinal; Var phSocket:SNetSocket_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_RetrieveData(hListenSocket:SNetListenSocket_t; pubDest:Pointer; cubDest:Cardinal; Var pcubMsgSize:Cardinal; Var phSocket:SNetSocket_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_GetSocketInfo(hSocket:SNetSocket_t; Var pSteamIDRemote:CSteamID; Var peSocketStatus:Integer; Var punIPRemote:Cardinal; Var punPortRemote:Word):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_GetListenSocketInfo(hListenSocket:SNetListenSocket_t; Var pnIP:Cardinal; Var pnPort:Word):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_GetSocketConnectionType(hSocket:SNetSocket_t):ESNetSocketConnectionType; CDecl; External SteamWrapperName;
Function ISteamNetworking_GetMaxPacketSize(hSocket:SNetSocket_t):Integer; CDecl; External SteamWrapperName;

// SteamRemoteStorage
Function ISteamRemoteStorage_FileWrite(pchFile:PChar; pvData:PByte; cubData:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileRead(pchFile:PChar; pvData:PByte; cubDataToRead:Integer):Integer; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileForget(pchFile:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileDelete(pchFile:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileShare(pchFile:PChar):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_SetSyncPlatforms(pchFile:PChar; eRemoteStoragePlatform:ERemoteStoragePlatform):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileWriteStreamOpen(pchFile:PChar):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileWriteStreamWriteChunk(writeHandle:UGCFileWriteStreamHandle_t; pvData:PByte; cubData:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileWriteStreamClose(writeHandle:UGCFileWriteStreamHandle_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileWriteStreamCancel(writeHandle:UGCFileWriteStreamHandle_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileExists(pchFile:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FilePersisted(pchFile:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetFileSize(pchFile:PChar):Integer; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetFileTimestamp(pchFile:PChar):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetSyncPlatforms(pchFile:PChar):ERemoteStoragePlatform; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetFileCount():Integer; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetFileNameAndSize(iFile:Integer; Var pnFileSizeInBytes:Integer):PChar; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetQuota(Var pnTotalBytes:Integer; Var puAvailableBytes:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_IsCloudEnabledForAccount():Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_IsCloudEnabledForApp():Boolean; CDecl; External SteamWrapperName;
Procedure ISteamRemoteStorage_SetCloudEnabledForApp(bEnabled:Boolean); CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UGCDownload(hContent:UGCHandle_t; unPriority:Cardinal):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetUGCDownloadProgress(hContent:UGCHandle_t; Var pnBytesDownloaded:Integer; Var pnBytesExpected:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetUGCDetails(hContent:UGCHandle_t; Var pnAppID:SteamAppID; Var ppchName:Pointer; Var pnFileSizeInBytes:Integer; Var pSteamIDOwner:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UGCRead(hContent:UGCHandle_t; pvData:PByte; cubDataToRead:Integer; cOffset:Cardinal; eAction:EUGCReadAction):Integer; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetCachedUGCCount():Integer; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetCachedUGCHandle(iCachedContent:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_PublishWorkshopFile(pchFile:PChar; pchPreviewFile:PChar; nConsumerAppId:SteamAppID; pchTitle:PChar; pchDescription:PChar; eVisibility:ERemoteStoragePublishedFileVisibility; pTags:Pointer; eWorkshopFileType:EWorkshopFileType):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_CreatePublishedFileUpdateRequest(unPublishedFileId:PublishedFileId_t):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdatePublishedFileFile(updateHandle:PublishedFileUpdateHandle_t; pchFile:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdatePublishedFilePreviewFile(updateHandle:PublishedFileUpdateHandle_t; pchPreviewFile:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdatePublishedFileTitle(updateHandle:PublishedFileUpdateHandle_t; pchTitle:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdatePublishedFileDescription(updateHandle:PublishedFileUpdateHandle_t; pchDescription:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdatePublishedFileVisibility(updateHandle:PublishedFileUpdateHandle_t; eVisibility:ERemoteStoragePublishedFileVisibility):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdatePublishedFileTags(updateHandle:PublishedFileUpdateHandle_t; pTags:Pointer):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_CommitPublishedFileUpdate(updateHandle:PublishedFileUpdateHandle_t):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetPublishedFileDetails(unPublishedFileId:PublishedFileId_t; unMaxSecondsOld:Cardinal):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_DeletePublishedFile(unPublishedFileId:PublishedFileId_t):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_EnumerateUserPublishedFiles(unStartIndex:Cardinal):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_SubscribePublishedFile(unPublishedFileId:PublishedFileId_t):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_EnumerateUserSubscribedFiles(unStartIndex:Cardinal):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UnsubscribePublishedFile(unPublishedFileId:PublishedFileId_t):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription(updateHandle:PublishedFileUpdateHandle_t; pchChangeDescription:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetPublishedItemVoteDetails(unPublishedFileId:PublishedFileId_t):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdateUserPublishedItemVote(unPublishedFileId:PublishedFileId_t; bVoteUp:Boolean):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetUserPublishedItemVoteDetails(unPublishedFileId:PublishedFileId_t):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles(steamId:CSteamID; unStartIndex:Cardinal; pRequiredTags:Pointer; pExcludedTags:Pointer):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_PublishVideo(eVideoProvider:EWorkshopVideoProvider; pchVideoAccount:PChar; pchVideoIdentifier:PChar; pchPreviewFile:PChar; nConsumerAppId:SteamAppID; pchTitle:PChar; pchDescription:PChar; eVisibility:ERemoteStoragePublishedFileVisibility; pTags:Pointer):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_SetUserPublishedFileAction(unPublishedFileId:PublishedFileId_t; eAction:EWorkshopFileAction):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_EnumeratePublishedFilesByUserAction(eAction:EWorkshopFileAction; unStartIndex:Cardinal):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_EnumeratePublishedWorkshopFiles(eEnumerationType:EWorkshopEnumerationType; unStartIndex:Cardinal; unCount:Cardinal; unDays:Cardinal; pTags:Pointer; pUserTags:Pointer):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UGCDownloadToLocation(hContent:UGCHandle_t; pchLocation:PChar; unPriority:Cardinal):Int64; CDecl; External SteamWrapperName;

// SteamScreenshots
Function ISteamScreenshots_WriteScreenshot(pubRGB:PByte; cubRGB:Cardinal; nWidth:Integer; nHeight:Integer):Cardinal; CDecl; External SteamWrapperName;
Function ISteamScreenshots_AddScreenshotToLibrary(pchFilename:PChar; pchThumbnailFilename:PChar; nWidth:Integer; nHeight:Integer):Cardinal; CDecl; External SteamWrapperName;
Procedure ISteamScreenshots_TriggerScreenshot(); CDecl; External SteamWrapperName;
Procedure ISteamScreenshots_HookScreenshots(bHook:Boolean); CDecl; External SteamWrapperName;
Function ISteamScreenshots_SetLocation(hScreenshot:ScreenshotHandle; pchLocation:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamScreenshots_TagUser(hScreenshot:ScreenshotHandle; steamID:CSteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamScreenshots_TagPublishedFile(hScreenshot:ScreenshotHandle; unPublishedFileID:PublishedFileId_t):Boolean; CDecl; External SteamWrapperName;

// SteamUGC
Function ISteamUGC_CreateQueryUserUGCRequest(unAccountID:AccountID_t; eListType:EUserUGCList; eMatchingUGCType:EUGCMatchingUGCType; eSortOrder:EUserUGCListSortOrder; nCreatorAppID:SteamAppID; nConsumerAppID:SteamAppID; unPage:Cardinal):Int64; CDecl; External SteamWrapperName;
Function ISteamUGC_CreateQueryAllUGCRequest(eQueryType:EUGCQuery; eMatchingeMatchingUGCTypeFileType:EUGCMatchingUGCType; nCreatorAppID:SteamAppID; nConsumerAppID:SteamAppID; unPage:Cardinal):Int64; CDecl; External SteamWrapperName;
Function ISteamUGC_SendQueryUGCRequest(handle:UGCQueryHandle_t):Int64; CDecl; External SteamWrapperName;
Function ISteamUGC_GetQueryUGCResult(handle:UGCQueryHandle_t; index:Cardinal; Var pDetails:SteamUGCDetails_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_ReleaseQueryUGCRequest(handle:UGCQueryHandle_t):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_AddRequiredTag(handle:UGCQueryHandle_t; pTagName:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_AddExcludedTag(handle:UGCQueryHandle_t; pTagName:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetReturnLongDescription(handle:UGCQueryHandle_t; bReturnLongDescription:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetReturnTotalOnly(handle:UGCQueryHandle_t; bReturnTotalOnly:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetAllowCachedResponse(handle:UGCQueryHandle_t; unMaxAgeSeconds:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetCloudFileNameFilter(handle:UGCQueryHandle_t; pMatchCloudFileName:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetMatchAnyTag(handle:UGCQueryHandle_t; bMatchAnyTag:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetSearchText(handle:UGCQueryHandle_t; pSearchText:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetRankedByTrendDays(handle:UGCQueryHandle_t; unDays:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_RequestUGCDetails(nPublishedFileID:PublishedFileId_t; unMaxAgeSeconds:Cardinal):Int64; CDecl; External SteamWrapperName;
Function ISteamUGC_CreateItem(nConsumerAppId:SteamAppID; eFileType:EWorkshopFileType):Int64; CDecl; External SteamWrapperName;
Function ISteamUGC_StartItemUpdate(nConsumerAppId:SteamAppID; nPublishedFileID:PublishedFileId_t):Int64; CDecl; External SteamWrapperName;
Function ISteamUGC_SetItemTitle(handle:UGCUpdateHandle_t; pchTitle:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetItemDescription(handle:UGCUpdateHandle_t; pchDescription:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetItemVisibility(handle:UGCUpdateHandle_t; eVisibility:ERemoteStoragePublishedFileVisibility):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetItemTags(updateHandle:UGCUpdateHandle_t; pTags:Pointer):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetItemContent(handle:UGCUpdateHandle_t; pszContentFolder:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetItemPreview(handle:UGCUpdateHandle_t; pszPreviewFile:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SubmitItemUpdate(handle:UGCUpdateHandle_t; pchChangeNote:PChar):Int64; CDecl; External SteamWrapperName;
Function ISteamUGC_GetItemUpdateProgress(handle:UGCUpdateHandle_t; Var punBytesProcessed:Int64; Var punBytesTotal:Int64):EItemUpdateStatus; CDecl; External SteamWrapperName;
Function ISteamUGC_SubscribeItem(nPublishedFileID:PublishedFileId_t):Int64; CDecl; External SteamWrapperName;
Function ISteamUGC_UnsubscribeItem(nPublishedFileID:PublishedFileId_t):Int64; CDecl; External SteamWrapperName;
Function ISteamUGC_GetNumSubscribedItems():Cardinal; CDecl; External SteamWrapperName;
Function ISteamUGC_GetSubscribedItems(pvecPublishedFileID:PublishedFileId_t[]; cMaxEntries:Cardinal):Cardinal; CDecl; External SteamWrapperName;
Function ISteamUGC_GetItemInstallInfo(nPublishedFileID:PublishedFileId_t; Var punSizeOnDisk:Int64; pchFolder:Pointer; cchFolderSize:Cardinal; Var pbLegacyItem:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_GetItemUpdateInfo(nPublishedFileID:PublishedFileId_t; Var pbNeedsUpdate:Boolean; Var pbIsDownloading:Boolean; Var punBytesDownloaded:Int64; Var punBytesTotal:Int64):Boolean; CDecl; External SteamWrapperName;

// SteamUnifiedMessages
Function ISteamUnifiedMessages_SendMethod(pchServiceMethod:PChar; pRequestBuffer:PByte; unRequestBufferSize:Cardinal; unContext:Int64):Int64; CDecl; External SteamWrapperName;
Function ISteamUnifiedMessages_GetMethodResponseInfo(hHandle:ClientUnifiedMessageHandle; Var punResponseSize:Cardinal; Var peResult:EResult):Boolean; CDecl; External SteamWrapperName;
Function ISteamUnifiedMessages_GetMethodResponseData(hHandle:ClientUnifiedMessageHandle; pResponseBuffer:PByte; unResponseBufferSize:Cardinal; bAutoRelease:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUnifiedMessages_ReleaseMethod(hHandle:ClientUnifiedMessageHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamUnifiedMessages_SendNotification(pchServiceNotification:PChar; pNotificationBuffer:PByte; unNotificationBufferSize:Cardinal):Boolean; CDecl; External SteamWrapperName;

// SteamUser
Function ISteamUser_GetHSteamUser():Integer; CDecl; External SteamWrapperName;
Function ISteamUser_BLoggedOn():Boolean; CDecl; External SteamWrapperName;
Function ISteamUser_GetSteamID():Int64; CDecl; External SteamWrapperName;
Function ISteamUser_InitiateGameConnection(pAuthBlob:PByte; cbMaxAuthBlob:Integer; steamIDGameServer:CSteamID; unIPServer:Cardinal; usPortServer:Word; bSecure:Boolean):Integer; CDecl; External SteamWrapperName;
Procedure ISteamUser_TerminateGameConnection(unIPServer:Cardinal; usPortServer:Word); CDecl; External SteamWrapperName;
Procedure ISteamUser_TrackAppUsageEvent(gameID:CGameID; eAppUsageEvent:Integer; pchExtraInfo:PChar); CDecl; External SteamWrapperName;
Function ISteamUser_GetUserDataFolder(pchBuffer:Pointer; cubBuffer:Integer):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamUser_StartVoiceRecording(); CDecl; External SteamWrapperName;
Procedure ISteamUser_StopVoiceRecording(); CDecl; External SteamWrapperName;
Function ISteamUser_GetAvailableVoice(Var pcbCompressed:Cardinal; Var pcbUncompressed:Cardinal; nUncompressedVoiceDesiredSampleRate:Cardinal):EVoiceResult; CDecl; External SteamWrapperName;
Function ISteamUser_GetVoice(bWantCompressed:Boolean; pDestBuffer:PByte; cbDestBufferSize:Cardinal; Var nBytesWritten:Cardinal; bWantUncompressed:Boolean; pUncompressedDestBuffer:PByte; cbUncompressedDestBufferSize:Cardinal; Var nUncompressBytesWritten:Cardinal; nUncompressedVoiceDesiredSampleRate:Cardinal):EVoiceResult; CDecl; External SteamWrapperName;
Function ISteamUser_DecompressVoice(pCompressed:PByte; cbCompressed:Cardinal; pDestBuffer:PByte; cbDestBufferSize:Cardinal; Var nBytesWritten:Cardinal; nDesiredSampleRate:Cardinal):EVoiceResult; CDecl; External SteamWrapperName;
Function ISteamUser_GetVoiceOptimalSampleRate():Cardinal; CDecl; External SteamWrapperName;
Function ISteamUser_GetAuthSessionTicket(pTicket:PByte; cbMaxTicket:Integer; Var pcbTicket:Cardinal):Cardinal; CDecl; External SteamWrapperName;
Function ISteamUser_BeginAuthSession(pAuthTicket:PByte; cbAuthTicket:Integer; steamID:CSteamID):EBeginAuthSessionResult; CDecl; External SteamWrapperName;
Procedure ISteamUser_EndAuthSession(steamID:CSteamID); CDecl; External SteamWrapperName;
Procedure ISteamUser_CancelAuthTicket(hAuthTicket:HAuthTicket); CDecl; External SteamWrapperName;
Function ISteamUser_UserHasLicenseForApp(steamID:CSteamID; appID:SteamAppID):EUserHasLicenseForAppResult; CDecl; External SteamWrapperName;
Function ISteamUser_BIsBehindNAT():Boolean; CDecl; External SteamWrapperName;
Procedure ISteamUser_AdvertiseGame(steamIDGameServer:CSteamID; unIPServer:Cardinal; usPortServer:Word); CDecl; External SteamWrapperName;
Function ISteamUser_RequestEncryptedAppTicket(pDataToInclude:PByte; cbDataToInclude:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamUser_GetEncryptedAppTicket(pTicket:PByte; cbMaxTicket:Integer; Var pcbTicket:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUser_GetGameBadgeLevel(nSeries:Integer; bFoil:Boolean):Integer; CDecl; External SteamWrapperName;
Function ISteamUser_GetPlayerSteamLevel():Integer; CDecl; External SteamWrapperName;

// SteamUserStats
Function ISteamUserStats_RequestCurrentStats():Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetStat(pchName:PChar; Var pData:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetStat_(pchName:PChar; Var pData:float):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_SetStat(pchName:PChar; nData:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_SetStat_(pchName:PChar; fData:float):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_UpdateAvgRateStat(pchName:PChar; flCountThisSession:float; dSessionLength:double):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetAchievement(pchName:PChar; Var pbAchieved:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_SetAchievement(pchName:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_ClearAchievement(pchName:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetAchievementAndUnlockTime(pchName:PChar; Var pbAchieved:Boolean; Var punUnlockTime:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_StoreStats():Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetAchievementIcon(pchName:PChar):Integer; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetAchievementDisplayAttribute(pchName:PChar; pchKey:PChar):PChar; CDecl; External SteamWrapperName;
Function ISteamUserStats_IndicateAchievementProgress(pchName:PChar; nCurProgress:Cardinal; nMaxProgress:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetNumAchievements():Cardinal; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetAchievementName(iAchievement:Cardinal):PChar; CDecl; External SteamWrapperName;
Function ISteamUserStats_RequestUserStats(steamIDUser:CSteamID):Int64; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetUserStat(steamIDUser:CSteamID; pchName:PChar; Var pData:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetUserStat_(steamIDUser:CSteamID; pchName:PChar; Var pData:float):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetUserAchievement(steamIDUser:CSteamID; pchName:PChar; Var pbAchieved:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetUserAchievementAndUnlockTime(steamIDUser:CSteamID; pchName:PChar; Var pbAchieved:Boolean; Var punUnlockTime:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_ResetAllStats(bAchievementsToo:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_FindOrCreateLeaderboard(pchLeaderboardName:PChar; eLeaderboardSortMethod:ELeaderboardSortMethod; eLeaderboardDisplayType:ELeaderboardDisplayType):Int64; CDecl; External SteamWrapperName;
Function ISteamUserStats_FindLeaderboard(pchLeaderboardName:PChar):Int64; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetLeaderboardName(hSteamLeaderboard:SteamLeaderboard_t):PChar; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetLeaderboardEntryCount(hSteamLeaderboard:SteamLeaderboard_t):Integer; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetLeaderboardSortMethod(hSteamLeaderboard:SteamLeaderboard_t):ELeaderboardSortMethod; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetLeaderboardDisplayType(hSteamLeaderboard:SteamLeaderboard_t):ELeaderboardDisplayType; CDecl; External SteamWrapperName;
Function ISteamUserStats_DownloadLeaderboardEntries(hSteamLeaderboard:SteamLeaderboard_t; eLeaderboardDataRequest:ELeaderboardDataRequest; nRangeStart:Integer; nRangeEnd:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamUserStats_DownloadLeaderboardEntriesForUsers(hSteamLeaderboard:SteamLeaderboard_t; prgUsers:CSteamID[]; cUsers:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetDownloadedLeaderboardEntry(hSteamLeaderboardEntries:SteamLeaderboardEntries_t; index:Integer; Var pLeaderboardEntry:LeaderboardEntry_t; pDetails:int[]; cDetailsMax:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_UploadLeaderboardScore(hSteamLeaderboard:SteamLeaderboard_t; eLeaderboardUploadScoreMethod:ELeaderboardUploadScoreMethod; nScore:Integer; pScoreDetails:int[]; cScoreDetailsCount:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamUserStats_AttachLeaderboardUGC(hSteamLeaderboard:SteamLeaderboard_t; hUGC:UGCHandle_t):Int64; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetNumberOfCurrentPlayers():Int64; CDecl; External SteamWrapperName;
Function ISteamUserStats_RequestGlobalAchievementPercentages():Int64; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetMostAchievedAchievementInfo(pchName:Pointer; unNameBufLen:Cardinal; Var pflPercent:float; Var pbAchieved:Boolean):Integer; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetNextMostAchievedAchievementInfo(iIteratorPrevious:Integer; pchName:Pointer; unNameBufLen:Cardinal; Var pflPercent:float; Var pbAchieved:Boolean):Integer; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetAchievementAchievedPercent(pchName:PChar; Var pflPercent:float):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_RequestGlobalStats(nHistoryDays:Integer):Int64; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetGlobalStat(pchStatName:PChar; Var pData:Int64):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetGlobalStat_(pchStatName:PChar; Var pData:double):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetGlobalStatHistory(pchStatName:PChar; pData:long[]; cubData:Cardinal):Integer; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetGlobalStatHistory_(pchStatName:PChar; pData:double[]; cubData:Cardinal):Integer; CDecl; External SteamWrapperName;

// SteamUtils
Function ISteamUtils_GetSecondsSinceAppActive():Cardinal; CDecl; External SteamWrapperName;
Function ISteamUtils_GetSecondsSinceComputerActive():Cardinal; CDecl; External SteamWrapperName;
Function ISteamUtils_GetConnectedUniverse():EUniverse; CDecl; External SteamWrapperName;
Function ISteamUtils_GetServerRealTime():Cardinal; CDecl; External SteamWrapperName;
Function ISteamUtils_GetIPCountry():PChar; CDecl; External SteamWrapperName;
Function ISteamUtils_GetImageSize(iImage:Integer; Var pnWidth:Cardinal; Var pnHeight:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_GetImageRGBA(iImage:Integer; pubDest:PByte; nDestBufferSize:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_GetCSERIPPort(Var unIP:Cardinal; Var usPort:Word):Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_GetCurrentBatteryPower():byte; CDecl; External SteamWrapperName;
Function ISteamUtils_GetAppID():Cardinal; CDecl; External SteamWrapperName;
Procedure ISteamUtils_SetOverlayNotificationPosition(eNotificationPosition:ENotificationPosition); CDecl; External SteamWrapperName;
Function ISteamUtils_IsAPICallCompleted(hSteamAPICall:SteamAPICall_t; Var pbFailed:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_GetAPICallFailureReason(hSteamAPICall:SteamAPICall_t):ESteamAPICallFailure; CDecl; External SteamWrapperName;
Function ISteamUtils_GetAPICallResult(hSteamAPICall:SteamAPICall_t; pCallback:Pointer; cubCallback:Integer; iCallbackExpected:Integer; Var pbFailed:Boolean):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamUtils_RunFrame(); CDecl; External SteamWrapperName;
Function ISteamUtils_GetIPCCallCount():Cardinal; CDecl; External SteamWrapperName;
Procedure ISteamUtils_SetWarningMessageHook(pFunction:SteamAPIWarningMessageHook_t); CDecl; External SteamWrapperName;
Function ISteamUtils_IsOverlayEnabled():Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_BOverlayNeedsPresent():Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_ShowGamepadTextInput(eInputMode:EGamepadTextInputMode; eLineInputMode:EGamepadTextInputLineMode; pchDescription:PChar; unCharMax:Cardinal; pchExistingText:PChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_GetEnteredGamepadTextLength():Cardinal; CDecl; External SteamWrapperName;
Function ISteamUtils_GetEnteredGamepadTextInput(pchText:Pointer; cchText:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_GetSteamUILanguage():PChar; CDecl; External SteamWrapperName;
Function ISteamUtils_IsSteamRunningInVR():Boolean; CDecl; External SteamWrapperName;

Implementation

End.
