//--- Common Libraries Includer
#include "../Data/Constant.mqh"
#include "../Data/Dictionaries.mqh"
#include "../Data/Enumerators.mqh"
#include "../Common/DiscordClass.mqh"
#include "../Common/TelegramClass.mqh"
#include "../Common/FilesClass.mqh"
#include "../Common/LogsFileClass.mqh"
#include "../Common/NewCandleClass.mqh"
#include "../Common/DateTimeStruc.mqh"
#include "../Common/ScreenshotClass.mqh"

//--- MQL4 Libraries Includer
#include "FunctionsPkg.mqh"

//--- Main Functions
int FrameworkInit()
{
    Print("Using the version " + _FRAMEWORK_VERSION_STRING_ + " of the " + _FRAMEWORK_NAME_ + " by " + _FRAMEWORK_AUTHOR_ + ".");
    Print("Visit our website at " + _FRAMEWORK_WEBSITE_ + ".");
    Print("Thank you for using our framework!");

    return FRAMEWORK_INITIALIZATION_SUCCEED;
}

int FrameworkDeinit()
{
    int i = 0;
    Print(_FRAMEWORK_NAME_ + " with version " _FRAMEWORK_VERSION_STRING_ + " has been unloaded.");
}

int FrameworkOnTick()
{
    return FRAMEWORK_UNLOADING_SUCCEED;
}