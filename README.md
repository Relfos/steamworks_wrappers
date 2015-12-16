Steamworks Wrappers
================

Steamworks API wrappers for Delphi / Object Pascal:

Based on the [Steamworks.NET](https://github.com/rlabrecque/Steamworks.NET) wrapper done by [Riley Labrecque](https://github.com/rlabrecque)

* License: [MIT](http://www.opensource.org/licenses/mit-license.php)  

Installation / Notes
-----

If you just want to add Steamworks support to your project, you will just need the files in the "headers" folder.
You will also need the compiled libraries (dll, so or dylib) for the wrapper.  
For convenience I'm providing here the pre-compiled binaries, in the bin folder.  
For instructions how to compile them yourself check the [Steamworks.NET](https://github.com/rlabrecque/Steamworks.NET) repository.  

Usage
-----
After you installed the Delphi units and setup the compiler paths in Delphi, Lazarus or FPC, just include the SteamManager unit in your game code, along with a appid.txt in the folder with the main .exe
Be sure to call the SteamManager.Update() method once every frame, or stuff like achievments / stats won't work.


Adding new languages
-----

While I'm currently providing only a wrapper for Delphi/Object Pascal, if you want to make bindings for other languages with the included binding generator it is possible, but you'll need a Object Pascal compiler (eg: [FPC](http://www.freepascal.org)).  
Check out the test_demo program that shows how to walk through all Steamworks structs/enums/consts/functions.  
From them, you have to output the declarations you need for your language, converting the types to your language equivalents, etc.  
For a more complex example, check the gen_delphi_steam_unit program.  
