//--- A set of dictionaries ready to use in your scripts

//--- Hour Dictionary
string HourToString(Hour hour)
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
string DayToString(Day day)
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
string MonthToString(Month month)
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
string WeekdayToString(Weekday weekday)
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

//--- Get a character position in the english alphabet
int GetCharPos(string str)
{
    int pos = -1;

    if(StringLen(str) != 1) return(-1);

    if (str == "a" || str == "A") pos = 1;
    if (str == "b" || str == "B") pos = 2;
    if (str == "c" || str == "C") pos = 3;
    if (str == "d" || str == "D") pos = 4;
    if (str == "e" || str == "E") pos = 5;
    if (str == "f" || str == "F") pos = 6;
    if (str == "g" || str == "G") pos = 7;
    if (str == "h" || str == "H") pos = 8;
    if (str == "i" || str == "I") pos = 9;
    if (str == "j" || str == "J") pos = 10;
    if (str == "k" || str == "K") pos = 11;
    if (str == "l" || str == "L") pos = 12;
    if (str == "m" || str == "M") pos = 13;
    if (str == "n" || str == "N") pos = 14;
    if (str == "o" || str == "O") pos = 15;
    if (str == "p" || str == "P") pos = 16;
    if (str == "q" || str == "Q") pos = 17;
    if (str == "r" || str == "R") pos = 18;
    if (str == "s" || str == "S") pos = 19;
    if (str == "t" || str == "T") pos = 20;
    if (str == "u" || str == "U") pos = 21;
    if (str == "v" || str == "V") pos = 22;
    if (str == "w" || str == "W") pos = 23;
    if (str == "x" || str == "X") pos = 24;
    if (str == "y" || str == "Y") pos = 25;
    if (str == "z" || str == "Z") pos = 26;

    return pos;
}

//--- Get a character from a position in the english alphabet
string GetCharFromPos(int pos)
{
    string str = "";

    if(pos < 1 || pos > 26) return("");

    if (pos == 1) str = "a";
    if (pos == 2) str = "b";
    if (pos == 3) str = "c";
    if (pos == 4) str = "d";
    if (pos == 5) str = "e";
    if (pos == 6) str = "f";
    if (pos == 7) str = "g";
    if (pos == 8) str = "h";
    if (pos == 9) str = "i";
    if (pos == 10) str = "j";
    if (pos == 11) str = "k";
    if (pos == 12) str = "l";
    if (pos == 13) str = "m";
    if (pos == 14) str = "n";
    if (pos == 15) str = "o";
    if (pos == 16) str = "p";
    if (pos == 17) str = "q";
    if (pos == 18) str = "r";
    if (pos == 19) str = "s";
    if (pos == 20) str = "t";
    if (pos == 21) str = "u";
    if (pos == 22) str = "v";
    if (pos == 23) str = "w";
    if (pos == 24) str = "x";
    if (pos == 25) str = "y";
    if (pos == 26) str = "z";

    return str;
}