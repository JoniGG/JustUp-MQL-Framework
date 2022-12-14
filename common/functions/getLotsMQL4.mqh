//--- Function that return the lot size for a position based on the risk
#include "../constants.mqh"
#ifdef _MQL5_
    #include "../packages/Mql4InMql5.mqh"
#endif
#define _GET_LOTS_FUNCTION_VERSION_ 1.0

double GetLots(double stopLossPips, double riskPercent, string symbol = SYMBOL)
{
    //--- Verify the input parameters
    if (stopLossPips <= 0 || riskPercent <= 0)
        return(0);
    
    if(symbol == SYMBOL)
        symbol = Symbol();
    
    //--- Calculate the LotSize
    double lotSize = 0;
    double nTickValue = MarketInfo(symbol, MODE_TICKVALUE);
    double moneyAtRisk = AccountBalance() * riskPercent / 100;

    if(Digits == 3 || Digits == 5)
        nTickValue *= 10;
    
    lotSize = moneyAtRisk / (nTickValue * stopLossPips);
    lotSize = MathRound(lotSize / MarketInfo(symbol, MODE_LOTSTEP)) * MarketInfo(symbol, MODE_LOTSTEP);

    return lotSize;
}