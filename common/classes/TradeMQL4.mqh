//--- This library incorporates the class CTrade (native from MQL5) into the MQL4 language.
#include "../constants.mqh"
#define _TRADE_MQL4_VERSION_ 1.0

class CTrade
{
public:
        //--- Setting Parameters
        void SetExpertMagicNumber(int magic_number); // Set the magic number of the expert
        void SetDeviationInPoints(int deviation); // Set the deviation of the expert
        
        //--- Operations with orders
        bool OpenOrder(string symbol, ENUM_ORDER_TYPE order_type, double volume, double price, double sl, double tp, datetime expiration, string comment); // Open an order with the specified parameters
        bool ModifyOrder(int ticket, double price, double sl, double tp, datetime expiration = 0); // Modify the specified order from Ticket
        bool DeleteOrder(int ticket); // Delete the specified order from Ticket

        //--- Operations with positions
        bool PositionOpen(string symbol, ENUM_ORDER_TYPE order_type, double volume, double price, double sl, double tp, datetime expiration, string comment); // Open a position with the specified parameters
        bool PositionModify(int ticket, double sl, double tp); // Modify the specified position from Ticket
        bool PositionClose(int ticket, long deviation = ULONG_MAX); // Close the specified position from Ticket
        bool PositionClosePartial(int ticket, double volume, long deviation = ULONG_MAX); // Close a part of the specified position from Ticket

        //--- Additional Methods
        bool Buy(double volume, string symbol = SYMBOL, double price = 0.0, double sl = 0.0, double tp = 0.0, string comment = ""); // Open a buy order
        bool Sell(double volume, string symbol = SYMBOL, double price = 0.0, double sl = 0.0, double tp = 0.0, string comment = ""); // Open a sell order
        bool BuyLimit(double volume, double price, string symbol = SYMBOL, double sl = 0.0, double tp = 0.0, datetime expiration = 0, string comment = ""); // Open a buy limit order
        bool SellLimit(double volume, double price, string symbol = SYMBOL, double sl = 0.0, double tp = 0.0, datetime expiration = 0, string comment = ""); // Open a sell limit order
        bool BuyStop(double volume, double price, string symbol = SYMBOL, double sl = 0.0, double tp = 0.0, datetime expiration = 0, string comment = ""); // Open a buy stop order
        bool SellStop(double volume, double price, string symbol = SYMBOL, double sl = 0.0, double tp = 0.0, datetime expiration = 0, string comment = ""); // Open a sell stop order

        //--- Access to the last request parameters | The requested parameters, may be different from the actual parameters of the order
        int RequestMagic() {return _request_magic;} // Get the magic number of the expert
        string RequestSymbol() {return _request_symbol;} // Get the symbol of the order
        double RequestVolume() {return _request_volume;} // Get the volume of the order
        double RequestPrice() {return _request_price;} // Get the price of the order
        double RequestSL() {return _request_sl;} // Get the SL of the order
        double RequestTP() {return _request_tp;} // Get the TP of the order
        int RequestDeviation() {return _request_deviation;} // Get the deviation of the expert
        ENUM_ORDER_TYPE RequestType() {return _request_type;} // Get the type of the order
        string RequestTypeDescription(); // Get the type description of the order
        datetime RequestExpiration() {return _request_expiration;} // Get the expiration of the order
        string RequestComment() {return _request_comment;} // Get the comment of the order

        //--- Access to the last request execution result | The actual parameters of the order once is executed by the broker
        int ResultOrder() {return _result_order;} // Get the order ticket
        double ResultVolume(); // Get the volume of the order
        double ResultPrice(); // Get the price of the order
        string ResultComment() {return _request_comment;} // Get the comment of the order

private: 
        //--- Parameters
        int _magic_number; // Magic number of the expert
        int _deviation; // Deviation of the expert

        //--- Request Parameters
        int _request_magic; // Magic number of the expert
        string _request_symbol; // Symbol of the order
        double _request_volume; // Volume of the order
        double _request_price; // Price of the order
        double _request_sl; // SL of the order
        double _request_tp; // TP of the order
        int _request_deviation; // Deviation of the expert
        ENUM_ORDER_TYPE _request_type; // Type of the order
        string _request_type_description; // Type description of the order
        datetime _request_expiration; // Expiration of the order
        string _request_comment; // Comment of the order

