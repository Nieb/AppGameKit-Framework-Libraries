///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  ┌─────────┐
//  │         │     Signed-Distance to Volume Edge/Threshold.
//  │         │
//  │    o  A │ B   A = -0.375   B = +0.375
//  │         │
//  │         │
//  └─────────┘
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION SD_Circle(Pnt_Pos REF AS Vec2,
                   Cir_Pos REF AS Vec2, Cir_Rds AS FLOAT)
    DeltaX   AS FLOAT : DeltaX   = Cir_Pos.x - Pnt_Pos.x
    DeltaY   AS FLOAT : DeltaY   = Cir_Pos.y - Pnt_Pos.y
    Distance AS FLOAT : Distance = sqrt((DeltaX*DeltaX) + (DeltaY*DeltaY)) - Cir_Rds
ENDFUNCTION Distance


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION SD_LineClipped(Pnt_Pos  REF AS Vec2,
                        Lin_PosA REF AS Vec2, Lin_PosB REF AS Vec2, Lin_Rds AS FLOAT)
    Distance AS FLOAT
ENDFUNCTION Distance

FUNCTION SD_LineCapped(Pnt_Pos  REF AS Vec2,
                       Lin_PosA REF AS Vec2, Lin_PosB REF AS Vec2, Lin_Rds AS FLOAT)
    DeltaAP AS Vec2 : DeltaAP = sub2(Pnt_Pos , Lin_PosA)
    DeltaAB AS Vec2 : DeltaAB = sub2(Lin_PosB, Lin_PosA)

    Distance AS FLOAT
    Distance = clampf( dot2(DeltaAP,DeltaAB)/dot2(DeltaAB,DeltaAB), 0.0, 1.0 )
    Distance = dst2( DeltaAP, mul2f(DeltaAB, Distance) ) - Lin_Rds
ENDFUNCTION Distance

