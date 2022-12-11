<body>
    <p align="center"><a href="https://symfony.com" target="_blank">
        <img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/a405bc87-58fc-471b-8a07-f1ad1fb1fb52/Aadir_un_poco_de_texto.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20221211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20221211T182935Z&X-Amz-Expires=86400&X-Amz-Signature=6f9a25b5edace6250eeaa4d9de75b7abe55a2caa87cfadff9cd2b1c2da32d348&X-Amz-SignedHeaders=host&response-content-disposition=filename%3D%22A%25C3%25B1adir%2520un%2520poco%2520de%2520texto.png%22&x-id=GetObject">
    </a></p>


# JustUp-MQL-Framework
The official Just Up Corporation's framework for Metaquotes Language 4 &amp; 5.

# Wiki
USAGE:
1. Download/Clone the repository into your MQL4/5 main folder
2. Use #include <../JustUp-MQL-Framework/Main.mqh>

If you are using it in an expert advisor...
1. Call FrameworkInit() in your OnInit() function.
2. Call FrameworkDeInit() in your OnDeInit() function.
3. Call FrameworkOnTick() in your OnTick() function.
4. Call FrameworkOnChart() in your OnChartEvent() function.

If you are using it in a script...
1. Call FrameworkStart() at the beginning of your OnStart() function.
2. Call FrameworkStop() at the end of your OnStart() function.

It is all set-up. You just need to adjust the settings of the framework as you want it.
All the settings are found in the path *internal/settings.mqh*.
To make a change just adjust the definition value as you like.

All the libraries will have a full wiki and usage examples in the path *libraries_readme/library_name.md*

*The full wiki in the github repository will be launched soon!*

## Libraries List <br>
Below will be listed all the libraries list and a short description of what does them do. <br>
### Classes <br>
Here are the libraries that have multiple methods and which code is based on the class sintax. <br>
- CDiscord - Allow sending message to discord.

### Dictionaries <br>
Here are the libraries that allow you to get an string value from another value given in other type of variable. <br>
- None

### Enumerators <br>
Here are the libraries that contains enumerators. Very useful to use on the *input* or *extern* variable for a better user friendly setup. <br>
- None

### Functions <br>
Here are the functions that are by itself, with no relation to other functions. A function per library.<br>
- None

### Packages <br>
Here are the libraries that contains function packages. Are functions that have a relation between them but without a class syntax. <br>
- None

### Structures <br>
Here are the libraries that contain structures. In this framework we will be using structure where there's not methods in it, just variables. If there's a method, excluding the constructor & destructor, then we will make it a class for a better coding experience. <br>
- None

## Understanding Naming <br>
Here will be a description of how I structured the naming in my code. <br>

### Classes & Structures <br>

All classes will start with the letter "C". I.e. if I have a class called "Candles", it will be coded under the name "CCandles". <br>
In the other side, all the structure will start with the letter "S". I.e. if I have an structure called "Price" it'll be coded under the name "SPrice" <br>

*Private Class Variables & Methods* <br>
These will start with the letter "m" and the character "_" at the beginning, following then the external naming structure. <br>
I.e. <br>
The internal class variable of "nameOfDoctor" will be "m_nameOfDoctor" <br>
The internal class method of "GetSomething()" will be "m_GetSomething" <br>

These applies also to the private structure's variables. <br>

### Dictionaries & Functions <br>
These will be camel cased, so the first letter of each word of the name will be capitalized. <br>
I.e. If I have a function with name "Get My Name", it will be coded under the name "GetMyName()" <br>
The same applies to dictionaries due that are functions but with the intention of return a string variable as result of a conversion. <br>

### Enumerators <br>
These will start with the word "ENUM", then a "_", and followed by the name capitalized. Every new word will be divided by "_". <br>
I.e. If I have an enumerator with the name "Days of the Month", it will be coded under the name "ENUM_DAYS_OF_MONTH". <br>

### Variables & Definitions <br>
All the variables will start with a lower-case letter and every new word will start with a capitalized letter. <br>
I.e. I will name a variable called "My Trades Logs" with the name "myTradesLogs". <br>

