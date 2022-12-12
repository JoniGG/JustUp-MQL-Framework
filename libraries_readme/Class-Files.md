# Class-Files | MQL
This library will help you to handle files on a very easy way.

## Features
1. Create a file.
2. Write a message to the file.
3. Delete a file.
4. Add a single line to the file.
5. Add multiple lines to the file.
6. Replace a single line in the file.
7. Replace multiple lines in the file.
8. Check if the file is empty.
9. Read the first line of the file.
10. Read any line of the file.
11. Delete a single line in the file.
12. Get the number of lines in the file.
13. Move a file to another directory.
14. Get the specific line based on a string value given.

## Usage
1. Declare an instance of the class using:
```cpp
CFiles myFile("MyFile.txt","path/",FILE_TYPE_TEXT, false);
```
```
2. Use the function below to create a file:
```cpp
myFile.Create("My initial body");
```
3. Use the function below to delete a file:
```cpp
myFile.Delete();
```
4. Use the function below to add a line at the end of the file:
```cpp
myFile.AddLine("My new line");
```
5. Use the function below to replace the whole body of the file for "":
```cpp
myFile.ReplaceBody("");
```
6. Use the function below to replace a single line in the file:
```cpp
myFile.ReplaceLine(1, "My new line");
```
7. Use the function below to check if the file is empty:
```cpp
if(myFile.IsEmpty())
{
    //--- Do something
}
```
8. Use the function below to read the first line of the file:
```cpp
string firstLine = myFile.ReadFirstLine();
```
9. Use the function below to read any line of the file:
```cpp
string anyLine = myFile.ReadLine(1);
```
10. Use the function below to delete a single line in the file:
```cpp
myFile.DeleteLine(1);
```
11. Use the function below to get the specific line position based on a string value given:
```cpp
int linePosition = myFile.GetLinePosition("My new line");
```
12. Use the function below to get the name of the file:
```cpp
string fileName = myFile.GetFileName();
```
13. Use the function below to get the path of the file:
```cpp
string filePath = myFile.GetFilePath();
```
14. Use the function below to get the file type as ENUM_FILE_TYPE:
```cpp
ENUM_FILE_TYPE fileType = myFile.GetENUM_FILE_TYPE();
```
15. Use the function below to get true if the file is in the common folder:
```cpp
bool isCommon = myFile.IsCommon();
```
16. Use the function below to get the file extension as string:
```cpp
string fileExtension = myFile.GetFileExtension();
```
17. Use the function below to move the file to the new path:
```cpp
myFile.Move("New Name of the file", "New path of the file", inCommon = false);
```

## Code Example
_What does this code do?_
It will use the Files library to do a number of things listed below:

1. Create a file called "MyFile.txt" in the folder "MyFiles" inside the "Files" folder in the local path.
2. It will add the initial text "My initial body" to the file.
3. It will add a new line to the file with the text "My new line".
4. It will replace the line 1 with the text "My old line".
5. It will delete the line 2.
6. It will move the file to the folder "MyFiles_new" inside the "Files" folder in the local path.
7. It will add a new line to the file with the text "Text to find", and will return the line position of the text.
8. It will clear the file.
9. It will verify if the file is empty.
10. It will print the full path of the file.
11. It will delete the file.

All of this with 10 seconds between each action in order to give you time to see the results.

**Requirement Setup**
1. None

```cpp
//--- Code Example
#include <../JustUp-MQL-Framework/Main.mqh>

//Variables & Definitions
CFiles myFile("MyFile.txt","MyFiles/",FILE_TYPE_TEXT, false);

int OnInit()
{
    FrameworkInit();
    //---
    myFile.Create("My initial body");
    return INIT_SUCCEEDED;
}

void OnTick()
{
    myFile.AddLine("My new line");
    Print("Line Added");
    Sleep(10000);
    myFile.ReplaceLine(1, "My old line");
    Print("Line Replaced");
    Sleep(10000);
    myFile.DeleteLine(2);
    Print("Line Deleted");
    Sleep(10000);
    myFile.Move("MyFile.txt", "MyFiles_new/", false);
    Print("File Moved");
    Sleep(10000);
    myFile.AddLine("Text to find");
    Print("Line Added");
    int linePosition = myFile.GetLinePosition("Text to find");
    Print("Line position: ", linePosition);
    Sleep(10000);
    myFile.ReplaceBody("");
    Print("File Cleared");
    Sleep(10000);
    if(myFile.IsEmpty())
    {
        Print("The file is empty");
    }
    Sleep(10000);
    Print("Full path: ", myFile.GetFilePath() + myFile.GetFileName() + myFile.GetFileExtension());
    Sleep(10000);
    myFile.Delete();
    Print("File Deleted");
    //---
    ExpertRemove();
    FrameworkOnTick();
    //---
}

void OnDeinit(const int reason)
{
    FrameworkDeInit();
    //---
}

void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
    FrameworkOnChart();
    //--- 
  }

//--- End of the program
```

## Known Bugs
_No bugs known_

## Attachs
<img src="Link">