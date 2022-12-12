# Class-LogsFile | MQL
This class will help you make logs files with a predefined format.
It depends on the class CFiles.

## Features
1. Create a log file with a predefined format.
2. Write a message to the log file.

## Usage
1. Declare an instance of the class using:
```cpp
CLogsFile myLogsFile("MyLogsFile.txt","",false);
```
2. Place the function below on the OnInit() function:
```cpp
myLogsFile.LogsInit();
```
3. Place the function below on the OnDeinit() function:
```cpp
myLogsFile.LogsDeInit();
```
4. Use the function below to write a message to the log file:
```cpp
myLogsFile.Add("Title", "Message", "function of the message");
```

## Code Example
_What does this code do?_
This code will make a log file with the name "MyLogsFile.txt" and will write a message to it.
The message will be written each 60 seconds using the sleep function.

**Requirement Setup**
1. None

```cpp
//--- Code Example
#include <../JustUp-MQL-Framework/Main.mqh>

//Variables & Definitions
CLogsFile myLogsFile("MyLogsFile.txt","",false);

int OnInit()
{
    FrameworkInit();
    //---
    myLogsFile.LogsInit();
    return INIT_SUCCEEDED;
}

void OnTick()
{
    FrameworkOnTick();
    //---
    myLogsFile.Add("LOG", "New Message added", "from OnTick() function");
    Sleep(60000);
}

void OnDeinit(const int reason)
{
    FrameworkDeInit();
    //---
    myLogsFile.LogsDeInit();
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