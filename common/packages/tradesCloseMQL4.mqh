//--- This function will close all the BUY/SELL trades
#include "../constants.mqh"
#define _CHART_CLOSE_ALL_FUNCTION_VERSION_ 1.0

bool CloseAllPositions()
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderType() == 0)
        {
            if(!OrderClose(OrderTicket(), OrderLots(), Ask, 0, CLR_NONE))
                return false;
        }
        else if(OrderType() == 1)
        {
            if(!OrderClose(OrderTicket(), OrderLots(), Bid, 0, CLR_NONE))
                return false;
        }

    }

    return true;
    
}

bool DeleteAllOrders()
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(!OrderDelete(OrderTicket()))
            return false;
    }

    return true;
    
}

bool CloseAllPositionsAndDeleteAllOrders()
{
    if(!CloseAllPositions())
        return false;
    
    if(!DeleteAllOrders())
        return false;
    
    return true;
}

bool CloseAllBySymbol(string symbol = SYMBOL)
{
    if(OrdersTotal() == 0)
        return true;
    
    if(symbol == SYMBOL)
        symbol = Symbol();

    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderSymbol() == symbol)
        {
            if(OrderType() == 0)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Ask, 0, CLR_NONE))
                    return false;
            }
            else if(OrderType() == 1)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Bid, 0, CLR_NONE))
                    return false;
            }
        }
    }

    return true;
    
}

bool DeleteAllBySymbol(string symbol = SYMBOL)
{
    if(OrdersTotal() == 0)
        return true;
    
    if(symbol == SYMBOL)
        symbol = Symbol();

    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderSymbol() == symbol)
        {
            if(!OrderDelete(OrderTicket()))
                return false;
        }
    }

    return true;
    
}

bool CloseAllPositionsAndDeleteAllOrdersBySymbol(string symbol = SYMBOL)
{
    if(!CloseAllBySymbol(symbol))
        return false;
    
    if(!DeleteAllBySymbol(symbol))
        return false;
    
    return true;
}

bool CloseAllByMagicNumber(int magicNumber)
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderMagicNumber() == magicNumber)
        {
            if(OrderType() == 0)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Ask, 0, CLR_NONE))
                    return false;
            }
            else if(OrderType() == 1)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Bid, 0, CLR_NONE))
                    return false;
            }
        }
    }

    return true;
    
}

bool DeleteAllByMagicNumber(int magicNumber)
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderMagicNumber() == magicNumber)
        {
            if(!OrderDelete(OrderTicket()))
                return false;
        }
    }

    return true;
    
}

bool CloseAllPositionsAndDeleteAllOrdersByMagicNumber(int magicNumber)
{
    if(!CloseAllByMagicNumber(magicNumber))
        return false;
    
    if(!DeleteAllByMagicNumber(magicNumber))
        return false;
    
    return true;
}

bool CloseAllByComment(string comment)
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderComment() == comment)
        {
            if(OrderType() == 0)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Ask, 0, CLR_NONE))
                    return false;
            }
            else if(OrderType() == 1)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Bid, 0, CLR_NONE))
                    return false;
            }
        }
    }

    return true;
    
}

bool DeleteAllByComment(string comment)
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderComment() == comment)
        {
            if(!OrderDelete(OrderTicket()))
                return false;
        }
    }

    return true;
    
}

bool CloseAllPositionsAndDeleteAllOrdersByComment(string comment)
{
    if(!CloseAllByComment(comment))
        return false;
    
    if(!DeleteAllByComment(comment))
        return false;
    
    return true;
}

bool CloseAllBuys()
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderType() == 0)
        {
            if(!OrderClose(OrderTicket(), OrderLots(), Ask, 0, CLR_NONE))
                return false;
        }
    }

    return true;
    
}

bool CloseAllSells()
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderType() == 1)
        {
            if(!OrderClose(OrderTicket(), OrderLots(), Bid, 0, CLR_NONE))
                return false;
        }
    }

    return true;
    
}

bool CloseAllBuysBySymbol(string symbol = SYMBOL)
{
    if(OrdersTotal() == 0)
        return true;
    
    if(symbol == SYMBOL)
        symbol = Symbol();

    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderSymbol() == symbol)
        {
            if(OrderType() == 0)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Ask, 0, CLR_NONE))
                    return false;
            }
        }
    }

    return true;
    
}

