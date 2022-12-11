//--- This package will include function related to statistics concepts.
#define _TRADINGMETRICS_PACKAGE_VERSION_ 1.0

//--- This function return the mathematical expectation of a given array of doubles.
double MathExpectation(double &array[], int arraySize)
{
    double sum = 0;
    for(int i = 0; i < arraySize; i++)
        sum += array[i];

    return sum / arraySize;
}

//--- This function return the variance of a given array of doubles.
double Variance(double &array[], int arraySize)
{
    double sum = 0;
    double mathExpectation = MathExpectation(array, arraySize);

    for(int i = 0; i < arraySize; i++)
        sum += pow(array[i] - mathExpectation, 2);

    return sum / arraySize;
}

//--- This function return the standard deviation of a given array of doubles.
double StandardDeviation(double &array[], int arraySize)
{
    return sqrt(Variance(array, arraySize));
}

//--- This function return the covariance of two given arrays of doubles.
double Covariance(double &array1[], double &array2[], int arraySize)
{
    double sum = 0;
    double mathExpectation1 = MathExpectation(array1, arraySize);
    double mathExpectation2 = MathExpectation(array2, arraySize);

    for(int i = 0; i < arraySize; i++)
        sum += (array1[i] - mathExpectation1) * (array2[i] - mathExpectation2);

    return sum / arraySize;
}

//--- This function return the correlation coefficient of two given arrays of doubles.
double CorrelationCoefficient(double &array1[], double &array2[], int arraySize)
{
    return Covariance(array1, array2, arraySize) / (StandardDeviation(array1, arraySize) * StandardDeviation(array2, arraySize));
}

//--- This function return the log return of a given array of doubles.
double LogReturn(double &array[], int arraySize)
{
    double sum = 0;
    for(int i = 0; i < arraySize - 1; i++)
        sum += log(array[i + 1] / array[i]);

    return sum / arraySize;
}

//--- Math Hope
double SimpleMathHope(double winrate, double lossrate, double averageWin, double averageLoss, double averageDraw = 0)
{
   return(winrate*averageWin-lossrate*averageLoss+averageDraw);
}
