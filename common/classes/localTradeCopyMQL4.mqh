//--- This is a remastered of the tradeCoppierOffline.mqh package
//--- This will be a most extended and advanced version, however, you can keep using the old one for small projects
#include "textFiles.mqh"
#include "../packages/printExtended.mqh"

#ifdef __MQL5__
    #include "../packages/Mql4InMql5.mqh"
#endif
#define _LOCAL_TRADE_COPIER_VERSION_ 1.0

enum ENUM_LOCAL_COPY_MODE
{
    MODE_SENDER = 0,
    MODE_RECEIVER = 1
};

enum ENUM_LOCAL_SENDING_MODE
{
    MODE_NEW_TRADE = 0,
    MODE_TRADE_MODIFY = 1,
    MODE_TRADE_DELETE = 2,
    MODE_TRADE_CLOSE = 3
};

ENUM_LOCAL_SENDING_MODE TranslateSignal(string m_signalModeText)
{
    if(m_signalModeText == "0")
        return MODE_NEW_TRADE;
    else if(m_signalModeText == "1")
        return MODE_TRADE_MODIFY;
    else if(m_signalModeText == "2")
        return MODE_TRADE_DELETE;
    else if(m_signalModeText == "3")
        return MODE_TRADE_CLOSE;
    else
        return MODE_NEW_TRADE;
}

class CLocalTradeCopy
{
public:
            CLocalTradeCopy(ENUM_LOCAL_COPY_MODE mode, int identifier)
            {
                m_mode = mode;
                m_identifier = identifier;
            }
            bool SendSignal();
            bool RefreshSignals();
            bool ExecuteSignal(int maxSlippage = 0, string tradeComment = NULL);

            struct LocalGet
            {
                ENUM_LOCAL_SENDING_MODE m_signalMode;
                string m_symbol;
                int m_type;
                string m_price;
                double m_stopLoss;
                double m_takeProfits;
                double m_posSize;
                int m_magicNumber;
            } Get;

            struct LocalSendSignal
            {
                ENUM_LOCAL_SENDING_MODE signalMode;
                string symbol;
                int type;
                string price;
                double stopLoss;
                double takeProfits;
                double posSize;
                int magicNumber;
            } Set;
            
            
private:
    ENUM_LOCAL_COPY_MODE m_mode;
    int m_identifier;
    int lastReceivedTradeTicker;
};

//--- This function will send a signal to the receiver
bool CLocalTradeCopy::SendSignal()
{
    if(m_mode != MODE_SENDER)
        return false;
    
    CTextFiles signal("signal" + IntegerToString(m_identifier), "JustUp-MQL-Framework/LibrariesData/", true, DAT);
    
    if(signal.CountLines() > 1)
        return false;

    signal.AddText(IntegerToString(Set.signalMode));
    signal.AddText(Set.symbol);
    signal.AddText(IntegerToString(Set.type));
    signal.AddText(DoubleToString(Set.price,5));
    signal.AddText(DoubleToString(Set.stopLoss));
    signal.AddText(DoubleToString(Set.takeProfits));
    signal.AddText(DoubleToString(Set.posSize));
    signal.AddText(IntegerToString(Set.magicNumber));

    if(signal.CountLines() == 7)
        return true;
    else
        return false;
}

//--- This function will get a signal from the sender
bool CLocalTradeCopy::RefreshSignals()
{
    if(m_mode != MODE_RECEIVER)
        return false;

    CTextFiles signal2("signal" + IntegerToString(m_identifier), "JustUp-MQL-Framework/LibrariesData/", true, DAT);

    if(signal2.CountLines() < 7)
        return false;

    Get.m_signalMode = TranslateSignal(signal2.ReadLine(1));
    Get.m_symbol = signal2.ReadLine(2);
    Get.m_type = StringToInteger(signal2.ReadLine(3));
    Get.m_price = signal2.ReadLine(4);
    Get.m_stopLoss = StringToDouble(signal2.ReadLine(5));
    Get.m_takeProfits = StringToDouble(signal2.ReadLine(6));
    Get.m_posSize = StringToDouble(signal2.ReadLine(7));
    Get.m_magicNumber = StringToInteger(signal2.ReadLine(8));

    signal2.Delete();
    
    return true;
}

