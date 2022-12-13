//--- This function allows you to activate or deactivate the autotrading button from the code
//--- Credits to @Kailash Bai Mina in MQL5.com
#include <WinUser32.mqh>
#import "user32.dll"
int GetAncestor(int, int);
#define MT4_WMCMD_EXPERTS  33020
#import
#define _AUTO_TRADING_TOGGLE_MQL4_VERSION 1.0

void SetAutotrading(bool status)
{
    bool currentStatus = IsTradeAllowed();

    if(currentStatus != status) 
    {
        int main = GetAncestor(WindowHandle(Symbol(), Period()), 2/*GA_ROOT*/);
        PostMessageA(main, WM_COMMAND,  MT4_WMCMD_EXPERTS, 0 );
    }
}