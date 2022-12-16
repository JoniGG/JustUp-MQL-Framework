#define _FRAMEWORK_NAME_ "Just Up Corporation Framework"
#define _FRAMEWORK_AUTHOR_ "Jonathan Fernandez"
#define _FRAMEWORK_WEBSITE_ "https://tech.justup.us/framework/"
#define _FRAMEWORK_EMAIL_ "framework@justup.us"
#define _FRAMEWORK_VERSION_STRING_ "2.3.0"
#define _FRAMEWORK_VERSION_NUMBER_ 2.3.0
#define _FRAMEWORK_VERSION_DATE_ "2022.12.15"

//--- Main Libraries
#ifdef __MQL4__
   #include "includerMQL4.mqh"
#endif
#ifdef __MQL5__
   #include "includerMQL5.mqh"
#endif

/*
USAGE:
1- Call the FrameworkInit() function at the beginning of the OnInit() function.
2- Call the FrameworkDeinit() function at the beginning of the Deinit() function.
3- Call the FrameworkOnTick() function at the beginning of the OnTick() function.

Go to the repository at https://github.com/justupcorp/JustUp-MQL-Framework to see the full documentation.
*/

//--- Temporal Files (Do not modify)
#include "temp/temp.mqh"

//--- Settings Includer
#include "settings.mqh"