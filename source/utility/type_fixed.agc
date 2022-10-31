///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  Fixed-Point Large DataType:
TYPE  Fixed64 : Int AS INTEGER[ 1] : ENDTYPE
TYPE Fixed128 : Int AS INTEGER[ 3] : ENDTYPE
TYPE Fixed256 : Int AS INTEGER[ 7] : ENDTYPE
//TYPE  Fixed512 : Int AS INTEGER[15] : ENDTYPE
//TYPE Fixed1024 : Int AS INTEGER[31] : ENDTYPE

//@@  Arbitrary length will be difficult in AGK...
//TYPE FIXED
//    INT32 AS INTEGER[1] // Default is 64 bit.
//    //   1 =   64 bit
//    //   3 =  128 bit
//    //   7 =  256 bit
//    //  15 =  512 bit
//    //  31 = 1024 bit
//ENDTYPE


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION fxPrint64()
    //...
ENDFUNCTION

FUNCTION fxPrint128()
    //...
ENDFUNCTION

FUNCTION fxPrint256()
    //...
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION fxSet64( Int1 AS INTEGER, Int0 AS INTEGER)
    //...
ENDFUNCTION

FUNCTION fxSet128(Int3 AS INTEGER, Int2 AS INTEGER, Int1 AS INTEGER, Int0 AS INTEGER)
    //...
ENDFUNCTION

FUNCTION fxSet256(Int7 AS INTEGER, Int6 AS INTEGER, Int5 AS INTEGER, Int4 AS INTEGER,
                  Int3 AS INTEGER, Int2 AS INTEGER, Int1 AS INTEGER, Int0 AS INTEGER )
    //...
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//FUNCTION fxCast64_128()
//ENDFUNCTION
//FUNCTION fxCast64_256()
//ENDFUNCTION
//FUNCTION fxCast128_256()
//ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION fxAdd64(FixedA REF AS Fixed64, FixedB REF AS Fixed64)
    //...
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION fxSub64(FixedA REF AS Fixed64, FixedB REF AS Fixed64)
    //...
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION fxMul64(FixedA REF AS Fixed64, FixedB REF AS Fixed64)
    //...
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION fxDiv64(FixedA REF AS Fixed64, FixedB REF AS Fixed64)
    //...
ENDFUNCTION
