//--- CFiles class will allow you to handle files on a very easy way

enum FileType
  {
   FILE_TYPE_UNKNOWN=0,
   FILE_TYPE_TEXT,
   FILE_TYPE_BINARY,
    FILE_TYPE_CSV
  };

class CFiles
  {
    //--- Constructor
   CFiles(string fileName, string filePath, FileType type, bool inCommonFolder=false)
     {
        m_hFile=INVALID_HANDLE;
        m_fileName=fileName;
        m_filePath=filePath;
        m_fileType=type;
        m_inCommonFolder=inCommonFolder;
     }

    bool CreateFile(string initialText="");
    bool DeleteFile();
    bool AddLine(string line);
    bool ReplaceBody(string body);
    bool ReplaceLine(string line, int lineNum);
    bool IsEmpty();
    string ReadFirstLine();
    string ReadLine(int lineNum, int offset=0);
    bool DeleteLine(int lineNum);
    int GetLineNum(string valueOfLine);
    string GetFileName();
    string GetFilePath();
    FileType GetFileType();
    bool IsCommon();
    string GetFileExtension();
    bool MoveFile(string newFileName, string newFilePath, bool inCommonFolder=false);


private:
   string m_fileName;
   string m_filePath;
   FileType m_fileType;
   bool m_inCommonFolder;
   int m_hFile;
   int GetFileHandle();
  };

//--- Returns the file handle
int CFiles::GetFileHandle()
  {
    string fullPath = m_filePath + m_fileName;

    //--- Creates a TXT file
   if(m_fileType == FILE_TYPE_TEXT)
     {
      if(m_inCommonFolder)
        {
         m_hFile = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
        }
    else
        {
         m_hFile = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
        }
    }
    
    //--- Creates a binary file
    if(m_fileType == FILE_TYPE_BINARY)
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
    if(m_fileType == FILE_TYPE_CSV)
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
bool CFiles::CreateFile(string initialText = "")
  {
    long handle = GetFileHandle();
    bool res = false;
   
   if(FileWrite(m_hFile, initialText))
     {
        res = true;
      }
   FileClose(m_hFile);

   return res;
  }
//--- Deletes the file
bool CFiles::DeleteFile()
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
    long handle = GetFileHandle();
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
    long handle = GetFileHandle();
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
    long handle = GetFileHandle();
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
    long handle = GetFileHandle();
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
    long handle = GetFileHandle();
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
bool CFiles::ReplaceLine(string line, int lineNum)
{
    long handle = GetFileHandle();
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

    DeleteFile();
    CreateFile("");

    handle = GetFileHandle();

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
    long handle = GetFileHandle();
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

    DeleteFile();
    CreateFile("");

    handle = GetFileHandle();

    for (int o = 0; o < i; o++)
    {
      AddLine(Body[o]);
    }
    
    FileClose(m_hFile);

    return res;
}

//--- Return the line number of an specific string
int CFiles::GetLineNum(string valueOfLine)
{
    long handle = GetFileHandle();
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
FileType CFiles::GetFileType()
{
    return m_fileType;
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

    if(m_fileType == FILE_TYPE_TEXT)
    {
        ext = ".txt";
    }
    else if(m_fileType == FILE_TYPE_BINARY)
    {
        ext = ".bin";
    }
    else if (m_fileType == FILE_TYPE_CSV)
    {
        ext = ".csv";
    }
    
    return ext;
}

//--- Move the file to another folder
bool CFiles::MoveFile(string newFileName, string newFilePath, bool inCommonFolder=false)
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