//--- This function will execute the signal
bool CLocalTradeCopy::ExecuteSignal(int maxSlippage = 0, string tradeComment = NULL)
{
    if(m_mode != MODE_RECEIVER)
        return false;
    
    if(Get.m_signalMode == MODE_NEW_TRADE)
    {
        if(Get.m_type == OP_BUY)
        {
            lastReceivedTradeTicker = OrderSend(Get.m_symbol,OP_BUY,Get.m_posSize,Bid,maxSlippage,Get.m_stopLoss,Get.m_takeProfits,tradeComment,Get.m_magicNumber,0,0);
            if(lastReceivedTradeTicker != 0)
               return true;
            
            return false;
        }
        else if(Get.m_type == OP_SELL)
        {
            lastReceivedTradeTicker = OrderSend(Get.m_symbol,OP_SELL,Get.m_posSize,Ask,maxSlippage,Get.m_stopLoss,Get.m_takeProfits,tradeComment,Get.m_magicNumber,0,0);
            if(lastReceivedTradeTicker != 0)
               return true;
            
            return false;
        }
        else if(Get.m_type == OP_BUYLIMIT)
        {
            lastReceivedTradeTicker = OrderSend(Get.m_symbol,OP_BUYLIMIT,Get.m_posSize,Get.m_price,maxSlippage,Get.m_stopLoss,Get.m_takeProfits,tradeComment,Get.m_magicNumber,0,0);
            if(lastReceivedTradeTicker != 0)
               return true;
            
            return false;
        }
        else if(Get.m_type == OP_SELLLIMIT)
        {
            lastReceivedTradeTicker = OrderSend(Get.m_symbol,OP_SELLLIMIT,Get.m_posSize,Get.m_price,maxSlippage,Get.m_stopLoss,Get.m_takeProfits,tradeComment,Get.m_magicNumber,0,0);
            if(lastReceivedTradeTicker != 0)
               return true;
            
            return false;
        }
        else if(Get.m_type == OP_BUYSTOP)
        {
            lastReceivedTradeTicker = OrderSend(Get.m_symbol,OP_BUYSTOP,Get.m_posSize,Get.m_price,maxSlippage,Get.m_stopLoss,Get.m_takeProfits,tradeComment,Get.m_magicNumber,0,0);
            if(lastReceivedTradeTicker != 0)
               return true;
            
            return false;
        }
        else if(Get.m_type == OP_SELLSTOP)
        {
            lastReceivedTradeTicker = OrderSend(Get.m_symbol,OP_SELLSTOP,Get.m_posSize,Get.m_price,maxSlippage,Get.m_stopLoss,Get.m_takeProfits,tradeComment,Get.m_magicNumber,0,0);
            if(lastReceivedTradeTicker != 0)
               return true;
            
            return false;
        }
    }
    else if(Get.m_signalMode == MODE_TRADE_MODIFY)
    {
        if(OrderSelect(lastReceivedTradeTicker ,SELECT_BY_TICKET))
        {
               if(OrderModify(OrderTicket(),OrderOpenPrice(),Get.m_stopLoss,Get.m_takeProfits,0,0))
                     return true;
        }
    }
    else if(Get.m_signalMode == MODE_TRADE_DELETE)
    {
        if(OrderSelect(lastReceivedTradeTicker ,SELECT_BY_TICKET))
        {
               if(OrderDelete(OrderTicket(),0))
                     return true;
        }
    }
    else if(Get.m_signalMode == MODE_TRADE_CLOSE)
    {
        if(OrderSelect(lastReceivedTradeTicker ,SELECT_BY_TICKET))
        {
               if(OrderType() == OP_BUY)
               {
                     if(OrderClose(OrderTicket(),OrderLots(),Ask,0,0))
                        return true;
               }
                else if(OrderType() == OP_SELL)
                {
                        if(OrderClose(OrderTicket(),OrderLots(),Bid,0,0))
                            return true;
                }
        }
    }
        return false;
}