In the other side, all the definitions will be named with all the letters capitalized and divided by "_". <br>
I.e. On a definition called "My Definition" I will use MY_DEFINITION. <br>

The constants will have the initial letter "c" for be different to the regular variable that you can modify. <br>
I.e. The constant variable with name "pi" will be declared as "cPi". <br>

### Internal Structure <br>
The Internal Structure will be different in order to avoid you to use an internal made function or variable in an external mode. <br>
Also these will be private & protected, so you won't be able to call them by accident. <br>
It will have the characters "i_" using the same naming structure, except for the internal definition which will start and end with the character "_". <br>
I.e. <br>
*Internal Version*          |   *External Version* <br>
_FRAMEWORK_NAME_            |   FRAMEWORK_INIT_SUCCEED <br>
i_myVariable                |   myVariable <br>
i_MyFunction()              |   MyFunction() <br>
i_CMyClass                  |   CMyClass <br>
i_SMyStructure              |   SMyStructure <br>
i_ENUM_MY_ENUMERATOR        |   ENUM_MY_ENUMERATOR <br>
i_MyDictionary()            |   MyDictionary() <br>

## Credits <br>
Main Programmer - Jonathan Fernandez, CEO <br>
Collaborator (s): <br>
- N/A

Other public libraries were included into this framework, all the credits will be listed below: <br>
- @szagar in GitHub <br>
    - DateTime Structure Library
    - Some functions for the FunctionPkg Library
- @eromawyn in GitHub <br>
    - Mql4InMql5 Package

## Colaborate <br>
If you want to collaborate with the project feel free to contact me at  <br>
framework@justup.us <br>

If you want to **Push** a file to the repository, please use the open *branch* called **Open**. <br>
All the files pushed to that branch will be reviewed, origanized, and pushed to the **main branch** by me after testing them. <br>

So I do recommend to pull from the *main branch* and push to the *open brach*. <br>

## Known Bugs <br>
No known bugs at this moment. <br>
If you have found a bug, or fixed a bug and want to share it and include it to the repository, please, feel free to contact me at <br>
framework@justup.us or just open an issue at GitHub. <br>

## New Updates Expected <br>
No current date has been set. <br>

### Working with Versions & Releases <br>
The version will be structured by x.y.z. <br>
- An increment in "z" is just a patch for a bug that maybe can modify how the framework work but do not include any new feature or library. Just a bug fix. This version will be compatible with the prior versions with the same "x.y" number. <br>
- An increment of "y" will be a new update which can include or not patch for any bugs, but will include new features and/or libraries. These are compatible with prior "x" versions. <br>
- An increment of "x" will be a new major update which include new features, libraries, patchs, and code structure. This version are not compatible with any prior "x.y.z" version number. <br>

The releases will be made only on a minor & major update (x & y). Only will be made if the repository in that specific version has been tested and it is a stable version. <br>
However, this does not guarantee that will not be any bug. All the known bugs at the release will be listed at the end of the document, and can be any unknown bug to be fixed on next "y" or "z" updates. <br>

A normal update with a release could mean that the library incorporated has not been tested yet, or not deeply tested and can have fatal errors on it. <br>

### New Libraries to Incorporate <br>
- Candlestick Patterns class (2, 3, & 4 candles patterns divided with a class or structure). It will include alerts, and notifications. <br>
- Position Management Class with hedging, grid, and multi-positions supports <br>

### New Changes in current Libraries <br>
- No changes in process <br>

## Changes Log <br>
### Version 1.0.0 <br>
*Work in progress...* <br>

### Version 0.2.0
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


### Version 0.1.0
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

### Version 0.0.1
1. The following list of libraries were added:
    - DiscordClass: Helps sending messages and chart screenshot to a discord channel
    - TelegramClass: Helps sending message and files to a Telegram Channel
    - FilesClass: Helps handling all the tasks with a file
    - LogsFileClass: Helps logging some logs into a file with a predefined format
    - NewCandleClass:  Handles the event of a new candle in multiple timeframes
    - FunctionsPkg: A package will multiple functions. The function added on this version is:
        - CalculateLotSize(): Returns the lot size for an specific position
2. The initial files and some internal constants and settings were generated
