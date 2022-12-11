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
    double nTickValue = SymbolInfoDouble(symbol,SYMBOL_TRADE_TICK_VALUE);
    double moneyAtRisk = AccountInfoDouble(ACCOUNT_BALANCE) * riskPercent / 100;

    if(Digits() == 3 || Digits() == 5)
        nTickValue *= 10;
    
    lotSize = moneyAtRisk / (nTickValue * stopLossPips);
    lotSize = MathRound(lotSize / SymbolInfoDouble(symbol,SYMBOL_VOLUME_STEP)) * SymbolInfoDouble(symbol,SYMBOL_VOLUME_STEP);

    return lotSize;
}