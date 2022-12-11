//--- Will handle the screenshot of the chart

class CScreenshot
{
    //--- Constructor
    CScreenshot(string name, string path, string mode = "16:9", int resMultiplier = 1, int chartId = 0)
    {
        if(resMultiplier > 10)
            resMultiplier = 10;
        
        m_name = name;
        m_path = path;
        m_mode = mode;
        m_multiplier = resMultiplier;
        m_ext = ".png";
        m_width = 1920 * m_multiplier;
        m_chartId = chartId;

        if(m_mode == "21:9")
        {
            m_height = (int)MathRound(m_width * 2.33) * m_multiplier;
        }
        else if (m_mode == "16:9")
        {
            m_height = (int)MathRound(m_width * 1.78) * m_multiplier;
        }
        else if (m_mode == "4:3")
        {
            m_height = (int)MathRound(m_width * 1.33) * m_multiplier;
        }
        else
        {
            m_height = 1082 * m_multiplier;
        }
    }

    bool Take();
    bool DeleteLast();
    string GetLastScreenshotFullPath() { return lastScreenshotFullPath; }
    string GetLastScreenshotPath() { return lastScreenshotPath; }
    string GetLastScreenshotName() { return lastScreenshotName; }

private:
    string m_name;
    string m_path;
    string m_ext;
    int m_width;
    int m_height;
    int m_multiplier;
    string m_mode;
    int m_chartId;

    string lastScreenshotName;
    string lastScreenshotPath;
    string lastScreenshotFullPath;
};

//--- Will take a screenshot of the chart
bool CScreenshot::Take()
{
    string screenshotName = m_name + "_" + TimeToString(TimeCurrent(), TIME_DATE | TIME_SECONDS) + m_ext;
    string screenshotPath = m_path + screenshotName;
    string screenshotFullPath = screenshotPath + screenshotName;
    screenshotFullPath += "_" + TimeToString(TimeCurrent(), TIME_DATE | TIME_SECONDS) + m_ext;

    ChartScreenShot(m_chartId,screenshotPath, m_width, m_height, ALIGN_CENTER);

    if(!FileIsExist(screenshotFullPath))
    {
        Print("It was an error while taking the screenshot.");
        return false;
    }
    else
    {
        Print("Screenshot taken successfully.");
        return true;
    }

    lastScreenshotName = screenshotName;
    lastScreenshotPath = screenshotPath;
    lastScreenshotFullPath = screenshotFullPath;
}

//--- Will delete the last screenshot taken
bool CScreenshot::DeleteLast()
{
    if(!FileDelete(lastScreenshotFullPath))
    {
        Print("It was an error while deleting the screenshot.");
        return false;
    }
    else
    {
        Print("Screenshot deleted successfully.");
        return true;
    }
}