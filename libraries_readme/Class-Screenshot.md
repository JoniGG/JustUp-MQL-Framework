# Class-Screenshot | MQL
Handler for screenshots.

## Features
1. Make screenshots of the chart.
2. Manage the last screenshot taken.

## Usage
1. Declare an instance of the class using:
```cpp
CScreenshot screenshot(ChartID, "Name", "Path/", "String mode", multiplierOfResolution); //All are in default so you can skip them.
```
The modes are:
    - "21:9"
    - "16:9"
    - "4:3"

2. Take a screenshot using:
```cpp
screenshot.Take();
```
3. Get the last screenshot taken's full path using:
```cpp
screenshot.GetLastScreenshotFullPath();
```
4. Get the last screenshot taken's name using:
```cpp
screenshot.GetLastScreenshotName();
```
5. Get the last screenshot taken's path using:
```cpp
screenshot.GetLastScreenshotPath();
```

## Code Example
_What does this code do?_
This code will take 2 screenshots and print the last one's full path.

**Requirement Setup**
1. None

```cpp
//--- Code Example
#include <../JustUp-MQL-Framework/Main.mqh>

//Variables & Definitions
CScreenshot ss;

int OnInit()
{
    FrameworkInit();
    //---
    ss.Take();
    ss.Take();
    Print(ss.GetLastScreenshotFullPath());
    return INIT_SUCCEEDED;
}

void OnTick()
{
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