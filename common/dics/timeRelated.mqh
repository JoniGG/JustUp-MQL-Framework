//--- Time related dictionary. This library uses the enumerators defined in the timeRelated.mqh file in the enums folder.
#include "../enums/timeRelated.mqh"
#define _TIME_RELATED_DICTIONARY_VERSION_ 1.0

//--- Hour Dictionary
string HourToString(Hours hour)
{
   switch (hour)
   {
      case H00: return "00:00";
      case H01: return "01:00";
      case H02: return "02:00";
      case H03: return "03:00";
      case H04: return "04:00";
      case H05: return "05:00";
      case H06: return "06:00";
      case H07: return "07:00";
      case H08: return "08:00";
      case H09: return "09:00";
      case H10: return "10:00";
      case H11: return "11:00";
      case H12: return "12:00";
      case H13: return "13:00";
      case H14: return "14:00";
      case H15: return "15:00";
      case H16: return "16:00";
      case H17: return "17:00";
      case H18: return "18:00";
      case H19: return "19:00";
      case H20: return "20:00";
      case H21: return "21:00";
      case H22: return "22:00";
      case H23: return "23:00";
   }
   return "00:00";
}

//--- Day Dictionary
string DayToString(Days day)
{
   switch (day)
   {
      case D01: return "1st";
      case D02: return "2nd";
      case D03: return "3rd";
      case D04: return "4th";
      case D05: return "5th";
      case D06: return "6th";
      case D07: return "7th";
      case D08: return "8th";
      case D09: return "9th";
      case D10: return "10th";
      case D11: return "11th";
      case D12: return "12th";
      case D13: return "13th";
      case D14: return "14th";
      case D15: return "15th";
      case D16: return "16th";
      case D17: return "17th";
      case D18: return "18th";
      case D19: return "19th";
      case D20: return "20th";
      case D21: return "21st";
      case D22: return "22nd";
      case D23: return "23rd";
      case D24: return "24th";
      case D25: return "25th";
      case D26: return "26th";
      case D27: return "27th";
      case D28: return "28th";
      case D29: return "29th";
      case D30: return "30th";
      case D31: return "31st";
   }
   return "1st";
}

//--- Month Dictionary
string MonthToString(Months month)
{
   switch (month)
   {
      case JAN: return "January";
      case FEB: return "February";
      case MAR: return "March";
      case APR: return "April";
      case MAY: return "May";
      case JUN: return "June";
      case JUL: return "July";
      case AUG: return "August";
      case SEP: return "September";
      case OCT: return "October";
      case NOV: return "November";
      case DEC: return "December";
   }
   return "January";
}

//--- Weekday Dictionary
string WeekdayToString(Weekdays weekday)
{
   switch (weekday)
   {
      case MON: return "Monday";
      case TUE: return "Tuesday";
      case WED: return "Wednesday";
      case THU: return "Thursday";
      case FRI: return "Friday";
      case SAT: return "Saturday";
      case SUN: return "Sunday";
   }
   return "Monday";
}