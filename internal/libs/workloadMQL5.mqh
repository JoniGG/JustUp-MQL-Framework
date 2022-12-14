//--- This library will include the 4 main libraries of the framework workload. MQL5
#include "../../Main.mqh"
#define _WORKLOAD_MQL5_CLASS_VERSION_ 1.0

//--- Place in the beginning of the OnStart() function.
bool FrameworkStart()
{
    Print("Loading " + _FRAMEWORK_NAME_ + " v" + _FRAMEWORK_VERSION_STRING_ + "...");
    Print(_FRAMEWORK_NAME_ + " loaded successfully!");
    return true;
}

//---------------------------------------------------------------------------------------------|
//--- Place at the end of the OnStart() function.
void FrameworkStop()
{
    Print("Thanks for using " + _FRAMEWORK_NAME_ + " v" + _FRAMEWORK_VERSION_STRING_ + "!");
    Print(_FRAMEWORK_NAME_ + " unloaded successfully!");
}

//---------------------------------------------------------------------------------------------|
//--- Place in the beginning of the OnInit() function.
bool FrameworkInit()
{
    Print("Initializing " + _FRAMEWORK_NAME_ + " v" + _FRAMEWORK_VERSION_STRING_ + "...");

    if(!SETTING_BYPASS_VERIFICATIONS)
    {
        //--- Framework Verifications
        if(!IsTradeAllowed())
        {
            Print("INITIALIZATION ERROR: Trading is not allowed in this account!");
            return false;
        }
        if(!IsDllsAllowed())
        {
            Print("INITIALIZATION ERROR: DLLs are not allowed in this account!");
            return false;
        }
    }
    
    Print(_FRAMEWORK_NAME_ + " initialized successfully!");
    return true;
}

//---------------------------------------------------------------------------------------------|
//--- Place at the beginning of the Deinit() function.
void FrameworkDeInit()
{
    Print("Deinitializing " + _FRAMEWORK_NAME_ + " v" + _FRAMEWORK_VERSION_STRING_ + "...");

    //... Your code here

    Print(_FRAMEWORK_NAME_ + " deinitialized successfully!");
}

//---------------------------------------------------------------------------------------------|
//--- Place at the beginning of the OnTick() function.
void FrameworkRun()
{

    //... Your code here

}

//---------------------------------------------------------------------------------------------|
//--- Place at the beginning of the OnChartEvent() function.
void FrameworkOnChart()
{

    //... Your code here

}