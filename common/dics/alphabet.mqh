//--- This is a dictionaries pack related to the english alphabet.
#define _ALPHABET_DICTIONARY_VERSION_ 1.0

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