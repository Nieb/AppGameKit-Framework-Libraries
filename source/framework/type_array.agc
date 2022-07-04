///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION Mean(TheArray REF AS INTEGER[])
    Sum AS INTEGER : Sum = 0
    index AS INTEGER
    FOR index = 0 TO TheArray.length
        Sum = Sum + TheArray[index]
    NEXT index
ENDFUNCTION Sum / (TheArray.length + 1.0)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION Median(TheArray AS INTEGER[])
    TheArray.sort()
    index AS INTEGER
    IF mod(TheArray.length+1,2) // Odd or even?  ZeroInclusive.
        EXITFUNCTION TheArray[ (TheArray.length + 1) / 2 ]
    ELSE
        EXITFUNCTION (TheArray[ floor(TheArray.length / 2.0) ] + TheArray[ ceil(TheArray.length / 2.0) ]) / 2.0
    ENDIF
ENDFUNCTION 0.0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION Shuffle(TheArray REF AS INTEGER[])
    index AS INTEGER
    FOR index = 0 TO TheArray.length-1
        TheArray.swap(index, random(index,TheArray.length)) // Swap current item with any item AFTER it, including itself.
    NEXT index
ENDFUNCTION

