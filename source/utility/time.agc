///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
TYPE TimeType
    ThisFrame  AS FLOAT
    LastFrame  AS FLOAT
    Delta      AS FLOAT

    Multiplier AS FLOAT

    Speed AS FLOAT
ENDTYPE
GLOBAL Time AS TimeType


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  Place UpdateTime() at beginning of loop.
//  Use Time.Multiplier with any time based events.
FUNCTION UpdateTime()
    Time.ThisFrame = Timer()
    Time.Delta     = Time.ThisFrame - Time.LastFrame

    //  This maintains time precision to: ~0.000_001 seconds. (1 MicroSecond)
    IF (Time.ThisFrame >= 60.0) : ResetTimer() : Time.LastFrame = Timer()
    ELSE                                       : Time.LastFrame = Time.ThisFrame
    ENDIF

    //  This effectively makes all Deltas 'Units per-second'.
    IF (Time.Speed > 0.001) : Time.Multiplier = 60.0 * Time.Delta * Time.Speed
    ELSE                    : Time.Multiplier = 60.0 * Time.Delta
    ENDIF
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION UnixTimeToString(TimeUnix AS INTEGER)
    //  1 Hour                      3600 Seconds
    //  1 Day                      86400 Seconds
    //  1 Week                    604800 Seconds
    //  1 Month (30.44 days)     2629743 Seconds
    //  1 Year (365.24 days)    31556926 Seconds

    ClientTimeZoneOffset AS INTEGER : ClientTimeZoneOffset = val(left(GetCurrentTime(),2)) - GetHoursFromUnix(GetUnixTime())

    TimeUnix = TimeUnix + (3600 * ClientTimeZoneOffset)

    TimeUnixStr AS STRING
    TimeUnixStr =                      str(   GetYearFromUnix(TimeUnix)           )+"-"
    TimeUnixStr = TimeUnixStr + padstrwith(  GetMonthFromUnix(TimeUnix), 2, 0, "0")+"-"
    TimeUnixStr = TimeUnixStr + padstrwith(   GetDaysFromUnix(TimeUnix), 2, 0, "0")+" "
    TimeUnixStr = TimeUnixStr + padstrwith(  GetHoursFromUnix(TimeUnix), 2, 0, "0")+":"
    TimeUnixStr = TimeUnixStr + padstrwith(GetMinutesFromUnix(TimeUnix), 2, 0, "0")+":"
    TimeUnixStr = TimeUnixStr + padstrwith(GetSecondsFromUnix(TimeUnix), 2, 0, "0")
ENDFUNCTION TimeUnixStr

