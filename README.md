# JustUp-MQL-Framework
The official Just Up Corporation's framework for Metaquotes Language 4 &amp; 5.

### Wiki
USAGE:
1. Download/Clone the repository into your MQL4/5 main folder
2. Use #include <../JustUp-MQL-Framework/Main.mqh>

If you are using it in an expert advisor...
3. Call FrameworkInit() in your OnInit() function.
4. Call FrameworkDeInit() in your OnDeInit() function.
5. Call FrameworkOnTick() in your OnTick() function.

It is all set-up. You just need to go to the constant files to adjust the "Internal Framework Settings" variables if you want to modify something.
Please, do not modify any file of the framework except for the setting section if you don't understand completely what are you doing.

See the full wiki at 
https://just-up.notion.site/Just-Up-MQL-Framework-s-Wiki-1f132afd096041b09f4b5b31f2b24b52

### Credits
Main Programmer - Jonathan Fernandez, CEO
Collaborator (s):
- N/A

Other public libraries were included into this framework, all the credits will be listed below:
- N/A

## Colaborate
If you want to collaborate with the project feel free to contact me at 
jonathanfernandezoficial@outlook.com

## Known Bugs
No known bugs at this moment. 
If you have found a bug, or fixed a bug and want to share it and include it to the repository, please, feel free to contact me at
jonathanfernandezoficial@outlook.com

## New Update Expected
No current date has been set.
### New Libraries to Incorporate
- .Set Files reading for real-time EA settings change

### New Changes in current Libraries
- No changes in process

## Changes Log
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