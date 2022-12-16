//--- All the order handles from MQL4 in MQL5.
#include "common/packages/Mql4InMql5.mqh"
#define _MQL4_ORDERS_HANDLER_MQL5_VERSION_ 1.0

//--- Send an order
ulong OrderSendMQL4(
                  string symbol,
                  int cmd,
                  double volume,
                  double price,
                  int slippage,
                  double stoploss,
                  double takeprofits,
                  string comment = NULL,
                  int magic = 0,
                  datetime expiration = 0,
                  color allow_color = clrNONE 
                 )
{
      CTrade t;
      
      t.SetDeviationInPoints((ulong)slippage);
      t.SetExpertMagicNumber((ulong)magic);
      
      
      //--- Pending Case
      if(cmd != OP_BUY || cmd != OP_SELL)
      {
         if(cmd == OP_BUYLIMIT)
         {
            t.OrderOpen(symbol,ORDER_TYPE_BUY_LIMIT,volume,0,price,stoploss,takeprofits,ORDER_TIME_DAY,expiration,comment);
            return t.ResultOrder();
         }
         if(cmd == OP_SELLLIMIT)
         {
            t.OrderOpen(symbol,ORDER_TYPE_SELL_LIMIT,volume,0,price,stoploss,takeprofits,ORDER_TIME_DAY,expiration,comment);
            return t.ResultOrder();
         }
         if(cmd == OP_BUYSTOP)
         {
            t.OrderOpen(symbol,ORDER_TYPE_BUY_STOP,volume,0,price,stoploss,takeprofits,ORDER_TIME_DAY,expiration,comment);
            return t.ResultOrder();
         }
         if(cmd == OP_SELLSTOP)
         {
            t.OrderOpen(symbol,ORDER_TYPE_SELL_STOP,volume,0,price,stoploss,takeprofits,ORDER_TIME_DAY,expiration,comment);
            return t.ResultOrder();
         }
         
      }
      
      //--- Market case
      if(cmd == 0)
      {
         t.Buy(volume,symbol,0,stoploss,takeprofits,comment);
         return t.ResultOrder();
      }
      else
      {
         t.Sell(volume,symbol,0,stoploss,takeprofits,comment);
         return t.ResultOrder();
      }
}

//--- Modify an order
bool OrderModify(
                  ulong ticket,
                  double price,
                  double stoploss,
                  double takeprofits,
                  datetime expiration,
                  color allow_color
                )
{
     CTrade t;
     
     if(OrderSelect(ticket))
     {
         if(t.OrderModify(ticket,price,stoploss,takeprofits,ORDER_TIME_DAY,expiration))
            return true;
         else return false;
     }
     
     if(t.PositionModify(ticket,stoploss,takeprofits))
            return true;
     
     return false;
}

//--- Delete an order
bool OrderDelete(ulong ticket, color allow_color)
{
      CTrade t;
      
      return (t.OrderDelete(ticket));
}

//--- Close an order
bool OrderClose(
                  ulong ticket,
                  double lots,
                  double price,
                  int slippage,
                  color arrow_color
               )
{
      CTrade t;
      
      if(slippage == 0)
         slippage = -1;
      
      return(t.PositionClosePartial(ticket,lots,slippage));
}