//--- This function allows you to activate or deactivate the autotrading button from the code
//--- Credits to @Kailash Bai Mina in MQL5.com
#define MT_WMCMD_EXPERTS   32851
#define WM_COMMAND 0x0111
#define GA_ROOT    2
#include <WinAPI\winapi.mqh>
#define _AUTO_TRADING_TOGGLE_MQL5_VERSION 1.0

void SetAutoTrading(bool status)
{
    bool currentStatus = (bool) TerminalInfoInteger(TERMINAL_TRADE_ALLOWED);

    if(currentStatus != status)
    {
        HANDLE hChart = (HANDLE) ChartGetInteger(ChartID(), CHART_WINDOW_HANDLE);
        PostMessageW(GetAncestor(hChart, GA_ROOT), WM_COMMAND, MT_WMCMD_EXPERTS, 0);
    }
}