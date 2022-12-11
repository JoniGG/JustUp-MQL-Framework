//--- A package that allow you to compare variables of the same type.
#define _COMPAREVARS_PACKAGE_VERSION_ 1.0

//--- Compare two doubles with a presicion of a given nuber of digits after the decimal point.
bool EqualDoubles(double a, double b, int presicion = 12)
{
    if(presicion < 1 || presicion > 12)
     {
        Print("Error: presicion must be between 1 and 12");
        return false;
     }

    a = NormalizeDouble(a, presicion);
    b = NormalizeDouble(b, presicion);

    if(a - b == 0)
        return true;
    else
        return false;
}

//--- Compare two strings.
bool EqualStrings(string a, string b)
{
    if(a == b)
        return true;
    else
        return false;
}

//--- Compare two integers.
bool EqualIntegers(int a, int b)
{
    if(a == b)
        return true;
    else
        return false;
}

//--- Compare two booleans.
bool EqualBooleans(bool a, bool b)
{
    if(a == b)
        return true;
    else
        return false;
}

//--- Compare two arrays of doubles with a presicion of a given nuber of digits after the decimal point.
bool EqualDoubleArrays(double &a[], double &b[], int presicion = 12)
{
    if(presicion < 1 || presicion > 12)
     {
        Print("Error: presicion must be between 1 and 12");
        return false;
     }

    int size = ArraySize(a);
    if(size != ArraySize(b))
        return false;

    for(int i = 0; i < size; i++)
     {
        a[i] = NormalizeDouble(a[i], presicion);
        b[i] = NormalizeDouble(b[i], presicion);

        if(a[i] - b[i] != 0)
            return false;
     }

    return true;
}

//--- Compares two string arrays.
bool EqualStringArrays(string &a[], string &b[])
{
    int size = ArraySize(a);
    if(size != ArraySize(b))
        return false;

    for(int i = 0; i < size; i++)
     {
        if(a[i] != b[i])
            return false;
     }

    return true;
}

//--- Compares two integer arrays.
bool EqualIntegerArrays(int &a[], int &b[])
{
    int size = ArraySize(a);
    if(size != ArraySize(b))
        return false;

    for(int i = 0; i < size; i++)
     {
        if(a[i] != b[i])
            return false;
     }

    return true;
}

//--- Compares two boolean arrays.
bool EqualBooleanArrays(bool &a[], bool &b[])
{
    int size = ArraySize(a);
    if(size != ArraySize(b))
        return false;

    for(int i = 0; i < size; i++)
     {
        if(a[i] != b[i])
            return false;
     }

    return true;
}

