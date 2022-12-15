//--- Candlesticks patterns class to handle candlestick patterns in MQL4
#include "../enums/candlesticksPatterns.mqh"
#include "../constants.mqh"
#define _CANDLESTICKS_PATTERNS_CLASS_VERSION_ 1.0

//--- Candlesticks patterns class
class CCandlesticksPatterns
{
public:
            CCandlesticksPatterns(string symbol = SYMBOL, ENUM_TIMEFRAMES timeframe = PERIOD_CURRENT);
            bool inCandlestickPattern(CandlesticksPatterns pattern, int lastCandleIndex = 1);
            
private:
            string m_symbol;
            ENUM_TIMEFRAMES m_timeframe;
            bool IsBullish(int candlePos)
               {
                  return (iOpen(m_symbol,m_timeframe,candlePos) < iClose(m_symbol,m_timeframe,candlePos));
               }
};

//--- Constructor
CCandlesticksPatterns::CCandlesticksPatterns(string symbol = SYMBOL, ENUM_TIMEFRAMES timeframe = PERIOD_CURRENT)
{
    if(symbol == SYMBOL)
      m_symbol = Symbol();
    else
      m_symbol = symbol;
      
    m_timeframe = timeframe;
}

bool CCandlesticksPatterns::inCandlestickPattern(CandlesticksPatterns pattern, int lastCandleIndex = 1)
{
    //--- Pre-verifications
    if (lastCandleIndex < 1 || lastCandleIndex > 37)
        return false;
    
    //--- Controller
    int i = lastCandleIndex;
    
    //---------------------------------------------------------------------------------------------------| One candle patterns
    //--- Detect the hammer
    if (pattern == hammer)
    {
        if(IsBullish(i) && iClose(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i) > 0 && iOpen(m_symbol,m_timeframe,i) - iLow(m_symbol,m_timeframe,i) > 2 * (iClose(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i)))
            return true;
        else
            return false;
    }

    //--- Detect the hanging man
    if (pattern == hangingMan)
    {
        if(!IsBullish(i) && iClose(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i) > 0 && iClose(m_symbol,m_timeframe,i) - iLow(m_symbol,m_timeframe,i) > 2 * (iOpen(m_symbol,m_timeframe,i) - iClose(m_symbol,m_timeframe,i)))
            return true;
        else
            return false;
    }

    //--- Detect the inverted hammer
    if (pattern == invertedHammer)
    {
        if(IsBullish(i) && iClose(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i) > 0 && iHigh(m_symbol,m_timeframe,i) - iClose(m_symbol,m_timeframe,i) > 2 * (iClose(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i)))
            return true;
        else
            return false;
    }

    //--- Detect the shooting star
    if (pattern == shootingStar)
    {
        if(!IsBullish(i) && iOpen(m_symbol,m_timeframe,i) - iClose(m_symbol,m_timeframe,i) > 0 && iHigh(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i) > 2 * (iOpen(m_symbol,m_timeframe,i) - iClose(m_symbol,m_timeframe,i)))
            return true;
        else
            return false;
    }

    //--- Detect the Dragonfly Doji
    if (pattern == dragonflyDoji)
    {
        if(iClose(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i) == 0 && iHigh(m_symbol,m_timeframe,i) == iOpen(m_symbol,m_timeframe,i) && iHigh(m_symbol,m_timeframe,i) == iClose(m_symbol,m_timeframe,i))
            return true;
        else
            return false;
    }

    //--- Detect the Gravestone Doji
    if (pattern == gravestoneDoji)
    {
        if(iClose(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i) == 0 && iLow(m_symbol,m_timeframe,i) == iOpen(m_symbol,m_timeframe,i) && iLow(m_symbol,m_timeframe,i) == iClose(m_symbol,m_timeframe,i))
            return true;
        else
            return false;
    }

    //--- Detect the bullish spinning top
    if (pattern == bullishSpinningTop)
    {
        if(IsBullish(i) && iClose(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i) > 0 && iClose(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i) < 2 * (iOpen(m_symbol,m_timeframe,i) - iLow(m_symbol,m_timeframe,i)) && iClose(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i) < 2 * (iHigh(m_symbol,m_timeframe,i) - iClose(m_symbol,m_timeframe,i)))
            return true;
        else
            return false;
    }

    //--- Detect the bearish spinning top
    if (pattern == bearishSpinningTop)
    {
        if(!IsBullish(i) && iOpen(m_symbol,m_timeframe,i) - iClose(m_symbol,m_timeframe,i) > 0 && iOpen(m_symbol,m_timeframe,i) - iClose(m_symbol,m_timeframe,i) < 2 * (iClose(m_symbol,m_timeframe,i) - iLow(m_symbol,m_timeframe,i)) && iOpen(m_symbol,m_timeframe,i) - iClose(m_symbol,m_timeframe,i) < 2 * (iHigh(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i)))
            return true;
        else
            return false;
    }

    //---------------------------------------------------------------------------------------------------| Two candles patterns
    //--- Detect the bullish kicker
    if (pattern == bullishKicker)
    {
        if(IsBullish(i) && !IsBullish(i + 1) && iOpen(m_symbol,m_timeframe,i) > iOpen(m_symbol,m_timeframe,i + 1))
            return true;
        else
            return false;
    }

    //--- Detect the bearish kicker
    if (pattern == bearishKicker)
    {
        if(!IsBullish(i) && IsBullish(i + 1) && iOpen(m_symbol,m_timeframe,i) < iOpen(m_symbol,m_timeframe,i + 1))
            return true;
        else
            return false;
    }

    //--- Detect the bullish engulfing
    if (pattern == bullishEngulfing)
    {
        if(IsBullish(i) && !IsBullish(i + 1) && iClose(m_symbol,m_timeframe,i) > iOpen(m_symbol,m_timeframe,i + 1) && iOpen(m_symbol,m_timeframe,i) <= iClose(m_symbol,m_timeframe,i + 1))
            return true;
        else
            return false;
    }

    //--- Detect the bearish engulfing
    if (pattern == bearishEngulfing)
    {
        if(!IsBullish(i) && IsBullish(i + 1) && iOpen(m_symbol,m_timeframe,i) > iClose(m_symbol,m_timeframe,i + 1) && iClose(m_symbol,m_timeframe,i) <= iOpen(m_symbol,m_timeframe,i + 1))
            return true;
        else
            return false;
    }

    //--- Detect the bullish harami
    if (pattern == bullishHarami)
    {
        if(IsBullish(i) && !IsBullish(i + 1) && iClose(m_symbol,m_timeframe,i) < iOpen(m_symbol,m_timeframe,i + 1) && iOpen(m_symbol,m_timeframe,i) > iClose(m_symbol,m_timeframe,i + 1))
            return true;
        else
            return false;
    }

    //--- Detect the bearish harami
    if (pattern == bearishHarami)
    {
        if(!IsBullish(i) && IsBullish(i + 1) && iOpen(m_symbol,m_timeframe,i) < iClose(m_symbol,m_timeframe,i + 1) && iClose(m_symbol,m_timeframe,i) > iOpen(m_symbol,m_timeframe,i + 1))
            return true;
        else
            return false;
    }

    //--- Detect the Piercing Line
    if (pattern == piercingLine)
    {
        if(IsBullish(i) && !IsBullish(i + 1) && iClose(m_symbol,m_timeframe,i) < iOpen(m_symbol,m_timeframe,i + 1) && iOpen(m_symbol,m_timeframe,i) < iClose(m_symbol,m_timeframe,i + 1))
            return true;
        else
            return false;
    }

    //--- Detect the Dark Cloud Cover
    if (pattern == darkCloudCover)
    {
        if(!IsBullish(i) && IsBullish(i + 1) && iOpen(m_symbol,m_timeframe,i) > iClose(m_symbol,m_timeframe,i + 1) && iClose(m_symbol,m_timeframe,i) > iOpen(m_symbol,m_timeframe,i + 1))
            return true;
        else
            return false;
    }

    //--- Detect the Tweezer Bottom
    if (pattern == tweezerBottom)
    {
        if(IsBullish(i) && !IsBullish(i + 1) && iOpen(m_symbol,m_timeframe,i) == iClose(m_symbol,m_timeframe,i + 1) && iClose(m_symbol,m_timeframe,i) < iOpen(m_symbol,m_timeframe,i + 1) - 2 * (iOpen(m_symbol,m_timeframe,i + 1) - iClose(m_symbol,m_timeframe,i + 1)))
            return true;
        else
            return false;
    }

    //--- Detect the Tweezer Top
    if (pattern == tweezerTop)
    {
        if(!IsBullish(i) && IsBullish(i + 1) && iOpen(m_symbol,m_timeframe,i) == iClose(m_symbol,m_timeframe,i + 1) && iClose(m_symbol,m_timeframe,i) > iOpen(m_symbol,m_timeframe,i + 1) + 2 * (iOpen(m_symbol,m_timeframe,i + 1) - iClose(m_symbol,m_timeframe,i + 1)))
            return true;
        else
            return false;
    }

    //---------------------------------------------------------------------------------------------------| Three candles patterns
    //--- Detect the Morning Star
    if (pattern == morningStar)
    {
        if(IsBullish(i) && !IsBullish(i + 1) && !IsBullish(i + 2) && iOpen(m_symbol,m_timeframe,i) >= iOpen(m_symbol,m_timeframe,i + 1) && iOpen(m_symbol,m_timeframe,i+1) < iClose(m_symbol,m_timeframe,i+1) && iOpen(m_symbol,m_timeframe,i+1) < iClose(m_symbol,m_timeframe,i+2))
            return true;
        else
            return false;
    }

    //--- Detect the Evening Star
    if (pattern == eveningStar)
    {
        if(!IsBullish(i) && IsBullish(i + 1) && IsBullish(i + 2) && iOpen(m_symbol,m_timeframe,i) <= iOpen(m_symbol,m_timeframe,i + 1) && iOpen(m_symbol,m_timeframe,i+1) > iClose(m_symbol,m_timeframe,i+1) && iOpen(m_symbol,m_timeframe,i+1) > iClose(m_symbol,m_timeframe,i+2))
            return true;
        else
            return false;
    }

    //--- Detect the Morning Doji Star
    if (pattern == morningStar)
    {
        if(IsBullish(i) && !IsBullish(i + 1) && !IsBullish(i + 2) && iOpen(m_symbol,m_timeframe,i) >= iOpen(m_symbol,m_timeframe,i + 1) && iOpen(m_symbol,m_timeframe,i+1) == iClose(m_symbol,m_timeframe,i+1) && iOpen(m_symbol,m_timeframe,i+1) < iClose(m_symbol,m_timeframe,i+2))
            return true;
        else
            return false;
    }

    //--- Detect the Evening Doji Star
    if (pattern == eveningStar)
    {
        if(!IsBullish(i) && IsBullish(i + 1) && IsBullish(i + 2) && iOpen(m_symbol,m_timeframe,i) <= iOpen(m_symbol,m_timeframe,i + 1) && iOpen(m_symbol,m_timeframe,i+1) == iClose(m_symbol,m_timeframe,i+1) && iOpen(m_symbol,m_timeframe,i+1) > iClose(m_symbol,m_timeframe,i+2))
            return true;
        else
            return false;
    }

    //--- Detect the bullish Abandoned Baby
    if (pattern == bullishAbandonedBaby)
    {
        if(IsBullish(i) && IsBullish(i + 1) && !IsBullish(i + 2) && iLow(m_symbol,m_timeframe,i) > iHigh(m_symbol,m_timeframe,i+1) && iHigh(m_symbol,m_timeframe,i+1) < iLow(m_symbol,m_timeframe,i+2))
            return true;
        else
            return false;
    }

    //--- Detect the bearish Abandoned Baby
    if (pattern == bearishAbandonedBaby)
    {
        if(!IsBullish(i) && !IsBullish(i + 1) && IsBullish(i + 2) && iLow(m_symbol,m_timeframe,i) > iHigh(m_symbol,m_timeframe,i+1) && iHigh(m_symbol,m_timeframe,i+1) < iLow(m_symbol,m_timeframe,i+2))
            return true;
        else
            return false;
    }
    
    //--- Detect the bullish Three White Soldiers
    if (pattern == threeWhiteSoldiers)
    {
        if(IsBullish(i) && IsBullish(i + 1) && IsBullish(i + 2) && iClose(m_symbol,m_timeframe,i) > iClose(m_symbol,m_timeframe,i+1) && iOpen(m_symbol,m_timeframe,i) > iOpen(m_symbol,m_timeframe,i+1) && iClose(m_symbol,m_timeframe,i+1) > iClose(m_symbol,m_timeframe,i+2) && iOpen(m_symbol,m_timeframe,i+1) > iOpen(m_symbol,m_timeframe,i+2))
            return true;
        else
            return false;
    }

    //--- Detect the bearish Three Black Crows
    if (pattern == threeBlackCrows)
    {
        if(!IsBullish(i) && !IsBullish(i + 1) && !IsBullish(i + 2) && iClose(m_symbol,m_timeframe,i) < iClose(m_symbol,m_timeframe,i+1) && iOpen(m_symbol,m_timeframe,i) < iOpen(m_symbol,m_timeframe,i+1) && iClose(m_symbol,m_timeframe,i+1) < iClose(m_symbol,m_timeframe,i+2) && iOpen(m_symbol,m_timeframe,i+1) < iOpen(m_symbol,m_timeframe,i+2))
            return true;
        else
            return false;
    }

    //--- Detect the bullish Three Line Strike
    if (pattern == bullishThreeLineStrike)
    {
        if(IsBullish(i) && !IsBullish(i + 1) && !IsBullish(i + 2) && !IsBullish(i+3) && iClose(m_symbol,m_timeframe,i) > iOpen(m_symbol,m_timeframe,i+3) && iOpen(m_symbol,m_timeframe,i) <= iClose(m_symbol,m_timeframe,i+3))
            return true;
        else
            return false;
    }

    //--- Detect the bearish Three Line Strike
    if (pattern == bearishThreeLineStrike)
    {
        if(!IsBullish(i) && IsBullish(i + 1) && IsBullish(i + 2) && IsBullish(i+3) && iClose(m_symbol,m_timeframe,i) < iOpen(m_symbol,m_timeframe,i+3) && iOpen(m_symbol,m_timeframe,i) >= iClose(m_symbol,m_timeframe,i+3))
            return true;
        else
            return false;
    }

    //--- Detect the Three Inside Up
    if (pattern == threeInsideUp)
    {
        if(IsBullish(i) && IsBullish(i + 1) && !IsBullish(i + 2) && iClose(m_symbol,m_timeframe,i) > iClose(m_symbol,m_timeframe,i+1) && iClose(m_symbol,m_timeframe,i+1) < iOpen(m_symbol,m_timeframe,i+2) && iOpen(m_symbol,m_timeframe,i+1) < iClose(m_symbol,m_timeframe,i+2))
            return true;
        else
            return false;
    }

    //--- Detect the Three Inside Down
    if (pattern == threeInsideDown)
    {
        if(!IsBullish(i) && !IsBullish(i + 1) && IsBullish(i + 2) && iClose(m_symbol,m_timeframe,i) < iClose(m_symbol,m_timeframe,i+1) && iClose(m_symbol,m_timeframe,i+1) > iOpen(m_symbol,m_timeframe,i+2) && iOpen(m_symbol,m_timeframe,i+1) > iClose(m_symbol,m_timeframe,i+2))
            return true;
        else
            return false;
    }

    //--- Detect the Three Outside Up
    if (pattern == threeOutsideUp)
    {
        if(IsBullish(i) && IsBullish(i + 1) && !IsBullish(i + 2) && iClose(m_symbol,m_timeframe,i) > iClose(m_symbol,m_timeframe,i+1) && iClose(m_symbol,m_timeframe,i+1) > iOpen(m_symbol,m_timeframe,i+2) && iOpen(m_symbol,m_timeframe,i) < iClose(m_symbol,m_timeframe,i+2))
            return true;
        else
            return false;
    }

    //--- Detect the Three Outside Down
    if (pattern == threeOutsideDown)
    {
        if(!IsBullish(i) && !IsBullish(i + 1) && IsBullish(i + 2) && iClose(m_symbol,m_timeframe,i) < iClose(m_symbol,m_timeframe,i+1) && iClose(m_symbol,m_timeframe,i+1) < iOpen(m_symbol,m_timeframe,i+2) && iOpen(m_symbol,m_timeframe,i) > iClose(m_symbol,m_timeframe,i+2))
            return true;
        else
            return false;
    }

    //---------------------------------------------------------------------------------------------------| Neutral candles patterns
    //--- Detect the Doji
    if (pattern == doji)
    {
        if(iOpen(m_symbol,m_timeframe,i) == iClose(m_symbol,m_timeframe,i))
            return true;
        else
            return false;
    }

    //--- Detect the Marubozu
    if (pattern == marubozu)
    {
        if(!IsBullish(i))
        {
            if(IsBullish(i+1) && iOpen(m_symbol,m_timeframe,i) == iClose(m_symbol,m_timeframe,i+1) && iClose(m_symbol,m_timeframe,i) == iOpen(m_symbol,m_timeframe,i+1))
                return true;
            else
                return false;
        }
        else
        {
            if(!IsBullish(i+1) && iOpen(m_symbol,m_timeframe,i) == iClose(m_symbol,m_timeframe,i+1) && iClose(m_symbol,m_timeframe,i) == iOpen(m_symbol,m_timeframe,i+1))
                return true;
            else
                return false;
        }
    }

    //--- Detect the Double Spinning Tops
    if (pattern == doubleSpinningTop)
    {
        if(IsBullish(i))
        {
                    if(IsBullish(i) && iClose(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i) > 0 && iClose(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i) < 2 * (iOpen(m_symbol,m_timeframe,i) - iLow(m_symbol,m_timeframe,i)) && iClose(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i) < 2 * (iHigh(m_symbol,m_timeframe,i) - iClose(m_symbol,m_timeframe,i)) &&
                       IsBullish(i+1) && iClose(m_symbol,m_timeframe,i+1) - iOpen(m_symbol,m_timeframe,i+1) > 0 && iClose(m_symbol,m_timeframe,i+1) - iOpen(m_symbol,m_timeframe,i+1) < 2 * (iOpen(m_symbol,m_timeframe,i+1) - iLow(m_symbol,m_timeframe,i+1)) && iClose(m_symbol,m_timeframe,i+1) - iOpen(m_symbol,m_timeframe,i+1) < 2 * (iHigh(m_symbol,m_timeframe,i+1) - iClose(m_symbol,m_timeframe,i+1)))
                    {
                        return true;
                    }
                    else
                        return false;
        }
        else
        {
                    if(!IsBullish(i) && iOpen(m_symbol,m_timeframe,i) - iClose(m_symbol,m_timeframe,i) > 0 && iOpen(m_symbol,m_timeframe,i) - iClose(m_symbol,m_timeframe,i) < 2 * (iClose(m_symbol,m_timeframe,i) - iLow(m_symbol,m_timeframe,i)) && iOpen(m_symbol,m_timeframe,i) - iClose(m_symbol,m_timeframe,i) < 2 * (iHigh(m_symbol,m_timeframe,i) - iOpen(m_symbol,m_timeframe,i)) &&
                       !IsBullish(i+1) && iOpen(m_symbol,m_timeframe,i+1) - iClose(m_symbol,m_timeframe,i+1) > 0 && iOpen(m_symbol,m_timeframe,i+1) - iClose(m_symbol,m_timeframe,i+1) < 2 * (iClose(m_symbol,m_timeframe,i+1) - iLow(m_symbol,m_timeframe,i+1)) && iOpen(m_symbol,m_timeframe,i+1) - iClose(m_symbol,m_timeframe,i+1) < 2 * (iHigh(m_symbol,m_timeframe,i+1) - iOpen(m_symbol,m_timeframe,i+1)))
                    {
                        return true;
                    }
                    else
                        return false;
        }
    }

    return false;
}