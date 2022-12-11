//--- Package of functions

//--- Calculate LotSize
double CalculateLotSize(double stopLossPips, double riskPercent, string symbol = "CHART")
{
    //--- Verify the input parameters
    if (stopLossPips <= 0 || riskPercent <= 0)
        return(0);
        
    if(symbol == "CHART")
      symbol = Symbol();
    
    //--- Calculate the LotSize
    double lotSize = 0;
    double nTickValue = SymbolInfoDouble(symbol,SYMBOL_TRADE_TICK_VALUE);
    double moneyAtRisk = AccountInfoDouble(ACCOUNT_BALANCE) * riskPercent / 100;

    if(Digits() == 3 || Digits() == 5)
        nTickValue *= 10;
    
    lotSize = moneyAtRisk / (nTickValue * stopLossPips);
    lotSize = MathRound(lotSize / SymbolInfoDouble(symbol,SYMBOL_VOLUME_STEP)) * SymbolInfoDouble(symbol,SYMBOL_VOLUME_STEP);

    return lotSize;
}

//--- Returns if we're in the London Daylight Time
bool IsLondonDLS()
{
    //------------->>   London DST Start  ------------>>  London DST End
   if((TimeCurrent() >= D'2000.03.26' && TimeCurrent() <  D'2000.10.29')  ||
      (TimeCurrent() >= D'2001.03.25' && TimeCurrent() <  D'2001.10.28')  ||
      (TimeCurrent() >= D'2002.03.31' && TimeCurrent() <  D'2002.10.27')  ||
      (TimeCurrent() >= D'2003.03.30' && TimeCurrent() <  D'2003.10.26')  ||
      (TimeCurrent() >= D'2004.03.28' && TimeCurrent() <  D'2004.10.31')  ||
      (TimeCurrent() >= D'2005.03.27' && TimeCurrent() <  D'2005.10.30')  ||
      (TimeCurrent() >= D'2006.03.26' && TimeCurrent() <  D'2006.10.29')  ||
      (TimeCurrent() >= D'2007.03.25' && TimeCurrent() <  D'2007.10.28')  ||
      (TimeCurrent() >= D'2008.03.30' && TimeCurrent() <  D'2008.10.26')  ||
      (TimeCurrent() >= D'2009.03.29' && TimeCurrent() <  D'2009.10.25')  ||
      (TimeCurrent() >= D'2010.03.28' && TimeCurrent() <  D'2010.10.31')  ||
      (TimeCurrent() >= D'2011.03.27' && TimeCurrent() <  D'2011.10.30')  ||
      (TimeCurrent() >= D'2012.03.25' && TimeCurrent() <  D'2012.10.28')  ||
      (TimeCurrent() >= D'2013.03.31' && TimeCurrent() <  D'2013.10.27')  ||
      (TimeCurrent() >= D'2014.03.30' && TimeCurrent() <  D'2014.10.26')  ||
      (TimeCurrent() >= D'2015.03.29' && TimeCurrent() <  D'2015.10.25')  ||
      (TimeCurrent() >= D'2016.03.27' && TimeCurrent() <  D'2016.10.30')  ||
      (TimeCurrent() >= D'2017.03.26' && TimeCurrent() <  D'2017.10.29')  ||
      (TimeCurrent() >= D'2018.03.25' && TimeCurrent() <  D'2018.10.28')  ||
      (TimeCurrent() >= D'2019.03.31' && TimeCurrent() <  D'2019.10.27')  ||
      (TimeCurrent() >= D'2020.03.29' && TimeCurrent() <  D'2020.10.25')  ||
      (TimeCurrent() >= D'2021.03.28' && TimeCurrent() <  D'2021.10.31')  ||
      (TimeCurrent() >= D'2022.03.27' && TimeCurrent() <  D'2022.10.30')  ||
      (TimeCurrent() >= D'2023.03.26' && TimeCurrent() <  D'2023.10.29')  ||
      (TimeCurrent() >= D'2024.03.31' && TimeCurrent() <  D'2024.10.27')  ||
      (TimeCurrent() >= D'2025.03.30' && TimeCurrent() <  D'2025.10.26')  ||
      (TimeCurrent() >= D'2026.03.29' && TimeCurrent() <  D'2026.10.25')  ||
      (TimeCurrent() >= D'2027.03.28' && TimeCurrent() <  D'2027.10.31')  ||
      (TimeCurrent() >= D'2028.03.26' && TimeCurrent() <  D'2028.10.29')  ||
      (TimeCurrent() >= D'2029.03.25' && TimeCurrent() <  D'2029.10.28'))
   {
   		return true;
   }

   else 
   {
   		return false;
   }
}

