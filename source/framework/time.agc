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
// Place UpdateTime() at beginning of loop.
// Use Time.Multiplier with any time based events.
FUNCTION UpdateTime()
    Time.ThisFrame = Timer()
    Time.Delta     = Time.ThisFrame - Time.LastFrame

    // This maintains time precision to: ~0.000_001 seconds.
    IF Time.ThisFrame >= 60.0
        ResetTimer()
        Time.LastFrame = Timer()
    ELSE
        Time.LastFrame = Time.ThisFrame
    ENDIF

    // This effectively makes all Deltas 'Units per-second'.
    IF Time.Speed > 0.0
        Time.Multiplier = 60.0 * Time.Delta * Time.Speed
    ELSE
        Time.Multiplier = 60.0 * Time.Delta
    ENDIF
ENDFUNCTION
