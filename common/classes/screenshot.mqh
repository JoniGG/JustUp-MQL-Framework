//--- This class is used to work with chart screenshots
#define _SCREENSHOT_CLASS_VERSION_ 1.0

class CScreenshot
{
public:
    CScreenshot(int Chartid = 0, string name = "screenshot", string path = "", string mode = "16:9", int resMultiplier = 1)
    {
        if(resMultiplier > 10)
            resMultiplier = 10;
        if(resMultiplier < 1)
            resMultiplier = 1;
        
        m_name = name;
        m_path = path;
        m_mode = mode;
        m_multiplier = resMultiplier;
        m_height = 1080;
        m_window = Chartid;

        if(m_mode == "21:9")
        {
            m_width = (int)MathRound(m_height * 2.33);
        }
        else if (m_mode == "16:9")
        {
            m_width = (int)MathRound(m_height * 1.78);
        }
        else if (m_mode == "4:3")
        {
            m_width = (int)MathRound(m_height * 1.33);
        }
        else
        {
            m_width = 1082 * m_multiplier;
        }

        m_width *= m_multiplier;
        m_height *= m_multiplier;
    }
    void Take();
    string GetLastScreenshotName() { return lastScreenshotName; }
    string GetLastScreenshotPath() { return lastScreenshotPath; }
    string GetLastScreenshotFullPath() { return lastScreenshotFullPath; }

private:
    string m_name;
    string m_path;
    int m_width;
    int m_height;
    int m_multiplier;
    string m_mode;
    int m_window;

    string lastScreenshotName;
    string lastScreenshotPath;
    string lastScreenshotFullPath;
};

//--- Will take a screenshot of the chart
void CScreenshot::Take()
{
    int add = 0;

    if(FileIsExist(m_path + m_name + ".png"))
    {
        while(FileIsExist(m_path + m_name + "_" + add + ".png"))
        {
            add++;
        }
        m_name += "_" + add;
    }
    
    string screenshotName = m_name + ".png";
    string screenshotPath = m_path;
    string screenshotFullPath = screenshotPath + screenshotName;

    //ChartScreenShot(0,screenshotFullPath, 1922, 1080, ALIGN_CENTER);
    ChartScreenShot(m_window, screenshotFullPath, m_width, m_height, ALIGN_CENTER);

    lastScreenshotName = screenshotName;
    lastScreenshotPath = screenshotPath;
    lastScreenshotFullPath = screenshotFullPath;
}