//--- Returns if we're in the New York Daylight Time
bool IsNewYorkDLS()
{
      //------------->>   NY DST Start   ------------->>   NY DST End
   if((TimeCurrent() >= D'2000.04.02' && TimeCurrent() < D'2000.10.29')  ||
      (TimeCurrent() >= D'2001.04.01' && TimeCurrent() < D'2001.10.28')  ||
      (TimeCurrent() >= D'2002.04.07' && TimeCurrent() < D'2002.10.27')  ||
      (TimeCurrent() >= D'2003.04.06' && TimeCurrent() < D'2003.10.26')  ||
      (TimeCurrent() >= D'2004.04.04' && TimeCurrent() < D'2004.10.31')  ||
      (TimeCurrent() >= D'2005.04.03' && TimeCurrent() < D'2005.10.30')  ||
      (TimeCurrent() >= D'2006.04.02' && TimeCurrent() < D'2006.10.29')  ||
      (TimeCurrent() >= D'2007.03.11' && TimeCurrent() < D'2007.11.04')  ||
      (TimeCurrent() >= D'2008.03.09' && TimeCurrent() < D'2008.11.02')  ||
      (TimeCurrent() >= D'2009.03.08' && TimeCurrent() < D'2009.11.01')  ||
      (TimeCurrent() >= D'2010.03.14' && TimeCurrent() < D'2010.11.07')  ||
      (TimeCurrent() >= D'2011.03.13' && TimeCurrent() < D'2011.11.06')  ||
      (TimeCurrent() >= D'2012.03.11' && TimeCurrent() < D'2012.11.04')  ||
      (TimeCurrent() >= D'2013.03.10' && TimeCurrent() < D'2013.11.03')  ||
      (TimeCurrent() >= D'2014.03.09' && TimeCurrent() < D'2014.11.02')  ||
      (TimeCurrent() >= D'2015.03.08' && TimeCurrent() < D'2015.11.01')  ||
      (TimeCurrent() >= D'2016.03.13' && TimeCurrent() < D'2016.11.06')  ||
      (TimeCurrent() >= D'2017.03.12' && TimeCurrent() < D'2017.11.05')  ||
      (TimeCurrent() >= D'2018.03.11' && TimeCurrent() < D'2018.11.04')  ||
      (TimeCurrent() >= D'2019.03.10' && TimeCurrent() < D'2019.11.03')  ||
      (TimeCurrent() >= D'2020.03.08' && TimeCurrent() < D'2020.11.01')  ||
      (TimeCurrent() >= D'2021.03.14' && TimeCurrent() < D'2021.11.07')  ||
      (TimeCurrent() >= D'2022.03.13' && TimeCurrent() < D'2022.11.06')  ||
      (TimeCurrent() >= D'2023.03.12' && TimeCurrent() < D'2023.11.05')  ||
      (TimeCurrent() >= D'2024.03.10' && TimeCurrent() < D'2024.11.03')  ||
      (TimeCurrent() >= D'2025.03.09' && TimeCurrent() < D'2025.11.02')  ||
      (TimeCurrent() >= D'2026.03.08' && TimeCurrent() < D'2026.11.01')  ||
      (TimeCurrent() >= D'2027.03.14' && TimeCurrent() < D'2027.11.07')  ||
      (TimeCurrent() >= D'2028.03.12' && TimeCurrent() < D'2028.11.05')  ||
      (TimeCurrent() >= D'2029.03.11' && TimeCurrent() < D'2029.11.04'))
   {
   		return true;
   }
   else 
   {
   		return false;
   }
}

