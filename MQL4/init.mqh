//--- Common Libraries Includer
#include "../Data/Constant.mqh"
#include "../Common/DiscordClass.mqh"
#include "../Common/TelegramClass.mqh"
#include "../Common/FilesClass.mqh"

//--- MQL4 Libraries Includer
#include "FunctionsPkg.mqh"

//--- Main Functions
int FrameworkInit()
{
    int i = 0;
    Print("Using the version " + _FRAMEWORK_VERSION_ + " of the Just Up Corporation Framework.");
}

int FrameworkDeinit()
{
    int i = 0;
    Print("Just Up Corporation Framework version " + _FRAMEWORK_VERSION_ + " has been unloaded.");
}

int FrameworkOnTick()
{
    int i = 0;
}