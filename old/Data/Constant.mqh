#define _FRAMEWORK_NAME_ "Just Up Corporation Framework"
#define _FRAMEWORK_AUTHOR_ "Jonathan Fernandez"
#define _FRAMEWORK_WEBSITE_ "https://tech.justup.us/framework/"
#define _FRAMEWORK_VERSION_STRING_ "1.02"
#define _FRAMEWORK_VERSION_NUMBER_ 1.02
#define _FRAMEWORK_VERSION_DATE_ "2021.03.01"

#define FRAMEWORK_INITIALIZATION_SUCCEED 0
#define FRAMEWORK_INITIALIZATION_ERROR 1
#define FRAMEWORK_UNLOADING_SUCCEED 0
#define FRAMEWORK_UNLOADING_ERROR 1

//--- Internal Framework Settings
#define _ALLOW_INTERFACE_ true
#define _ALLOW_LOGGING_ true
#define _ALLOW_ALERTS_ true
#define _DEACTIVATE_LOGO_ false

//--- Framework Constants & Variables
const double pi = 3.1415926535897932384626433832795;
const double phi = 1.6180339887498948482045868343656;
const double kepler = 0.01720209895;
const double gravity = 9.80665;
const double speedOfLight = 299792458;
const double speedOfSound = 340.29;
const double speedOfSoundSeaLevel = 331.45;
const double onePip = 0.0001;
const double onePipInCents = 0.01;
const double onePipInPoints = 0.1;
const double onePipInTicks = 10;