//--- Get the description of a metatrader error code
string GetErrorDescription(int err_code)
{
    switch(err_code)
     {
      case TRADE_RETCODE_REQUOTE:            return("Requote");
      case TRADE_RETCODE_REJECT:             return("Request rejected");
      case TRADE_RETCODE_CANCEL:             return("Request canceled by trader");
      case TRADE_RETCODE_PLACED:             return("Order placed");
      case TRADE_RETCODE_DONE:               return("Request completed");
      case TRADE_RETCODE_DONE_PARTIAL:       return("Only part of the request was completed");
      case TRADE_RETCODE_ERROR:              return("Request processing error");
      case TRADE_RETCODE_TIMEOUT:            return("Request canceled by timeout");
      case TRADE_RETCODE_INVALID:            return("Invalid request");
      case TRADE_RETCODE_INVALID_VOLUME:     return("Invalid volume in the request");
      case TRADE_RETCODE_INVALID_PRICE:      return("Invalid price in the request");
      case TRADE_RETCODE_INVALID_STOPS:      return("Invalid stops in the request");
      case TRADE_RETCODE_TRADE_DISABLED:     return("Trade is disabled");
      case TRADE_RETCODE_MARKET_CLOSED:      return("Market is closed");
      case TRADE_RETCODE_NO_MONEY:           return("There is not enough money to complete the request");
      case TRADE_RETCODE_PRICE_CHANGED:      return("Prices changed");
      case TRADE_RETCODE_PRICE_OFF:          return("There are no quotes to process the request");
      case TRADE_RETCODE_INVALID_EXPIRATION: return("Invalid order expiration date in the request");
      case TRADE_RETCODE_ORDER_CHANGED:      return("Order state changed");
      case TRADE_RETCODE_TOO_MANY_REQUESTS:  return("Too frequent requests");
      case TRADE_RETCODE_NO_CHANGES:         return("No changes in request");
      case TRADE_RETCODE_SERVER_DISABLES_AT: return("Autotrading disabled by server");
      case TRADE_RETCODE_CLIENT_DISABLES_AT: return("Autotrading disabled by client terminal");
      case TRADE_RETCODE_LOCKED:             return("Request locked for processing");
      case TRADE_RETCODE_FROZEN:             return("Order or position frozen");
      case TRADE_RETCODE_INVALID_FILL:       return("Invalid order filling type");
      case TRADE_RETCODE_CONNECTION:         return("No connection with the trade server");
      case TRADE_RETCODE_ONLY_REAL:          return("Operation is allowed only for live accounts");
      case TRADE_RETCODE_LIMIT_ORDERS:       return("The number of pending orders has reached the limit");
      case TRADE_RETCODE_LIMIT_VOLUME:       return("The volume of orders and positions for the symbol has reached the limit");

      //--- Constant Description
      case ERR_SUCCESS:                      return("The operation completed successfully");
      case ERR_INTERNAL_ERROR:               return("Unexpected internal error");
      case ERR_WRONG_INTERNAL_PARAMETER:     return("Wrong parameter in the inner call of the client terminal function");
      case ERR_INVALID_PARAMETER:            return("Wrong parameter when calling the system function");
      case ERR_NOT_ENOUGH_MEMORY:            return("Not enough memory to perform the system function");
      case ERR_STRUCT_WITHOBJECTS_ORCLASS:   return("The structure contains objects of strings and/or dynamic arrays and/or structure of such objects and/or classes");
      case ERR_INVALID_ARRAY:                return("Array of a wrong type, wrong size, or a damaged object of a dynamic array");
      case ERR_ARRAY_RESIZE_ERROR:           return("Not enough memory for the relocation of an array, or an attempt to change the size of a static array");
      case ERR_STRING_RESIZE_ERROR:          return("Not enough memory for the relocation of string");
      case ERR_NOTINITIALIZED_STRING:        return("Not initialized string");
      case ERR_INVALID_DATETIME:             return("Invalid date and/or time");
      case ERR_ARRAY_BAD_SIZE:               return("Requested array size exceeds 2 GB");
      case ERR_INVALID_POINTER:              return("Wrong pointer");
      case ERR_INVALID_POINTER_TYPE:         return("Wrong type of pointer");
      case ERR_FUNCTION_NOT_ALLOWED:         return("System function is not allowed to call");

      //--- Charts	
      case ERR_CHART_WRONG_ID:               return("Wrong chart ID");
      case ERR_CHART_NO_REPLY:               return("Chart does not respond");
      case ERR_CHART_NOT_FOUND:              return("Chart not found");
      case ERR_CHART_NO_EXPERT:              return("No Expert Advisor in the chart that could handle the event");
      case ERR_CHART_CANNOT_OPEN:            return("Chart opening error");
      case ERR_CHART_CANNOT_CHANGE:          return("Failed to change chart symbol and period");
      case ERR_CHART_SCREENSHOT_FAILED:      return("Error creating screenshots");
      case ERR_CHART_NAVIGATE_FAILED:        return("Error navigating through chart");
      case ERR_CHART_TEMPLATE_FAILED:        return("Error applying template");
      case ERR_CHART_WINDOW_NOT_FOUND:       return("Subwindow containing the indicator was not found");
      case ERR_CHART_INDICATOR_CANNOT_ADD:   return("Error adding an indicator to chart");
      case ERR_CHART_INDICATOR_CANNOT_DEL:   return("Error deleting an indicator from the chart");
      case ERR_CHART_INDICATOR_NOT_FOUND:    return("Indicator not found on the specified chart");

      //--- Graphical Objects	
      case ERR_OBJECT_ERROR:                 return("Error working with a graphical object");
      case ERR_OBJECT_NOT_FOUND:             return("Graphical object was not found");
      case ERR_OBJECT_WRONG_PROPERTY:        return("Wrong ID of a graphical object property");
      case ERR_OBJECT_GETDATE_FAILED:        return("Unable to get date corresponding to the value");
      case ERR_OBJECT_GETVALUE_FAILED:       return("Unable to get value corresponding to the date");

      //--- MarketInfo	
      case ERR_MARKET_UNKNOWN_SYMBOL:        return("Unknown symbol");
      case ERR_MARKET_NOT_SELECTED:          return("Symbol is not selected in MarketWatch");
      case ERR_MARKET_WRONG_PROPERTY:        return("Wrong identifier of a symbol property");
      case ERR_MARKET_LASTTIME_UNKNOWN:      return("Time of the last tick is not known (no ticks)");
      case ERR_MARKET_SELECT_ERROR:          return("Error adding or deleting a symbol in MarketWatch");

      //--- History Access	
      case ERR_HISTORY_NOT_FOUND:            return("Requested history not found");
      case ERR_HISTORY_WRONG_PROPERTY:       return("Wrong ID of the history property");

      //--- Global_Variables	
      case ERR_GLOBALVARIABLE_NOT_FOUND:     return("Global variable of the client terminal is not found");
      case ERR_GLOBALVARIABLE_EXISTS:        return("Global variable of the client terminal with the same name already exists");
      case ERR_MAIL_SEND_FAILED:             return("Email sending failed");
      case ERR_PLAY_SOUND_FAILED:            return("Sound playing failed");
      case ERR_MQL5_WRONG_PROPERTY:          return("Wrong identifier of the program property");
      case ERR_TERMINAL_WRONG_PROPERTY:      return("Wrong identifier of the terminal property");
      case ERR_FTP_SEND_FAILED:              return("File sending via ftp failed");
      case ERR_NOTIFICATION_SEND_FAILED:     return("Error in sending notification");

      //--- Custom Indicator Buffers
      case ERR_BUFFERS_NO_MEMORY:            return("Not enough memory for the distribution of indicator buffers");
      case ERR_BUFFERS_WRONG_INDEX:          return("Wrong indicator buffer index");

      //--- Custom Indicator Properties
      case ERR_CUSTOM_WRONG_PROPERTY:        return("Wrong ID of the custom indicator property");

      //--- Account
      case ERR_ACCOUNT_WRONG_PROPERTY:       return("Wrong account property ID");
      case ERR_TRADE_WRONG_PROPERTY:         return("Wrong trade property ID");
      case ERR_TRADE_DISABLED:               return("Trading by Expert Advisors prohibited");
      case ERR_TRADE_POSITION_NOT_FOUND:     return("Position not found");
      case ERR_TRADE_ORDER_NOT_FOUND:        return("Order not found");
      case ERR_TRADE_DEAL_NOT_FOUND:         return("Deal not found");
      case ERR_TRADE_SEND_FAILED:            return("Trade request sending failed");

      //--- Indicators	
      case ERR_INDICATOR_UNKNOWN_SYMBOL:     return("Unknown symbol");
      case ERR_INDICATOR_CANNOT_CREATE:      return("Indicator cannot be created");
      case ERR_INDICATOR_NO_MEMORY:          return("Not enough memory to add the indicator");
      case ERR_INDICATOR_CANNOT_APPLY:       return("The indicator cannot be applied to another indicator");
      case ERR_INDICATOR_CANNOT_ADD:         return("Error applying an indicator to chart");
      case ERR_INDICATOR_DATA_NOT_FOUND:     return("Requested data not found");
      case ERR_INDICATOR_WRONG_HANDLE:       return("Wrong indicator handle");
      case ERR_INDICATOR_WRONG_PARAMETERS:   return("Wrong number of parameters when creating an indicator");
      case ERR_INDICATOR_PARAMETERS_MISSING: return("No parameters when creating an indicator");
      case ERR_INDICATOR_CUSTOM_NAME:        return("The first parameter in the array must be the name of the custom indicator");
      case ERR_INDICATOR_PARAMETER_TYPE:     return("Invalid parameter type in the array when creating an indicator");
      case ERR_INDICATOR_WRONG_INDEX:        return("Wrong index of the requested indicator buffer");

      //--- Depth of Market	
      case ERR_BOOKS_CANNOT_ADD:             return("Depth Of Market can not be added");
      case ERR_BOOKS_CANNOT_DELETE:          return("Depth Of Market can not be removed");
      case ERR_BOOKS_CANNOT_GET:             return("The data from Depth Of Market can not be obtained");
      case ERR_BOOKS_CANNOT_SUBSCRIBE:       return("Error in subscribing to receive new data from Depth Of Market");

      //--- File Operations
      case ERR_TOO_MANY_FILES:               return("More than 64 files cannot be opened at the same time");
      case ERR_WRONG_FILENAME:               return("Invalid file name");
      case ERR_TOO_LONG_FILENAME:            return("Too long file name");
      case ERR_CANNOT_OPEN_FILE:             return("File opening error");
      case ERR_FILE_CACHEBUFFER_ERROR:       return("Not enough memory for cache to read");
      case ERR_CANNOT_DELETE_FILE:           return("File deleting error");
      case ERR_INVALID_FILEHANDLE:           return("A file with this handle was closed, or was not opening at all");
      case ERR_WRONG_FILEHANDLE:             return("Wrong file handle");
      case ERR_FILE_NOTTOWRITE:              return("The file must be opened for writing");
      case ERR_FILE_NOTTOREAD:               return("The file must be opened for reading");
      case ERR_FILE_NOTBIN:                  return("The file must be opened as a binary one");
      case ERR_FILE_NOTTXT:                  return("The file must be opened as a text");
      case ERR_FILE_NOTTXTORCSV:             return("The file must be opened as a text or CSV");
      case ERR_FILE_NOTCSV:                  return("The file must be opened as CSV");
      case ERR_FILE_READERROR:               return("File reading error");
      case ERR_FILE_BINSTRINGSIZE:           return("String size must be specified, because the file is opened as binary");
      case ERR_INCOMPATIBLE_FILE:            return("A text file must be for string arrays, for other arrays - binary");
      case ERR_FILE_IS_DIRECTORY:            return("This is not a file, this is a directory");
      case ERR_FILE_NOT_EXIST:               return("File does not exist");
      case ERR_FILE_CANNOT_REWRITE:          return("File can not be rewritten");
      case ERR_WRONG_DIRECTORYNAME:          return("Wrong directory name");
      case ERR_DIRECTORY_NOT_EXIST:          return("Directory does not exist");
      case ERR_FILE_ISNOT_DIRECTORY:         return("This is a file, not a directory");
      case ERR_CANNOT_DELETE_DIRECTORY:      return("The directory cannot be removed");
      case ERR_CANNOT_CLEAN_DIRECTORY:       return("Failed to clear the directory (probably one or more files are blocked and removal operation failed)");
      case ERR_FILE_WRITEERROR:              return("Failed to write a resource to a file");

      //--- String Casting	
      case ERR_NO_STRING_DATE:               return("No date in the string");
      case ERR_WRONG_STRING_DATE:            return("Wrong date in the string");
      case ERR_WRONG_STRING_TIME:            return("Wrong time in the string");
      case ERR_STRING_TIME_ERROR:            return("Error converting string to date");
      case ERR_STRING_OUT_OF_MEMORY:         return("Not enough memory for the string");
      case ERR_STRING_SMALL_LEN:             return("The string length is less than expected");
      case ERR_STRING_TOO_BIGNUMBER:         return("Too large number, more than ULONG_MAX");
      case ERR_WRONG_FORMATSTRING:           return("Invalid format string");
      case ERR_TOO_MANY_FORMATTERS:          return("Amount of format specifiers more than the parameters");
      case ERR_TOO_MANY_PARAMETERS:          return("Amount of parameters more than the format specifiers");
      case ERR_WRONG_STRING_PARAMETER:       return("Damaged parameter of string type");
      case ERR_STRINGPOS_OUTOFRANGE:         return("Position outside the string");
      case ERR_STRING_ZEROADDED:             return("0 added to the string end, a useless operation");
      case ERR_STRING_UNKNOWNTYPE:           return("Unknown data type when converting to a string");
      case ERR_WRONG_STRING_OBJECT:          return("Damaged string object");

      //--- Operations with Arrays	
      case ERR_INCOMPATIBLE_ARRAYS:          return("Copying incompatible arrays. String array can be copied only to a string array, and a numeric array - in numeric array only");
      case ERR_SMALL_ASSERIES_ARRAY:         return("The receiving array is declared as AS_SERIES, and it is of insufficient size");
      case ERR_SMALL_ARRAY:                  return("Too small array, the starting position is outside the array");
      case ERR_ZEROSIZE_ARRAY:               return("An array of zero length");
      case ERR_NUMBER_ARRAYS_ONLY:           return("Must be a numeric array");
      case ERR_ONEDIM_ARRAYS_ONLY:           return("Must be a one-dimensional array");
      case ERR_SERIES_ARRAY:                 return("Timeseries cannot be used");
      case ERR_DOUBLE_ARRAY_ONLY:            return("Must be an array of type double");
      case ERR_FLOAT_ARRAY_ONLY:             return("Must be an array of type float");
      case ERR_LONG_ARRAY_ONLY:              return("Must be an array of type long");
      case ERR_INT_ARRAY_ONLY:               return("Must be an array of type int");
      case ERR_SHORT_ARRAY_ONLY:             return("Must be an array of type short");
      case ERR_CHAR_ARRAY_ONLY:              return("Must be an array of type char");

      //--- Operations with OpenCL	
      case ERR_OPENCL_NOT_SUPPORTED:         return("OpenCL functions are not supported on this computer");
      case ERR_OPENCL_INTERNAL:              return("Internal error occurred when running OpenCL");
      case ERR_OPENCL_INVALID_HANDLE:        return("Invalid OpenCL handle");
      case ERR_OPENCL_CONTEXT_CREATE:        return("Error creating the OpenCL context");
      case ERR_OPENCL_QUEUE_CREATE:          return("Failed to create a run queue in OpenCL");
      case ERR_OPENCL_PROGRAM_CREATE:        return("Error occurred when compiling an OpenCL program");
      case ERR_OPENCL_TOO_LONG_KERNEL_NAME:  return("Too long kernel name (OpenCL kernel)");
      case ERR_OPENCL_KERNEL_CREATE:         return("Error creating an OpenCL kernel");
      case ERR_OPENCL_SET_KERNEL_PARAMETER:  return("Error occurred when setting parameters for the OpenCL kernel");
      case ERR_OPENCL_EXECUTE:               return("OpenCL program runtime error");
      case ERR_OPENCL_WRONG_BUFFER_SIZE:     return("Invalid size of the OpenCL buffer");
      case ERR_OPENCL_WRONG_BUFFER_OFFSET:   return("Invalid offset in the OpenCL buffer");
      case ERR_OPENCL_BUFFER_CREATE:         return("Failed to create and OpenCL buffer");
      
      //--- User-Defined Errors	
      default: if(err_code>=ERR_USER_ERROR_FIRST && err_code<ERR_USER_ERROR_LAST)
                                             return("User error "+string(err_code-ERR_USER_ERROR_FIRST));
     }
//---
   return("Unknown error");
}

//--- function for converting RGB color to integer
int RGB(int red_value,int green_value,int blue_value)
  {
//--- check parameters
   if(red_value<0)     red_value=0;
   if(red_value>255)   red_value=255;
   if(green_value<0)   green_value=0;
   if(green_value>255) green_value=255;
   if(blue_value<0)    blue_value=0;
   if(blue_value>255)  blue_value=255;
//---
   green_value<<=8;
   blue_value<<=16;
   return(red_value+green_value+blue_value);
  }

//--- Compare two double numbers with specified precision
bool CompareDoubles(double number1,double number2)
  {
   if(NormalizeDouble(number1-number2,8)==0) return(true);
   else return(false);
  }

//--- Calculate the mathematical hope
double MathHope(double winrate, double lossrate, double averageWin, double averageLoss, double averageDraw = 0)
  {
   return(winrate*averageWin-lossrate*averageLoss+averageDraw);
  }