//--- New Candle Event Handler
#define _NEW_CANDLE_EVENT_CLASS_VERSION_ 2.0

class CNewCandleEvent
{
public:
         CNewCandleEvent(ENUM_TIMEFRAMES timeframe)
         {
            m_timeframe = timeframe;
            m_lastCandleTime = 0;
         }
        
        bool NewCandleEvent();
private:
        ENUM_TIMEFRAMES m_timeframe;
        datetime m_lastCandleTime;
};

//--- New Candle Event Handler
bool CNewCandleEvent::NewCandleEvent()
{
    if(m_lastCandleTime != iTime(NULL, m_timeframe, 0))
    {
        //--- On initialization will not send a signal
        if(m_lastCandleTime != 0)
        {
            m_lastCandleTime = iTime(NULL, m_timeframe, 0);
            return(true);
        }
        else
        {
            m_lastCandleTime = iTime(NULL, m_timeframe, 0);
            return(false);
        }
    }

    return(false);
}