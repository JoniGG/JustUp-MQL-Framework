//--- This class is used to work with logs files
#define _LOGS_FILE_CLASS_VERSION_ 1.1

class CLogsFile
{
public:
    CLogsFile(string fileName, string filePath, bool inCommonFolder=false)
    {
        m_fileName=fileName;
        m_filePath=filePath;
        m_inCommonFolder=inCommonFolder;
        m_hFile=GetFileHandle();
        FileWrite(m_hFile, "Log file created at: " + TimeToString(TimeCurrent(), TIME_DATE | TIME_SECONDS));
        FileClose(m_hFile);
    }
    bool Add(string title, string message, string location);
    bool LogsInit();
    bool LogsDeInit();

private:
    string m_fileName;
    string m_filePath;
    bool m_inCommonFolder;
    int m_hFile;
    int GetFileHandle();
};

//--- Returns the file handle
int CLogsFile::GetFileHandle()
{
    string fullPath = m_filePath + m_fileName;

    //--- Creates/Opens a TXT file
    if(m_inCommonFolder)
    {
        m_hFile = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
    }
    else
    {
        m_hFile = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
    }

    return m_hFile;
}

//--- Adds a log to the file
bool CLogsFile::Add(string title, string message, string location)
{
    bool res = false;
    m_hFile = GetFileHandle();

    FileSeek(m_hFile, 0, SEEK_END);
    if(FileWrite(m_hFile, TimeToString(TimeCurrent(), TIME_DATE | TIME_SECONDS) + " | " + title + " | " + message + " | " + location + "n"))
    {
        res = true;
    }

    FileClose(m_hFile);
    return res;
}

//--- Initializes the logs file
bool CLogsFile::LogsInit()
{
    bool res = false;
    m_hFile = GetFileHandle();

    FileSeek(m_hFile, 0, SEEK_END);
    if(FileWrite(m_hFile, TimeToString(TimeCurrent(), TIME_DATE | TIME_SECONDS) + " | " + "Logs file initialized"))
    {
        res = true;
    }

    FileClose(m_hFile);
    return res;
}

//--- Deinitializes the logs file
bool CLogsFile::LogsDeInit()
{
    bool res = false;
    m_hFile = GetFileHandle();

    FileSeek(m_hFile, 0, SEEK_END);
    if(FileWrite(m_hFile, TimeToString(TimeCurrent(), TIME_DATE | TIME_SECONDS) + " | " + "Logs file deinitialized"))
    {
        res = true;
    }

    FileClose(m_hFile);
    return res;
}