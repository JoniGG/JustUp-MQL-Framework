//--- This package will allow you to code trade from a terminal to other in the same computer
#include "../classes/textFiles.mqh"
#define _OFFLINE_TRADE_COPIER_VERSION_ 1.0

CTextFiles tcFile("tradeCopierSignal","frameworkFiles/", true);

void LocalSenderSend(string price, string sl, string tp, string lots, string type, string symbol)
{
    tcFile.Create("New Signal");
    tcFile.AddText(price);
    tcFile.AddText(sl);
    tcFile.AddText(tp);
    tcFile.AddText(lots);
    tcFile.AddText(type);
    tcFile.AddText(symbol);
    tcFile.AddText("//---end of the signal");
}

struct LocalReceiver
{
        void Receive()
        {
            price = StringToDouble(tcFile.ReadLine(2));
            sl = StringToDouble(tcFile.ReadLine(3));
            tp = StringToDouble(tcFile.ReadLine(4));
            lots = StringToDouble(tcFile.ReadLine(5));
            type = tcFile.ReadLine(6);
            symbol = tcFile.ReadLine(7);
            tcFile.Delete();
        }
        double lots;
        double price;
        double sl;
        double tp;
        string type;
        string symbol;
};