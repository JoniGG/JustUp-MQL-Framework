# Class-TextFiles | MQL
This library will help you to handle text files in a very easy way.

## Features
1. Create a text file
2. Delete a text file
3. Add a line at the end of the file
4. Replace the whole body of the file for ""
5. Replace a single line in the file
6. Read an specific line of the file
7. Count the number of lines in the file
8. Get the line number where is an specific value
9. Rename a file
10. Move a file to another folder

## Usage
1. Declare an instance of the class using:
```cpp
CTextFiles myFile("MyFile.txt","path/", inCommonFolder);
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
myFile.AddText("My new line");
```
5. Use the function below to read any line of the file:
```cpp
string anyLine = myFile.ReadLine(1);
```
6. Use the function below to delete a single line in the file:
```cpp
myFile.DeleteLine(1);
```
7. Use the function below to get the specific line position based on a string value given:
```cpp
int linePosition = myFile.GetLinePosition("My new line");
```
8. Use the function below to get the name of the file:
```cpp
string fileName = myFile.GetFileName();
```
9. Use the function below to get the path of the file:
```cpp
string filePath = myFile.GetFilePath();
```
10. Use the function below to get true if the file is in the common folder:
```cpp
bool isCommon = myFile.IsCommon();
```
11. Use the function below to get the file extension as string:
```cpp
string fileExtension = myFile.GetFileExtension();
```
12. Use the function below to move the file to the new path:
```cpp
myFile.Move("New Path/", bool DeleteFolder?);
```
13. Use the function below to get the full path:
```cpp
myFile.GetFullPath();
```
14. Use the function below to rename the file:
```cpp
myFile.Rename("New Name");
```
15. Use the function below to read the first line of the file:
```cpp
myFile.Read("New Name");
```

## Code Example
_What does this code do?_
It will use the Files library to do a number of things listed below:

1. Create a file called "MyFile.txt" in the folder "MyFiles" inside the "Files" folder in the local path.
2. The file

All of this with 10 seconds between each action in order to give you time to see the results.

**Requirement Setup**
1. None

```cpp
//--- Code Example
#include <../JustUp-MQL-Framework/Main.mqh>

//Variables & Definitions
CTextFiles myFile("MyFile","MyFiles/", false);

int OnInit()
{
    FrameworkInit();
    //---
    myFile.Create("My initial body");
    return INIT_SUCCEEDED;
}

void OnTick()
{
    myFile.AddText("My new line");
    Print("New line added");
    Sleep(10000);

    myFile.DeleteLine(1);
    Print("Line #1 deleted");
    Sleep(10000);

    Print("Reading the line #1: " + myFile.ReadLine(1));
    int linePosition = myFile.GetLinePosition("My new line");
    Print("Test found in the number #" + linePosition);
    Sleep(1000);
    Print("File Name: ", myFile.GetFileName());
    Sleep(1000);
    Print("File Path: ", myFile.GetFilePath());
    Sleep(1000);
    Print("Is Common: ", myFile.IsCommon());
    Sleep(1000);
    Print("File Extension: ", myFile.GetFileExtension());
    Sleep(10000);

    myFile.Move("New Path/", false);
    Print("Full Path: ", myFile.GetFullPath());
    Sleep(10000);

    myFile.Rename("New Name");
    Print("File renamed to: ", myFile.GetFileName());
    Sleep(10000);
    
    myFile.Delete();
    Print("File deleted");
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