        //--- Result Parameters
        int _result_order; // Order ticket
        double _result_volume; // Volume of the order
        double _result_price; // Price of the order

        //--- Methods
        void _SetRequestParameters(int magic_number=0, int ticket=0, string symbol="", double volume=0, double price=0, double sl=0, double tp=0, int deviation=0, ENUM_ORDER_TYPE order_type=0, datetime expiration=0, string comment=""); // Set the request parameters
        void _SetResultParameters(int ticket, double volume, double price, string comment); // Set the result parameters
};

//--- Setting Parameters
void CTrade::SetExpertMagicNumber(int magic_number)
{
        _magic_number = magic_number;
        return;
}

void CTrade::SetDeviationInPoints(int deviation)
{
        _deviation = deviation;
        return;
}

//--- Operations with orders
bool CTrade::OpenOrder(string symbol, ENUM_ORDER_TYPE order_type, double volume, double price, double sl, double tp, datetime expiration, string comment)
{
        _SetRequestParameters(_magic_number, 0, symbol, volume, price, sl, tp, _deviation, order_type, expiration, comment);

        if(order_type == ORDER_TYPE_BUY)
                _result_order = OrderSend(symbol, order_type, volume, price, _deviation, sl, tp, comment, _magic_number, expiration);
        else if(order_type == ORDER_TYPE_SELL)
                _result_order = OrderSend(symbol, order_type, volume, price, _deviation, sl, tp, comment, _magic_number, expiration);
        else if(order_type == ORDER_TYPE_BUY_LIMIT)
                _result_order = OrderSend(symbol, order_type, volume, price, _deviation, sl, tp, comment, _magic_number, expiration);
        else if(order_type == ORDER_TYPE_SELL_LIMIT)
                _result_order = OrderSend(symbol, order_type, volume, price, _deviation, sl, tp, comment, _magic_number, expiration);
        else if(order_type == ORDER_TYPE_BUY_STOP)
                _result_order = OrderSend(symbol, order_type, volume, price, _deviation, sl, tp, comment, _magic_number, expiration);
        else if(order_type == ORDER_TYPE_SELL_STOP)
                _result_order = OrderSend(symbol, order_type, volume, price, _deviation, sl, tp, comment, _magic_number, expiration);
        else
                _result_order = 0;

        return (_result_order != 0);
}

bool CTrade::ModifyOrder(int ticket, double price, double sl, double tp, datetime expiration = 0)
{
        if(!OrderSelect(ticket, SELECT_BY_TICKET, MODE_TRADES))
                return false;

        if(OrderType() == OP_BUY || OrderType() == OP_SELL)
                return false;

        _SetRequestParameters(_magic_number, ticket, "", 0, price, sl, tp, _deviation, 0, expiration);

        if(OrderModify(ticket, price, sl, tp, expiration))
                _result_order = ticket;
        else
                _result_order = 0;

        return (_result_order != 0);
}

bool CTrade::DeleteOrder(int ticket)
{
        if(!OrderSelect(ticket, SELECT_BY_TICKET, MODE_TRADES))
                return false;

        if(OrderType() == OP_BUY || OrderType() == OP_SELL)
                return false;

        _SetRequestParameters(_magic_number, ticket, "", 0, 0, 0, 0, _deviation, 0, 0);

        if(OrderDelete(ticket,0))
                _result_order = ticket;
        else
                _result_order = 0;

        return (_result_order != 0);
}

