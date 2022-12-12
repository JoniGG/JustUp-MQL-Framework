# Class-Discord | Language: MQL(4&5)
This libraries allows you to send a message and a chart screenshot to a discord channel.
It can be useful for bots and/or indicators that need to send signals, logs, or messages 
to a discord community.

## Features
1. Send a discord embeded message.
2. Send a chart screenshot to discord. The chart must be open on the given symbol and timeframe. Failing on this will result on a screenshot of the `ChartID() = 0`

## Usage
1. Declare an instance of the class using:
```cpp
CDiscord myDiscord("My webhook here!");
```
2. Add the website `https://discord.com` to your trusted web addresses on your metatrader settings.
3. Use any of the 2 class methods to send a discord message or  chart screenshot:
    - Send a discord message using:
```cpp
myDiscord.SendMessage("This is my outside message", "This is my embed title", "This is my embed text body");
```
    - Send to discord a chart screenshot using:
```cpp
myDiscord.SendScreenShot(TheSymbol, ThePeriod, TheWidth=1912, TheHeight=1080);
```

## Code Example
_What does this code do?_
This code will send a discord message & a chart screenshot with the following format:
Outside text
**Embed Title**
Embed text body
__My chart screenshot__

**Requirement Setup**
1. You must open a chart on the BTCUSD on the 5-minutes timeframe before executing the code.
2. You must add the channel webhook link to the external variable when adding the EA to your chart.

```cpp
//--- Code Example
#include <../JustUp-MQL-Framework/Main.mqh>

//Variables & Definitions
input string myWebhook = "INVALID WEBHOOK";
CDiscord discord(myWebhook);

int OnInit()
{
    FrameworkInit();
    //---
    discord.SendMessage("This is my outside message", "This is my embed title", "This is my embed text body");
    discord.SendScreenShot("BTCUSD", PERIOD_M5);
    Print("Done!");
    return INIT_SUCCEEDED;
}

void OnTick()
{
    FrameworkOnTick();
    //---
}

void OnDeinit()
{
    FrameworkDeInit(const int reason);
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
<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/0de4a293-42e7-4dde-a44c-8c8ebca6674f/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20221212%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20221212T033929Z&X-Amz-Expires=86400&X-Amz-Signature=81a157eb9ddeb6daa853287b69edfc8e3e6851c3b84bc49daa939bf273edf823&X-Amz-SignedHeaders=host&response-content-disposition=filename%3D%22Untitled.png%22&x-id=GetObject">