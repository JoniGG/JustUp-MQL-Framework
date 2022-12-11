//--- CNewCandleClass class that send a signal when a new candle is formed

class CNewCandle
{
public:
        CNewCandle(ENUM_TIMEFRAMES timeframe, string symbol = "CHART")
        {
            m_timeframe = timeframe;
            m_symbol = symbol;
            m_lastCandleTime = 0;
        }
        bool NewCandleEvent();
private:
        ENUM_TIMEFRAMES m_timeframe;
        string m_symbol;
        datetime m_lastCandleTime;
};

bool CNewCandle::NewCandleEvent()
{
    if(m_lastCandleTime != iTime(m_symbol, m_timeframe, 0))
    {
        //--- On initialization will not send a signal
        if(m_lastCandleTime != 0)
        {
            m_lastCandleTime = iTime(m_symbol, m_timeframe, 0);
            return(true);
        }
        else
        {
            m_lastCandleTime = iTime(m_symbol, m_timeframe, 0);
            return(false);
        }
    }

    return(false);
}