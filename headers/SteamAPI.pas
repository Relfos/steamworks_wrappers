Unit SteamAPI;

Interface

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

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
  SteamID = UInt64;
  PSteamID = ^SteamID;
  SteamAppID = Cardinal;
  PSteamAppID = ^SteamAppID;
  SteamAccountID = Cardinal;
  PSteamAccountID = ^SteamAccountID;
  SteamDepotID = Cardinal;
  PSteamDepotID = ^SteamDepotID;
  SteamGameID = UInt64;
  PSteamGameID = ^SteamGameID;
  SteamAPICall = UInt64;
  PSteamAPICall = ^SteamAPICall;
  SteamPublishedFileId = UInt64;
  PSteamPublishedFileId = ^SteamPublishedFileId;
  SteamSNetSocket = Cardinal;
  PSteamSNetSocket = ^SteamSNetSocket;
  SteamSNetListenSocket = Cardinal;
  PSteamSNetListenSocket = ^SteamSNetListenSocket;
  SteamLeaderboard = UInt64;
  PSteamLeaderboard = ^SteamLeaderboard;
  SteamLeaderboardEntries = UInt64;
  PSteamLeaderboardEntries = ^SteamLeaderboardEntries;

  SteamPipeHandle = Integer;
  SteamUserHandle = Integer;
  SteamAuthTicketHandle = Integer;
  SteamHTTPRequestHandle = Integer;
  SteamHTMLBrowserHandle = Integer;
  SteamServerListRequestHandle = Integer;
  SteamServerQueryHandle = Integer;
  SteamUGCHandle = Integer;
  SteamUGCUpdateHandle = Integer;
  SteamUGCQueryHandle = Integer;
  SteamUGCFileWriteStreamHandle = Integer;
  SteamPublishedFileUpdateHandle = Integer;
  SteamScreenshotHandle = Integer;
  SteamClientUnifiedMessageHandle = Integer;

Const
  STEAMAPPLIST_INTERFACE_VERSION :String = 'STEAMAPPLIST_INTERFACE_VERSION001';
  STEAMAPPS_INTERFACE_VERSION :String = 'STEAMAPPS_INTERFACE_VERSION006';
  STEAMAPPTICKET_INTERFACE_VERSION :String = 'STEAMAPPTICKET_INTERFACE_VERSION001';
  STEAMCLIENT_INTERFACE_VERSION :String = 'SteamClient016';
  STEAMCONTROLLER_INTERFACE_VERSION :String = 'STEAMCONTROLLER_INTERFACE_VERSION';
  STEAMFRIENDS_INTERFACE_VERSION :String = 'SteamFriends014';
  STEAMGAMECOORDINATOR_INTERFACE_VERSION :String = 'SteamGameCoordinator001';
  STEAMGAMESERVER_INTERFACE_VERSION :String = 'SteamGameServer012';
  STEAMGAMESERVERSTATS_INTERFACE_VERSION :String = 'SteamGameServerStats001';
  STEAMHTMLSURFACE_INTERFACE_VERSION :String = 'STEAMHTMLSURFACE_INTERFACE_VERSION_002';
  STEAMHTTP_INTERFACE_VERSION :String = 'STEAMHTTP_INTERFACE_VERSION002';
  STEAMMATCHMAKING_INTERFACE_VERSION :String = 'SteamMatchMaking009';
  STEAMMATCHMAKINGSERVERS_INTERFACE_VERSION :String = 'SteamMatchMakingServers002';
  STEAMMUSIC_INTERFACE_VERSION :String = 'STEAMMUSIC_INTERFACE_VERSION001';
  STEAMMUSICREMOTE_INTERFACE_VERSION :String = 'STEAMMUSICREMOTE_INTERFACE_VERSION001';
  STEAMNETWORKING_INTERFACE_VERSION :String = 'SteamNetworking005';
  STEAMREMOTESTORAGE_INTERFACE_VERSION :String = 'STEAMREMOTESTORAGE_INTERFACE_VERSION012';
  STEAMSCREENSHOTS_INTERFACE_VERSION :String = 'STEAMSCREENSHOTS_INTERFACE_VERSION002';
  STEAMUGC_INTERFACE_VERSION :String = 'STEAMUGC_INTERFACE_VERSION003';
  STEAMUNIFIEDMESSAGES_INTERFACE_VERSION :String = 'STEAMUNIFIEDMESSAGES_INTERFACE_VERSION001';
  STEAMUSER_INTERFACE_VERSION :String = 'SteamUser017';
  STEAMUSERSTATS_INTERFACE_VERSION :String = 'STEAMUSERSTATS_INTERFACE_VERSION011';
  STEAMUTILS_INTERFACE_VERSION :String = 'SteamUtils007';
  k_cubAppProofOfPurchaseKeyMax  = 64;
  k_iSteamUserCallbacks  = 100;
  k_iSteamGameServerCallbacks  = 200;
  k_iSteamFriendsCallbacks  = 300;
  k_iSteamBillingCallbacks  = 400;
  k_iSteamMatchmakingCallbacks  = 500;
  k_iSteamContentServerCallbacks  = 600;
  k_iSteamUtilsCallbacks  = 700;
  k_iClientFriendsCallbacks  = 800;
  k_iClientUserCallbacks  = 900;
  k_iSteamAppsCallbacks  = 1000;
  k_iSteamUserStatsCallbacks  = 1100;
  k_iSteamNetworkingCallbacks  = 1200;
  k_iClientRemoteStorageCallbacks  = 1300;
  k_iClientDepotBuilderCallbacks  = 1400;
  k_iSteamGameServerItemsCallbacks  = 1500;
  k_iClientUtilsCallbacks  = 1600;
  k_iSteamGameCoordinatorCallbacks  = 1700;
  k_iSteamGameServerStatsCallbacks  = 1800;
  k_iSteam2AsyncCallbacks  = 1900;
  k_iSteamGameStatsCallbacks  = 2000;
  k_iClientHTTPCallbacks  = 2100;
  k_iClientScreenshotsCallbacks  = 2200;
  k_iSteamScreenshotsCallbacks  = 2300;
  k_iClientAudioCallbacks  = 2400;
  k_iClientUnifiedMessagesCallbacks  = 2500;
  k_iSteamStreamLauncherCallbacks  = 2600;
  k_iClientControllerCallbacks  = 2700;
  k_iSteamControllerCallbacks  = 2800;
  k_iClientParentalSettingsCallbacks  = 2900;
  k_iClientDeviceAuthCallbacks  = 3000;
  k_iClientNetworkDeviceManagerCallbacks  = 3100;
  k_iClientMusicCallbacks  = 3200;
  k_iClientRemoteClientManagerCallbacks  = 3300;
  k_iClientUGCCallbacks  = 3400;
  k_iSteamStreamClientCallbacks  = 3500;
  k_IClientProductBuilderCallbacks  = 3600;
  k_iClientShortcutsCallbacks  = 3700;
  k_iClientRemoteControlManagerCallbacks  = 3800;
  k_iSteamAppListCallbacks  = 3900;
  k_iSteamMusicCallbacks  = 4000;
  k_iSteamMusicRemoteCallbacks  = 4100;
  k_iClientVRCallbacks  = 4200;
  k_iClientReservedCallbacks  = 4300;
  k_iSteamReservedCallbacks  = 4400;
  k_iSteamHTMLSurfaceCallbacks  = 4500;
  k_iClientVideoCallbacks  = 4600;
  k_cchMaxFriendsGroupName  = 64;
  k_cFriendsGroupLimit  = 100;
  k_cEnumerateFollowersMax  = 50;
  k_cchPersonaNameMax  = 128;
  k_cwchPersonaNameMax  = 32;
  k_cubChatMetadataMax  = 8192;
  k_cchMaxRichPresenceKeys  = 20;
  k_cchMaxRichPresenceKeyLength  = 64;
  k_cchMaxRichPresenceValueLength  = 256;
  k_unServerFlagNone  = $00;
  k_unServerFlagActive  = $01;
  k_unServerFlagSecure  = $02;
  k_unServerFlagDedicated  = $04;
  k_unServerFlagLinux  = $08;
  k_unServerFlagPassworded  = $10;
  k_unServerFlagPrivate  = $20;
  k_unFavoriteFlagNone  = $00;
  k_unFavoriteFlagFavorite  = $01;
  k_unFavoriteFlagHistory  = $02;
  k_unMaxCloudFileChunkSize  = 100 * 1024 * 1024;
  k_cchPublishedDocumentTitleMax  = 128 + 1;
  k_cchPublishedDocumentDescriptionMax  = 8000;
  k_cchPublishedDocumentChangeDescriptionMax  = 8000;
  k_unEnumeratePublishedFilesMaxResults  = 50;
  k_cchTagListMax  = 1024 + 1;
  k_cchFilenameMax  = 260;
  k_cchPublishedFileURLMax  = 256;
  k_nScreenshotMaxTaggedUsers  = 32;
  k_nScreenshotMaxTaggedPublishedFiles  = 32;
  k_cubUFSTagTypeMax  = 255;
  k_cubUFSTagValueMax  = 255;
  k_ScreenshotThumbWidth  = 200;
  kNumUGCResultsPerPage  = 50;
  k_cchStatNameMax  = 128;
  k_cchLeaderboardNameMax  = 128;
  k_cLeaderboardDetailsMax  = 64;
  k_cbMaxGameServerGameDir  = 32;
  k_cbMaxGameServerMapName  = 32;
  k_cbMaxGameServerGameDescription  = 64;
  k_cbMaxGameServerName  = 64;
  k_cbMaxGameServerTags  = 128;
  k_cbMaxGameServerGameData  = 2048;
  k_unSteamAccountIDMask  = -1;
  k_unSteamAccountInstanceMask  = $000FFFFF;
  k_unSteamUserDesktopInstance  = 1;
  k_unSteamUserConsoleInstance  = 2;
  k_unSteamUserWebInstance  = 4;
  k_cchGameExtraInfoMax  = 64;
  k_nSteamEncryptedAppTicketSymmetricKeyLen  = 32;
  k_cubSaltSize  = 8;
  k_GIDNil  = $ffffffffffffffff;
  k_TxnIDNil  = k_GIDNil;
  k_TxnIDUnknown  = 0;
  k_uPackageIdFreeSub :Cardinal = $0;
  k_uPackageIdInvalid :Cardinal = $FFFFFFFF;
  k_ulAssetClassIdInvalid  = $0;
  k_uPhysicalItemIdInvalid :Cardinal = $0;
  k_uCellIDInvalid :Cardinal = $FFFFFFFF;
  k_uPartnerIdInvalid :Cardinal = 0;
  MASTERSERVERUPDATERPORT_USEGAMESOCKETSHARE  = -1;
  INVALID_HTTPREQUEST_HANDLE :Byte = 0;
  k_nMaxLobbyKeyLength :Byte = 255;
  k_SteamMusicNameMaxLength  = 255;
  k_SteamMusicPNGMaxLength  = 65535;
  QUERY_PORT_NOT_INITIALIZED  = $FFFF;
  QUERY_PORT_ERROR  = $FFFE;
  STEAM_RIGHT_TRIGGER_MASK  = $0000000000000001;
  STEAM_LEFT_TRIGGER_MASK  = $0000000000000002;
  STEAM_RIGHT_BUMPER_MASK  = $0000000000000004;
  STEAM_LEFT_BUMPER_MASK  = $0000000000000008;
  STEAM_BUTTON_0_MASK  = $0000000000000010;
  STEAM_BUTTON_1_MASK  = $0000000000000020;
  STEAM_BUTTON_2_MASK  = $0000000000000040;
  STEAM_BUTTON_3_MASK  = $0000000000000080;
  STEAM_TOUCH_0_MASK  = $0000000000000100;
  STEAM_TOUCH_1_MASK  = $0000000000000200;
  STEAM_TOUCH_2_MASK  = $0000000000000400;
  STEAM_TOUCH_3_MASK  = $0000000000000800;
  STEAM_BUTTON_MENU_MASK  = $0000000000001000;
  STEAM_BUTTON_STEAM_MASK  = $0000000000002000;
  STEAM_BUTTON_ESCAPE_MASK  = $0000000000004000;
  STEAM_BUTTON_BACK_LEFT_MASK  = $0000000000008000;
  STEAM_BUTTON_BACK_RIGHT_MASK  = $0000000000010000;
  STEAM_BUTTON_LEFTPAD_CLICKED_MASK  = $0000000000020000;
  STEAM_BUTTON_RIGHTPAD_CLICKED_MASK  = $0000000000040000;
  STEAM_LEFTPAD_FINGERDOWN_MASK  = $0000000000080000;
  STEAM_RIGHTPAD_FINGERDOWN_MASK  = $0000000000100000;
  MAX_STEAM_CONTROLLERS :Byte = 8;

