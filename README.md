moon
=====
A suite of core and expanded Delphi libraries that include utility classes.

Precompile Instructions:
MN_DEBUG
MN_CHINESE
MN_NODIALOG
MN_UNITTEST

UnitTest Project: ;MN_DEBUG;MN_NODIALOG;MN_UNITTEST
English Project: MN_DEBUG
Chinese Project: MN_DEBUG;MN_CHINESE

How to install:
1. Menu -> Tools -> Options -> Environment Options -> Delphi Options -> Library-Win32. Add these to Library path:
	{Moon Path}\src\Moon_Utilities\
	{Moon Path}\src\Moon_Components\
2. Open .bds/Moon.bdsgroup in Delphi.
3. Build Moon_Utilities.bpl. Install Moon_Utilities.bpl.
4. Build Moon_Components.bpl. Install Moon_Components.bpl.
5. Build Moon_IOTA.bpl. Install Moon_IOTA.bpl.
