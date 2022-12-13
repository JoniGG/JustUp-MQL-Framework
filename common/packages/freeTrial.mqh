//--- Function package that will help you to handle free trials
#define _FREE_TRIAL_PACKAGE_VERSION_ 1.0

//--- Function that check is a free trial is over - D'2025.01.01 00:00'
bool IsFreeTrialOver(datetime start, int days)
{
    datetime now = TimeCurrent();
    datetime end = start + (days * 24 * 60 * 60);

    if(now > end)
        return true;
    
    return false;
}

//--- Function that will return the number of days left in the free trial
int GetFreeTrialDaysLeft(datetime start, int days)
{
    datetime now = TimeCurrent();
    datetime end = start + (days * 24 * 60 * 60);

    if(now > end)
        return 0;
    
    return (int)MathRound((end - now) / (24 * 60 * 60));
}

//--- Function that will return the number of hours left in the free trial
int GetFreeTrialHoursLeft(datetime start, int days)
{
    datetime now = TimeCurrent();
    datetime end = start + (days * 24 * 60 * 60);

    if(now > end)
        return 0;
    
    return (int)MathRound((end - now) / (60 * 60));
}

//--- Function that will return the number of minutes left in the free trial
int GetFreeTrialMinutesLeft(datetime start, int days)
{
    datetime now = TimeCurrent();
    datetime end = start + (days * 24 * 60 * 60);

    if(now > end)
        return 0;
    
    return (int)MathRound((end - now) / 60);
}

//--- Function that will return the number of seconds left in the free trial
int GetFreeTrialSecondsLeft(datetime start, int days)
{
    datetime now = TimeCurrent();
    datetime end = start + (days * 24 * 60 * 60);

    if(now > end)
        return 0;
    
    return (int)MathRound(end - now);
}