Type
  SteamRegisterActivationCodeResult = (
		SteamRegisterActivationCodeResultOK = 0,
		SteamRegisterActivationCodeResultFail = 1,
		SteamRegisterActivationCodeResultAlreadyRegistered = 2,
		SteamRegisterActivationCodeResultTimeout = 3,
		SteamRegisterActivationCodeAlreadyOwned = 4
  );

  SteamControllerPad = (
		SteamSteamControllerPad_Left = 0,
		SteamSteamControllerPad_Right = 1
  );

  SteamFriendRelationship = (
		SteamFriendRelationshipNone = 0,
		SteamFriendRelationshipBlocked = 1,
		SteamFriendRelationshipRequestRecipient = 2,
		SteamFriendRelationshipFriend = 3,
		SteamFriendRelationshipRequestInitiator = 4,
		SteamFriendRelationshipIgnored = 5,
		SteamFriendRelationshipIgnoredFriend = 6,
		SteamFriendRelationshipSuggested = 7,// keep this updated
		SteamFriendRelationshipMax = 8
  );

  SteamPersonaState = (
		SteamPersonaStateOffline = 0,// friend is not currently logged on
		SteamPersonaStateOnline = 1,// friend is logged on
		SteamPersonaStateBusy = 2,// user is on, but busy
		SteamPersonaStateAway = 3,// auto-away feature
		SteamPersonaStateSnooze = 4,// auto-away for a long time
		SteamPersonaStateLookingToTrade = 5,// Online, trading
		SteamPersonaStateLookingToPlay = 6,// Online, wanting to play
		SteamPersonaStateMax = 7
  );

  SteamFriendFlags = (
		SteamFriendFlagNone = $00,// friend is not currently logged on
		SteamFriendFlagBlocked = $01,
		SteamFriendFlagFriendshipRequested = $02,
		SteamFriendFlagImmediate = $04,// "regular" friend
		SteamFriendFlagClanMember = $08,
		SteamFriendFlagOnGameServer = $10,// k_EFriendFlagFriendOfFriend	= 0x40, // not currently used
		SteamFriendFlagRequestingFriendship = $80,
		SteamFriendFlagRequestingInfo = $100,
		SteamFriendFlagIgnored = $200,
		SteamFriendFlagIgnoredFriend = $400,
		SteamFriendFlagSuggested = $800,
		SteamFriendFlagAll = $FFFF
  );

  SteamUserRestriction = (
		k_nUserRestrictionNone = 0,// no known chat/content restriction
		k_nUserRestrictionUnknown = 1,// we don't know yet (user offline)
		k_nUserRestrictionAnyChat = 2,// user is not allowed to (or can't) send/recv any chat
		k_nUserRestrictionVoiceChat = 4,// user is not allowed to (or can't) send/recv voice chat
		k_nUserRestrictionGroupChat = 8,// user is not allowed to (or can't) send/recv group chat
		k_nUserRestrictionRating = 16,// user is too young according to rating in current region
		k_nUserRestrictionGameInvites = 32,// user cannot send or recv game invites (e.g. mobile)
		k_nUserRestrictionTrading = 64// user cannot participate in trading (console, mobile)
  );

  SteamOverlayToStoreFlag = (
		SteamOverlayToStoreFlag_None = 0,// no known chat/content restriction
		SteamOverlayToStoreFlag_AddToCart = 1,
		SteamOverlayToStoreFlag_AddToCartAndShow = 2
  );

  SteamPersonaChange = (
		SteamPersonaChangeName = $0001,// no known chat/content restriction
		SteamPersonaChangeStatus = $0002,
		SteamPersonaChangeComeOnline = $0004,
		SteamPersonaChangeGoneOffline = $0008,
		SteamPersonaChangeGamePlayed = $0010,
		SteamPersonaChangeGameServer = $0020,
		SteamPersonaChangeAvatar = $0040,
		SteamPersonaChangeJoinedSource = $0080,
		SteamPersonaChangeLeftSource = $0100,
		SteamPersonaChangeRelationshipChanged = $0200,
		SteamPersonaChangeNameFirstSet = $0400,
		SteamPersonaChangeFacebookInfo = $0800,
		SteamPersonaChangeNickname = $1000,
		SteamPersonaChangeSteamLevel = $2000
  );

  SteamGCResults = (
		SteamGCResultOK = 0,// no known chat/content restriction
		SteamGCResultNoMessage = 1,// There is no message in the queue
		SteamGCResultBufferTooSmall = 2,// The buffer is too small for the requested message
		SteamGCResultNotLoggedOn = 3,// The client is not logged onto Steam
		SteamGCResultInvalidMessage = 4// Something was wrong with the message being sent with SendMessage
  );

  SteamHTMLMouseButton = (
		eHTMLMouseButton_Left = 0,// no known chat/content restriction
		eHTMLMouseButton_Right = 1,
		eHTMLMouseButton_Middle = 2
  );

  SteamMouseCursor = (
		dc_user = 0,// no known chat/content restriction
		dc_none = 1,
		dc_arrow = 2,
		dc_ibeam = 3,
		dc_hourglass = 4,
		dc_waitarrow = 5,
		dc_crosshair = 6,
		dc_up = 7,
		dc_sizenw = 8,
		dc_sizese = 9,
		dc_sizene = 10,
		dc_sizesw = 11,
		dc_sizew = 12,
		dc_sizee = 13,
		dc_sizen = 14,
		dc_sizes = 15,
		dc_sizewe = 16,
		dc_sizens = 17,
		dc_sizeall = 18,
		dc_no = 19,
		dc_hand = 20,
		dc_blank = 21,// don't show any custom cursor, just use your default
		dc_middle_pan = 22,
		dc_north_pan = 23,
		dc_north_east_pan = 24,
		dc_east_pan = 25,
		dc_south_east_pan = 26,
		dc_south_pan = 27,
		dc_south_west_pan = 28,
		dc_west_pan = 29,
		dc_north_west_pan = 30,
		dc_alias = 31,
		dc_cell = 32,
		dc_colresize = 33,
		dc_copycur = 34,
		dc_verticaltext = 35,
		dc_rowresize = 36,
		dc_zoomin = 37,
		dc_zoomout = 38,
		dc_help = 39,
		dc_custom = 40,
		dc_last = 41// custom cursors start from this value and up
  );

  SteamHTMLKeyModifiers = (
		eHTMLKeyModifier_None = 0,// no known chat/content restriction
		eHTMLKeyModifier_AltDown = 1 Shl 0,
		eHTMLKeyModifier_CrtlDown = 1 Shl 1,
		eHTMLKeyModifier_ShiftDown = 1 Shl 2
  );

  SteamLobbyType = (
		SteamLobbyTypePrivate = 0,// only way to join the lobby is to invite to someone else
		SteamLobbyTypeFriendsOnly = 1,// shows for friends or invitees, but not in lobby list
		SteamLobbyTypePublic = 2,// visible for friends and in lobby list
		SteamLobbyTypeInvisible = 3//	  a user can be in only one regular lobby, and up to two invisible lobbies
  );

  SteamLobbyComparison = (
		SteamLobbyComparisonEqualToOrLessThan = -2,// only way to join the lobby is to invite to someone else
		SteamLobbyComparisonLessThan = -1,
		SteamLobbyComparisonEqual = 0,
		SteamLobbyComparisonGreaterThan = 1,
		SteamLobbyComparisonEqualToOrGreaterThan = 2,
		SteamLobbyComparisonNotEqual = 3
  );

  SteamLobbyDistanceFilter = (
		SteamLobbyDistanceFilterClose = 0,// only lobbies in the same immediate region will be returned
		SteamLobbyDistanceFilterDefault = 1,// only lobbies in the same region or near by regions
		SteamLobbyDistanceFilterFar = 2,// for games that don't have many latency requirements, will return lobbies about half-way around the globe
		SteamLobbyDistanceFilterWorldwide = 3// no filtering, will match lobbies as far as India to NY (not recommended, expect multiple seconds of latency between the clients)
  );

  SteamChatMemberStateChange = (
		SteamChatMemberStateChangeEntered = $0001,// This user has joined or is joining the chat room
		SteamChatMemberStateChangeLeft = $0002,// This user has left or is leaving the chat room
		SteamChatMemberStateChangeDisconnected = $0004,// User disconnected without leaving the chat first
		SteamChatMemberStateChangeKicked = $0008,// User kicked
		SteamChatMemberStateChangeBanned = $0010// User kicked and banned
  );

  SteamAudioPlayback_Status = (
		AudioPlayback_Undefined = 0,// This user has joined or is joining the chat room
		AudioPlayback_Playing = 1,
		AudioPlayback_Paused = 2,
		AudioPlayback_Idle = 3
  );

  SteamP2PSessionError = (
		SteamP2PSessionErrorNone = 0,// This user has joined or is joining the chat room
		SteamP2PSessionErrorNotRunningApp = 1,// target is not running the same game
		SteamP2PSessionErrorNoRightsToApp = 2,// local user doesn't own the app that is running
		SteamP2PSessionErrorDestinationNotLoggedIn = 3,// target user isn't connected to Steam
		SteamP2PSessionErrorTimeout = 4,// make sure that UDP ports 3478, 4379, and 4380 are open in an outbound direction
		SteamP2PSessionErrorMax = 5
  );

  SteamP2PSend = (
		SteamP2PSendUnreliable = 0,// This is only really useful for kinds of data that should never buffer up, i.e. voice payload packets
		SteamP2PSendUnreliableNoDelay = 1,// Does fragmentation/re-assembly of messages under the hood, as well as a sliding window for efficient sends of large chunks of data.
		SteamP2PSendReliable = 2,// do a normal k_EP2PSendReliable to force all the buffered data to be sent.
		SteamP2PSendReliableWithBuffering = 3
  );

  SteamSNetSocketState = (
		SteamSNetSocketStateInvalid = 0,// communication is valid
		SteamSNetSocketStateConnected = 1,// states while establishing a connection
		SteamSNetSocketStateInitiated = 10,// p2p connections
		SteamSNetSocketStateLocalCandidatesFound = 11,// we've found our local IP info
		SteamSNetSocketStateReceivedRemoteCandidates = 12,// direct connections
		SteamSNetSocketStateChallengeHandshake = 15,// failure states
		SteamSNetSocketStateDisconnecting = 21,// the API shut it down, and we're in the process of telling the other end
		SteamSNetSocketStateLocalDisconnect = 22,// the API shut it down, and we've completed shutdown
		SteamSNetSocketStateTimeoutDuringConnect = 23,// we timed out while trying to creating the connection
		SteamSNetSocketStateRemoteEndDisconnected = 24,// the remote end has disconnected from us
		SteamSNetSocketStateConnectionBroken = 25// connection has been broken; either the other end has disappeared or our local network connection has broke
  );

  SteamSNetSocketConnectionType = (
		SteamSNetSocketConnectionTypeNotConnected = 0,// communication is valid
		SteamSNetSocketConnectionTypeUDP = 1,
		SteamSNetSocketConnectionTypeUDPRelay = 2
  );

  SteamResolveConflict = (
		SteamResolveConflictKeepClient = 1,// The local version of each file will be used to overwrite the server version
		SteamResolveConflictKeepServer = 2// The server version of each file will be used to overwrite the local version
  );

  SteamRemoteStoragePlatform = (
		SteamRemoteStoragePlatformNone = 0,// The local version of each file will be used to overwrite the server version
		SteamRemoteStoragePlatformWindows = (1 Shl 0),
		SteamRemoteStoragePlatformOSX = (1 Shl 1),
		SteamRemoteStoragePlatformPS3 = (1 Shl 2),
		SteamRemoteStoragePlatformLinux = (1 Shl 3),
		SteamRemoteStoragePlatformReserved2 = (1 Shl 4),
		SteamRemoteStoragePlatformAll = -1
  );

  SteamRemoteStoragePublishedFileVisibility = (
		SteamRemoteStoragePublishedFileVisibilityPublic = 0,// The local version of each file will be used to overwrite the server version
		SteamRemoteStoragePublishedFileVisibilityFriendsOnly = 1,
		SteamRemoteStoragePublishedFileVisibilityPrivate = 2
  );

  SteamWorkshopFileType = (
		SteamWorkshopFileTypeFirst = 0,// The local version of each file will be used to overwrite the server version
		SteamWorkshopFileTypeCommunity = 0,
		SteamWorkshopFileTypeMicrotransaction = 1,
		SteamWorkshopFileTypeCollection = 2,
		SteamWorkshopFileTypeArt = 3,
		SteamWorkshopFileTypeVideo = 4,
		SteamWorkshopFileTypeScreenshot = 5,
		SteamWorkshopFileTypeGame = 6,
		SteamWorkshopFileTypeSoftware = 7,
		SteamWorkshopFileTypeConcept = 8,
		SteamWorkshopFileTypeWebGuide = 9,
		SteamWorkshopFileTypeIntegratedGuide = 10,
		SteamWorkshopFileTypeMerch = 11,
		SteamWorkshopFileTypeControllerBinding = 12,
		SteamWorkshopFileTypeSteamworksAccessInvite = 13,
		SteamWorkshopFileTypeSteamVideo = 14,// Update k_EWorkshopFileTypeMax if you add values.
		SteamWorkshopFileTypeMax = 15
  );

  SteamWorkshopVote = (
		SteamWorkshopVoteUnvoted = 0,// The local version of each file will be used to overwrite the server version
		SteamWorkshopVoteFor = 1,
		SteamWorkshopVoteAgainst = 2
  );

  SteamWorkshopFileAction = (
		SteamWorkshopFileActionPlayed = 0,// The local version of each file will be used to overwrite the server version
		SteamWorkshopFileActionCompleted = 1
  );

  SteamWorkshopEnumerationType = (
		SteamWorkshopEnumerationTypeRankedByVote = 0,// The local version of each file will be used to overwrite the server version
		SteamWorkshopEnumerationTypeRecent = 1,
		SteamWorkshopEnumerationTypeTrending = 2,
		SteamWorkshopEnumerationTypeFavoritesOfFriends = 3,
		SteamWorkshopEnumerationTypeVotedByFriends = 4,
		SteamWorkshopEnumerationTypeContentByFriends = 5,
		SteamWorkshopEnumerationTypeRecentFromFollowedUsers = 6
  );

  SteamWorkshopVideoProvider = (
		SteamWorkshopVideoProviderNone = 0,// The local version of each file will be used to overwrite the server version
		SteamWorkshopVideoProviderYoutube = 1
  );

  SteamUGCReadAction = (
		SteamUGCRead_ContinueReadingUntilFinished = 0,// When you are done seeking around the file, make a final call with k_EUGCRead_Close to close it.
		SteamUGCRead_ContinueReading = 1,// To read the file from Steam again you will need to call UGCDownload again.
		SteamUGCRead_Close = 2
  );

  SteamUGCMatchingUGCType = (
		SteamUGCMatchingUGCType_Items = 0,// both mtx items and ready-to-use items
		SteamUGCMatchingUGCType_Items_Mtx = 1,
		SteamUGCMatchingUGCType_Items_ReadyToUse = 2,
		SteamUGCMatchingUGCType_Collections = 3,
		SteamUGCMatchingUGCType_Artwork = 4,
		SteamUGCMatchingUGCType_Videos = 5,
		SteamUGCMatchingUGCType_Screenshots = 6,
		SteamUGCMatchingUGCType_AllGuides = 7,// both web guides and integrated guides
		SteamUGCMatchingUGCType_WebGuides = 8,
		SteamUGCMatchingUGCType_IntegratedGuides = 9,
		SteamUGCMatchingUGCType_UsableInGame = 10,// ready-to-use items and integrated guides
		SteamUGCMatchingUGCType_ControllerBindings = 11
  );

  SteamUserUGCList = (
		SteamUserUGCList_Published = 0,// both mtx items and ready-to-use items
		SteamUserUGCList_VotedOn = 1,
		SteamUserUGCList_VotedUp = 2,
		SteamUserUGCList_VotedDown = 3,
		SteamUserUGCList_WillVoteLater = 4,
		SteamUserUGCList_Favorited = 5,
		SteamUserUGCList_Subscribed = 6,
		SteamUserUGCList_UsedOrPlayed = 7,
		SteamUserUGCList_Followed = 8
  );

  SteamUserUGCListSortOrder = (
		SteamUserUGCListSortOrder_CreationOrderDesc = 0,// both mtx items and ready-to-use items
		SteamUserUGCListSortOrder_CreationOrderAsc = 1,
		SteamUserUGCListSortOrder_TitleAsc = 2,
		SteamUserUGCListSortOrder_LastUpdatedDesc = 3,
		SteamUserUGCListSortOrder_SubscriptionDateDesc = 4,
		SteamUserUGCListSortOrder_VoteScoreDesc = 5,
		SteamUserUGCListSortOrder_ForModeration = 6
  );

  SteamUGCQuery = (
		SteamUGCQuery_RankedByVote = 0,// both mtx items and ready-to-use items
		SteamUGCQuery_RankedByPublicationDate = 1,
		SteamUGCQuery_AcceptedForGameRankedByAcceptanceDate = 2,
		SteamUGCQuery_RankedByTrend = 3,
		SteamUGCQuery_FavoritedByFriendsRankedByPublicationDate = 4,
		SteamUGCQuery_CreatedByFriendsRankedByPublicationDate = 5,
		SteamUGCQuery_RankedByNumTimesReported = 6,
		SteamUGCQuery_CreatedByFollowedUsersRankedByPublicationDate = 7,
		SteamUGCQuery_NotYetRated = 8,
		SteamUGCQuery_RankedByTotalVotesAsc = 9,
		SteamUGCQuery_RankedByVotesUp = 10,
		SteamUGCQuery_RankedByTextSearch = 11
  );

  SteamItemUpdateStatus = (
		SteamItemUpdateStatusInvalid = 0,// The item update handle was invalid, job might be finished, listen too SubmitItemUpdateResult_t
		SteamItemUpdateStatusPreparingConfig = 1,// The item update is processing configuration data
		SteamItemUpdateStatusPreparingContent = 2,// The item update is reading and processing content files
		SteamItemUpdateStatusUploadingContent = 3,// The item update is uploading content changes to Steam
		SteamItemUpdateStatusUploadingPreviewFile = 4,// The item update is uploading new preview file image
		SteamItemUpdateStatusCommittingChanges = 5  // The item update is committing all changes
  );

  SteamLeaderboardDataRequest = (
		SteamLeaderboardDataRequestGlobal = 0,// The item update handle was invalid, job might be finished, listen too SubmitItemUpdateResult_t
		SteamLeaderboardDataRequestGlobalAroundUser = 1,
		SteamLeaderboardDataRequestFriends = 2,
		SteamLeaderboardDataRequestUsers = 3
  );

  SteamLeaderboardSortMethod = (
		SteamLeaderboardSortMethodNone = 0,// The item update handle was invalid, job might be finished, listen too SubmitItemUpdateResult_t
		SteamLeaderboardSortMethodAscending = 1,// top-score is lowest number
		SteamLeaderboardSortMethodDescending = 2// top-score is highest number
  );

  SteamLeaderboardDisplayType = (
		SteamLeaderboardDisplayTypeNone = 0,// The item update handle was invalid, job might be finished, listen too SubmitItemUpdateResult_t
		SteamLeaderboardDisplayTypeNumeric = 1,// simple numerical score
		SteamLeaderboardDisplayTypeTimeSeconds = 2,// the score represents a time, in seconds
		SteamLeaderboardDisplayTypeTimeMilliSeconds = 3// the score represents a time, in milliseconds
  );

  SteamLeaderboardUploadScoreMethod = (
		SteamLeaderboardUploadScoreMethodNone = 0,// The item update handle was invalid, job might be finished, listen too SubmitItemUpdateResult_t
		SteamLeaderboardUploadScoreMethodKeepBest = 1,// Leaderboard will keep user's best score
		SteamLeaderboardUploadScoreMethodForceUpdate = 2// Leaderboard will always replace score with specified
  );

  SteamAPICallFailure = (
		SteamSteamAPICallFailureNone = -1,// no failure
		SteamSteamAPICallFailureSteamGone = 0,// the local Steam process has gone away
		SteamSteamAPICallFailureNetworkFailure = 1,// SteamServersConnected_t will be sent when the client is able to talk to the Steam servers again
		SteamSteamAPICallFailureInvalidHandle = 2,// the SteamAPICall_t handle passed in no longer exists
		SteamSteamAPICallFailureMismatchedCallback = 3// GetAPICallResult() was called with the wrong callback type for this API call
  );

  SteamGamepadTextInputMode = (
		SteamGamepadTextInputModeNormal = 0,// no failure
		SteamGamepadTextInputModePassword = 1
  );

  SteamGamepadTextInputLineMode = (
		SteamGamepadTextInputLineModeSingleLine = 0,// no failure
		SteamGamepadTextInputLineModeMultipleLines = 1
  );

  SteamCheckFileSignature = (
		SteamCheckFileSignatureInvalidSignature = 0,// no failure
		SteamCheckFileSignatureValidSignature = 1,
		SteamCheckFileSignatureFileNotFound = 2,
		SteamCheckFileSignatureNoSignaturesFoundForThisApp = 3,
		SteamCheckFileSignatureNoSignaturesFoundForThisFile = 4
  );

  SteamMatchMakingServerResponse = (
		eServerResponded = 0,// no failure
		eServerFailedToRespond = 1,
		eNoServersListedOnMasterServer = 2// for the Internet query type, returned in response callback if no servers of this type match
  );

  SteamResult = (
		SteamResultOK = 1,// success
		SteamResultFail = 2,// generic failure
		SteamResultNoConnection = 3,//	k_EResultNoConnectionRetry = 4,				// OBSOLETE - removed
		SteamResultInvalidPassword = 5,// password/ticket is invalid
		SteamResultLoggedInElsewhere = 6,// same user logged in elsewhere
		SteamResultInvalidProtocolVer = 7,// protocol version is incorrect
		SteamResultInvalidParam = 8,// a parameter is incorrect
		SteamResultFileNotFound = 9,// file was not found
		SteamResultBusy = 10,// called method busy - action not taken
		SteamResultInvalidState = 11,// called object was in an invalid state
		SteamResultInvalidName = 12,// name is invalid
		SteamResultInvalidEmail = 13,// email is invalid
		SteamResultDuplicateName = 14,// name is not unique
		SteamResultAccessDenied = 15,// access is denied
		SteamResultTimeout = 16,// operation timed out
		SteamResultBanned = 17,// VAC2 banned
		SteamResultAccountNotFound = 18,// account not found
		SteamResultInvalidSteamID = 19,// steamID is invalid
		SteamResultServiceUnavailable = 20,// The requested service is currently unavailable
		SteamResultNotLoggedOn = 21,// The user is not logged on
		SteamResultPending = 22,// Request is pending (may be in process, or waiting on third party)
		SteamResultEncryptionFailure = 23,// Encryption or Decryption failed
		SteamResultInsufficientPrivilege = 24,// Insufficient privilege
		SteamResultLimitExceeded = 25,// Too much of a good thing
		SteamResultRevoked = 26,// Access has been revoked (used for revoked guest passes)
		SteamResultExpired = 27,// License/Guest pass the user is trying to access is expired
		SteamResultAlreadyRedeemed = 28,// Guest pass has already been redeemed by account, cannot be acked again
		SteamResultDuplicateRequest = 29,// The request is a duplicate and the action has already occurred in the past, ignored this time
		SteamResultAlreadyOwned = 30,// All the games in this guest pass redemption request are already owned by the user
		SteamResultIPNotFound = 31,// IP address not found
		SteamResultPersistFailed = 32,// failed to write change to the data store
		SteamResultLockingFailed = 33,// failed to acquire access lock for this operation
		SteamResultLogonSessionReplaced = 34,
		SteamResultConnectFailed = 35,
		SteamResultHandshakeFailed = 36,
		SteamResultIOFailure = 37,
		SteamResultRemoteDisconnect = 38,
		SteamResultShoppingCartNotFound = 39,// failed to find the shopping cart requested
		SteamResultBlocked = 40,// a user didn't allow it
		SteamResultIgnored = 41,// target is ignoring sender
		SteamResultNoMatch = 42,// nothing matching the request found
		SteamResultAccountDisabled = 43,
		SteamResultServiceReadOnly = 44,// this service is not accepting content changes right now
		SteamResultAccountNotFeatured = 45,// account doesn't have value, so this feature isn't available
		SteamResultAdministratorOK = 46,// allowed to take this action, but only because requester is admin
		SteamResultContentVersion = 47,// A Version mismatch in content transmitted within the Steam protocol.
		SteamResultTryAnotherCM = 48,// The current CM can't service the user making a request, user should try another.
		SteamResultPasswordRequiredToKickSession = 49,// You are already logged in elsewhere, this cached credential login has failed.
		SteamResultAlreadyLoggedInElsewhere = 50,// You are already logged in elsewhere, you must wait
		SteamResultSuspended = 51,// Long running operation (content download) suspended/paused
		SteamResultCancelled = 52,// Operation canceled (typically by user: content download)
		SteamResultDataCorruption = 53,// Operation canceled because data is ill formed or unrecoverable
		SteamResultDiskFull = 54,// Operation canceled - not enough disk space.
		SteamResultRemoteCallFailed = 55,// an remote call or IPC call failed
		SteamResultPasswordUnset = 56,// Password could not be verified as it's unset server side
		SteamResultExternalAccountUnlinked = 57,// External account (PSN, Facebook...) is not linked to a Steam account
		SteamResultPSNTicketInvalid = 58,// PSN ticket was invalid
		SteamResultExternalAccountAlreadyLinked = 59,// External account (PSN, Facebook...) is already linked to some other account, must explicitly request to replace/delete the link first
		SteamResultRemoteFileConflict = 60,// The sync cannot resume due to a conflict between the local and remote files
		SteamResultIllegalPassword = 61,// The requested new password is not legal
		SteamResultSameAsPreviousValue = 62,// new value is the same as the old one ( secret question and answer )
		SteamResultAccountLogonDenied = 63,// account login denied due to 2nd factor authentication failure
		SteamResultCannotUseOldPassword = 64,// The requested new password is not legal
		SteamResultInvalidLoginAuthCode = 65,// account login denied due to auth code invalid
		SteamResultAccountLogonDeniedNoMail = 66,// account login denied due to 2nd factor auth failure - and no mail has been sent
		SteamResultHardwareNotCapableOfIPT = 67,//
		SteamResultIPTInitError = 68,//
		SteamResultParentalControlRestricted = 69,// operation failed due to parental control restrictions for current user
		SteamResultFacebookQueryError = 70,// Facebook query returned an error
		SteamResultExpiredLoginAuthCode = 71,// account login denied due to auth code expired
		SteamResultIPLoginRestrictionFailed = 72,
		SteamResultAccountLockedDown = 73,
		SteamResultAccountLogonDeniedVerifiedEmailRequired = 74,
		SteamResultNoMatchingURL = 75,
		SteamResultBadResponse = 76,// parse failure, missing field, etc.
		SteamResultRequirePasswordReEntry = 77,// The user cannot complete the action until they re-enter their password
		SteamResultValueOutOfRange = 78,// the value entered is outside the acceptable range
		SteamResultUnexpectedError = 79,// something happened that we didn't expect to ever happen
		SteamResultDisabled = 80,// The requested service has been configured to be unavailable
		SteamResultInvalidCEGSubmission = 81,// The set of files submitted to the CEG server are not valid !
		SteamResultRestrictedDevice = 82,// The device being used is not allowed to perform this action
		SteamResultRegionLocked = 83,// The action could not be complete because it is region restricted
		SteamResultRateLimitExceeded = 84,// Temporary rate limit exceeded, try again later, different from k_EResultLimitExceeded which may be permanent
		SteamResultAccountLoginDeniedNeedTwoFactor = 85,// Need two-factor code to login
		SteamResultItemDeleted = 86,// The thing we're trying to access has been deleted
		SteamResultAccountLoginDeniedThrottle = 87,// login attempt failed, try to throttle response to possible attacker
		SteamResultTwoFactorCodeMismatch = 88,// two factor code mismatch
		SteamResultTwoFactorActivationCodeMismatch = 89// activation code for two-factor didn't match
  );

  SteamVoiceResult = (
		SteamVoiceResultOK = 0,// success
		SteamVoiceResultNotInitialized = 1,
		SteamVoiceResultNotRecording = 2,
		SteamVoiceResultNoData = 3,
		SteamVoiceResultBufferTooSmall = 4,
		SteamVoiceResultDataCorrupted = 5,
		SteamVoiceResultRestricted = 6,
		SteamVoiceResultUnsupportedCodec = 7
  );

  SteamDenyReason = (
		SteamDenyInvalid = 0,// success
		SteamDenyInvalidVersion = 1,
		SteamDenyGeneric = 2,
		SteamDenyNotLoggedOn = 3,
		SteamDenyNoLicense = 4,
		SteamDenyCheater = 5,
		SteamDenyLoggedInElseWhere = 6,
		SteamDenyUnknownText = 7,
		SteamDenyIncompatibleAnticheat = 8,
		SteamDenyMemoryCorruption = 9,
		SteamDenyIncompatibleSoftware = 10,
		SteamDenySteamConnectionLost = 11,
		SteamDenySteamConnectionError = 12,
		SteamDenySteamResponseTimedOut = 13,
		SteamDenySteamValidationStalled = 14,
		SteamDenySteamOwnerLeftGuestUser = 15
  );

  SteamBeginAuthSessionResult = (
		SteamBeginAuthSessionResultOK = 0,// Ticket is valid for this game and this steamID.
		SteamBeginAuthSessionResultInvalidTicket = 1,// Ticket is not valid.
		SteamBeginAuthSessionResultDuplicateRequest = 2,// A ticket has already been submitted for this steamID
		SteamBeginAuthSessionResultInvalidVersion = 3,// Ticket is from an incompatible interface version
		SteamBeginAuthSessionResultGameMismatch = 4,// Ticket is not for this game
		SteamBeginAuthSessionResultExpiredTicket = 5// Ticket has expired
  );

  SteamAuthSessionResponse = (
		SteamAuthSessionResponseOK = 0,// Steam has verified the user is online, the ticket is valid and ticket has not been reused.
		SteamAuthSessionResponseUserNotConnectedToSteam = 1,// The user in question is not connected to steam
		SteamAuthSessionResponseNoLicenseOrExpired = 2,// The license has expired.
		SteamAuthSessionResponseVACBanned = 3,// The user is VAC banned for this game.
		SteamAuthSessionResponseLoggedInElseWhere = 4,// The user account has logged in elsewhere and the session containing the game instance has been disconnected.
		SteamAuthSessionResponseVACCheckTimedOut = 5,// VAC has been unable to perform anti-cheat checks on this user
		SteamAuthSessionResponseAuthTicketCanceled = 6,// The ticket has been canceled by the issuer
		SteamAuthSessionResponseAuthTicketInvalidAlreadyUsed = 7,// This ticket has already been used, it is not valid.
		SteamAuthSessionResponseAuthTicketInvalid = 8,// This ticket is not from a user instance currently connected to steam.
		SteamAuthSessionResponsePublisherIssuedBan = 9// The user is banned for this game. The ban came via the web api and not VAC
  );

  SteamUserHasLicenseForAppResult = (
		SteamUserHasLicenseResultHasLicense = 0,// User has a license for specified app
		SteamUserHasLicenseResultDoesNotHaveLicense = 1,// User does not have a license for the specified app
		SteamUserHasLicenseResultNoAuth = 2// User has not been authenticated
  );

  SteamAccountType = (
		SteamAccountTypeInvalid = 0,// User has a license for specified app
		SteamAccountTypeIndividual = 1,// single user account
		SteamAccountTypeMultiseat = 2,// multiseat (e.g. cybercafe) account
		SteamAccountTypeGameServer = 3,// game server account
		SteamAccountTypeAnonGameServer = 4,// anonymous game server account
		SteamAccountTypePending = 5,// pending
		SteamAccountTypeContentServer = 6,// content server
		SteamAccountTypeClan = 7,
		SteamAccountTypeChat = 8,
		SteamAccountTypeConsoleUser = 9,// Fake SteamID for local PSN account on PS3 or Live account on 360, etc.
		SteamAccountTypeAnonUser = 10,// Max of 16 items in this field
		SteamAccountTypeMax = 11
  );

  SteamAppReleaseState = (
		SteamAppReleaseState_Unknown = 0,// unknown, required appinfo or license info is missing
		SteamAppReleaseState_Unavailable = 1,// even if user 'just' owns it, can see game at all
		SteamAppReleaseState_Prerelease = 2,// can be purchased and is visible in games list, nothing else. Common appInfo section released
		SteamAppReleaseState_PreloadOnly = 3,// owners can preload app, not play it. AppInfo fully released.
		SteamAppReleaseState_Released = 4// owners can download and play app.
  );

  SteamAppOwnershipFlags = (
		SteamAppOwnershipFlags_None = $0000,// unknown
		SteamAppOwnershipFlags_OwnsLicense = $0001,// owns license for this game
		SteamAppOwnershipFlags_FreeLicense = $0002,// not paid for game
		SteamAppOwnershipFlags_RegionRestricted = $0004,// owns app, but not allowed to play in current region
		SteamAppOwnershipFlags_LowViolence = $0008,// only low violence version
		SteamAppOwnershipFlags_InvalidPlatform = $0010,// app not supported on current platform
		SteamAppOwnershipFlags_SharedLicense = $0020,// license was granted by authorized local device
		SteamAppOwnershipFlags_FreeWeekend = $0040,// owned by a free weekend licenses
		SteamAppOwnershipFlags_RetailLicense = $0080,// has a retail license for game, (CD-Key etc)
		SteamAppOwnershipFlags_LicenseLocked = $0100,// shared license is locked (in use) by other user
		SteamAppOwnershipFlags_LicensePending = $0200,// owns app, but transaction is still pending. Can't install or play
		SteamAppOwnershipFlags_LicenseExpired = $0400,// doesn't own app anymore since license expired
		SteamAppOwnershipFlags_LicensePermanent = $0800,// permanent license, not borrowed, or guest or freeweekend etc
		SteamAppOwnershipFlags_LicenseRecurring = $1000,// Recurring license, user is charged periodically
		SteamAppOwnershipFlags_LicenseCanceled = $2000// Mark as canceled, but might be still active if recurring
  );

  SteamAppType = (
		SteamAppType_Invalid = $000,// unknown / invalid
		SteamAppType_Game = $001,// playable game, default type
		SteamAppType_Application = $002,// software application
		SteamAppType_Tool = $004,// SDKs, editors & dedicated servers
		SteamAppType_Demo = $008,// game demo
		SteamAppType_Media_DEPRECATED = $010,// legacy - was used for game trailers, which are now just videos on the web
		SteamAppType_DLC = $020,// down loadable content
		SteamAppType_Guide = $040,// game guide, PDF etc
		SteamAppType_Driver = $080,// hardware driver updater (ATI, Razor etc)
		SteamAppType_Config = $100,// hidden app used to config Steam features (backpack, sales, etc)
		SteamAppType_Film = $200,// A Movie (feature film)
		SteamAppType_TVSeries = $400,// A TV or other video series which will have episodes and perhaps seasons
		SteamAppType_Video = $800,// A video component of either a Film or TVSeries (may be the feature, an episode, preview, making-of, etc)
		SteamAppType_Plugin = $1000,// Plug-in types for other Apps
		SteamAppType_Music = $2000,// Music files
		SteamAppType_Shortcut = $40000000,// just a shortcut, client side only
		SteamAppType_DepotOnly = -2147483647// placeholder since depots and apps share the same namespace
  );

  SteamUserStatType = (
		SteamSteamUserStatTypeINVALID = 0,// unknown / invalid
		SteamSteamUserStatTypeINT = 1,
		SteamSteamUserStatTypeFLOAT = 2,// Read as FLOAT, set with count / session length
		SteamSteamUserStatTypeAVGRATE = 3,
		SteamSteamUserStatTypeACHIEVEMENTS = 4,
		SteamSteamUserStatTypeGROUPACHIEVEMENTS = 5,// max, for sanity checks
		SteamSteamUserStatTypeMAX = 6
  );

  SteamChatEntryType = (
		SteamChatEntryTypeInvalid = 0,// unknown / invalid
		SteamChatEntryTypeChatMsg = 1,// Normal text message from another user
		SteamChatEntryTypeTyping = 2,// Another user is typing (not used in multi-user chat)
		SteamChatEntryTypeInviteGame = 3,// Invite from other user into that users current game
		SteamChatEntryTypeEmote = 4,//k_EChatEntryTypeLobbyGameStart = 5,	// lobby game is starting (dead - listen for LobbyGameCreated_t callback instead)
		SteamChatEntryTypeLeftConversation = 6,// Above are previous FriendMsgType entries, now merged into more generic chat entry types
		SteamChatEntryTypeEntered = 7,// user has entered the conversation (used in multi-user chat and group chat)
		SteamChatEntryTypeWasKicked = 8,// user was kicked (data: 64-bit steamid of actor performing the kick)
		SteamChatEntryTypeWasBanned = 9,// user was banned (data: 64-bit steamid of actor performing the ban)
		SteamChatEntryTypeDisconnected = 10,// user disconnected
		SteamChatEntryTypeHistoricalChat = 11,// a chat message from user's chat history or offilne message
		SteamChatEntryTypeReserved1 = 12,
		SteamChatEntryTypeReserved2 = 13
  );

  SteamChatRoomEnterResponse = (
		SteamChatRoomEnterResponseSuccess = 1,// Success
		SteamChatRoomEnterResponseDoesntExist = 2,// Chat doesn't exist (probably closed)
		SteamChatRoomEnterResponseNotAllowed = 3,// General Denied - You don't have the permissions needed to join the chat
		SteamChatRoomEnterResponseFull = 4,// Chat room has reached its maximum size
		SteamChatRoomEnterResponseError = 5,// Unexpected Error
		SteamChatRoomEnterResponseBanned = 6,// You are banned from this chat room and may not join
		SteamChatRoomEnterResponseLimited = 7,// Joining this chat is not allowed because you are a limited user (no value on account)
		SteamChatRoomEnterResponseClanDisabled = 8,// Attempt to join a clan chat when the clan is locked or disabled
		SteamChatRoomEnterResponseCommunityBan = 9,// Attempt to join a chat when the user has a community lock on their account
		SteamChatRoomEnterResponseMemberBlockedYou = 10,// Join failed - some member in the chat has blocked you from joining
		SteamChatRoomEnterResponseYouBlockedMember = 11// k_EChatRoomEnterResponseRankOutOfRange = 14, //  No longer used
  );

  ChatSteamIDInstanceFlags = (
		SteamChatAccountInstanceMask = $00000FFF,// top 8 bits are flags
		SteamChatInstanceFlagClan = ( $00000FFF + 1 ) Shr 1,// top bit
		SteamChatInstanceFlagLobby = ( $00000FFF + 1 ) Shr 2,// next one down, etc
		SteamChatInstanceFlagMMSLobby = ( $00000FFF + 1 ) Shr 3// Max of 8 flags
  );

  SteamMarketingMessageFlags = (
		SteamMarketingMessageFlagsNone = 0,// top 8 bits are flags
		SteamMarketingMessageFlagsHighPriority = 1 Shl 0,
		SteamMarketingMessageFlagsPlatformWindows = 1 Shl 1,
		SteamMarketingMessageFlagsPlatformMac = 1 Shl 2,
		SteamMarketingMessageFlagsPlatformLinux = 1 Shl 3,//aggregate flags
		SteamMarketingMessageFlagsPlatformRestrictions = $FFFF
  );

  SteamNotificationPosition = (
		SteamPositionTopLeft = 0,// top 8 bits are flags
		SteamPositionTopRight = 1,
		SteamPositionBottomLeft = 2,
		SteamPositionBottomRight = 3
  );

  SteamHTTPMethod = (
		SteamHTTPMethodInvalid = 0,// top 8 bits are flags
		SteamHTTPMethodGET = 1,
		SteamHTTPMethodHEAD = 2,
		SteamHTTPMethodPOST = 3,
		SteamHTTPMethodPUT = 4,
		SteamHTTPMethodDELETE = 5,
		SteamHTTPMethodOPTIONS = 6// k_EHTTPMethodCONNECT
  );

  SteamHTTPStatusCode = (
		SteamHTTPStatusCodeInvalid = 0,// Informational codes
		SteamHTTPStatusCode100Continue = 100,
		SteamHTTPStatusCode101SwitchingProtocols = 101,// Success codes
		SteamHTTPStatusCode200OK = 200,
		SteamHTTPStatusCode201Created = 201,
		SteamHTTPStatusCode202Accepted = 202,
		SteamHTTPStatusCode203NonAuthoritative = 203,
		SteamHTTPStatusCode204NoContent = 204,
		SteamHTTPStatusCode205ResetContent = 205,
		SteamHTTPStatusCode206PartialContent = 206,// Redirection codes
		SteamHTTPStatusCode300MultipleChoices = 300,
		SteamHTTPStatusCode301MovedPermanently = 301,
		SteamHTTPStatusCode302Found = 302,
		SteamHTTPStatusCode303SeeOther = 303,
		SteamHTTPStatusCode304NotModified = 304,
		SteamHTTPStatusCode305UseProxy = 305,//k_EHTTPStatusCode306Unused =				306, (used in old HTTP spec, now unused in 1.1)
		SteamHTTPStatusCode307TemporaryRedirect = 307,// Error codes
		SteamHTTPStatusCode400BadRequest = 400,
		SteamHTTPStatusCode401Unauthorized = 401,
		SteamHTTPStatusCode402PaymentRequired = 402,// This is reserved for future HTTP specs, not really supported by clients
		SteamHTTPStatusCode403Forbidden = 403,
		SteamHTTPStatusCode404NotFound = 404,
		SteamHTTPStatusCode405MethodNotAllowed = 405,
		SteamHTTPStatusCode406NotAcceptable = 406,
		SteamHTTPStatusCode407ProxyAuthRequired = 407,
		SteamHTTPStatusCode408RequestTimeout = 408,
		SteamHTTPStatusCode409Conflict = 409,
		SteamHTTPStatusCode410Gone = 410,
		SteamHTTPStatusCode411LengthRequired = 411,
		SteamHTTPStatusCode412PreconditionFailed = 412,
		SteamHTTPStatusCode413RequestEntityTooLarge = 413,
		SteamHTTPStatusCode414RequestURITooLong = 414,
		SteamHTTPStatusCode415UnsupportedMediaType = 415,
		SteamHTTPStatusCode416RequestedRangeNotSatisfiable = 416,
		SteamHTTPStatusCode417ExpectationFailed = 417,
		SteamHTTPStatusCode429TooManyRequests = 429,// Server error codes
		SteamHTTPStatusCode500InternalServerError = 500,
		SteamHTTPStatusCode501NotImplemented = 501,
		SteamHTTPStatusCode502BadGateway = 502,
		SteamHTTPStatusCode503ServiceUnavailable = 503,
		SteamHTTPStatusCode504GatewayTimeout = 504,
		SteamHTTPStatusCode505HTTPVersionNotSupported = 505
  );

  SteamUniverse = (
		SteamUniverseInvalid = 0,// Informational codes
		SteamUniversePublic = 1,
		SteamUniverseBeta = 2,
		SteamUniverseInternal = 3,
		SteamUniverseDev = 4,// k_EUniverseRC = 5,				// no such universe anymore
		SteamUniverseMax = 5
  );

  SteamServerMode = (
		eServerModeInvalid = 0,// DO NOT USE
		eServerModeNoAuthentication = 1,// Don't authenticate user logins and don't list on the server list
		eServerModeAuthentication = 2,// Authenticate users, list on the server list, don't run VAC on clients that connect
		eServerModeAuthenticationAndSecure = 3// Authenticate users, list on the server list and VAC protect clients
  );

