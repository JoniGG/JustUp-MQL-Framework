//--- This library will include the 4 main libraries of the framework workload. MQL4
#include "../../Main.mqh"

//--- Place in the beginning of the OnStart() function.
void FrameworkStart()
{
    Print("Loading " + _FRAMEWORK_NAME_ + " v" + _FRAMEWORK_VERSION_STRING_ + "...");
    Print(_FRAMEWORK_NAME_ + " loaded successfully!");
}

//--- Place at the end of the OnStart() function.
void FrameworkStop()
{
    Print("Thanks for using " + _FRAMEWORK_NAME_ + " v" + _FRAMEWORK_VERSION_STRING_ + "!");
    Print(_FRAMEWORK_NAME_ + " unloaded successfully!");
}

//--- Place in the beginning of the OnInit() function.
void FrameworkInit()
{
    Print("Initializing " + _FRAMEWORK_NAME_ + " v" + _FRAMEWORK_VERSION_STRING_ + "...");

    //... Your code here

    Print(_FRAMEWORK_NAME_ + " initialized successfully!");
}

//--- Place at the beginning of the Deinit() function.
void FrameworkDeInit()
{
    Print("Deinitializing " + _FRAMEWORK_NAME_ + " v" + _FRAMEWORK_VERSION_STRING_ + "...");

    //... Your code here

    Print(_FRAMEWORK_NAME_ + " deinitialized successfully!");
}

//--- Place at the beginning of the OnTick() function.
void FrameworkOnTick()
{

    //... Your code here

}

//--- Place at the beginning of the OnChartEvent() function.
void FrameworkOnChart()
{

    //... Your code here

}