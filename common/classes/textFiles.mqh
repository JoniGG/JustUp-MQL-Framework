//--- This class is used to work with files
#include "../packages/printExtended.mqh"
#define _TEXT_FILES_CLASS_VERSION_ 2.0

enum ENUM_FILE_TYPE
{
    TXT = 0,
    DAT = 1,
    LOGS = 2
};

class CTextFiles
{
public:

    //--- Constructor
    CTextFiles(string name, string path = NULL, bool commonFlag = false, ENUM_FILE_TYPE fileType = TXT)
    {
        m_hFile = INVALID_HANDLE;
        m_fileName = name;
        m_filePath = path;
        m_inCommonFolder = commonFlag;

        if(fileType == TXT)
        {
            m_fileExtension = ".txt";
        }
        else if(fileType == DAT)
        {
            m_fileExtension = ".dat";
        }
        else if(fileType == LOGS)
        {
            m_fileExtension = ".logs";
        }
        else
        {
            m_fileExtension = ".txt";
        }

    }
    bool Create(string baseText = "");
    bool AddText(string text);
    string Read();
    string ReadLine(int lineNum);
    int CountLines();
    bool DeleteLine(int lineNum);
    int GetLinePosition(string textToFind);
    bool Rename(string newName);
    bool Move(string newPath, bool deleteFolder = false);
    bool Delete();

    //--- Getters
    string GetFileName() { return m_fileName; }
    string GetFilePath() { return m_filePath; }
    string GetFileExtension() { return m_fileExtension; }
    string GetFullPath() { return m_filePath + m_fileName + m_fileExtension; }
    bool IsCommon() { return m_inCommonFolder; }

private:
    string m_fileName;
    string m_filePath;
    string m_fileExtension;
    bool m_inCommonFolder;
    int m_hFile;
};

//--- Creates a TXT file
bool CTextFiles::Create(string baseText = "")
{
    int fileHandle = INVALID_HANDLE;
    string fullPath = m_filePath + m_fileName + m_fileExtension;

    if(m_inCommonFolder)
    {
        fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
    }
    else
    {
        fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
    }

    if(!FileWrite(fileHandle, baseText))
    {
        FileClose(fileHandle);
        return false;
    }

    FileClose(fileHandle);

    return true;
}

//--- Adds text to the end of the file
bool CTextFiles::AddText(string text)
{
    int fileHandle = INVALID_HANDLE;
    string fullPath = m_filePath + m_fileName + m_fileExtension;

    if(m_inCommonFolder)
    {
        fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
    }
    else
    {
        fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
    }

    FileSeek(fileHandle, 0, SEEK_END);
    if(!FileWrite(fileHandle, text))
    {
        FileClose(fileHandle);
        return false;
    }

    FileClose(fileHandle);

    return true;
}

//--- Reads the first line of the file
string CTextFiles::Read()
{
    int fileHandle = INVALID_HANDLE;
    string fullPath = m_filePath + m_fileName + m_fileExtension;
    string text = "";

    if(m_inCommonFolder)
    {
        fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
    }
    else
    {
        fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
    }

    text = FileReadString(fileHandle);

    FileClose(fileHandle);

    return text;
}

//--- Reads the specified line of the file
string CTextFiles::ReadLine(int lineNum)
{
    int fileHandle = INVALID_HANDLE;
    string fullPath = m_filePath + m_fileName + m_fileExtension;
    string text = "";

    if(m_inCommonFolder)
    {
        fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
    }
    else
    {
        fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
    }

    for(int i = 0; i < lineNum; i++)
    {
        text = FileReadString(fileHandle);
    }


    FileClose(fileHandle);

    return text;
}

//--- Counts the number of lines in the file
int CTextFiles::CountLines()
{
    int fileHandle = INVALID_HANDLE;
    string fullPath = m_filePath + m_fileName + m_fileExtension;
    int lineCount = 0;

    if(m_inCommonFolder)
    {
        fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
    }
    else
    {
        fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
    }

    while(!FileIsEnding(fileHandle))
    {
        FileReadString(fileHandle);
        lineCount++;
    }

    FileClose(fileHandle);

    return lineCount;
}


//--- Deletes the specified line of the file
bool CTextFiles::DeleteLine(int lineNum)
{
    int fileHandle = INVALID_HANDLE;
    string fullPath = m_filePath + m_fileName + m_fileExtension;
    int controller = 1;
    CTextFiles tempFile(m_fileName + "_temp", m_filePath, m_inCommonFolder);

    while (controller <= CountLines())
    {
        if(controller != lineNum)
        {
            if(!tempFile.AddText(ReadLine(controller)))
            {
                return false;
            }
        }
        controller++;
    }

    FileClose(fileHandle);
    Delete();

    tempFile.Rename(m_fileName);

    Sleep(1000);

    return true;
}

//--- Gets the position of the line which if the text is found
int CTextFiles::GetLinePosition(string textToFind)
{
    int fileHandle = INVALID_HANDLE;
    string fullPath = m_filePath + m_fileName + m_fileExtension;
    int lineCount = 1;
    int controller = 1;

    while(controller <= CountLines())
    {
        if(ReadLine(controller) == textToFind)
        {
            return lineCount;
        }
        lineCount++;
        controller++;
    }

    FileClose(fileHandle);

    return -1;
}

//--- Renames the file
bool CTextFiles::Rename(string newName)
{
    int fileHandle = INVALID_HANDLE;
    string fullPath = m_filePath + m_fileName + m_fileExtension;
    string newFullPath = m_filePath + newName + m_fileExtension;

    if(m_inCommonFolder)
    {
        fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
        if(fileHandle == INVALID_HANDLE)
        {
            return false;
        }
    }
    else
    {
        fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
        if(fileHandle == INVALID_HANDLE)
        {
            return false;
        }
    }

    FileClose(fileHandle);
    FileMove(fullPath,m_inCommonFolder,newFullPath,0);
    m_fileName = newName;

    return true;
}

//--- Moves the file to a new path
bool CTextFiles::Move(string newPath, bool deleteFolder = false)
{
    int fileHandle = INVALID_HANDLE;
    string fullPath = m_filePath + m_fileName + m_fileExtension;
    string newFullPath = newPath + m_fileName + m_fileExtension;

    if(m_inCommonFolder)
    {
        fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
        if(fileHandle == INVALID_HANDLE)
        {
            return false;
        }
    }
    else
    {
        fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
        if(fileHandle == INVALID_HANDLE)
        {
            return false;
        }
    }

    FileClose(fileHandle);
    FileMove(fullPath,m_inCommonFolder,newFullPath,0);

    Sleep(1000);

    if(deleteFolder)
    {
        FolderDelete(m_filePath);
    }

    m_filePath = newPath;

    return true;
}

//--- Deletes the file
bool CTextFiles::Delete()
{
    string fullPath = m_filePath + m_fileName + m_fileExtension;

    if(m_inCommonFolder)
    {
        if(!FileDelete(fullPath, FILE_COMMON))
        {
            return false;
        }
    }
    else
    {
        if(!FileDelete(fullPath))
        {
            return false;
        }
    }

    return true;
}