Type
  SteamFriendGameInfo = Packed Record
		ameID:SteamGameID;
		nGameIP:Cardinal;
		sGamePort:Word;
		sQueryPort:Word;
		teamIDLobby:SteamID;
  End;

  SteamFriendSessionStateInfo = Packed Record
		iOnlineSessionInstances:Cardinal;
		iPublishedToFriendsSessionInstance:Byte;
  End;

  SteamP2PSessionState = Packed Record
		ConnectionActive:Byte;	// true if we've got an active open connection
		Connecting:Byte;	// true if we're currently trying to establish a connection
		P2PSessionError:Byte;	// last error recorded (see enum above)
		UsingRelay:Byte;	// true if it's going through a relay server (TURN)
		BytesQueuedForSend:Integer;
		PacketsQueuedForSend:Integer;
		RemoteIP:Cardinal;	// potential IP:Port of remote host. Could be TURN server.
		RemotePort:Word;	// Only exists for compatibility with older authentication api's
  End;

  SteamParamStringArray = Packed Record
		pStrings:Pointer;	// true if we've got an active open connection
		NumStrings:Integer;
  End;

  SteamUGCDetails = Packed Record
		PublishedFileId:SteamPublishedFileId;	// true if we've got an active open connection
		Result:SteamResult;	// The result of the operation.
		FileType:SteamWorkshopFileType;	// Type of the file
		CreatorAppID:SteamAppId;	// ID of the app that created this file.
		ConsumerAppID:SteamAppId;	// ID of the app that will consume this file.
		gchTitle:Array[0..Pred(k_cchPublishedDocumentTitleMax)] Of Char;	// title of document
		gchDescription:Array[0..Pred(k_cchPublishedDocumentDescriptionMax)] Of Char;	// description of document
		lSteamIDOwner:UInt64;	// Steam ID of the user who created this content.
		timeCreated:Cardinal;	// time when the published file was created
		timeUpdated:Cardinal;	// time when the published file was last updated
		timeAddedToUserList:Cardinal;	// time when the user added the published file to their list (not always applicable)
		Visibility:SteamRemoteStoragePublishedFileVisibility;	// visibility
		Banned:Boolean;	// whether the file was banned
		AcceptedForUse:Boolean;	// developer has specifically flagged this item as accepted in the Workshop
		TagsTruncated:Boolean;	// whether the list of tags was too long to be returned in the provided buffer
		gchTags:Array[0..Pred(k_cchTagListMax)] Of Char;	// file/url information
		FileHandle:SteamUGCHandle;	// The handle of the primary file
		PreviewFile:SteamUGCHandle;	// The handle of the preview file
		chFileName:Array[0..Pred(k_cchFilenameMax)] Of Char;	// The cloud filename of the primary file
		FileSize:Integer;	// Size of the primary file
		PreviewFileSize:Integer;	// Size of the preview file
		gchURL:Array[0..Pred(k_cchPublishedFileURLMax)] Of Char;	// voting information
		nVotesUp:Cardinal;	// number of votes up
		nVotesDown:Cardinal;	// number of votes down
		lScore:Single;	// calculated score
		nNumChildren:Cardinal;	// if m_eFileType == k_EWorkshopFileTypeCollection, then this number will be the number of children contained within the collection
  End;

  SteamCallbackMsg = Packed Record
		SteamUser:Integer;	// true if we've got an active open connection
		Callback:Integer;
		ptrParam:Pointer;
		ubParam:Integer;
  End;

  SteamLeaderboardEntry = Packed Record
		teamIDUser:SteamID;	// user with the entry - use SteamFriends()->GetFriendPersonaName() & SteamFriends()->GetFriendAvatar() to get more info
		GlobalRank:Integer;	// [1..N], where N is the number of users with an entry in the leaderboard
		Score:Integer;	// score as set in the leaderboard
		Details:Integer;	// number of int32 details available for this entry
		UGC:SteamUGCHandle;	// handle for UGC attached to the entry
  End;

  SteamMatchMakingKeyValuePair = Packed Record
		zKey:Array[0..Pred(256)] Of Char;	// user with the entry - use SteamFriends()->GetFriendPersonaName() & SteamFriends()->GetFriendAvatar() to get more info
		zValue:Array[0..Pred(256)] Of Char;
  End;

  SteamControllerState = Packed Record
		unPacketNum:Cardinal;	// bit flags for each of the buttons
		ulButtons:UInt64;	// Left pad coordinates
		sLeftPadX:SmallInt;
		sLeftPadY:SmallInt;	// Right pad coordinates
		sRightPadX:SmallInt;
		sRightPadY:SmallInt;
  End;

  SteamGameType = (
    SteamGameIDTypeApp = 0,
    SteamGameIDTypeGameMod = 1,
    SteamGameIDTypeShortcut = 2,
    SteamGameIDTypeP2P = 3
  );

  SteamAPIWarningMessageHook = Procedure (nSeverity:Integer; pchDebugText:PAnsiChar); Cdecl; 
  SteamAPI_PostAPIResultInProcess = Procedure(callHandle:SteamAPICall; pUnknown:Pointer; unCallbackSize:Cardinal; iCallbackNum:Integer); Cdecl; 
  SteamAPI_CheckCallbackRegistered = Procedure(iCallbackNum:Integer); Cdecl; 

