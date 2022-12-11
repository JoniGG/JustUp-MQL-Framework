# JustUp-MQL-Framework
The official Just Up Corporation's framework for Metaquotes Language 4 &amp; 5.

### Wiki
USAGE:
1. Download/Clone the repository into your MQL4/5 main folder
2. Use #include <../JustUp-MQL-Framework/Main.mqh>

If you are using it in an expert advisor...
1. Call FrameworkInit() in your OnInit() function.
2. Call FrameworkDeInit() in your OnDeInit() function.
3. Call FrameworkOnTick() in your OnTick() function.

It is all set-up. You just need to go to the constant files to adjust the "Internal Framework Settings" variables if you want to modify something.
Please, do not modify any file of the framework except for the setting section if you don't understand completely what are you doing.

See the full wiki at 
https://just-up.notion.site/Just-Up-MQL-Framework-s-Wiki-1f132afd096041b09f4b5b31f2b24b52

### Credits
Main Programmer - Jonathan Fernandez, CEO
Collaborator (s):
- N/A

Other public libraries were included into this framework, all the credits will be listed below:
- @szagar in GitHub
    - DateTime Structure Library
    - Some functions for the FunctionPkg Library
- @eromawyn in GitHub
    - Mql4InMql5 Package

## Colaborate
If you want to collaborate with the project feel free to contact me at
framework@justup.us

## Known Bugs
No known bugs at this moment. 
If you have found a bug, or fixed a bug and want to share it and include it to the repository, please, feel free to contact me at
framework@justup.us

## New Update Expected
No current date has been set.
### New Libraries to Incorporate
- Candlestick Patterns class (2, 3, & 4 candles patterns divided with a class or structure). It will include alerts, and notifications.
- Position Management Class with hedging, grid, and multi-positions supports
- Add the timeframe enumerator and dictionay

### New Changes in current Libraries
- No changes in process

## Changes Log
### Version 1.02
1. Constant File improvement
2. Initialization & Deinitialization of the framework has been improved
3. Upgrade of the FunctionPkg Library. See the list below:
    - IsLondonDLS() added. It is a function that return true if we're in the London Daylight Saving time. Supports from 2000 to 2029.
    - IsNewYorkDLS() added. It is a function that return true if we're in the New York Daylight Saving time. Supports from 2000 to 2029.
    - GetErrorDescription() added. Return the error description from a given error code.
    - RGB() added. Make a color from rgb
    - CompareDoubles() added. Compares 2 doubles with a very good precision.
    - MathHope() added. Calculates the Mathematical Hope

4. Added the library Screenshot Class: It helps to take a chart screenshot and manage the last screenshot taken
5. DateTime Structure added. This is an extension of the MqlDateTime structure made by @szagar in GitHub
6. Added the Enumerators Library. It is a set of enumerators ready to be used. It Includes:
    - Hour
    - Day
    - Month
    - Weekday

7. Added Dictionaries Library. It is a set of dictionaries ready to be used. It supports the enumerators format. It includes:
    - HourToString()
    - DayToString()
    - MonthToString()
    - WeekdayToString()
    - GetCharPos() added. It is a function that returns the position of a given character within the english alphabet.
    - GetCharFromPos() added. It is a function that returns the character in a given position within the english alphabet.

8. Mql4InMql5 Package added. This is a package that allows to code with the mql4 style in mql5. Made by @eromawyn in GitHub.


### Version 1.01
1. The FilesClass library has been modified. The following changes were made:
    - Added the function ReadLine() for reading an specific line instead of the first line only
    - Added the function ReplaceLine() for replacing an specific line with a new argument
    - Added the function DeleteLine() for deleting a single line content
    - Added the function GetLineNum() for returning the line number where is an specific value
    - Added the function GetFileName() for returning the file name (i.e MyFile.txt)
    - Added the function GetFilePath() for returning the file path
    - Added the function GetFileType() for returning the file type in the enum format
    - Added the function IsCommon() for returning true or false if is in the common folder or not
    - Added the function GetFileExtension() for returning the file extension in the string format
    - Added the function MoveFile() for moving the file to another folder

### Version 1.00
1. The following list of libraries were added:
    - DiscordClass: Helps sending messages and chart screenshot to a discord channel
    - TelegramClass: Helps sending message and files to a Telegram Channel
    - FilesClass: Helps handling all the tasks with a file
    - LogsFileClass: Helps logging some logs into a file with a predefined format
    - NewCandleClass:  Handles the event of a new candle in multiple timeframes
    - FunctionsPkg: A package will multiple functions. The function added on this version is:
        - CalculateLotSize(): Returns the lot size for an specific position
2. The initial files and some internal constants and settings were generated
