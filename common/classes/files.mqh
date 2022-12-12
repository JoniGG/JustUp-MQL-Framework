//--- This class is used to work with files
#include "../enums/fileType.mqh"
#define _FILES_CLASS_VERSION_ 1.2

class CFiles
  {
public: 
   //--- Constructor
   CFiles(string fileName, string filePath, ENUM_FILE_TYPE type, bool inCommonFolder=false)
     {
        m_hFile=INVALID_HANDLE;
        m_fileName=fileName;
        m_filePath=filePath;
        m_ENUM_FILE_TYPE=type;
        m_inCommonFolder=inCommonFolder;
     }

    bool Create(string initialText="");
    bool Delete();
    bool AddLine(string line);
    bool ReplaceBody(string body);
    bool ReplaceLine(int lineNum, string line);
    bool IsEmpty();
    string ReadFirstLine();
    string ReadLine(int lineNum, int offset=0);
    bool DeleteLine(int lineNum);
    int GetLinePosition(string valueOfLine);
    string GetFileName();
    string GetFilePath();
    ENUM_FILE_TYPE GetENUM_FILE_TYPE();
    bool IsCommon();
    string GetFileExtension();
    bool Move(string newFileName, string newFilePath, bool inCommonFolder=false);


private:
   string m_fileName;
   string m_filePath;
   ENUM_FILE_TYPE m_ENUM_FILE_TYPE;
   bool m_inCommonFolder;
   int m_hFile;
   int GetFileHandle();
  };

//--- Returns the file handle
int CFiles::GetFileHandle()
  {
    string fullPath = m_filePath + m_fileName;

    //--- Creates a TXT file
   if(m_ENUM_FILE_TYPE == FILE_TYPE_TEXT)
     {
      if(m_inCommonFolder)
        {
         m_hFile = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON | FILE_SHARE_READ);
        }
    else
        {
         m_hFile = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_SHARE_READ);
        }
    }
    
    //--- Creates a binary file
    if(m_ENUM_FILE_TYPE == FILE_TYPE_BINARY)
      {
       if(m_inCommonFolder)
         {
          m_hFile = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_BIN | FILE_COMMON);
         }
     else
         {
          m_hFile = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_BIN);
         }
      }
      
    //--- Creates a CSV file
    if(m_ENUM_FILE_TYPE == FILE_TYPE_CSV)
    {
        if(m_inCommonFolder)
          {
           m_hFile = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_CSV | FILE_COMMON);
          }
        else
          {
           m_hFile = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_CSV);
          }
   }
    
    return m_hFile;
  }

//--- Creates the file
bool CFiles::Create(string initialText = "")
  {
    m_hFile = GetFileHandle();
    bool res = false;
   
   if(FileWrite(m_hFile, initialText))
     {
        res = true;
      }
   FileClose(m_hFile);

   return res;
  }
//--- Deletes the file
bool CFiles::Delete()
  {
   string fullPath = m_filePath + m_fileName;

    //--- Deletes the file
   if(FileDelete(fullPath))
     {
        return true;
      }
    else
      {
        return false;
      }
  }

//--- Adds a line to the file
bool CFiles::AddLine(string line)
{
    m_hFile = GetFileHandle();
    bool res = false;

    //--- Adds a line to the file
    FileSeek(m_hFile, 0, SEEK_END);
    if(FileWrite(m_hFile, line))
    {
        res = true;
    }

    FileClose(m_hFile);

    return res;
}

//--- Replaces the body of the file
bool CFiles::ReplaceBody(string body)
{
    m_hFile = GetFileHandle();
    bool res = false;

    //--- Replaces the body of the file
    FileSeek(m_hFile, 0, SEEK_SET);
    if(FileWrite(m_hFile, body))
    {
        res = true;
    }

    FileClose(m_hFile);

    return res;
}

//--- Checks if the file is empty
bool CFiles::IsEmpty()
{
    m_hFile = GetFileHandle();
    bool res = false;

    //--- Checks if the file is empty
    FileSeek(m_hFile, 0, SEEK_SET);
    if(FileReadString(m_hFile) == "")
    {
        res = true;
    }
    FileClose(m_hFile);

    return res;
}

//--- Reads the first line of the file
string CFiles::ReadFirstLine()
{
    m_hFile = GetFileHandle();
    string res = "";

    //--- Reads the first line of the file
    FileSeek(m_hFile, 0, SEEK_SET);
    res = FileReadString(m_hFile);

    FileClose(m_hFile);
    
    return res;
}