// steam_api.h
Procedure SteamAPI_Shutdown(); CDecl; External SteamWrapperName Name 'Shutdown';
Function SteamAPI_IsSteamRunning():Boolean; CDecl; External SteamWrapperName Name 'IsSteamRunning';
Function SteamAPI_RestartAppIfNecessary(unOwnAppID:SteamAppId):Boolean; CDecl; External SteamWrapperName Name 'RestartAppIfNecessary';
Procedure SteamAPI_WriteMiniDump(uStructuredExceptionCode:Cardinal; pvExceptionInfo:Pointer; uBuildID:Cardinal); CDecl; External SteamWrapperName Name 'WriteMiniDump';
Procedure SteamAPI_SetMiniDumpComment(pchMsg:PAnsiChar); CDecl; External SteamWrapperName Name 'SetMiniDumpComment';
Function GetSteamClient():Pointer; CDecl; External SteamWrapperName Name 'SteamClient_';
Function SteamAPI_InitSafe():Boolean; CDecl; External SteamWrapperName Name 'InitSafe';
Procedure SteamAPI_RunCallbacks(); CDecl; External SteamWrapperName Name 'RunCallbacks';
Procedure SteamAPI_RegisterCallback(pCallback:Pointer; iCallback:Integer); CDecl; External SteamWrapperName Name 'RegisterCallback';
Procedure SteamAPI_UnregisterCallback(pCallback:Pointer); CDecl; External SteamWrapperName Name 'UnregisterCallback';
Procedure SteamAPI_RegisterCallResult(pCallback:Pointer; hAPICall:UInt64); CDecl; External SteamWrapperName Name 'RegisterCallResult';
Procedure SteamAPI_UnregisterCallResult(pCallback:Pointer; hAPICall:UInt64); CDecl; External SteamWrapperName Name 'UnregisterCallResult';
Procedure Steam_RunCallbacks(hSteamPipe:SteamPipeHandle; bGameServerCallbacks:Boolean); CDecl; External SteamWrapperName Name 'Steam_RunCallbacks_';
Procedure Steam_RegisterInterfaceFuncs(hModule:Pointer); CDecl; External SteamWrapperName Name 'Steam_RegisterInterfaceFuncs_';
Function Steam_GetHSteamUserCurrent():Integer; CDecl; External SteamWrapperName Name 'Steam_GetHSteamUserCurrent_';
Function SteamAPI_GetSteamInstallPath():Integer; CDecl; External SteamWrapperName Name 'GetSteamInstallPath';
Function SteamAPI_GetHSteamPipe():Integer; CDecl; External SteamWrapperName Name 'GetHSteamPipe_';
Procedure SteamAPI_SetTryCatchCallbacks(bTryCatchCallbacks:Boolean); CDecl; External SteamWrapperName Name 'SetTryCatchCallbacks';
Function SteamAPI_GetHSteamUser():Integer; CDecl; External SteamWrapperName Name 'GetHSteamUser_';
Procedure SteamAPI_UseBreakpadCrashHandler(pchVersion:PAnsiChar; pchDate:PAnsiChar; pchTime:PAnsiChar; bFullMemoryDumps:Boolean; pvContext:Pointer; m_pfnPreMinidumpCallback:Pointer); CDecl; External SteamWrapperName Name 'UseBreakpadCrashHandler';
Function GetSteamUser():Pointer; CDecl; External SteamWrapperName Name 'SteamUser';
Function GetSteamFriends():Pointer; CDecl; External SteamWrapperName Name 'SteamFriends';
Function GetSteamUtils():Pointer; CDecl; External SteamWrapperName Name 'SteamUtils';
Function GetSteamMatchmaking():Pointer; CDecl; External SteamWrapperName Name 'SteamMatchmaking';
Function GetSteamUserStats():Pointer; CDecl; External SteamWrapperName Name 'SteamUserStats';
Function GetSteamApps():Pointer; CDecl; External SteamWrapperName Name 'SteamApps';
Function GetSteamNetworking():Pointer; CDecl; External SteamWrapperName Name 'SteamNetworking';
Function GetSteamMatchmakingServers():Pointer; CDecl; External SteamWrapperName Name 'SteamMatchmakingServers';
Function GetSteamRemoteStorage():Pointer; CDecl; External SteamWrapperName Name 'SteamRemoteStorage';
Function GetSteamScreenshots():Pointer; CDecl; External SteamWrapperName Name 'SteamScreenshots';
Function GetSteamHTTP():Pointer; CDecl; External SteamWrapperName Name 'SteamHTTP';
Function GetSteamUnifiedMessages():Pointer; CDecl; External SteamWrapperName Name 'SteamUnifiedMessages';
Function GetSteamController():Pointer; CDecl; External SteamWrapperName Name 'SteamController';
Function GetSteamUGC():Pointer; CDecl; External SteamWrapperName Name 'SteamUGC';
Function GetSteamAppList():Pointer; CDecl; External SteamWrapperName Name 'SteamAppList';
Function GetSteamMusic():Pointer; CDecl; External SteamWrapperName Name 'SteamMusic';
Function GetSteamMusicRemote():Pointer; CDecl; External SteamWrapperName Name 'SteamMusicRemote';

// steam_gameserver.h
Function SteamGameServer_InitSafe(unIP:Cardinal; usSteamPort:Word; usGamePort:Word; usQueryPort:Word; eServerMode:SteamServerMode; pchVersionString:PAnsiChar):Boolean; CDecl; External SteamWrapperName Name 'GameServer_InitSafe';
Procedure SteamGameServer_Shutdown(); CDecl; External SteamWrapperName Name 'GameServer_Shutdown';
Procedure SteamGameServer_RunCallbacks(); CDecl; External SteamWrapperName Name 'GameServer_RunCallbacks';
Function SteamGameServer_BSecure():Boolean; CDecl; External SteamWrapperName Name 'GameServer_BSecure';
Function SteamGameServer_GetSteamID():UInt64; CDecl; External SteamWrapperName Name 'GameServer_GetSteamID';
Function SteamGameServer_GetHSteamPipe():Integer; CDecl; External SteamWrapperName Name 'GameServer_GetHSteamPipe';
Function SteamGameServer_GetHSteamUser():Integer; CDecl; External SteamWrapperName Name 'GameServer_GetHSteamUser';
Function GetSteamClientGameServer():Pointer; CDecl; External SteamWrapperName Name 'SteamClientGameServer';
Function GetSteamGameServer():Pointer; CDecl; External SteamWrapperName Name 'SteamGameServer';
Function GetSteamGameServerUtils():Pointer; CDecl; External SteamWrapperName Name 'SteamGameServerUtils';
Function GetSteamGameServerNetworking():Pointer; CDecl; External SteamWrapperName Name 'SteamGameServerNetworking';
Function GetSteamGameServerStats():Pointer; CDecl; External SteamWrapperName Name 'SteamGameServerStats';
Function GetSteamGameServerHTTP():Pointer; CDecl; External SteamWrapperName Name 'SteamGameServerHTTP';