bool CloseAllSellsBySymbol(string symbol = SYMBOL)
{
    if(OrdersTotal() == 0)
        return true;
    
    if(symbol == SYMBOL)
        symbol = Symbol();

    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderSymbol() == symbol)
        {
            if(OrderType() == 1)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Bid, 0, CLR_NONE))
                    return false;
            }
        }
    }

    return true;
    
}

bool CloseAllBuysByMagicNumber(int magicNumber)
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderMagicNumber() == magicNumber)
        {
            if(OrderType() == 0)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Ask, 0, CLR_NONE))
                    return false;
            }
        }
    }

    return true;
    
}

bool CloseAllSellsByMagicNumber(int magicNumber)
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderMagicNumber() == magicNumber)
        {
            if(OrderType() == 1)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Bid, 0, CLR_NONE))
                    return false;
            }
        }
    }

    return true;
    
}

bool CloseAllBuysByComment(string comment)
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderComment() == comment)
        {
            if(OrderType() == 0)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Ask, 0, CLR_NONE))
                    return false;
            }
        }
    }

    return true;
    
}

bool CloseAllSellsByComment(string comment)
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderComment() == comment)
        {
            if(OrderType() == 1)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Bid, 0, CLR_NONE))
                    return false;
            }
        }
    }

    return true;
    
}

bool CloseAllInProfits()
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderProfit() > 0)
        {
            if(OrderType() == 0)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Ask, 0, CLR_NONE))
                    return false;
            }
            else if(OrderType() == 1)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Bid, 0, CLR_NONE))
                    return false;
            }
        }
    }

    return true;
    
}

bool CloseAllInLosses()
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderProfit() < 0)
        {
            if(OrderType() == 0)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Ask, 0, CLR_NONE))
                    return false;
            }
            else if(OrderType() == 1)
            {
                if(!OrderClose(OrderTicket(), OrderLots(), Bid, 0, CLR_NONE))
                    return false;
            }
        }
    }

    return true;
    
}

bool CloseAllInProfitsByMagicNumber(int magicNumber)
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderMagicNumber() == magicNumber)
        {
            if(OrderProfit() > 0)
            {
                if(OrderType() == 0)
                {
                    if(!OrderClose(OrderTicket(), OrderLots(), Ask, 0, CLR_NONE))
                        return false;
                }
                else if(OrderType() == 1)
                {
                    if(!OrderClose(OrderTicket(), OrderLots(), Bid, 0, CLR_NONE))
                        return false;
                }
            }
        }
    }

    return true;
    
}

bool CloseAllInLossesByMagicNumber(int magicNumber)
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderMagicNumber() == magicNumber)
        {
            if(OrderProfit() < 0)
            {
                if(OrderType() == 0)
                {
                    if(!OrderClose(OrderTicket(), OrderLots(), Ask, 0, CLR_NONE))
                        return false;
                }
                else if(OrderType() == 1)
                {
                    if(!OrderClose(OrderTicket(), OrderLots(), Bid, 0, CLR_NONE))
                        return false;
                }
            }
        }
    }

    return true;
    
}

bool CloseAllInProfitsByComment(string comment)
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderComment() == comment)
        {
            if(OrderProfit() > 0)
            {
                if(OrderType() == 0)
                {
                    if(!OrderClose(OrderTicket(), OrderLots(), Ask, 0, CLR_NONE))
                        return false;
                }
                else if(OrderType() == 1)
                {
                    if(!OrderClose(OrderTicket(), OrderLots(), Bid, 0, CLR_NONE))
                        return false;
                }
            }
        }
    }

    return true;
    
}

bool CloseAllInLossesByComment(string comment)
{
    if(OrdersTotal() == 0)
        return true;
    
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
            return false;

        if(OrderComment() == comment)
        {
            if(OrderProfit() < 0)
            {
                if(OrderType() == 0)
                {
                    if(!OrderClose(OrderTicket(), OrderLots(), Ask, 0, CLR_NONE))
                        return false;
                }
                else if(OrderType() == 1)
                {
                    if(!OrderClose(OrderTicket(), OrderLots(), Bid, 0, CLR_NONE))
                        return false;
                }
            }
        }
    }

    return true;
    
}

