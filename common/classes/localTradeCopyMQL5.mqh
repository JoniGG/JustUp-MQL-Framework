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

class LocalTradeCopy
{
public:
            LocalTradeCopy(ENUM_LOCAL_COPY_MODE mode, int identifier)
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
                ENUM_ORDER_TYPE m_type;
                double m_price;
                double m_stopLoss;
                double m_takeProfits;
                double m_posSize;
                ulong m_magicNumber;
            } Get;

            struct LocalSendSignal
            {
                ENUM_LOCAL_SENDING_MODE signalMode;
                string symbol;
                ENUM_ORDER_TYPE type;
                double price;
                double stopLoss;
                double takeProfits;
                double posSize;
                ulong magicNumber;
            } Set;
            
            
private:
    ENUM_LOCAL_COPY_MODE m_mode;
    int m_identifier;
    int lastReceivedTradeTicker;
};

//--- This function will send a signal to the receiver
bool LocalTradeCopy::SendSignal()
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
bool LocalTradeCopy::RefreshSignals()
{
    if(m_mode != MODE_RECEIVER)
        return false;

    CTextFiles signal2("signal" + IntegerToString(m_identifier), "JustUp-MQL-Framework/LibrariesData/", true, DAT);

    if(signal2.CountLines() < 7)
        return false;

    Get.m_signalMode = TranslateSignal(signal2.ReadLine(1));
    Get.m_symbol = signal2.ReadLine(2);
    Get.m_type = ENUM_ORDER_TYPE(signal2.ReadLine(3));
    Get.m_price = (double)signal2.ReadLine(4);
    Get.m_stopLoss = StringToDouble(signal2.ReadLine(5));
    Get.m_takeProfits = StringToDouble(signal2.ReadLine(6));
    Get.m_posSize = StringToDouble(signal2.ReadLine(7));
    Get.m_magicNumber = ulong(signal2.ReadLine(8));

    signal2.Delete();
    
    return true;
}

//--- This function will execute the signal
bool LocalTradeCopy::ExecuteSignal(int maxSlippage=0,string tradeComment=NULL)
{
   if(m_mode != MODE_RECEIVER)
        return false;
   
   MqlTradeRequest request;
   request.deviation = maxSlippage;
   request.comment = tradeComment;
   request.sl = Get.m_stopLoss;
   request.tp = Get.m_takeProfits;
   request.symbol = Get.m_symbol;
   request.volume = Get.m_posSize;
   request.magic = Get.m_magicNumber;
   
   MqlTradeResult result;
   
   if(Get.m_type == 0)
      request.type = ORDER_TYPE_BUY;
   if(Get.m_type == 1)
      request.type = ORDER_TYPE_SELL;
   if(Get.m_type == 2)
      request.type = ORDER_TYPE_BUY_LIMIT;
   if(Get.m_type == 3)
      request.type = ORDER_TYPE_SELL_LIMIT;
   if(Get.m_type == 4)
      request.type = ORDER_TYPE_BUY_STOP;
   if(Get.m_type == 5)
      request.type = ORDER_TYPE_SELL_STOP;
      
   request.price = Get.m_price;
   request.type_filling = ORDER_FILLING_IOC;
   
   
   //--- On new trade event
   if(Get.m_signalMode == MODE_NEW_TRADE)
    {
        request.action = TRADE_ACTION_DEAL;
        
        if(Get.m_type == ORDER_TYPE_BUY)
        {
            request.price = SymbolInfoDouble(Get.m_symbol,SYMBOL_BID);
            lastReceivedTradeTicker = OrderSend(request, result);
            if(lastReceivedTradeTicker != 0)
               return true;
            
            return false;
        }
        else if(Get.m_type == ORDER_TYPE_SELL)
        {
            request.price = SymbolInfoDouble(Get.m_symbol,SYMBOL_ASK);
            lastReceivedTradeTicker = OrderSend(request, result);
            if(lastReceivedTradeTicker != 0)
            {
               return true;
            }
            return false;
        }
        
        else if(Get.m_type == ORDER_TYPE_BUY_LIMIT)
        {
            lastReceivedTradeTicker = OrderSend(request, result);
            if(lastReceivedTradeTicker != 0)
            {
               return true;
            }
            return false;
        }
        else if(Get.m_type == ORDER_TYPE_SELL_LIMIT)
        {
            lastReceivedTradeTicker = OrderSend(request, result);
            if(lastReceivedTradeTicker != 0)
            {
               return true;
            }
            return false;
        }
        else if(Get.m_type == ORDER_TYPE_BUY_STOP)
        {
            lastReceivedTradeTicker = OrderSend(request, result);
            if(lastReceivedTradeTicker != 0)
            {
               return true;
            }
            return false;
        }
        else if(Get.m_type == ORDER_TYPE_SELL_STOP)
        {
            lastReceivedTradeTicker = OrderSend(request, result);
            if(lastReceivedTradeTicker != 0)
            {
               return true;
            }
            return false;
        }
    }
   
   return false;
}

/*
//--- This function will execute the signal
bool LocalTradeCopy::ExecuteSignal(int maxSlippage = 0, string tradeComment = NULL)
{
    
    
    MqlTradeRequest request;
    
    
    if(Get.m_signalMode == MODE_NEW_TRADE)
    {
        if(Get.m_type == OP_BUY)
        {
            lastReceivedTradeTicker = OrderSendMQL4(Get.m_symbol,OP_BUY,Get.m_posSize,Bid,maxSlippage,Get.m_stopLoss,Get.m_takeProfits,tradeComment,Get.m_magicNumber,0,0);
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
*/