//--- Main Libraries
#ifdef __MQL4__
#include "MQL4/init.mqh"
#endif
#ifdef defined __MQL5__
#include "MQL5/init.mqh"
#endif

/*
USAGE:
1- Call the FrameworkInit() function at the beginning of the OnInit() function.
2- Call the FrameworkDeinit() function at the beginning of the Deinit() function.
3- Call the FrameworkOnTick() function at the beginning of the OnTick() function.

Go to our website to get more information about the Just Up Corporation Framework:
https://tech.justup.us/framework/
*/