///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION Mean(TheArray REF AS INTEGER[])
    Sum AS INTEGER : Sum = 0
    iAry AS INTEGER
    FOR iAry = 0 TO TheArray.length
        Sum = Sum + TheArray[iAry]
    NEXT iAry
ENDFUNCTION Sum / (TheArray.length + 1.0)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION Median(TheArray AS INTEGER[])
    TheArray.sort()
    IF mod(TheArray.length+1,2) // Odd or even?  ZeroInclusive.
        // Odd:
        EXITFUNCTION TheArray[ (TheArray.length + 1) / 2 ]
    ELSE
        // Even:
        EXITFUNCTION (TheArray[ floor(TheArray.length / 2.0) ] + TheArray[ ceil(TheArray.length / 2.0) ]) / 2.0
    ENDIF
ENDFUNCTION 0.0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION Shuffle(TheArray REF AS INTEGER[])
    iAry AS INTEGER
    FOR iAry = 0 TO TheArray.length-1
        TheArray.swap(iAry, random(iAry,TheArray.length)) // Swap current item with any item AFTER it, including itself.
    NEXT iAry
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PurgeDuplicates(TheArray REF AS INTEGER[])
    TheArray.sort()
    iAry AS INTEGER
    FOR iAry = TheArray.length TO 1 STEP -1
        IF TheArray[iAry] = TheArray[iAry-1] THEN TheArray.remove(iAry)
    NEXT iAry
ENDFUNCTION

