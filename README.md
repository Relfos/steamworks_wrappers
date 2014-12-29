Steamworks Wrappers
================

Steamworks API wrappers for various languages:

* C
* Delphi
* Java

Based on the [Steamworks.NET](https://github.com/rlabrecque/Steamworks.NET) wrapper done by [Riley Labrecque](https://github.com/rlabrecque)

* License: [MIT](http://www.opensource.org/licenses/mit-license.php)  

Notes
-----

You will need the compiled libraries (dll, so or dylib) for the wrapper.  
For convenience I'm providing here the pre-compiled binaries, in the bin folder.  
For instructions how to compile them yourself check the [Steamworks.NET](https://github.com/rlabrecque/Steamworks.NET) repository.  

Adding new languages
-----

If you want to make bindings for other languages you'll need a Object Pascal compiler (eg: [FPC](http://www.freepascal.org).
Check out the test_demo program that shows how to walk through all Steamworks structs/enums/consts/functions.
From them, you have to output the declarations you need for your language, converting the types to your language equivalents, etc.
For a more complex example, check the gen_delphi_steam_unit program.

TODO
---------------------------------

* Add C headers  
* Add Java headers and JNI wrapper.  
