//--- Package of functions

//--- Calculate LotSize
double CalculateLotSize(double stopLossPips, double riskPercent, string symbol = "CHART")
{
    //--- Verify the input parameters
    if (stopLossPips <= 0 || riskPercent <= 0)
        return(0);
    
    if(symbol == "CHART")
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