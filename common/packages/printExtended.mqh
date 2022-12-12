//--- This package is an extension of the print function.
#define _PRINT_EXTENDED_PACKAGE_VERSION_ 1.0

//--- Debug Print
void PrintDebug(string text)
{
   Print("DEBUG: ", text);
}

//--- Error Print
void PrintError(string text)
{
   Print("ERROR: ", text);
}

//--- Warning Print
void PrintWarning(string text)
{
   Print("WARNING: ", text);
}

//--- Info Print
void PrintInfo(string text)
{
   Print("INFO: ", text);
}

//--- Success Print
void PrintSuccess(string text)
{
   Print("SUCCESS: ", text);
}