//--- Reads a line of the file
string CFiles::ReadLine(int lineNum, int offset=0)
{
    m_hFile = GetFileHandle();
    string res = "";
    int max_i = lineNum + offset;

    //--- Reads a line of the file
    FileSeek(m_hFile, 0, SEEK_SET);
    for(int i = 0; i < max_i; i++)
    {
        FileReadString(m_hFile);
    }
    res = FileReadString(m_hFile);

    FileClose(m_hFile);

    return res;
}

//--- Replaces a line of the file
bool CFiles::ReplaceLine(int lineNum, string line)
{
     m_hFile = GetFileHandle();
    bool res = false;
    string Body[] = {""};

    //--- Replaces a line of the file
    FileSeek(m_hFile, 0, SEEK_SET);

    int i = 0;

    while(!FileIsEnding(m_hFile))
    {
      if(i != lineNum)
      {
        Body[i] = FileReadString(m_hFile);
      }
      else
      {
        Body[i] = line;
      }

      i++;
    }

    FileClose(m_hFile);

    Delete();
    Create("");

    m_hFile = GetFileHandle();

    for (int o = 0; o < i; o++)
    {
      AddLine(Body[o]);
    }
    
    FileClose(m_hFile);

    return res;
}

//--- Deletes a line of the file
bool CFiles::DeleteLine(int lineNum)
{
    m_hFile = GetFileHandle();
    bool res = false;
    string Body[] = {""};

    //--- Replaces a line of the file
    FileSeek(m_hFile, 0, SEEK_SET);

    int i = 0;

    while(!FileIsEnding(m_hFile))
    {
      if(i != lineNum)
      {
        Body[i] = FileReadString(m_hFile);
      }

      i++;
    }

    FileClose(m_hFile);

    Delete();
    Create("");

    m_hFile = GetFileHandle();

    for (int o = 0; o < i; o++)
    {
      AddLine(Body[o]);
    }
    
    FileClose(m_hFile);

    return res;
}

//--- Return the line number of an specific string
int CFiles::GetLinePosition(string valueOfLine)
{
    m_hFile = GetFileHandle();
    int res = 0;

    //--- Return the line number of an specific string
    FileSeek(m_hFile, 0, SEEK_SET);

    while(!FileIsEnding(m_hFile))
    {
      if(FileReadString(m_hFile) == valueOfLine)
      {
        FileClose(m_hFile);
        return res;
      }
      res++;
    }

    FileClose(m_hFile);

    return -1;
}

//--- Return the file name
string CFiles::GetFileName()
{
    return m_fileName;
}

//--- Return the file path
string CFiles::GetFilePath()
{
    return m_filePath;
}

//--- Return the file type
ENUM_FILE_TYPE CFiles::GetENUM_FILE_TYPE()
{
    return m_ENUM_FILE_TYPE;
}

//--- Return if it is in the common folder or not
bool CFiles::IsCommon()
{
    return m_inCommonFolder;
}

//--- Return the file extension
string CFiles::GetFileExtension()
{
    string ext = "FILE_TYPE_UNKNOWN";

    if(m_ENUM_FILE_TYPE == FILE_TYPE_TEXT)
    {
        ext = ".txt";
    }
    else if(m_ENUM_FILE_TYPE == FILE_TYPE_BINARY)
    {
        ext = ".bin";
    }
    else if (m_ENUM_FILE_TYPE == FILE_TYPE_CSV)
    {
        ext = ".csv";
    }
    
    return ext;
}

//--- Move the file to another folder
bool CFiles::Move(string newFileName, string newFilePath, bool inCommonFolder=false)
{
    bool res = false;

    //--- Move the file to another folder
    if(m_inCommonFolder)
    {
        if(FileMove(m_filePath + m_fileName,FILE_COMMON, newFilePath + newFileName, FILE_COMMON|FILE_REWRITE))
        {
            res = true;
        }
    }
    else
    {
        if(FileMove(m_filePath + m_fileName, 0, newFilePath + newFileName, FILE_REWRITE))
        {
            res = true;
        }
    }

    //--- If the file was moved, update the file name and path
    if(res)
    {
        m_fileName = newFileName;
        m_filePath = newFilePath;
        m_inCommonFolder = inCommonFolder;
    }

    return res;
}

//--- End of File