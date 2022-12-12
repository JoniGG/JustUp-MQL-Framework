<body>
    <p align="center"><a href="https://symfony.com" target="_blank">
        <img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/a405bc87-58fc-471b-8a07-f1ad1fb1fb52/Aadir_un_poco_de_texto.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20221211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20221211T182935Z&X-Amz-Expires=86400&X-Amz-Signature=6f9a25b5edace6250eeaa4d9de75b7abe55a2caa87cfadff9cd2b1c2da32d348&X-Amz-SignedHeaders=host&response-content-disposition=filename%3D%22A%25C3%25B1adir%2520un%2520poco%2520de%2520texto.png%22&x-id=GetObject">
    </a></p>


# JustUp-MQL-Framework
The official Just Up Corporation's framework for Metaquotes Language 4 &amp; 5.

# Wiki
See the full wiki at [Github](https://www.github.com/justupcorp/JustUp-MQL-Framework/wiki) for getting a deep undertanding of how to use it.

## Libraries List <br>
Below will be listed all the libraries list and a short description of what does them do. <br>
### Classes <br>
Here are the libraries that have multiple methods and which code is based on the class sintax. <br>
- CDiscord - Allows sending message to discord.
- CFiles - Allows handling files very easy.
- CLogsFile - Allow handling logs files with pre-defined structures.
- CNewCandle - Allows handling the new candle event
- CScreenshot - Allows handling the chart screenshot task
- CTelegram - Allows sending message to a telegram channel.

### Dictionaries <br>
Here are the libraries that allow you to get an string value from another value given in other type of variable. <br>
- Alphabet - Allows working with the characters position within the english alphabet
- Error Descriptions - Return the description from a given error code/definition
- Time Related: Dictionary that works with the library with the same name on the enumerators.

### Enumerators <br>
Here are the libraries that contains enumerators. Very useful to use on the *input* or *extern* variable for a better user friendly setup. <br>
- Time Related: A library that makes more user-friendly the extern/input variables related to time.
- File Type: An enumerator with supported time files.

### Functions <br>
Here are the functions that are by itself, with no relation to other functions. A function per library.<br>
- getLot() - Return the lot size based on a given risk and stop loss distance in pip

### Packages <br>
Here are the libraries that contains function packages. Are functions that have a relation between them but without a class syntax. <br>
- Compare Vars: It is a library that have multiple functions for comparing variables & arrays of the same type
- Daylight Savings: It is a package to manage the day light saving times in New York and London.
- Statistics: It is a package with multiple statistic math functions inside.
- Mql4InMql5: It is a package that allow using the same functions in MQL5 as you do in MQL4.

### Structures <br>
Here are the libraries that contain structures. In this framework we will be using structure where there's not methods in it, just variables. If there's a method, excluding the constructor & destructor, then we will make it a class for a better coding experience. <br>
- DateTime: It extends the built-in MqlDateTime structures.

## Credits <br>
Main Programmer - Jonathan Fernandez, CEO <br>
Collaborator (s): <br>
- N/A

Other public libraries were included into this framework, all the credits will be listed below: <br>
- @szagar in [GitHub](https://github.com/szagar) <br>
- @eromawyn in [GitHub](https://github.com/eromawyn) <br>

## Colaborate <br>
If you want to collaborate with the project feel free to contact me at  <br>
framework@justup.us <br>

If you want to **Push** a file to the repository, please use the open *branch* called **Open**. <br>
All the files pushed to that branch will be reviewed, origanized, and pushed to the **main branch** by me after testing them. <br>

So I do recommend to pull from the *main branch* and push to the *open brach*. <br>

## Coding in progress
Libraries that will be added soon!

### New Libraries to Incorporate <br>
- Candlestick Patterns class (2, 3, & 4 candles patterns divided with a class or structure). It will include alerts, and notifications. <br>
- Position Management Class with hedging, grid, and multi-positions supports <br>
- Logs on chart <br>
- The new files libraries to handle the other files types <br>

### New Changes in current Libraries <br>
- No changes in process <br>
- Fix the bugs in the screenshot & new candle libraries <br>

## Changes Log <br>
### Version 1.0.3 <br>
1. Added the library Print Extended. It is a library that allows you to use the function Print() with more options. <br>
2. The library CFiles has been deleted.
3. Added the library TextFiles to handle text files. All the bugs related to the old CFiles library were changed. <br>
However, this library won't be included in the includer commands until the next major update 2.0.0. to avoid conflicts with the first pre-release. <br>
But, the file is already included in the repository, so you can added manually by uncommenting the line in the includer file in the common folder. <br>

### Version 1.0.2 <br>
Same libraries but a most structured folders and files <br>

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
