# Library Name | Language: MQL(4&5)
_Explanation of what it is..._

## Features
1. Feature 1.

## Usage
1. Declare an instance of the class using:
```cpp
C---
```
2. ...

## Code Example
_What does this code do?_
...

**Requirement Setup**
1. None

```cpp
//--- Code Example
#include <../JustUp-MQL-Framework/Main.mqh>

//Variables & Definitions

int OnInit()
{
    FrameworkInit();
    //---
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