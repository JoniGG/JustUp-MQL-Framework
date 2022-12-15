//--- This dictionary will handle timeframes from the ENUM_TIMEFRAMES and the enum Timeframes (from this framework).
#include "../enums/timeframes.mqh"
#define _TIMEFRAMES_DICTIONARY_VERSION_ 1.0

//--- Timeframes dictionary from the framework timeframes enumerator
ENUM_TIMEFRAMES GetPeriod(Timeframes tf)
{
        if(tf == TF_CURRENT)
            return PERIOD_CURRENT;
        if(tf == TF_M1)
            return PERIOD_M1;
        if(tf == TF_M5)
            return PERIOD_M5;
        if(tf == TF_M15)
            return PERIOD_M15;
        if(tf == TF_M30)
            return PERIOD_M30;
        if(tf == TF_H1)
            return PERIOD_H1;
        if(tf == TF_H4)
            return PERIOD_H4;
        if(tf == TF_D1)
            return PERIOD_D1;
        if(tf == TF_W1)
            return PERIOD_W1;
        if(tf == TF_MN1)
            return PERIOD_MN1;
      
      return PERIOD_CURRENT;
}

//--- Get the timeframe name from the framework timeframes enumerator
string GetTimeframeName(Timeframes tf)
{
        if(tf == TF_CURRENT)
            return "current";
        if(tf == TF_M1)
            return "1-minute timeframe";
        if(tf == TF_M5)
            return "5-minute timeframe";
        if(tf == TF_M15)
            return "15-minute timeframe";
        if(tf == TF_M30)
            return "30-minute timeframe";
        if(tf == TF_H1)
            return "1-hour timeframe";
        if(tf == TF_H4)
            return "4-hour timeframe";
        if(tf == TF_D1)
            return "1-day timeframe";
        if(tf == TF_W1)
            return "1-week timeframe";
        if(tf == TF_MN1)
            return "1-month timeframe";
      
      return "Current";
}

//--- Timeframes dictionary from the MetaTrader timeframes enumerator
string GetPeriodName(ENUM_TIMEFRAMES period)
{
        if(period == PERIOD_CURRENT)
            return "current";
        if(period == PERIOD_M1)
            return "1-minute timeframe";
        if(period == PERIOD_M5)
            return "5-minute timeframe";
        if(period == PERIOD_M15)
            return "15-minute timeframe";
        if(period == PERIOD_M30)
            return "30-minute timeframe";
        if(period == PERIOD_H1)
            return "1-hour timeframe";
        if(period == PERIOD_H4)
            return "4-hour timeframe";
        if(period == PERIOD_D1)
            return "1-day timeframe";
        if(period == PERIOD_W1)
            return "1-week timeframe";
        if(period == PERIOD_MN1)
            return "1-month timeframe";
      
      return "Current";
}