# Class-NewCandle | MQL
This class will allow you to detect a new candle in multiple timeframes and assets.

## Features
1. Detect a new candle in multiple timeframes and assets.

## Usage
1. Declare an instance of the class using:
```cpp
CNewCandleEvent newCandle(PERIOD_M1);
```
2. Use the class method on an if cycle to detect a new candle:
```cpp
if(newCandle.NewCandleEvent())
{
    //--- Do something
}
```

## Code Example
_What does this code do?_
This code will detect a new candle in the M1 timeframe and send an alert.

**Requirement Setup**
1. None

```cpp
//--- Code Example
#include <../JustUp-MQL-Framework/Main.mqh>

//Variables & Definitions
CNewCandleEvent newCandle(PERIOD_M1);

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
    if(newCandle.NewCandleEvent())
    {
        Alert("New Candle");
    }
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