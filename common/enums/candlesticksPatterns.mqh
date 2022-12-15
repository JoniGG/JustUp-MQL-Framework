//--- A candlesticks patterns enumeration
#define _CANDLESTICKS_PATTERNS_ENUM_VERSION_ 1.0

enum CandlesticksPatterns
{
    unknown_pattern = 0, //--- Unknown pattern

    //--- One candle patterns
    hammer = 1, //Hammer
    hangingMan = 2, //Hanging Man
    invertedHammer = 3, //Inverted Hammer
    shootingStar = 4, //Shooting Star
    dragonflyDoji = 5, //Dragonfly Doji
    gravestoneDoji = 6, //Gravestone Doji
    bullishSpinningTop = 7, //Bullish Spinning Top
    bearishSpinningTop = 8, //Bearish Spinning Top

    //--- Two candle patterns
    bullishKicker = 9, //Bullish Kicker
    bearishKicker = 10, //Bearish Kicker
    bullishEngulfing = 11, //Bullish Engulfing
    bearishEngulfing = 12, //Bearish Engulfing
    bullishHarami = 13, //Bullish Harami
    bearishHarami = 14, //Bearish Harami
    piercingLine = 15, //Piercing Line
    darkCloudCover = 16, //Dark Cloud Cover
    tweezerBottom = 17, //Tweezer Bottom
    tweezerTop = 18, //Tweezer Top

    //--- Three candle patterns
    morningStar = 19, //Morning Star
    eveningStar = 20, //Evening Star
    morningDojiStar = 21, //Morning Doji Star
    eveningDojiStar = 22, //Evening Doji Star
    bullishAbandonedBaby = 23, //Bullish Abandoned Baby
    bearishAbandonedBaby = 24, //Bearish Abandoned Baby
    threeWhiteSoldiers = 25, //Three White Soldiers
    threeBlackCrows = 26, //Three Black Crows
    bullishThreeLineStrike = 27, //Bullish Three Line Strike
    bearishThreeLineStrike = 28, //Bearish Three Line Strike
    threeInsideUp = 31, //Bullish Three Inside Up
    threeInsideDown = 32, //Bearish Three Inside Down
    threeOutsideUp = 29, //Bullish Three Outside Up
    threeOutsideDown = 30, //Bearish Three Outside Down

    //--- Neutral patterns
    doji = 33, //Doji
    marubozu = 34, //Marubozu
    doubleSpinningTop = 37, //Double Spinning Tops
};