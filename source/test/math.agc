

FUNCTION TEST_math()
    Print("math.agc")
    Print("")
    Print("=======================================================================")
    Print1("   deg(pi ) = ", deg(pi)   , 4, -1)
    Print1("   rad(180) = ", rad(180)  , 4, -1)
    Print("")
    Print("=======================================================================")
ENDFUNCTION



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// https://en.wikipedia.org/wiki/Feigenbaum_constants
/// https://en.wikipedia.org/wiki/Logistic_map
///
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// https://en.wikipedia.org/wiki/Integral    ∫
///
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// https://en.wikipedia.org/wiki/Summation   Σ = Sum of a Sequence.      Π = Product of a Sequence.
///     End:       n
///              -----
///              \
///               |    i = n*2        <--- Add this result to each result for i to n.
///              /
///              -----
///     Start:   i = 1
///
/// FOR i = 1 TO n
///     i = i + (i*2)
/// NEXT i


