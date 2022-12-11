//--- This package contains the functions to work with the Daylight Savings Time.
#define _DAYLIGHTSAVINGS_PACKAGE_VERSION_ 1.0

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