//--- Operations with positions
bool CTrade::PositionOpen(string symbol, ENUM_ORDER_TYPE order_type, double volume, double price, double sl, double tp, datetime expiration, string comment)
{
        _SetRequestParameters(_magic_number, 0, symbol, volume, price, sl, tp, _deviation, order_type, expiration, comment);

        if(order_type == ORDER_TYPE_BUY)
                _result_order = OrderSend(symbol, order_type, volume, price, _deviation, sl, tp, comment, _magic_number, expiration);
        else if(order_type == ORDER_TYPE_SELL)
                _result_order = OrderSend(symbol, order_type, volume, price, _deviation, sl, tp, comment, _magic_number, expiration);
        else if(order_type == ORDER_TYPE_BUY_LIMIT)
                _result_order = OrderSend(symbol, order_type, volume, price, _deviation, sl, tp, comment, _magic_number, expiration);
        else if(order_type == ORDER_TYPE_SELL_LIMIT)
                _result_order = OrderSend(symbol, order_type, volume, price, _deviation, sl, tp, comment, _magic_number, expiration);
        else if(order_type == ORDER_TYPE_BUY_STOP)
                _result_order = OrderSend(symbol, order_type, volume, price, _deviation, sl, tp, comment, _magic_number, expiration);
        else if(order_type == ORDER_TYPE_SELL_STOP)
                _result_order = OrderSend(symbol, order_type, volume, price, _deviation, sl, tp, comment, _magic_number, expiration);
        else
                _result_order = 0;

        return (_result_order != 0);
}

bool CTrade::PositionClose(int ticket, long deviation = ULONG_MAX)
{
        _SetRequestParameters(ticket, deviation);

        if(!OrderSelect(ticket,SELECT_BY_POS))
            return false;
        
        if(OrderType() == OP_BUY)
        {
            if(OrderClose(ticket,OrderLots(),Ask,deviation,0))
                _result_order = ticket;
            else
                _result_order = 0;
        }
        else if(OrderType() == OP_SELL)
        {
            if(OrderClose(ticket,OrderLots(),Bid,deviation,0))
                _result_order = ticket;
            else
                _result_order = 0;
        }
        else
            return false;
            
        return (_result_order != 0);
}

bool CTrade::PositionModify(int ticket, double sl, double tp)
{
        _SetRequestParameters(ticket, sl, tp);

        if(!OrderSelect(ticket,SELECT_BY_POS))
            return false;
        
        if(OrderType() == OP_BUY)
        {
            if(OrderModify(ticket,OrderOpenPrice(),sl,tp,0))
                _result_order = ticket;
            else
                _result_order = 0;
        }
        else if(OrderType() == OP_SELL)
        {
            if(OrderModify(ticket,OrderOpenPrice(),sl,tp,0))
                _result_order = ticket;
            else
                _result_order = 0;
        }
        else
            return false;
            
        return (_result_order != 0);
}

bool CTrade::PositionClosePartial(int ticket, double volume, long deviation = ULONG_MAX)
{
        _SetRequestParameters(ticket, deviation);

        if(!OrderSelect(ticket,SELECT_BY_POS))
            return false;
        
        if(OrderType() == OP_BUY)
        {
            if(OrderClose(ticket,volume,Ask,deviation,0))
                _result_order = ticket;
            else
                _result_order = 0;
        }
        else if(OrderType() == OP_SELL)
        {
            if(OrderClose(ticket,volume,Bid,deviation,0))
                _result_order = ticket;
            else
                _result_order = 0;
        }
        else
            return false;
            
        return (_result_order != 0);
}

bool CTrade::Buy(double volume, string symbol = SYMBOL, double price = 0.0, double sl = 0.0, double tp = 0.0, string comment = "")
{
        _SetRequestParameters(_magic_number, 0, symbol, volume, price, sl, tp, _deviation, ORDER_TYPE_BUY, 0, comment);
        
        string m_symbol;
        
        if(symbol == SYMBOL)
            m_symbol = Symbol();
        else
            m_symbol = symbol;
        
        _result_order = OrderSend(m_symbol,OP_BUY,volume,Bid,_deviation,sl,tp,comment,_magic_number,0,0);
        
        return(_result_order != 0);
}

bool CTrade::Sell(double volume, string symbol = SYMBOL, double price = 0.0, double sl = 0.0, double tp = 0.0, string comment = "")
{
        _SetRequestParameters(_magic_number, 0, symbol, volume, price, sl, tp, _deviation, ORDER_TYPE_SELL, 0, comment);
        
        string m_symbol;
        
        if(symbol == SYMBOL)
            m_symbol = Symbol();
        else
            m_symbol = symbol;
        
        _result_order = OrderSend(m_symbol,OP_SELL,volume,Ask,_deviation,sl,tp,comment,_magic_number,0,0);
        
        return(_result_order != 0);
}