// steamencryptedappticket.h
Function BDecryptTicket(rgubTicketEncrypted:PByte; cubTicketEncrypted:Cardinal; rgubTicketDecrypted:PByte; Var pcubTicketDecrypted:Cardinal; rgubKey:PByte; cubKey:Integer):Boolean; CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_BDecryptTicket';
Function BIsTicketForApp(rgubTicketDecrypted:PByte; cubTicketDecrypted:Cardinal; nAppID:SteamAppId):Boolean; CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_BIsTicketForApp';
Function GetTicketIssueTime(rgubTicketDecrypted:PByte; cubTicketDecrypted:Cardinal):Cardinal; CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_GetTicketIssueTime';
Procedure GetTicketSteamID(rgubTicketDecrypted:PByte; cubTicketDecrypted:Cardinal; Var psteamID:SteamID); CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_GetTicketSteamID';
Function GetTicketAppID(rgubTicketDecrypted:PByte; cubTicketDecrypted:Cardinal):Cardinal; CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_GetTicketAppID';
Function BUserOwnsAppInTicket(rgubTicketDecrypted:PByte; cubTicketDecrypted:Cardinal; nAppID:SteamAppId):Boolean; CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_BUserOwnsAppInTicket';
Function BUserIsVacBanned(rgubTicketDecrypted:PByte; cubTicketDecrypted:Cardinal):Boolean; CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_BUserIsVacBanned';
Function GetUserVariableData(rgubTicketDecrypted:PByte; cubTicketDecrypted:Cardinal; Var pcubUserData:Cardinal):Pointer; CDecl; External SteamWrapperName Name 'SteamEncryptedAppTicket_GetUserVariableData';

// SteamAppList
Function ISteamAppList_GetNumInstalledApps():Cardinal; CDecl; External SteamWrapperName;
Function ISteamAppList_GetInstalledApps(pvecAppID:PSteamAppId; unMaxAppIDs:Cardinal):Cardinal; CDecl; External SteamWrapperName;
Function ISteamAppList_GetAppName(nAppID:SteamAppId; pchName:Pointer; cchNameMax:Integer):Integer; CDecl; External SteamWrapperName;
Function ISteamAppList_GetAppInstallDir(nAppID:SteamAppId; pchDirectory:Pointer; cchNameMax:Integer):Integer; CDecl; External SteamWrapperName;
Function ISteamAppList_GetAppBuildId(nAppID:SteamAppId):Integer; CDecl; External SteamWrapperName;

