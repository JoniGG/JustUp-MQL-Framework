//--- This class is used to work with logs files
#include "../constants.mqh"

#ifdef __MQL4__
#include "../dics/errorDescriptionMQL4.mqh"
#endif

#ifdef __MQL5__
#include "../dics/errorDescriptionMQL5.mqh"
#endif
#define _LOGS_FILE_CLASS_VERSION_ 2.1

enum ENUM_LOG_MODE
{
    MODE_LOG = 0,
    MODE_ERROR = 1,
    MODE_WARN = 2,
    MODE_INFO = 3,
    MODE_DEBUG = 4
};

class CLogsFile
{
public:

    CLogsFile(string name = "Logs", string path = NULL, bool inCommon = false)
    {
        m_name = name + ".log";
        m_path = path;
        m_inCommon = inCommon;
    }
    void Add(int errorCode = 0, string description = NULL, ENUM_LOG_MODE logMode = MODE_LOG);
    void Initialize();
    void Deinitialize();

private:

    string m_name;
    string m_path;
    bool m_inCommon;
};

//--- This function will add a new line to the logs file
void CLogsFile::Add(int errorCode = 0, string description = NULL, ENUM_LOG_MODE logMode = MODE_LOG)
{   
    int fileHandle = INVALID_HANDLE;
    string mode = "LOG  ";
    bool firstTime = false;

    if(!FileIsExist(m_path + m_name))
        firstTime = true;

    if(logMode == MODE_ERROR)
        mode = "ERROR";
    else if(logMode == MODE_WARN)
        mode = "WARN ";
    else if(logMode == MODE_INFO)
        mode = "INFO ";
    else if(logMode == MODE_DEBUG)
        mode = "DEBUG";

    if(m_inCommon)
    {
        fileHandle =  FileOpen(m_path + m_name, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
    }
    else
    {
        fileHandle = FileOpen(m_path + m_name, FILE_WRITE | FILE_READ | FILE_TXT);
    }

    if(description == NULL)
        description = GetErrorDescription(errorCode);
    
    if(!firstTime)
    {
        FileSeek(fileHandle,0,SEEK_END);
        FileWrite(fileHandle,(TimeToString(TimeCurrent()) + " | " + mode +  " | Error code = " + IntegerToString(errorCode) + " | Description = " + description));
    }
    else
    {
        FileWrite(fileHandle,TimeToString(TimeCurrent()) + " | " + "INFO-" +  " | The Logs Files has been created.");
    }
    
    FileClose(fileHandle);
}

//--- This function will initialize the logs file
void CLogsFile::Initialize()
{
    int fileHandle = INVALID_HANDLE;

    if(m_inCommon)
    {
        fileHandle =  FileOpen(m_path + m_name, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
    }
    else
    {
        fileHandle = FileOpen(m_path + m_name, FILE_WRITE | FILE_READ | FILE_TXT);
    }

    FileSeek(fileHandle,0,SEEK_END);
    FileWrite(fileHandle,(TimeToString(TimeCurrent()) + " | " + "INIT " +  " | The Logs Files has been initialized------------------------------------------------------------"));
    FileClose(fileHandle);
}

//--- This function will deinitialize the logs file
void CLogsFile::Deinitialize()
{
    int fileHandle = INVALID_HANDLE;

    if(m_inCommon)
    {
        fileHandle =  FileOpen(m_path + m_name, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
    }
    else
    {
        fileHandle = FileOpen(m_path + m_name, FILE_WRITE | FILE_READ | FILE_TXT);
    }

    FileSeek(fileHandle,0,SEEK_END);
    FileWrite(fileHandle,(TimeToString(TimeCurrent()) + " | " + "DEINIT" +  "| The Logs Files has been deinitialized----------------------------------------------------------\n"));
    FileClose(fileHandle);
}