bool CTrade::BuyLimit(double volume, double price, string symbol = SYMBOL, double sl = 0.0, double tp = 0.0, datetime expiration = 0, string comment = "")
{
        _SetRequestParameters(_magic_number, 0, symbol, volume, price, sl, tp, _deviation, ORDER_TYPE_BUY_LIMIT, 0, comment);
        
        string m_symbol;
        
        if(symbol == SYMBOL)
            m_symbol = Symbol();
        else
            m_symbol = symbol;
        
        _result_order = OrderSend(m_symbol,OP_BUYLIMIT,volume,price,_deviation,sl,tp,comment,_magic_number,expiration,0);
        
        return(_result_order != 0);
}

bool CTrade::SellLimit(double volume, double price, string symbol = SYMBOL, double sl = 0.0, double tp = 0.0, datetime expiration = 0, string comment = "")
{
        _SetRequestParameters(_magic_number, 0, symbol, volume, price, sl, tp, _deviation, ORDER_TYPE_SELL_LIMIT, 0, comment);
        
        string m_symbol;
        
        if(symbol == SYMBOL)
            m_symbol = Symbol();
        else
            m_symbol = symbol;
        
        _result_order = OrderSend(m_symbol,OP_SELLLIMIT,volume,price,_deviation,sl,tp,comment,_magic_number,expiration,0);
        
        return(_result_order != 0);
}

bool CTrade::BuyStop(double volume, double price, string symbol = SYMBOL, double sl = 0.0, double tp = 0.0, datetime expiration = 0, string comment = "")
{
        _SetRequestParameters(_magic_number, 0, symbol, volume, price, sl, tp, _deviation, ORDER_TYPE_BUY_STOP, 0, comment);
        
        string m_symbol;
        
        if(symbol == SYMBOL)
            m_symbol = Symbol();
        else
            m_symbol = symbol;
        
        _result_order = OrderSend(m_symbol,OP_BUYSTOP,volume,price,_deviation,sl,tp,comment,_magic_number,expiration,0);
        
        return(_result_order != 0);
}

bool CTrade::SellStop(double volume, double price, string symbol = SYMBOL, double sl = 0.0, double tp = 0.0, datetime expiration = 0, string comment = "")
{
        _SetRequestParameters(_magic_number, 0, symbol, volume, price, sl, tp, _deviation, ORDER_TYPE_SELL_STOP, 0, comment);
        
        string m_symbol;
        
        if(symbol == SYMBOL)
            m_symbol = Symbol();
        else
            m_symbol = symbol;
        
        _result_order = OrderSend(m_symbol,OP_SELLSTOP,volume,price,_deviation,sl,tp,comment,_magic_number,expiration,0);
        
        return(_result_order != 0);
}

//--- Results
double CTrade::ResultVolume()
{
        if(_result_order == 0)
            return 0;
        
        if(!OrderSelect(_result_order,SELECT_BY_TICKET,MODE_TRADES))
        {
                if(!OrderSelect(_result_order,SELECT_BY_TICKET,MODE_HISTORY))
                    return 0;
                else
                        return OrderLots();
        }
        else
                return OrderLots();
        
        return OrderLots();
}

double CTrade::ResultPrice()
{
        if(_result_order == 0)
            return 0;
        
        if(!OrderSelect(_result_order,SELECT_BY_TICKET,MODE_TRADES))
        {
                if(!OrderSelect(_result_order,SELECT_BY_TICKET,MODE_HISTORY))
                    return 0;
                else
                        return OrderOpenPrice();
        }
        else
                return OrderOpenPrice();
        
        return OrderOpenPrice();
}

//--- Requests
string CTrade::RequestTypeDescription()
{
        if(_request_type == ORDER_TYPE_BUY)
                return "Buy";
        else if(_request_type == ORDER_TYPE_SELL)
                return "Sell";
        else if(_request_type == ORDER_TYPE_BUY_LIMIT)
                return "Buy Limit";
        else if(_request_type == ORDER_TYPE_SELL_LIMIT)
                return "Sell Limit";
        else if(_request_type == ORDER_TYPE_BUY_STOP)
                return "Buy Stop";
        else if(_request_type == ORDER_TYPE_SELL_STOP)
                return "Sell Stop";
        else
                return "Unknown";
        
}