// SteamApps
Function ISteamApps_BIsSubscribed():Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_BIsLowViolence():Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_BIsCybercafe():Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_BIsVACBanned():Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_GetCurrentGameLanguage():PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamApps_GetAvailableGameLanguages():PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamApps_BIsSubscribedApp(appID:SteamAppId):Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_BIsDlcInstalled(appID:SteamAppId):Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_GetEarliestPurchaseUnixTime(nAppID:SteamAppId):Cardinal; CDecl; External SteamWrapperName;
Function ISteamApps_BIsSubscribedFromFreeWeekend():Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_GetDLCCount():Integer; CDecl; External SteamWrapperName;
Function ISteamApps_BGetDLCDataByIndex(iDLC:Integer; Var pAppID:SteamAppId; Var pbAvailable:Boolean; pchName:Pointer; cchNameBufferSize:Integer):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamApps_InstallDLC(nAppID:SteamAppId); CDecl; External SteamWrapperName;
Procedure ISteamApps_UninstallDLC(nAppID:SteamAppId); CDecl; External SteamWrapperName;
Procedure ISteamApps_RequestAppProofOfPurchaseKey(nAppID:SteamAppId); CDecl; External SteamWrapperName;
Function ISteamApps_GetCurrentBetaName(pchName:Pointer; cchNameBufferSize:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_MarkContentCorrupt(bMissingFilesOnly:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_GetInstalledDepots(appID:SteamAppId; pvecDepots:PSteamDepotId; cMaxDepots:Cardinal):Cardinal; CDecl; External SteamWrapperName;
Function ISteamApps_GetAppInstallDir(appID:SteamAppId; pchFolder:Pointer; cchFolderBufferSize:Cardinal):Cardinal; CDecl; External SteamWrapperName;
Function ISteamApps_BIsAppInstalled(appID:SteamAppId):Boolean; CDecl; External SteamWrapperName;
Function ISteamApps_GetAppOwner():UInt64; CDecl; External SteamWrapperName;
Function ISteamApps_GetLaunchQueryParam(pchKey:PAnsiChar):PAnsiChar; CDecl; External SteamWrapperName;

// SteamClient
Function ISteamClient_CreateSteamPipe():Integer; CDecl; External SteamWrapperName;
Function ISteamClient_BReleaseSteamPipe(hSteamPipe:SteamPipeHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamClient_ConnectToGlobalUser(hSteamPipe:SteamPipeHandle):Integer; CDecl; External SteamWrapperName;
Function ISteamClient_CreateLocalUser(Var phSteamPipe:SteamPipeHandle; eAccountType:SteamAccountType):Integer; CDecl; External SteamWrapperName;
Procedure ISteamClient_ReleaseUser(hSteamPipe:SteamPipeHandle; hUser:SteamUserHandle); CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamUser(hSteamUser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamGameServer(hSteamUser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Procedure ISteamClient_SetLocalIPBinding(unIP:Cardinal; usPort:Word); CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamFriends(hSteamUser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamUtils(hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamMatchmaking(hSteamUser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamMatchmakingServers(hSteamUser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamGenericInterface(hSteamUser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamUserStats(hSteamUser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamGameServerStats(hSteamuser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamApps(hSteamUser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamNetworking(hSteamUser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamRemoteStorage(hSteamuser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamScreenshots(hSteamuser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Procedure ISteamClient_RunFrame(); CDecl; External SteamWrapperName;
Function ISteamClient_GetIPCCallCount():Cardinal; CDecl; External SteamWrapperName;
Procedure ISteamClient_SetWarningMessageHook(pFunction:SteamAPIWarningMessageHook); CDecl; External SteamWrapperName;
Function ISteamClient_BShutdownIfAllPipesClosed():Boolean; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamHTTP(hSteamuser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamUnifiedMessages(hSteamuser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamController(hSteamUser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamUGC(hSteamUser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamAppList(hSteamUser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamMusic(hSteamuser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamMusicRemote(hSteamuser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Function ISteamClient_GetISteamHTMLSurface(hSteamuser:SteamUserHandle; hSteamPipe:SteamPipeHandle; pchVersion:PAnsiChar):Pointer; CDecl; External SteamWrapperName;
Procedure ISteamClient_Set_SteamAPI_CPostAPIResultInProcess(func:SteamAPI_PostAPIResultInProcess); CDecl; External SteamWrapperName;
Procedure ISteamClient_Remove_SteamAPI_CPostAPIResultInProcess(func:SteamAPI_PostAPIResultInProcess); CDecl; External SteamWrapperName;
Procedure ISteamClient_Set_SteamAPI_CCheckCallbackRegisteredInProcess(func:SteamAPI_CheckCallbackRegistered); CDecl; External SteamWrapperName;

// SteamController
Function ISteamController_Init(pchAbsolutePathToControllerConfigVDF:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamController_Shutdown():Boolean; CDecl; External SteamWrapperName;
Procedure ISteamController_RunFrame(); CDecl; External SteamWrapperName;
Function ISteamController_GetControllerState(unControllerIndex:Cardinal; Var pState:SteamControllerState):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamController_TriggerHapticPulse(unControllerIndex:Cardinal; eTargetPad:SteamControllerPad; usDurationMicroSec:Word); CDecl; External SteamWrapperName;
Procedure ISteamController_SetOverrideMode(pchMode:PAnsiChar); CDecl; External SteamWrapperName;

// SteamFriends
Function ISteamFriends_GetPersonaName():PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamFriends_SetPersonaName(pchPersonaName:PAnsiChar):UInt64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetPersonaState():SteamPersonaState; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendCount(iFriendFlags:SteamFriendFlags):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendByIndex(iFriend:Integer; iFriendFlags:SteamFriendFlags):UInt64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendRelationship(steamIDFriend:SteamID):SteamFriendRelationship; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendPersonaState(steamIDFriend:SteamID):SteamPersonaState; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendPersonaName(steamIDFriend:SteamID):PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendGamePlayed(steamIDFriend:SteamID; Var pFriendGameInfo:SteamFriendGameInfo):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendPersonaNameHistory(steamIDFriend:SteamID; iPersonaName:Integer):PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamFriends_GetPlayerNickname(steamIDPlayer:SteamID):PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamFriends_HasFriend(steamIDFriend:SteamID; iFriendFlags:SteamFriendFlags):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanCount():Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanByIndex(iClan:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanName(steamIDClan:SteamID):PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanTag(steamIDClan:SteamID):PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanActivityCounts(steamIDClan:SteamID; Var pnOnline:Integer; Var pnInGame:Integer; Var pnChatting:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_DownloadClanActivityCounts(psteamIDClans:PSteamID; cClansToRequest:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendCountFromSource(steamIDSource:SteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendFromSourceByIndex(steamIDSource:SteamID; iFriend:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamFriends_IsUserInSource(steamIDUser:SteamID; steamIDSource:SteamID):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamFriends_SetInGameVoiceSpeaking(steamIDUser:SteamID; bSpeaking:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamFriends_ActivateGameOverlay(pchDialog:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamFriends_ActivateGameOverlayToUser(pchDialog:PAnsiChar; steamID:SteamID); CDecl; External SteamWrapperName;
Procedure ISteamFriends_ActivateGameOverlayToWebPage(pchURL:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamFriends_ActivateGameOverlayToStore(nAppID:SteamAppId; eFlag:SteamOverlayToStoreFlag); CDecl; External SteamWrapperName;
Procedure ISteamFriends_SetPlayedWith(steamIDUserPlayedWith:SteamID); CDecl; External SteamWrapperName;
Procedure ISteamFriends_ActivateGameOverlayInviteDialog(steamIDLobby:SteamID); CDecl; External SteamWrapperName;
Function ISteamFriends_GetSmallFriendAvatar(steamIDFriend:SteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetMediumFriendAvatar(steamIDFriend:SteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetLargeFriendAvatar(steamIDFriend:SteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_RequestUserInformation(steamIDUser:SteamID; bRequireNameOnly:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_RequestClanOfficerList(steamIDClan:SteamID):UInt64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanOwner(steamIDClan:SteamID):UInt64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanOfficerCount(steamIDClan:SteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanOfficerByIndex(steamIDClan:SteamID; iOfficer:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetUserRestrictions():Cardinal; CDecl; External SteamWrapperName;
Function ISteamFriends_SetRichPresence(pchKey:PAnsiChar; pchValue:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamFriends_ClearRichPresence(); CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendRichPresence(steamIDFriend:SteamID; pchKey:PAnsiChar):PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendRichPresenceKeyCount(steamIDFriend:SteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendRichPresenceKeyByIndex(steamIDFriend:SteamID; iKey:Integer):PAnsiChar; CDecl; External SteamWrapperName;
Procedure ISteamFriends_RequestFriendRichPresence(steamIDFriend:SteamID); CDecl; External SteamWrapperName;
Function ISteamFriends_InviteUserToGame(steamIDFriend:SteamID; pchConnectString:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_GetCoplayFriendCount():Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetCoplayFriend(iCoplayFriend:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendCoplayTime(steamIDFriend:SteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendCoplayGame(steamIDFriend:SteamID):Cardinal; CDecl; External SteamWrapperName;
Function ISteamFriends_JoinClanChatRoom(steamIDClan:SteamID):UInt64; CDecl; External SteamWrapperName;
Function ISteamFriends_LeaveClanChatRoom(steamIDClan:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanChatMemberCount(steamIDClan:SteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetChatMemberByIndex(steamIDClan:SteamID; iUser:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamFriends_SendClanChatMessage(steamIDClanChat:SteamID; pchText:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_GetClanChatMessage(steamIDClanChat:SteamID; iMessage:Integer; prgchText:Pointer; cchTextMax:Integer; Var peChatEntryType:SteamChatEntryType; Var psteamidChatter:SteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_IsClanChatAdmin(steamIDClanChat:SteamID; steamIDUser:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_IsClanChatWindowOpenInSteam(steamIDClanChat:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_OpenClanChatWindowInSteam(steamIDClanChat:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_CloseClanChatWindowInSteam(steamIDClanChat:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_SetListenForFriendsMessages(bInterceptEnabled:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_ReplyToFriendMessage(steamIDFriend:SteamID; pchMsgToSend:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFriendMessage(steamIDFriend:SteamID; iMessageID:Integer; pvData:Pointer; cubData:Integer; Var peChatEntryType:SteamChatEntryType):Integer; CDecl; External SteamWrapperName;
Function ISteamFriends_GetFollowerCount(steamID:SteamID):UInt64; CDecl; External SteamWrapperName;
Function ISteamFriends_IsFollowing(steamID:SteamID):UInt64; CDecl; External SteamWrapperName;
Function ISteamFriends_EnumerateFollowingList(unStartIndex:Cardinal):UInt64; CDecl; External SteamWrapperName;

// SteamGameServer
Function ISteamGameServer_InitGameServer(unIP:Cardinal; usGamePort:Word; usQueryPort:Word; unFlags:Cardinal; nGameAppId:SteamAppId; pchVersionString:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetProduct(pszProduct:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetGameDescription(pszGameDescription:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetModDir(pszModDir:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetDedicatedServer(bDedicated:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_LogOn(pszToken:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_LogOnAnonymous(); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_LogOff(); CDecl; External SteamWrapperName;
Function ISteamGameServer_BLoggedOn():Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServer_BSecure():Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServer_GetSteamID():UInt64; CDecl; External SteamWrapperName;
Function ISteamGameServer_WasRestartRequested():Boolean; CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetMaxPlayerCount(cPlayersMax:Integer); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetBotPlayerCount(cBotplayers:Integer); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetServerName(pszServerName:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetMapName(pszMapName:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetPasswordProtected(bPasswordProtected:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetSpectatorPort(unSpectatorPort:Word); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetSpectatorServerName(pszSpectatorServerName:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_ClearAllKeyValues(); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetKeyValue(pKey:PAnsiChar; pValue:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetGameTags(pchGameTags:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetGameData(pchGameData:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetRegion(pszRegion:PAnsiChar); CDecl; External SteamWrapperName;
Function ISteamGameServer_SendUserConnectAndAuthenticate(unIPClient:Cardinal; pvAuthBlob:PByte; cubAuthBlobSize:Cardinal; Var pSteamIDUser:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServer_CreateUnauthenticatedUserConnection():UInt64; CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SendUserDisconnect(steamIDUser:SteamID); CDecl; External SteamWrapperName;
Function ISteamGameServer_BUpdateUserData(steamIDUser:SteamID; pchPlayerName:PAnsiChar; uScore:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServer_GetAuthSessionTicket(pTicket:PByte; cbMaxTicket:Integer; Var pcbTicket:Cardinal):Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServer_BeginAuthSession(pAuthTicket:PByte; cbAuthTicket:Integer; steamID:SteamID):SteamBeginAuthSessionResult; CDecl; External SteamWrapperName;
Procedure ISteamGameServer_EndAuthSession(steamID:SteamID); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_CancelAuthTicket(hAuthTicket:SteamAuthTicketHandle); CDecl; External SteamWrapperName;
Function ISteamGameServer_UserHasLicenseForApp(steamID:SteamID; appID:SteamAppId):SteamUserHasLicenseForAppResult; CDecl; External SteamWrapperName;
Function ISteamGameServer_RequestUserGroupStatus(steamIDUser:SteamID; steamIDGroup:SteamID):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamGameServer_GetGameplayStats(); CDecl; External SteamWrapperName;
Function ISteamGameServer_GetServerReputation():UInt64; CDecl; External SteamWrapperName;
Function ISteamGameServer_GetPublicIP():Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServer_HandleIncomingPacket(pData:PByte; cbData:Integer; srcIP:Cardinal; srcPort:Word):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServer_GetNextOutgoingPacket(pOut:PByte; cbMaxOut:Integer; Var pNetAdr:Cardinal; Var pPort:Word):Integer; CDecl; External SteamWrapperName;
Procedure ISteamGameServer_EnableHeartbeats(bActive:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_SetHeartbeatInterval(iHeartbeatInterval:Integer); CDecl; External SteamWrapperName;
Procedure ISteamGameServer_ForceHeartbeat(); CDecl; External SteamWrapperName;
Function ISteamGameServer_AssociateWithClan(steamIDClan:SteamID):UInt64; CDecl; External SteamWrapperName;
Function ISteamGameServer_ComputeNewPlayerCompatibility(steamIDNewPlayer:SteamID):UInt64; CDecl; External SteamWrapperName;

// SteamGameServerHTTP
Function ISteamGameServerHTTP_CreateHTTPRequest(eHTTPRequestMethod:SteamHTTPMethod; pchAbsoluteURL:PAnsiChar):SteamHTTPRequestHandle; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_SetHTTPRequestContextValue(hRequest:SteamHTTPRequestHandle; ulContextValue:UInt64):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_SetHTTPRequestNetworkActivityTimeout(hRequest:SteamHTTPRequestHandle; unTimeoutSeconds:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_SetHTTPRequestHeaderValue(hRequest:SteamHTTPRequestHandle; pchHeaderName:PAnsiChar; pchHeaderValue:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_SetHTTPRequestGetOrPostParameter(hRequest:SteamHTTPRequestHandle; pchParamName:PAnsiChar; pchParamValue:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_SendHTTPRequest(hRequest:SteamHTTPRequestHandle; Var pCallHandle:SteamAPICall):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_SendHTTPRequestAndStreamResponse(hRequest:SteamHTTPRequestHandle; Var pCallHandle:SteamAPICall):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_DeferHTTPRequest(hRequest:SteamHTTPRequestHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_PrioritizeHTTPRequest(hRequest:SteamHTTPRequestHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_GetHTTPResponseHeaderSize(hRequest:SteamHTTPRequestHandle; pchHeaderName:PAnsiChar; Var unResponseHeaderSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_GetHTTPResponseHeaderValue(hRequest:SteamHTTPRequestHandle; pchHeaderName:PAnsiChar; pHeaderValueBuffer:PByte; unBufferSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_GetHTTPResponseBodySize(hRequest:SteamHTTPRequestHandle; Var unBodySize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_GetHTTPResponseBodyData(hRequest:SteamHTTPRequestHandle; pBodyDataBuffer:PByte; unBufferSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_GetHTTPStreamingResponseBodyData(hRequest:SteamHTTPRequestHandle; cOffset:Cardinal; pBodyDataBuffer:PByte; unBufferSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_ReleaseHTTPRequest(hRequest:SteamHTTPRequestHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_GetHTTPDownloadProgressPct(hRequest:SteamHTTPRequestHandle; Var pflPercentOut:Single):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerHTTP_SetHTTPRequestRawPostBody(hRequest:SteamHTTPRequestHandle; pchContentType:PAnsiChar; pubBody:PByte; unBodyLen:Cardinal):Boolean; CDecl; External SteamWrapperName;

// SteamGameServerNetworking
Function ISteamGameServerNetworking_SendP2PPacket(steamIDRemote:SteamID; pubData:PByte; cubData:Cardinal; eP2PSendType:SteamP2PSend; nChannel:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_IsP2PPacketAvailable(Var pcubMsgSize:Cardinal; nChannel:Integer = 0):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_ReadP2PPacket(pubDest:PByte; cubDest:Cardinal; Var pcubMsgSize:Cardinal; Var psteamIDRemote:SteamID; nChannel:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_AcceptP2PSessionWithUser(steamIDRemote:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_CloseP2PSessionWithUser(steamIDRemote:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_CloseP2PChannelWithUser(steamIDRemote:SteamID; nChannel:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_GetP2PSessionState(steamIDRemote:SteamID; Var pConnectionState:SteamP2PSessionState):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_AllowP2PPacketRelay(bAllow:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_CreateListenSocket(nVirtualP2PPort:Integer; nIP:Cardinal; nPort:Word; bAllowUseOfPacketRelay:Boolean):Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_CreateP2PConnectionSocket(steamIDTarget:SteamID; nVirtualPort:Integer; nTimeoutSec:Integer; bAllowUseOfPacketRelay:Boolean):Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_CreateConnectionSocket(nIP:Cardinal; nPort:Word; nTimeoutSec:Integer):Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_DestroySocket(hSocket:SteamSNetSocket; bNotifyRemoteEnd:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_DestroyListenSocket(hSocket:SteamSNetListenSocket; bNotifyRemoteEnd:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_SendDataOnSocket(hSocket:SteamSNetSocket; pubData:Pointer; cubData:Cardinal; bReliable:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_IsDataAvailableOnSocket(hSocket:SteamSNetSocket; Var pcubMsgSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_RetrieveDataFromSocket(hSocket:SteamSNetSocket; pubDest:Pointer; cubDest:Cardinal; Var pcubMsgSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_IsDataAvailable(hListenSocket:SteamSNetListenSocket; Var pcubMsgSize:Cardinal; Var phSocket:SteamSNetSocket):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_RetrieveData(hListenSocket:SteamSNetListenSocket; pubDest:Pointer; cubDest:Cardinal; Var pcubMsgSize:Cardinal; Var phSocket:SteamSNetSocket):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_GetSocketInfo(hSocket:SteamSNetSocket; Var pSteamIDRemote:SteamID; Var peSocketStatus:Integer; Var punIPRemote:Cardinal; Var punPortRemote:Word):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_GetListenSocketInfo(hListenSocket:SteamSNetListenSocket; Var pnIP:Cardinal; Var pnPort:Word):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_GetSocketConnectionType(hSocket:SteamSNetSocket):SteamSNetSocketConnectionType; CDecl; External SteamWrapperName;
Function ISteamGameServerNetworking_GetMaxPacketSize(hSocket:SteamSNetSocket):Integer; CDecl; External SteamWrapperName;

// SteamGameServerStats
Function ISteamGameServerStats_RequestUserStats(steamIDUser:SteamID):UInt64; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_GetUserStat(steamIDUser:SteamID; pchName:PAnsiChar; Var pData:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_GetUserStat_(steamIDUser:SteamID; pchName:PAnsiChar; Var pData:Single):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_GetUserAchievement(steamIDUser:SteamID; pchName:PAnsiChar; Var pbAchieved:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_SetUserStat(steamIDUser:SteamID; pchName:PAnsiChar; nData:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_SetUserStat_(steamIDUser:SteamID; pchName:PAnsiChar; fData:Single):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_UpdateUserAvgRateStat(steamIDUser:SteamID; pchName:PAnsiChar; flCountThisSession:Single; dSessionLength:double):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_SetUserAchievement(steamIDUser:SteamID; pchName:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_ClearUserAchievement(steamIDUser:SteamID; pchName:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerStats_StoreUserStats(steamIDUser:SteamID):UInt64; CDecl; External SteamWrapperName;

// SteamGameServerUtils
Function ISteamGameServerUtils_GetSecondsSinceAppActive():Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetSecondsSinceComputerActive():Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetConnectedUniverse():SteamUniverse; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetServerRealTime():Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetIPCountry():PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetImageSize(iImage:Integer; Var pnWidth:Cardinal; Var pnHeight:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetImageRGBA(iImage:Integer; pubDest:PByte; nDestBufferSize:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetCSERIPPort(Var unIP:Cardinal; Var usPort:Word):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetCurrentBatteryPower():Byte; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetAppID():Cardinal; CDecl; External SteamWrapperName;
Procedure ISteamGameServerUtils_SetOverlayNotificationPosition(eNotificationPosition:SteamNotificationPosition); CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_IsAPICallCompleted(hSteamAPICall:SteamAPICall; Var pbFailed:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetAPICallFailureReason(hSteamAPICall:SteamAPICall):SteamAPICallFailure; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetAPICallResult(hSteamAPICall:SteamAPICall; pCallback:Pointer; cubCallback:Integer; iCallbackExpected:Integer; Var pbFailed:Boolean):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamGameServerUtils_RunFrame(); CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetIPCCallCount():Cardinal; CDecl; External SteamWrapperName;
Procedure ISteamGameServerUtils_SetWarningMessageHook(pFunction:SteamAPIWarningMessageHook); CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_IsOverlayEnabled():Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_BOverlayNeedsPresent():Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_ShowGamepadTextInput(eInputMode:SteamGamepadTextInputMode; eLineInputMode:SteamGamepadTextInputLineMode; pchDescription:PAnsiChar; unCharMax:Cardinal; pchExistingText:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetEnteredGamepadTextLength():Cardinal; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetEnteredGamepadTextInput(pchText:Pointer; cchText:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_GetSteamUILanguage():PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamGameServerUtils_IsSteamRunningInVR():Boolean; CDecl; External SteamWrapperName;

// SteamHTMLSurface
Function ISteamHTMLSurface_Init():Boolean; CDecl; External SteamWrapperName;
Function ISteamHTMLSurface_Shutdown():Boolean; CDecl; External SteamWrapperName;
Function ISteamHTMLSurface_CreateBrowser(pchUserAgent:PAnsiChar; pchUserCSS:PAnsiChar):UInt64; CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_RemoveBrowser(unBrowserHandle:SteamHTMLBrowserHandle); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_LoadURL(unBrowserHandle:SteamHTMLBrowserHandle; pchURL:PAnsiChar; pchPostData:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_SetSize(unBrowserHandle:SteamHTMLBrowserHandle; unWidth:Cardinal; unHeight:Cardinal); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_StopLoad(unBrowserHandle:SteamHTMLBrowserHandle); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_Reload(unBrowserHandle:SteamHTMLBrowserHandle); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_GoBack(unBrowserHandle:SteamHTMLBrowserHandle); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_GoForward(unBrowserHandle:SteamHTMLBrowserHandle); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_AddHeader(unBrowserHandle:SteamHTMLBrowserHandle; pchKey:PAnsiChar; pchValue:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_ExecuteJavascript(unBrowserHandle:SteamHTMLBrowserHandle; pchScript:PAnsiChar); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_MouseUp(unBrowserHandle:SteamHTMLBrowserHandle; eMouseButton:SteamHTMLMouseButton); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_MouseDown(unBrowserHandle:SteamHTMLBrowserHandle; eMouseButton:SteamHTMLMouseButton); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_MouseDoubleClick(unBrowserHandle:SteamHTMLBrowserHandle; eMouseButton:SteamHTMLMouseButton); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_MouseMove(unBrowserHandle:SteamHTMLBrowserHandle; x:Integer; y:Integer); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_MouseWheel(unBrowserHandle:SteamHTMLBrowserHandle; nDelta:Integer); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_KeyDown(unBrowserHandle:SteamHTMLBrowserHandle; nNativeKeyCode:Cardinal; eHTMLKeyModifiers:SteamHTMLKeyModifiers); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_KeyUp(unBrowserHandle:SteamHTMLBrowserHandle; nNativeKeyCode:Cardinal; eHTMLKeyModifiers:SteamHTMLKeyModifiers); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_KeyChar(unBrowserHandle:SteamHTMLBrowserHandle; cUnicodeChar:Cardinal; eHTMLKeyModifiers:SteamHTMLKeyModifiers); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_SetHorizontalScroll(unBrowserHandle:SteamHTMLBrowserHandle; nAbsolutePixelScroll:Cardinal); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_SetVerticalScroll(unBrowserHandle:SteamHTMLBrowserHandle; nAbsolutePixelScroll:Cardinal); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_SetKeyFocus(unBrowserHandle:SteamHTMLBrowserHandle; bHasKeyFocus:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_ViewSource(unBrowserHandle:SteamHTMLBrowserHandle); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_CopyToClipboard(unBrowserHandle:SteamHTMLBrowserHandle); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_PasteFromClipboard(unBrowserHandle:SteamHTMLBrowserHandle); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_Find(unBrowserHandle:SteamHTMLBrowserHandle; pchSearchStr:PAnsiChar; bCurrentlyInFind:Boolean; bReverse:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_StopFind(unBrowserHandle:SteamHTMLBrowserHandle); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_GetLinkAtPosition(unBrowserHandle:SteamHTMLBrowserHandle; x:Integer; y:Integer); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_SetCookie(pchHostname:PAnsiChar; pchKey:PAnsiChar; pchValue:PAnsiChar; pchPath:PAnsiChar; nExpires:Cardinal = 0; bSecure:Boolean = false; bHTTPOnly:Boolean = false); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_SetPageScaleFactor(unBrowserHandle:SteamHTMLBrowserHandle; flZoom:Single; nPointX:Integer; nPointY:Integer); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_AllowStartRequest(unBrowserHandle:SteamHTMLBrowserHandle; bAllowed:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_JSDialogResponse(unBrowserHandle:SteamHTMLBrowserHandle; bResult:Boolean); CDecl; External SteamWrapperName;
Procedure ISteamHTMLSurface_FileLoadDialogResponse(unBrowserHandle:SteamHTMLBrowserHandle; pchSelectedFiles:Pointer); CDecl; External SteamWrapperName;

// SteamHTTP
Function ISteamHTTP_CreateHTTPRequest(eHTTPRequestMethod:SteamHTTPMethod; pchAbsoluteURL:PAnsiChar):SteamHTTPRequestHandle; CDecl; External SteamWrapperName;
Function ISteamHTTP_SetHTTPRequestContextValue(hRequest:SteamHTTPRequestHandle; ulContextValue:UInt64):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_SetHTTPRequestNetworkActivityTimeout(hRequest:SteamHTTPRequestHandle; unTimeoutSeconds:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_SetHTTPRequestHeaderValue(hRequest:SteamHTTPRequestHandle; pchHeaderName:PAnsiChar; pchHeaderValue:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_SetHTTPRequestGetOrPostParameter(hRequest:SteamHTTPRequestHandle; pchParamName:PAnsiChar; pchParamValue:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_SendHTTPRequest(hRequest:SteamHTTPRequestHandle; Var pCallHandle:SteamAPICall):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_SendHTTPRequestAndStreamResponse(hRequest:SteamHTTPRequestHandle; Var pCallHandle:SteamAPICall):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_DeferHTTPRequest(hRequest:SteamHTTPRequestHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_PrioritizeHTTPRequest(hRequest:SteamHTTPRequestHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_GetHTTPResponseHeaderSize(hRequest:SteamHTTPRequestHandle; pchHeaderName:PAnsiChar; Var unResponseHeaderSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_GetHTTPResponseHeaderValue(hRequest:SteamHTTPRequestHandle; pchHeaderName:PAnsiChar; pHeaderValueBuffer:PByte; unBufferSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_GetHTTPResponseBodySize(hRequest:SteamHTTPRequestHandle; Var unBodySize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_GetHTTPResponseBodyData(hRequest:SteamHTTPRequestHandle; pBodyDataBuffer:PByte; unBufferSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_GetHTTPStreamingResponseBodyData(hRequest:SteamHTTPRequestHandle; cOffset:Cardinal; pBodyDataBuffer:PByte; unBufferSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_ReleaseHTTPRequest(hRequest:SteamHTTPRequestHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_GetHTTPDownloadProgressPct(hRequest:SteamHTTPRequestHandle; Var pflPercentOut:Single):Boolean; CDecl; External SteamWrapperName;
Function ISteamHTTP_SetHTTPRequestRawPostBody(hRequest:SteamHTTPRequestHandle; pchContentType:PAnsiChar; pubBody:PByte; unBodyLen:Cardinal):Boolean; CDecl; External SteamWrapperName;

// SteamMatchmaking
Function ISteamMatchmaking_GetFavoriteGameCount():Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetFavoriteGame(iGame:Integer; Var pnAppID:SteamAppId; Var pnIP:Cardinal; Var pnConnPort:Word; Var pnQueryPort:Word; Var punFlags:Cardinal; Var pRTime32LastPlayedOnServer:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_AddFavoriteGame(nAppID:SteamAppId; nIP:Cardinal; nConnPort:Word; nQueryPort:Word; unFlags:Cardinal; rTime32LastPlayedOnServer:Cardinal):Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_RemoveFavoriteGame(nAppID:SteamAppId; nIP:Cardinal; nConnPort:Word; nQueryPort:Word; unFlags:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_RequestLobbyList():UInt64; CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_AddRequestLobbyListStringFilter(pchKeyToMatch:PAnsiChar; pchValueToMatch:PAnsiChar; eComparisonType:SteamLobbyComparison); CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_AddRequestLobbyListNumericalFilter(pchKeyToMatch:PAnsiChar; nValueToMatch:Integer; eComparisonType:SteamLobbyComparison); CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_AddRequestLobbyListNearValueFilter(pchKeyToMatch:PAnsiChar; nValueToBeCloseTo:Integer); CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable(nSlotsAvailable:Integer); CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_AddRequestLobbyListDistanceFilter(eLobbyDistanceFilter:SteamLobbyDistanceFilter); CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_AddRequestLobbyListResultCountFilter(cMaxResults:Integer); CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter(steamIDLobby:SteamID); CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyByIndex(iLobby:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_CreateLobby(eLobbyType:SteamLobbyType; cMaxMembers:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_JoinLobby(steamIDLobby:SteamID):UInt64; CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_LeaveLobby(steamIDLobby:SteamID); CDecl; External SteamWrapperName;
Function ISteamMatchmaking_InviteUserToLobby(steamIDLobby:SteamID; steamIDInvitee:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetNumLobbyMembers(steamIDLobby:SteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyMemberByIndex(steamIDLobby:SteamID; iMember:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyData(steamIDLobby:SteamID; pchKey:PAnsiChar):PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_SetLobbyData(steamIDLobby:SteamID; pchKey:PAnsiChar; pchValue:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyDataCount(steamIDLobby:SteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyDataByIndex(steamIDLobby:SteamID; iLobbyData:Integer; pchKey:Pointer; cchKeyBufferSize:Integer; pchValue:Pointer; cchValueBufferSize:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_DeleteLobbyData(steamIDLobby:SteamID; pchKey:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyMemberData(steamIDLobby:SteamID; steamIDUser:SteamID; pchKey:PAnsiChar):PAnsiChar; CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_SetLobbyMemberData(steamIDLobby:SteamID; pchKey:PAnsiChar; pchValue:PAnsiChar); CDecl; External SteamWrapperName;
Function ISteamMatchmaking_SendLobbyChatMsg(steamIDLobby:SteamID; pvMsgBody:PByte; cubMsgBody:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyChatEntry(steamIDLobby:SteamID; iChatID:Integer; Var pSteamIDUser:SteamID; pvData:PByte; cubData:Integer; Var peChatEntryType:SteamChatEntryType):Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_RequestLobbyData(steamIDLobby:SteamID):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamMatchmaking_SetLobbyGameServer(steamIDLobby:SteamID; unGameServerIP:Cardinal; unGameServerPort:Word; steamIDGameServer:SteamID); CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyGameServer(steamIDLobby:SteamID; Var punGameServerIP:Cardinal; Var punGameServerPort:Word; Var psteamIDGameServer:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_SetLobbyMemberLimit(steamIDLobby:SteamID; cMaxMembers:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyMemberLimit(steamIDLobby:SteamID):Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_SetLobbyType(steamIDLobby:SteamID; eLobbyType:SteamLobbyType):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_SetLobbyJoinable(steamIDLobby:SteamID; bLobbyJoinable:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_GetLobbyOwner(steamIDLobby:SteamID):UInt64; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_SetLobbyOwner(steamIDLobby:SteamID; steamIDNewOwner:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmaking_SetLinkedLobby(steamIDLobby:SteamID; steamIDLobbyDependent:SteamID):Boolean; CDecl; External SteamWrapperName;

// SteamMatchmakingServers
Function ISteamMatchmakingServers_RequestInternetServerList(iApp:SteamAppId; ppchFilters:Pointer; nFilters:Cardinal; pRequestServersResponse:Pointer):Pointer; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_RequestLANServerList(iApp:SteamAppId; pRequestServersResponse:Pointer):Pointer; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_RequestFriendsServerList(iApp:SteamAppId; ppchFilters:Pointer; nFilters:Cardinal; pRequestServersResponse:Pointer):Pointer; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_RequestFavoritesServerList(iApp:SteamAppId; ppchFilters:Pointer; nFilters:Cardinal; pRequestServersResponse:Pointer):Pointer; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_RequestHistoryServerList(iApp:SteamAppId; ppchFilters:Pointer; nFilters:Cardinal; pRequestServersResponse:Pointer):Pointer; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_RequestSpectatorServerList(iApp:SteamAppId; ppchFilters:Pointer; nFilters:Cardinal; pRequestServersResponse:Pointer):Pointer; CDecl; External SteamWrapperName;
Procedure ISteamMatchmakingServers_ReleaseRequest(hServerListRequest:SteamServerListRequestHandle); CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_GetServerDetails(hRequest:SteamServerListRequestHandle; iServer:Integer):Pointer; CDecl; External SteamWrapperName;
Procedure ISteamMatchmakingServers_CancelQuery(hRequest:SteamServerListRequestHandle); CDecl; External SteamWrapperName;
Procedure ISteamMatchmakingServers_RefreshQuery(hRequest:SteamServerListRequestHandle); CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_IsRefreshing(hRequest:SteamServerListRequestHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_GetServerCount(hRequest:SteamServerListRequestHandle):Integer; CDecl; External SteamWrapperName;
Procedure ISteamMatchmakingServers_RefreshServer(hRequest:SteamServerListRequestHandle; iServer:Integer); CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_PingServer(unIP:Cardinal; usPort:Word; pRequestServersResponse:Pointer):Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_PlayerDetails(unIP:Cardinal; usPort:Word; pRequestServersResponse:Pointer):Integer; CDecl; External SteamWrapperName;
Function ISteamMatchmakingServers_ServerRules(unIP:Cardinal; usPort:Word; pRequestServersResponse:Pointer):Integer; CDecl; External SteamWrapperName;
Procedure ISteamMatchmakingServers_CancelServerQuery(hServerQuery:SteamServerQueryHandle); CDecl; External SteamWrapperName;

// SteamMusic
Function ISteamMusic_BIsEnabled():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusic_BIsPlaying():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusic_GetPlaybackStatus():SteamAudioPlayback_Status; CDecl; External SteamWrapperName;
Procedure ISteamMusic_Play(); CDecl; External SteamWrapperName;
Procedure ISteamMusic_Pause(); CDecl; External SteamWrapperName;
Procedure ISteamMusic_PlayPrevious(); CDecl; External SteamWrapperName;
Procedure ISteamMusic_PlayNext(); CDecl; External SteamWrapperName;
Procedure ISteamMusic_SetVolume(flVolume:Single); CDecl; External SteamWrapperName;
Function ISteamMusic_GetVolume():Single; CDecl; External SteamWrapperName;

// SteamMusicRemote
Function ISteamMusicRemote_RegisterSteamMusicRemote(pchName:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_DeregisterSteamMusicRemote():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_BIsCurrentMusicRemote():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_BActivationSuccess(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_SetDisplayName(pchDisplayName:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_SetPNGIcon_64x64(pvBuffer:PByte; cbBufferLength:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_EnablePlayPrevious(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_EnablePlayNext(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_EnableShuffled(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_EnableLooped(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_EnableQueue(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_EnablePlaylists(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_UpdatePlaybackStatus(nStatus:SteamAudioPlayback_Status):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_UpdateShuffled(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_UpdateLooped(bValue:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_UpdateVolume(flValue:Single):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_CurrentEntryWillChange():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_CurrentEntryIsAvailable(bAvailable:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_UpdateCurrentEntryText(pchText:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds(nValue:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_UpdateCurrentEntryCoverArt(pvBuffer:PByte; cbBufferLength:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_CurrentEntryDidChange():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_QueueWillChange():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_ResetQueueEntries():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_SetQueueEntry(nID:Integer; nPosition:Integer; pchEntryText:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_SetCurrentQueueEntry(nID:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_QueueDidChange():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_PlaylistWillChange():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_ResetPlaylistEntries():Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_SetPlaylistEntry(nID:Integer; nPosition:Integer; pchEntryText:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_SetCurrentPlaylistEntry(nID:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamMusicRemote_PlaylistDidChange():Boolean; CDecl; External SteamWrapperName;

// SteamNetworking
Function ISteamNetworking_SendP2PPacket(steamIDRemote:SteamID; pubData:PByte; cubData:Cardinal; eP2PSendType:SteamP2PSend; nChannel:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_IsP2PPacketAvailable(Var pcubMsgSize:Cardinal; nChannel:Integer = 0):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_ReadP2PPacket(pubDest:PByte; cubDest:Cardinal; Var pcubMsgSize:Cardinal; Var psteamIDRemote:SteamID; nChannel:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_AcceptP2PSessionWithUser(steamIDRemote:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_CloseP2PSessionWithUser(steamIDRemote:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_CloseP2PChannelWithUser(steamIDRemote:SteamID; nChannel:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_GetP2PSessionState(steamIDRemote:SteamID; Var pConnectionState:SteamP2PSessionState):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_AllowP2PPacketRelay(bAllow:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_CreateListenSocket(nVirtualP2PPort:Integer; nIP:Cardinal; nPort:Word; bAllowUseOfPacketRelay:Boolean):Cardinal; CDecl; External SteamWrapperName;
Function ISteamNetworking_CreateP2PConnectionSocket(steamIDTarget:SteamID; nVirtualPort:Integer; nTimeoutSec:Integer; bAllowUseOfPacketRelay:Boolean):Cardinal; CDecl; External SteamWrapperName;
Function ISteamNetworking_CreateConnectionSocket(nIP:Cardinal; nPort:Word; nTimeoutSec:Integer):Cardinal; CDecl; External SteamWrapperName;
Function ISteamNetworking_DestroySocket(hSocket:SteamSNetSocket; bNotifyRemoteEnd:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_DestroyListenSocket(hSocket:SteamSNetListenSocket; bNotifyRemoteEnd:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_SendDataOnSocket(hSocket:SteamSNetSocket; pubData:Pointer; cubData:Cardinal; bReliable:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_IsDataAvailableOnSocket(hSocket:SteamSNetSocket; Var pcubMsgSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_RetrieveDataFromSocket(hSocket:SteamSNetSocket; pubDest:Pointer; cubDest:Cardinal; Var pcubMsgSize:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_IsDataAvailable(hListenSocket:SteamSNetListenSocket; Var pcubMsgSize:Cardinal; Var phSocket:SteamSNetSocket):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_RetrieveData(hListenSocket:SteamSNetListenSocket; pubDest:Pointer; cubDest:Cardinal; Var pcubMsgSize:Cardinal; Var phSocket:SteamSNetSocket):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_GetSocketInfo(hSocket:SteamSNetSocket; Var pSteamIDRemote:SteamID; Var peSocketStatus:Integer; Var punIPRemote:Cardinal; Var punPortRemote:Word):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_GetListenSocketInfo(hListenSocket:SteamSNetListenSocket; Var pnIP:Cardinal; Var pnPort:Word):Boolean; CDecl; External SteamWrapperName;
Function ISteamNetworking_GetSocketConnectionType(hSocket:SteamSNetSocket):SteamSNetSocketConnectionType; CDecl; External SteamWrapperName;
Function ISteamNetworking_GetMaxPacketSize(hSocket:SteamSNetSocket):Integer; CDecl; External SteamWrapperName;

// SteamRemoteStorage
Function ISteamRemoteStorage_FileWrite(pchFile:PAnsiChar; pvData:PByte; cubData:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileRead(pchFile:PAnsiChar; pvData:PByte; cubDataToRead:Integer):Integer; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileForget(pchFile:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileDelete(pchFile:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileShare(pchFile:PAnsiChar):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_SetSyncPlatforms(pchFile:PAnsiChar; eRemoteStoragePlatform:SteamRemoteStoragePlatform):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileWriteStreamOpen(pchFile:PAnsiChar):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileWriteStreamWriteChunk(writeHandle:SteamUGCFileWriteStreamHandle; pvData:PByte; cubData:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileWriteStreamClose(writeHandle:SteamUGCFileWriteStreamHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileWriteStreamCancel(writeHandle:SteamUGCFileWriteStreamHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FileExists(pchFile:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_FilePersisted(pchFile:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetFileSize(pchFile:PAnsiChar):Integer; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetFileTimestamp(pchFile:PAnsiChar):Int64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetSyncPlatforms(pchFile:PAnsiChar):SteamRemoteStoragePlatform; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetFileCount():Integer; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetFileNameAndSize(iFile:Integer; Var pnFileSizeInBytes:Integer):PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetQuota(Var pnTotalBytes:Integer; Var puAvailableBytes:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_IsCloudEnabledForAccount():Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_IsCloudEnabledForApp():Boolean; CDecl; External SteamWrapperName;
Procedure ISteamRemoteStorage_SetCloudEnabledForApp(bEnabled:Boolean); CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UGCDownload(hContent:SteamUGCHandle; unPriority:Cardinal):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetUGCDownloadProgress(hContent:SteamUGCHandle; Var pnBytesDownloaded:Integer; Var pnBytesExpected:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetUGCDetails(hContent:SteamUGCHandle; Var pnAppID:SteamAppId; Var ppchName:Pointer; Var pnFileSizeInBytes:Integer; Var pSteamIDOwner:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UGCRead(hContent:SteamUGCHandle; pvData:PByte; cubDataToRead:Integer; cOffset:Cardinal; eAction:SteamUGCReadAction):Integer; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetCachedUGCCount():Integer; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetCachedUGCHandle(iCachedContent:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_PublishWorkshopFile(pchFile:PAnsiChar; pchPreviewFile:PAnsiChar; nConsumerAppId:SteamAppId; pchTitle:PAnsiChar; pchDescription:PAnsiChar; eVisibility:SteamRemoteStoragePublishedFileVisibility; pTags:Pointer; eWorkshopFileType:SteamWorkshopFileType):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_CreatePublishedFileUpdateRequest(unPublishedFileId:SteamPublishedFileId):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdatePublishedFileFile(updateHandle:SteamPublishedFileUpdateHandle; pchFile:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdatePublishedFilePreviewFile(updateHandle:SteamPublishedFileUpdateHandle; pchPreviewFile:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdatePublishedFileTitle(updateHandle:SteamPublishedFileUpdateHandle; pchTitle:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdatePublishedFileDescription(updateHandle:SteamPublishedFileUpdateHandle; pchDescription:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdatePublishedFileVisibility(updateHandle:SteamPublishedFileUpdateHandle; eVisibility:SteamRemoteStoragePublishedFileVisibility):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdatePublishedFileTags(updateHandle:SteamPublishedFileUpdateHandle; pTags:Pointer):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_CommitPublishedFileUpdate(updateHandle:SteamPublishedFileUpdateHandle):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetPublishedFileDetails(unPublishedFileId:SteamPublishedFileId; unMaxSecondsOld:Cardinal):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_DeletePublishedFile(unPublishedFileId:SteamPublishedFileId):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_EnumerateUserPublishedFiles(unStartIndex:Cardinal):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_SubscribePublishedFile(unPublishedFileId:SteamPublishedFileId):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_EnumerateUserSubscribedFiles(unStartIndex:Cardinal):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UnsubscribePublishedFile(unPublishedFileId:SteamPublishedFileId):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription(updateHandle:SteamPublishedFileUpdateHandle; pchChangeDescription:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetPublishedItemVoteDetails(unPublishedFileId:SteamPublishedFileId):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UpdateUserPublishedItemVote(unPublishedFileId:SteamPublishedFileId; bVoteUp:Boolean):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_GetUserPublishedItemVoteDetails(unPublishedFileId:SteamPublishedFileId):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles(steamId:SteamID; unStartIndex:Cardinal; pRequiredTags:Pointer; pExcludedTags:Pointer):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_PublishVideo(eVideoProvider:SteamWorkshopVideoProvider; pchVideoAccount:PAnsiChar; pchVideoIdentifier:PAnsiChar; pchPreviewFile:PAnsiChar; nConsumerAppId:SteamAppId; pchTitle:PAnsiChar; pchDescription:PAnsiChar; eVisibility:SteamRemoteStoragePublishedFileVisibility; pTags:Pointer):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_SetUserPublishedFileAction(unPublishedFileId:SteamPublishedFileId; eAction:SteamWorkshopFileAction):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_EnumeratePublishedFilesByUserAction(eAction:SteamWorkshopFileAction; unStartIndex:Cardinal):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_EnumeratePublishedWorkshopFiles(eEnumerationType:SteamWorkshopEnumerationType; unStartIndex:Cardinal; unCount:Cardinal; unDays:Cardinal; pTags:Pointer; pUserTags:Pointer):UInt64; CDecl; External SteamWrapperName;
Function ISteamRemoteStorage_UGCDownloadToLocation(hContent:SteamUGCHandle; pchLocation:PAnsiChar; unPriority:Cardinal):UInt64; CDecl; External SteamWrapperName;

// SteamScreenshots
Function ISteamScreenshots_WriteScreenshot(pubRGB:PByte; cubRGB:Cardinal; nWidth:Integer; nHeight:Integer):Cardinal; CDecl; External SteamWrapperName;
Function ISteamScreenshots_AddScreenshotToLibrary(pchFilename:PAnsiChar; pchThumbnailFilename:PAnsiChar; nWidth:Integer; nHeight:Integer):Cardinal; CDecl; External SteamWrapperName;
Procedure ISteamScreenshots_TriggerScreenshot(); CDecl; External SteamWrapperName;
Procedure ISteamScreenshots_HookScreenshots(bHook:Boolean); CDecl; External SteamWrapperName;
Function ISteamScreenshots_SetLocation(hScreenshot:SteamScreenshotHandle; pchLocation:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamScreenshots_TagUser(hScreenshot:SteamScreenshotHandle; steamID:SteamID):Boolean; CDecl; External SteamWrapperName;
Function ISteamScreenshots_TagPublishedFile(hScreenshot:SteamScreenshotHandle; unPublishedFileID:SteamPublishedFileId):Boolean; CDecl; External SteamWrapperName;

// SteamUGC
Function ISteamUGC_CreateQueryUserUGCRequest(unAccountID:SteamAccountID; eListType:SteamUserUGCList; eMatchingUGCType:SteamUGCMatchingUGCType; eSortOrder:SteamUserUGCListSortOrder; nCreatorAppID:SteamAppId; nConsumerAppID:SteamAppId; unPage:Cardinal):UInt64; CDecl; External SteamWrapperName;
Function ISteamUGC_CreateQueryAllUGCRequest(eQueryType:SteamUGCQuery; eMatchingeMatchingUGCTypeFileType:SteamUGCMatchingUGCType; nCreatorAppID:SteamAppId; nConsumerAppID:SteamAppId; unPage:Cardinal):UInt64; CDecl; External SteamWrapperName;
Function ISteamUGC_SendQueryUGCRequest(handle:SteamUGCQueryHandle):UInt64; CDecl; External SteamWrapperName;
Function ISteamUGC_GetQueryUGCResult(handle:SteamUGCQueryHandle; index:Cardinal; Var pDetails:SteamUGCDetails):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_ReleaseQueryUGCRequest(handle:SteamUGCQueryHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_AddRequiredTag(handle:SteamUGCQueryHandle; pTagName:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_AddExcludedTag(handle:SteamUGCQueryHandle; pTagName:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetReturnLongDescription(handle:SteamUGCQueryHandle; bReturnLongDescription:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetReturnTotalOnly(handle:SteamUGCQueryHandle; bReturnTotalOnly:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetAllowCachedResponse(handle:SteamUGCQueryHandle; unMaxAgeSeconds:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetCloudFileNameFilter(handle:SteamUGCQueryHandle; pMatchCloudFileName:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetMatchAnyTag(handle:SteamUGCQueryHandle; bMatchAnyTag:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetSearchText(handle:SteamUGCQueryHandle; pSearchText:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetRankedByTrendDays(handle:SteamUGCQueryHandle; unDays:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_RequestUGCDetails(nPublishedFileID:SteamPublishedFileId; unMaxAgeSeconds:Cardinal):UInt64; CDecl; External SteamWrapperName;
Function ISteamUGC_CreateItem(nConsumerAppId:SteamAppId; eFileType:SteamWorkshopFileType):UInt64; CDecl; External SteamWrapperName;
Function ISteamUGC_StartItemUpdate(nConsumerAppId:SteamAppId; nPublishedFileID:SteamPublishedFileId):UInt64; CDecl; External SteamWrapperName;
Function ISteamUGC_SetItemTitle(handle:SteamUGCUpdateHandle; pchTitle:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetItemDescription(handle:SteamUGCUpdateHandle; pchDescription:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetItemVisibility(handle:SteamUGCUpdateHandle; eVisibility:SteamRemoteStoragePublishedFileVisibility):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetItemTags(updateHandle:SteamUGCUpdateHandle; pTags:Pointer):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetItemContent(handle:SteamUGCUpdateHandle; pszContentFolder:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SetItemPreview(handle:SteamUGCUpdateHandle; pszPreviewFile:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_SubmitItemUpdate(handle:SteamUGCUpdateHandle; pchChangeNote:PAnsiChar):UInt64; CDecl; External SteamWrapperName;
Function ISteamUGC_GetItemUpdateProgress(handle:SteamUGCUpdateHandle; Var punBytesProcessed:UInt64; Var punBytesTotal:UInt64):SteamItemUpdateStatus; CDecl; External SteamWrapperName;
Function ISteamUGC_SubscribeItem(nPublishedFileID:SteamPublishedFileId):UInt64; CDecl; External SteamWrapperName;
Function ISteamUGC_UnsubscribeItem(nPublishedFileID:SteamPublishedFileId):UInt64; CDecl; External SteamWrapperName;
Function ISteamUGC_GetNumSubscribedItems():Cardinal; CDecl; External SteamWrapperName;
Function ISteamUGC_GetSubscribedItems(pvecPublishedFileID:PSteamPublishedFileId; cMaxEntries:Cardinal):Cardinal; CDecl; External SteamWrapperName;
Function ISteamUGC_GetItemInstallInfo(nPublishedFileID:SteamPublishedFileId; Var punSizeOnDisk:UInt64; pchFolder:Pointer; cchFolderSize:Cardinal; Var pbLegacyItem:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUGC_GetItemUpdateInfo(nPublishedFileID:SteamPublishedFileId; Var pbNeedsUpdate:Boolean; Var pbIsDownloading:Boolean; Var punBytesDownloaded:UInt64; Var punBytesTotal:UInt64):Boolean; CDecl; External SteamWrapperName;

// SteamUnifiedMessages
Function ISteamUnifiedMessages_SendMethod(pchServiceMethod:PAnsiChar; pRequestBuffer:PByte; unRequestBufferSize:Cardinal; unContext:UInt64):UInt64; CDecl; External SteamWrapperName;
Function ISteamUnifiedMessages_GetMethodResponseInfo(hHandle:SteamClientUnifiedMessageHandle; Var punResponseSize:Cardinal; Var peResult:SteamResult):Boolean; CDecl; External SteamWrapperName;
Function ISteamUnifiedMessages_GetMethodResponseData(hHandle:SteamClientUnifiedMessageHandle; pResponseBuffer:PByte; unResponseBufferSize:Cardinal; bAutoRelease:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUnifiedMessages_ReleaseMethod(hHandle:SteamClientUnifiedMessageHandle):Boolean; CDecl; External SteamWrapperName;
Function ISteamUnifiedMessages_SendNotification(pchServiceNotification:PAnsiChar; pNotificationBuffer:PByte; unNotificationBufferSize:Cardinal):Boolean; CDecl; External SteamWrapperName;

// SteamUser
Function ISteamUser_GetHSteamUser():Integer; CDecl; External SteamWrapperName;
Function ISteamUser_BLoggedOn():Boolean; CDecl; External SteamWrapperName;
Function ISteamUser_GetSteamID():UInt64; CDecl; External SteamWrapperName;
Function ISteamUser_InitiateGameConnection(pAuthBlob:PByte; cbMaxAuthBlob:Integer; steamIDGameServer:SteamID; unIPServer:Cardinal; usPortServer:Word; bSecure:Boolean):Integer; CDecl; External SteamWrapperName;
Procedure ISteamUser_TerminateGameConnection(unIPServer:Cardinal; usPortServer:Word); CDecl; External SteamWrapperName;
Procedure ISteamUser_TrackAppUsageEvent(gameID:SteamGameID; eAppUsageEvent:Integer; pchExtraInfo:PAnsiChar); CDecl; External SteamWrapperName;
Function ISteamUser_GetUserDataFolder(pchBuffer:Pointer; cubBuffer:Integer):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamUser_StartVoiceRecording(); CDecl; External SteamWrapperName;
Procedure ISteamUser_StopVoiceRecording(); CDecl; External SteamWrapperName;
Function ISteamUser_GetAvailableVoice(Var pcbCompressed:Cardinal; Var pcbUncompressed:Cardinal; nUncompressedVoiceDesiredSampleRate:Cardinal):SteamVoiceResult; CDecl; External SteamWrapperName;
Function ISteamUser_GetVoice(bWantCompressed:Boolean; pDestBuffer:PByte; cbDestBufferSize:Cardinal; Var nBytesWritten:Cardinal; bWantUncompressed:Boolean; pUncompressedDestBuffer:PByte; cbUncompressedDestBufferSize:Cardinal; Var nUncompressBytesWritten:Cardinal; nUncompressedVoiceDesiredSampleRate:Cardinal):SteamVoiceResult; CDecl; External SteamWrapperName;
Function ISteamUser_DecompressVoice(pCompressed:PByte; cbCompressed:Cardinal; pDestBuffer:PByte; cbDestBufferSize:Cardinal; Var nBytesWritten:Cardinal; nDesiredSampleRate:Cardinal):SteamVoiceResult; CDecl; External SteamWrapperName;
Function ISteamUser_GetVoiceOptimalSampleRate():Cardinal; CDecl; External SteamWrapperName;
Function ISteamUser_GetAuthSessionTicket(pTicket:PByte; cbMaxTicket:Integer; Var pcbTicket:Cardinal):Cardinal; CDecl; External SteamWrapperName;
Function ISteamUser_BeginAuthSession(pAuthTicket:PByte; cbAuthTicket:Integer; steamID:SteamID):SteamBeginAuthSessionResult; CDecl; External SteamWrapperName;
Procedure ISteamUser_EndAuthSession(steamID:SteamID); CDecl; External SteamWrapperName;
Procedure ISteamUser_CancelAuthTicket(hAuthTicket:SteamAuthTicketHandle); CDecl; External SteamWrapperName;
Function ISteamUser_UserHasLicenseForApp(steamID:SteamID; appID:SteamAppId):SteamUserHasLicenseForAppResult; CDecl; External SteamWrapperName;
Function ISteamUser_BIsBehindNAT():Boolean; CDecl; External SteamWrapperName;
Procedure ISteamUser_AdvertiseGame(steamIDGameServer:SteamID; unIPServer:Cardinal; usPortServer:Word); CDecl; External SteamWrapperName;
Function ISteamUser_RequestEncryptedAppTicket(pDataToInclude:PByte; cbDataToInclude:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamUser_GetEncryptedAppTicket(pTicket:PByte; cbMaxTicket:Integer; Var pcbTicket:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUser_GetGameBadgeLevel(nSeries:Integer; bFoil:Boolean):Integer; CDecl; External SteamWrapperName;
Function ISteamUser_GetPlayerSteamLevel():Integer; CDecl; External SteamWrapperName;

// SteamUserStats
Function ISteamUserStats_RequestCurrentStats():Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetStat(pchName:PAnsiChar; Var pData:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetStat_(pchName:PAnsiChar; Var pData:Single):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_SetStat(pchName:PAnsiChar; nData:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_SetStat_(pchName:PAnsiChar; fData:Single):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_UpdateAvgRateStat(pchName:PAnsiChar; flCountThisSession:Single; dSessionLength:double):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetAchievement(pchName:PAnsiChar; Var pbAchieved:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_SetAchievement(pchName:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_ClearAchievement(pchName:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetAchievementAndUnlockTime(pchName:PAnsiChar; Var pbAchieved:Boolean; Var punUnlockTime:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_StoreStats():Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetAchievementIcon(pchName:PAnsiChar):Integer; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetAchievementDisplayAttribute(pchName:PAnsiChar; pchKey:PAnsiChar):PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamUserStats_IndicateAchievementProgress(pchName:PAnsiChar; nCurProgress:Cardinal; nMaxProgress:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetNumAchievements():Cardinal; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetAchievementName(iAchievement:Cardinal):PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamUserStats_RequestUserStats(steamIDUser:SteamID):UInt64; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetUserStat(steamIDUser:SteamID; pchName:PAnsiChar; Var pData:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetUserStat_(steamIDUser:SteamID; pchName:PAnsiChar; Var pData:Single):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetUserAchievement(steamIDUser:SteamID; pchName:PAnsiChar; Var pbAchieved:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetUserAchievementAndUnlockTime(steamIDUser:SteamID; pchName:PAnsiChar; Var pbAchieved:Boolean; Var punUnlockTime:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_ResetAllStats(bAchievementsToo:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_FindOrCreateLeaderboard(pchLeaderboardName:PAnsiChar; eLeaderboardSortMethod:SteamLeaderboardSortMethod; eLeaderboardDisplayType:SteamLeaderboardDisplayType):UInt64; CDecl; External SteamWrapperName;
Function ISteamUserStats_FindLeaderboard(pchLeaderboardName:PAnsiChar):UInt64; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetLeaderboardName(hSteamLeaderboard:SteamLeaderboard):PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetLeaderboardEntryCount(hSteamLeaderboard:SteamLeaderboard):Integer; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetLeaderboardSortMethod(hSteamLeaderboard:SteamLeaderboard):SteamLeaderboardSortMethod; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetLeaderboardDisplayType(hSteamLeaderboard:SteamLeaderboard):SteamLeaderboardDisplayType; CDecl; External SteamWrapperName;
Function ISteamUserStats_DownloadLeaderboardEntries(hSteamLeaderboard:SteamLeaderboard; eLeaderboardDataRequest:SteamLeaderboardDataRequest; nRangeStart:Integer; nRangeEnd:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamUserStats_DownloadLeaderboardEntriesForUsers(hSteamLeaderboard:SteamLeaderboard; prgUsers:PSteamID; cUsers:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetDownloadedLeaderboardEntry(hSteamLeaderboardEntries:SteamLeaderboardEntries; index:Integer; Var pLeaderboardEntry:SteamLeaderboardEntry; pDetails:PInteger; cDetailsMax:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_UploadLeaderboardScore(hSteamLeaderboard:SteamLeaderboard; eLeaderboardUploadScoreMethod:SteamLeaderboardUploadScoreMethod; nScore:Integer; pScoreDetails:PInteger; cScoreDetailsCount:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamUserStats_AttachLeaderboardUGC(hSteamLeaderboard:SteamLeaderboard; hUGC:SteamUGCHandle):UInt64; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetNumberOfCurrentPlayers():UInt64; CDecl; External SteamWrapperName;
Function ISteamUserStats_RequestGlobalAchievementPercentages():UInt64; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetMostAchievedAchievementInfo(pchName:Pointer; unNameBufLen:Cardinal; Var pflPercent:Single; Var pbAchieved:Boolean):Integer; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetNextMostAchievedAchievementInfo(iIteratorPrevious:Integer; pchName:Pointer; unNameBufLen:Cardinal; Var pflPercent:Single; Var pbAchieved:Boolean):Integer; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetAchievementAchievedPercent(pchName:PAnsiChar; Var pflPercent:Single):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_RequestGlobalStats(nHistoryDays:Integer):UInt64; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetGlobalStat(pchStatName:PAnsiChar; Var pData:Int64):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetGlobalStat_(pchStatName:PAnsiChar; Var pData:double):Boolean; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetGlobalStatHistory(pchStatName:PAnsiChar; pData:PInt64; cubData:Cardinal):Integer; CDecl; External SteamWrapperName;
Function ISteamUserStats_GetGlobalStatHistory_(pchStatName:PAnsiChar; pData:Pdouble; cubData:Cardinal):Integer; CDecl; External SteamWrapperName;

// SteamUtils
Function ISteamUtils_GetSecondsSinceAppActive():Cardinal; CDecl; External SteamWrapperName;
Function ISteamUtils_GetSecondsSinceComputerActive():Cardinal; CDecl; External SteamWrapperName;
Function ISteamUtils_GetConnectedUniverse():SteamUniverse; CDecl; External SteamWrapperName;
Function ISteamUtils_GetServerRealTime():Cardinal; CDecl; External SteamWrapperName;
Function ISteamUtils_GetIPCountry():PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamUtils_GetImageSize(iImage:Integer; Var pnWidth:Cardinal; Var pnHeight:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_GetImageRGBA(iImage:Integer; pubDest:PByte; nDestBufferSize:Integer):Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_GetCSERIPPort(Var unIP:Cardinal; Var usPort:Word):Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_GetCurrentBatteryPower():Byte; CDecl; External SteamWrapperName;
Function ISteamUtils_GetAppID():Cardinal; CDecl; External SteamWrapperName;
Procedure ISteamUtils_SetOverlayNotificationPosition(eNotificationPosition:SteamNotificationPosition); CDecl; External SteamWrapperName;
Function ISteamUtils_IsAPICallCompleted(hSteamAPICall:SteamAPICall; Var pbFailed:Boolean):Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_GetAPICallFailureReason(hSteamAPICall:SteamAPICall):SteamAPICallFailure; CDecl; External SteamWrapperName;
Function ISteamUtils_GetAPICallResult(hSteamAPICall:SteamAPICall; pCallback:Pointer; cubCallback:Integer; iCallbackExpected:Integer; Var pbFailed:Boolean):Boolean; CDecl; External SteamWrapperName;
Procedure ISteamUtils_RunFrame(); CDecl; External SteamWrapperName;
Function ISteamUtils_GetIPCCallCount():Cardinal; CDecl; External SteamWrapperName;
Procedure ISteamUtils_SetWarningMessageHook(pFunction:SteamAPIWarningMessageHook); CDecl; External SteamWrapperName;
Function ISteamUtils_IsOverlayEnabled():Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_BOverlayNeedsPresent():Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_ShowGamepadTextInput(eInputMode:SteamGamepadTextInputMode; eLineInputMode:SteamGamepadTextInputLineMode; pchDescription:PAnsiChar; unCharMax:Cardinal; pchExistingText:PAnsiChar):Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_GetEnteredGamepadTextLength():Cardinal; CDecl; External SteamWrapperName;
Function ISteamUtils_GetEnteredGamepadTextInput(pchText:Pointer; cchText:Cardinal):Boolean; CDecl; External SteamWrapperName;
Function ISteamUtils_GetSteamUILanguage():PAnsiChar; CDecl; External SteamWrapperName;
Function ISteamUtils_IsSteamRunningInVR():Boolean; CDecl; External SteamWrapperName;


Implementation


End.
