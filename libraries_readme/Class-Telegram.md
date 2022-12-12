# Class-Telegram | MQL
This class will allow you to send messages to a telegram chat.
It can be really useful when forming a signal telegram channel.

## Features
1. Send a message to a telegram chat.
2. Send a message to a telegram chat with a photo.

## Usage
1. Declare an instance of the class using:
```cpp
CTelegram telegram("token", "chat_id");
```
2. Add the web address of the telegram api to the "Allow Web Request" list in the terminal settings.
`https://api.telegram.org`
3. Send a message to a telegram chat using:
```cpp
telegram.SendMessage("message");
```
4. Send a message to a telegram chat with a photo using:
```cpp
telegram.SendMessageWithPhoto("message", "photo_path");
```

## Code Example
_What does this code do?_
This code will send a message to a telegram chat with a photo which path will be given when loading the bot.

**Requirement Setup**
1. Take a screehot of the chart and save it as a `xx.png` file in the `Files` folder.

```cpp
//--- Code Example
#include <../JustUp-MQL-Framework/Main.mqh>

//Variables & Definitions
input string chat_id = "chat_id";
input string myToken = "token";
input string myMessage = "message";
input string photo_name = ".png"; //Photo name, the picture must be in the Files folder
CTelegram telegram(myToken, chat_id);

int OnInit()
{
    FrameworkInit();
    //---
    telegram.SendMessageWithPhoto(myMessage, photo_name);
    Print("Message sent");
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
_No attachs have been added_