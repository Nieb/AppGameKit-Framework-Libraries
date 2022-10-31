///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  Aar = "Axis-Aligned Rectangle"
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PointVsAar( Pnt     AS Vec2,
                     Rct_Pos AS Vec2, Rct_Siz AS Vec2 )
ENDFUNCTION (Pnt.x < Rct_Pos.x+Rct_Siz.x AND Pnt.x >= Rct_Pos.x AND Pnt.y < Rct_Pos.y+Rct_Siz.y AND Pnt.y >= Rct_Pos.y)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION AarVsAar( Rct1_Pos AS Vec2, Rct1_Siz AS Vec2,
                   Rct2_Pos AS Vec2, Rct2_Siz AS Vec2 )
ENDFUNCTION (Rct1_Pos.x < Rct2_Pos.x+Rct2_Siz.x AND Rct1_Pos.x+Rct1_Siz.x >= Rct2_Pos.x AND Rct1_Pos.y < Rct2_Pos.y+Rct2_Siz.y AND Rct1_Pos.y+Rct1_Siz.y >= Rct2_Pos.y)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PointVsCircle( Pnt     AS Vec2,
                        Cir_Pos AS Vec2, Cir_Rds AS FLOAT )
    Dlt_X AS FLOAT : Dlt_X = Pnt.x - Cir_Pos.x
    Dlt_Y AS FLOAT : Dlt_Y = Pnt.y - Cir_Pos.y
ENDFUNCTION (Dlt_X*Dlt_X + Dlt_Y*Dlt_Y < Cir_Rds*Cir_Rds)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION CircleVsCircle( Cir1_Pos AS Vec2, Cir1_Rds AS FLOAT,
                         Cir2_Pos AS Vec2, Cir2_Rds AS FLOAT )
    Dlt_X AS FLOAT : Dlt_X = Cir1_Pos.x - Cir2_Pos.x
    Dlt_Y AS FLOAT : Dlt_Y = Cir1_Pos.y - Cir2_Pos.y
    IF (sqrt(Dlt_X*Dlt_X + Dlt_Y*Dlt_Y) < Cir1_Rds+Cir2_Rds) THEN EXITFUNCTION 1
ENDFUNCTION 0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION CircleVsAar( Cir_Pos AS Vec2, Cir_Rds AS FLOAT,
                      Rct_Pos AS Vec2, Rct_Siz AS Vec2 )
    //=====================================================================================================================================
    Cir_Lf AS FLOAT : Cir_Lf = Cir_Pos.x - Cir_Rds // "Circle-Left"
    Cir_Rt AS FLOAT : Cir_Rt = Cir_Pos.x + Cir_Rds // "Circle-Right"
    Cir_Bm AS FLOAT : Cir_Bm = Cir_Pos.y - Cir_Rds // "Circle-Bottom"                   2D Y is inverted in AGK.
    Cir_Tp AS FLOAT : Cir_Tp = Cir_Pos.y + Cir_Rds // "Circle-Top"
    //=====================================================================================================================================
    Rct_Rt AS FLOAT : Rct_Rt = Rct_Pos.x + Rct_Siz.x // "Rectangle-Right"
    Rct_Tp AS FLOAT : Rct_Tp = Rct_Pos.y + Rct_Siz.y // "Rectangle-Top"                 2D Y is inverted in AGK.
    //=====================================================================================================================================
    IF (Cir_Lf > Rct_Rt OR Cir_Bm > Rct_Tp OR Cir_Rt < Rct_Pos.x OR Cir_Tp < Rct_Pos.y) THEN EXITFUNCTION 0
    //=====================================================================================================================================
    IF     (Cir_Pos.y >= Rct_Pos.y AND Cir_Pos.y < Rct_Tp) : IF (Cir_Lf < Rct_Rt AND Cir_Rt > Rct_Pos.x) THEN EXITFUNCTION 1
    ELSEIF (Cir_Pos.x >= Rct_Pos.x AND Cir_Pos.x < Rct_Rt) : IF (Cir_Bm < Rct_Tp AND Cir_Tp > Rct_Pos.y) THEN EXITFUNCTION 1
    ENDIF
    //=====================================================================================================================================
    Dlt_X AS FLOAT
    IF     (Cir_Pos.x < Rct_Pos.x) : Dlt_X = Cir_Pos.x - Rct_Pos.x
    ELSEIF (Cir_Pos.x > Rct_Rt   ) : Dlt_X = Cir_Pos.x - Rct_Rt
    ENDIF
    Dlt_Y AS FLOAT
    IF     (Cir_Pos.y < Rct_Pos.y) : Dlt_Y = Cir_Pos.y - Rct_Pos.y
    ELSEIF (Cir_Pos.y > Rct_Tp   ) : Dlt_Y = Cir_Pos.y - Rct_Tp
    ENDIF
    IF (Dlt_X*Dlt_X + Dlt_Y*Dlt_Y <= Cir_Rds*Cir_Rds) THEN EXITFUNCTION 1
    //=====================================================================================================================================
ENDFUNCTION 0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PointVsLine( Pnt   REF AS Vec2,
                      LinA  REF AS Vec2, LinB  REF AS Vec2,
                      Tolerance AS FLOAT )
    DltPA_X AS FLOAT : DltPA_X = LinA.x - Pnt.x
    DltPA_Y AS FLOAT : DltPA_Y = LinA.y - Pnt.y
    DltPB_X AS FLOAT : DltPB_X = LinB.x - Pnt.x
    DltPB_Y AS FLOAT : DltPB_Y = LinB.y - Pnt.y
    APB_Len AS FLOAT : APB_Len = sqrt(DltPA_X*DltPA_X + DltPA_Y*DltPA_Y) + sqrt(DltPB_X*DltPB_X + DltPB_Y*DltPB_Y)
    DltAB_X AS FLOAT : DltAB_X = LinB.x - LinA.x
    DltAB_Y AS FLOAT : DltAB_Y = LinB.y - LinA.y
    AB_Len  AS FLOAT : AB_Len  = sqrt(DltAB_X*DltAB_X + DltAB_Y*DltAB_Y)
ENDFUNCTION (APB_Len < AB_Len + Tolerance) && (APB_Len > AB_Len - Tolerance)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION LineVsLine( Lin1A REF AS Vec2, Lin1B REF AS Vec2,  //  Parallel overlapping Lines will not test positive as a collision.
                     Lin2A REF AS Vec2, Lin2B REF AS Vec2 )
    //=====================================================================================================================================
    Dlt_Lin1_X   AS FLOAT : Dlt_Lin1_X   = Lin1B.x - Lin1A.x //  Line1 in LocalSpace.   A = (0,0)  B = (#,#)
    Dlt_Lin1_Y   AS FLOAT : Dlt_Lin1_Y   = Lin1B.y - Lin1A.y
    Dlt_Lin2_X   AS FLOAT : Dlt_Lin2_X   = Lin2B.x - Lin2A.x //  Line2 in LocalSpace.   A = (0,0)  B = (#,#)
    Dlt_Lin2_Y   AS FLOAT : Dlt_Lin2_Y   = Lin2B.y - Lin2A.y
    Dlt_LinPos_X AS FLOAT : Dlt_LinPos_X = Lin1A.x - Lin2A.x
    Dlt_LinPos_Y AS FLOAT : Dlt_LinPos_Y = Lin1A.y - Lin2A.y
    //=====================================================================================================================================
    n1 AS FLOAT : n1 = Dlt_Lin1_X*Dlt_LinPos_Y - Dlt_Lin1_Y*Dlt_LinPos_X //  Dlt_Lin1  cross  Dlt_LinPos
    n2 AS FLOAT : n2 = Dlt_Lin2_X*Dlt_LinPos_Y - Dlt_Lin2_Y*Dlt_LinPos_X //  Dlt_Lin2  cross  Dlt_LinPos
    d  AS FLOAT : d  = Dlt_Lin1_X*Dlt_Lin2_Y   - Dlt_Lin1_Y*Dlt_Lin2_X   //  Dlt_Lin1  cross  Dlt_Lin2
    r  AS FLOAT : r  = n1 / d     //@@  DivByZero possible?
    s  AS FLOAT : s  = n2 / d
    //=====================================================================================================================================
ENDFUNCTION (r >= 0.0 && r <= 1.0) && (s >= 0.0 && s <= 1.0)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION LineVsAas( LinA    AS Vec2, LinB    AS Vec2,
                    Sqr_Pos AS Vec2, Sqr_Siz AS FLOAT ) // BottomLeft, Width & Height        "Axis-Aligned Square"
//  //=====================================================================================================================================
//  SqrRadius AS FLOAT : SqrRadius = Sqr_Diameter * 0.5
//  Sqr_X_Lft AS FLOAT : Sqr_X_Lft = Sqr_X - SqrRadius
//  Sqr_X_Rit AS FLOAT : Sqr_X_Rit = Sqr_X + SqrRadius
//  Sqr_Y_Top AS FLOAT : Sqr_Y_Top = Sqr_Y - SqrRadius
//  Sqr_Y_Btm AS FLOAT : Sqr_Y_Btm = Sqr_Y + SqrRadius
//  //=====================================================================================================================================
//  // Is Area of line over Area of Square?
//  Lin_X_Lft AS FLOAT
//  Lin_X_Rit AS FLOAT
//  Lin_Y_Top AS FLOAT
//  Lin_Y_Btm AS FLOAT
//  IF LinA.x <= LinB.x : Lin_X_Lft = LinA.x : Lin_X_Rit = LinB.x
//  ELSE                : Lin_X_Lft = LinB.x : Lin_X_Rit = LinA.x
//  ENDIF
//  IF LinA.y <= LinB.y : Lin_Y_Top = LinA.y : Lin_Y_Btm = LinB.y
//  ELSE                : Lin_Y_Top = LinB.y : Lin_Y_Btm = LinA.y
//  ENDIF
//  IF (Sqr_X_Lft > Lin_X_Rit OR Sqr_Y_Top > Lin_Y_Btm OR Sqr_X_Rit < Lin_X_Lft OR Sqr_Y_Btm < Lin_Y_Top) THEN EXITFUNCTION 0  //@fix      Test >= Start, Test < End
//  //=====================================================================================================================================
//  // Is PointB in Square?                 Check PointB first, it's typically used as the destination of a movement vector.
//  IF LinB.x < Sqr_X_Rit AND LinB.x >= Sqr_X_Lft AND LinB.y < Sqr_Y_Btm AND LinB.y >= Sqr_Y_Top THEN EXITFUNCTION 101
//  //=====================================================================================================================================
//  // Is PointA in Square?
//  IF LinA.x < Sqr_X_Rit AND LinA.x >= Sqr_X_Lft AND LinA.y < Sqr_Y_Btm AND LinA.y >= Sqr_Y_Top THEN EXITFUNCTION 102
//  //=====================================================================================================================================
//  // Are any of the 4 Square lines colliding?
//  Delta_LineA_LineB_X AS FLOAT : Delta_LineA_LineB_X = LinB.x - LinA.x
//  Delta_LineA_LineB_Y AS FLOAT : Delta_LineA_LineB_Y = LinB.y - LinA.y
//  Delta_LineA_SqrA_X AS FLOAT
//  Delta_LineA_SqrA_Y AS FLOAT
//  //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  n1 AS FLOAT
//  n2 AS FLOAT
//  d AS FLOAT
//  r AS FLOAT
//  s AS FLOAT
//  //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  Delta_LineA_SqrA_X = LinA.x - Sqr_X_Lft
//  Delta_LineA_SqrA_Y = LinA.y - Sqr_Y_Top
//  n1 = (Delta_LineA_SqrA_Y * Delta_LineA_LineB_X) - (Delta_LineA_SqrA_X * Delta_LineA_LineB_Y)
//  n2 = (Delta_LineA_SqrA_Y * Sqr_Diameter)
//  d  = -(Delta_LineA_LineB_Y * Sqr_Diameter)
//  r = n1 / d
//  s = n2 / d
//  IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 201
//  //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  Delta_LineA_SqrA_X = LinA.x - Sqr_X_Rit
//  Delta_LineA_SqrA_Y = LinA.y - Sqr_Y_Top
//  n1 = (Delta_LineA_SqrA_Y * Delta_LineA_LineB_X) - (Delta_LineA_SqrA_X * Delta_LineA_LineB_Y)
//  n2 = -(Delta_LineA_SqrA_X * Sqr_Diameter)
//  d  = (Delta_LineA_LineB_X * Sqr_Diameter)
//  r = n1 / d
//  s = n2 / d
//  IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 202
//  //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  Delta_LineA_SqrA_X = LinA.x - Sqr_X_Rit
//  Delta_LineA_SqrA_Y = LinA.y - Sqr_Y_Btm
//  n1 = (Delta_LineA_SqrA_Y * Delta_LineA_LineB_X) - (Delta_LineA_SqrA_X * Delta_LineA_LineB_Y)
//  n2 = (Delta_LineA_SqrA_Y * -Sqr_Diameter)
//  d  = -(Delta_LineA_LineB_Y * -Sqr_Diameter)
//  r = n1 / d
//  s = n2 / d
//  IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 203
//  //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  // The function will never make it here.
//  Delta_LineA_SqrA_X = LinA.x - Sqr_X_Lft
//  Delta_LineA_SqrA_Y = LinA.y - Sqr_Y_Btm
//  n1 = (Delta_LineA_SqrA_Y * Delta_LineA_LineB_X) - (Delta_LineA_SqrA_X * Delta_LineA_LineB_Y)
//  n2 = -(Delta_LineA_SqrA_X * -Sqr_Diameter)
//  d  = (Delta_LineA_LineB_X * -Sqr_Diameter)
//  r = n1 / d
//  s = n2 / d
//  IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 204
//  //=====================================================================================================================================
ENDFUNCTION 0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION LineVsAar( LinA    REF AS Vec2, LinB    REF AS Vec2,
                    Rct_Pos REF AS Vec2, Rct_Siz REF AS Vec2 )  // Pos = BottomLeft     Siz = (Width, Height)
    //=====================================================================================================================================
    Rct_Rt AS FLOAT : Rct_Rt = Rct_Pos.x + Rct_Siz.x
    Rct_Bm AS FLOAT : Rct_Bm = Rct_Pos.y + Rct_Siz.y
    //=====================================================================================================================================
    // Is Area of Line over Area of Rectangle?
    Lin_Lf AS FLOAT
    Lin_Rt AS FLOAT
    IF     (LinA.x <= LinB.x) : Lin_Lf = LinA.x : Lin_Rt = LinB.x
    ELSEIF (LinA.x >  LinB.x) : Lin_Lf = LinB.x : Lin_Rt = LinA.x
    ENDIF
    Lin_Bm AS FLOAT
    Lin_Tp AS FLOAT
    IF     (LinA.y <= LinB.y) : Lin_Bm = LinB.y : Lin_Tp = LinA.y
    ELSEIF (LinA.y >  LinB.y) : Lin_Bm = LinA.y : Lin_Tp = LinB.y
    ENDIF
    IF Rct_Pos.x > Lin_Rt OR Rct_Pos.y > Lin_Bm OR Rct_Rt < Lin_Lf OR Rct_Bm < Lin_Tp THEN EXITFUNCTION 0
    //=====================================================================================================================================
    // Is PointB in Rectangle?
    // Check PointB first, it's typically used as the destination of a movement vector.
    IF (LinB.x < Rct_Rt AND LinB.x >= Rct_Pos.x AND LinB.y < Rct_Bm AND LinB.y >= Rct_Pos.y) THEN EXITFUNCTION 1
    //=====================================================================================================================================
    // Is PointA in Rectangle?
    IF (LinA.x < Rct_Rt AND LinA.x >= Rct_Pos.x AND LinA.y < Rct_Bm AND LinA.y >= Rct_Pos.y) THEN EXITFUNCTION 1
    //=====================================================================================================================================
    // Are any of the 4 Rectangle lines colliding?
    Delta_1A_1B_X AS FLOAT : Delta_1A_1B_X = LinB.x - LinA.x
    Delta_1A_1B_Y AS FLOAT : Delta_1A_1B_Y = LinB.y - LinA.y
    Delta_2A_2B_X AS FLOAT
    Delta_2A_2B_Y AS FLOAT
    Delta_1A_2A_X AS FLOAT
    Delta_1A_2A_Y AS FLOAT
    //=====================================================================================================================================
    n1 AS FLOAT
    n2 AS FLOAT
    d  AS FLOAT
    r  AS FLOAT
    s  AS FLOAT
    //=====================================================================================================================================
    Delta_2A_2B_X = Rct_Rt    - Rct_Pos.x
    Delta_2A_2B_Y = Rct_Pos.y - Rct_Pos.y
    Delta_1A_2A_X = LinA.x - Rct_Pos.x
    Delta_1A_2A_Y = LinA.y - Rct_Pos.y
    n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    r = n1 / d
    s = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //=====================================================================================================================================
    Delta_2A_2B_X = Rct_Rt - Rct_Rt
    Delta_2A_2B_Y = Rct_Bm - Rct_Pos.y
    Delta_1A_2A_X = LinA.x - Rct_Rt
    Delta_1A_2A_Y = LinA.y - Rct_Pos.y
    n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    r = n1 / d
    s = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //=====================================================================================================================================
    Delta_2A_2B_X = Rct_Pos.x - Rct_Rt
    Delta_2A_2B_Y = Rct_Bm    - Rct_Bm
    Delta_1A_2A_X = LinA.x    - Rct_Rt
    Delta_1A_2A_Y = LinA.y    - Rct_Bm
    n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    r = n1 / d
    s = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //=====================================================================================================================================
    Delta_2A_2B_X = Rct_Pos.x - Rct_Pos.x
    Delta_2A_2B_Y = Rct_Pos.y - Rct_Bm
    Delta_1A_2A_X = LinA.x    - Rct_Pos.x
    Delta_1A_2A_Y = LinA.y    - Rct_Bm
    n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    r = n1 / d
    s = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //=====================================================================================================================================
ENDFUNCTION 0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION LineVsCircle( LinA    AS Vec2, LinB    AS Vec2,
                       Cir_Pos AS Vec2, Cir_Rds AS FLOAT )
    //=====================================================================================================================================
    Cir_Lf AS FLOAT : Cir_Lf = Cir_Pos.x - Cir_Rds
    Cir_Tp AS FLOAT : Cir_Tp = Cir_Pos.y - Cir_Rds
    Cir_Rt AS FLOAT : Cir_Rt = Cir_Pos.x + Cir_Rds
    Cir_Bm AS FLOAT : Cir_Bm = Cir_Pos.y + Cir_Rds
    //=====================================================================================================================================
    // Is Area-of-Line over Area-of-Circle?
    Lin_Lf AS FLOAT
    Lin_Rt AS FLOAT
    IF     (LinA.x <= LinB.x) : Lin_Lf = LinA.x : Lin_Rt = LinB.x
    ELSEIF (LinA.x >  LinB.x) : Lin_Lf = LinB.x : Lin_Rt = LinA.x
    ENDIF
    Lin_Tp AS FLOAT
    Lin_Bm AS FLOAT
    IF     (LinA.y <= LinB.y) : Lin_Tp = LinA.y : Lin_Bm = LinB.y
    ELSEIF (LinA.y >  LinB.y) : Lin_Tp = LinB.y : Lin_Bm = LinA.y
    ENDIF
    IF (Cir_Lf > Lin_Rt OR Cir_Tp > Lin_Bm OR Cir_Rt < Lin_Lf OR Cir_Bm < Lin_Tp) THEN EXITFUNCTION 0
    //=====================================================================================================================================
    CirRds_Sqrd AS FLOAT : CirRds_Sqrd = Cir_Rds*Cir_Rds
    //=====================================================================================================================================
    // Is PointB in Circle?                 Check PointB first, it's typically used as the destination of a movement vector.
    DeltaBC_X AS FLOAT : DeltaBC_X = Cir_Pos.x - LinB.x
    DeltaBC_Y AS FLOAT : DeltaBC_Y = Cir_Pos.y - LinB.y
    IF (DeltaBC_X*DeltaBC_X + DeltaBC_Y*DeltaBC_Y) < CirRds_Sqrd THEN EXITFUNCTION 1
    //=====================================================================================================================================
    // Is PointA in Circle?
    DeltaAC_X AS FLOAT : DeltaAC_X = Cir_Pos.x - LinA.x
    DeltaAC_Y AS FLOAT : DeltaAC_Y = Cir_Pos.y - LinA.y
    IF (DeltaAC_X*DeltaAC_X + DeltaAC_Y*DeltaAC_Y) < CirRds_Sqrd THEN EXITFUNCTION 1
    //=====================================================================================================================================
    // PointD = CircleCenter projected on to Line.
    DeltaAB_X AS FLOAT : DeltaAB_X = LinB.x - LinA.x
    DeltaAB_Y AS FLOAT : DeltaAB_Y = LinB.y - LinA.y
    DeltaAD_L AS FLOAT : DeltaAD_L = (DeltaAC_X*DeltaAB_X + DeltaAC_Y*DeltaAB_Y) / (DeltaAB_X*DeltaAB_X + DeltaAB_Y*DeltaAB_Y)
    PointDX   AS FLOAT : PointDX = LinA.x + DeltaAB_X * DeltaAD_L
    PointDY   AS FLOAT : PointDY = LinA.y + DeltaAB_Y * DeltaAD_L
    //=====================================================================================================================================
    // Is PointD between PointA and PointB?
    IF (PointDX > Lin_Rt OR PointDY > Lin_Bm OR PointDX < Lin_Lf OR PointDY < Lin_Tp) THEN EXITFUNCTION 0
    //=====================================================================================================================================
    // Is PointD in Circle?
    DeltaDC_X AS FLOAT : DeltaDC_X = PointDX - Cir_Pos.x
    DeltaDC_Y AS FLOAT : DeltaDC_Y = PointDY - Cir_Pos.y
    IF (DeltaDC_X*DeltaDC_X + DeltaDC_Y*DeltaDC_Y) < CirRds_Sqrd THEN EXITFUNCTION 1
    //=====================================================================================================================================
ENDFUNCTION 0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION WhichSideOfLine(Pnt  REF AS Vec2,
                         LinA REF AS Vec2,
                         LinB REF AS Vec2 )
    Dtrmt AS FLOAT : Dtrmt = (Pnt.x-LinA.x)*(LinB.y-LinA.y) - (Pnt.y-LinA.y)*(LinB.x-LinA.x) // "Determinant"
    //                                      P
    //
    //                               A──────O──────B
    //
    //                                      N
    IF     Dtrmt > 0.0 : EXITFUNCTION  1  // Example P
    ELSEIF Dtrmt < 0.0 : EXITFUNCTION -1  // Example N
    ENDIF                          //  0     Example O     Point is on Line.
ENDFUNCTION 0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PointVsTriangle(Pnt  AS Vec2,
                         TriA AS Vec2,  //  Triangle winding is Anti-Clockwise.
                         TriB AS Vec2,
                         TriC AS Vec2 )
    DltPA_X AS FLOAT : DltPA_X = TriA.x - Pnt.x // "Delta"
    DltPA_Y AS FLOAT : DltPA_Y = TriA.y - Pnt.y
    DltPB_X AS FLOAT : DltPB_X = TriB.x - Pnt.x
    DltPB_Y AS FLOAT : DltPB_Y = TriB.y - Pnt.y
    DltPC_X AS FLOAT : DltPC_X = TriC.x - Pnt.x
    DltPC_Y AS FLOAT : DltPC_Y = TriC.y - Pnt.y
ENDFUNCTION (DltPA_X*DltPC_Y >= DltPC_X*DltPA_Y) && (DltPB_X*DltPA_Y >= DltPA_X*DltPB_Y) && (DltPC_X*DltPB_Y >= DltPB_X*DltPC_Y)


////FUNCTION PointVsTriangle(Pnt_Pos  AS Vec2,
////                         Tri0_Pos AS Vec2,  //  Triangle winding is Anti-Clockwise.
////                         Tri1_Pos AS Vec2,
////                         Tri2_Pos AS Vec2 )
////
////    // Translate Points to LocalSpace.
////    L0_X AS FLOAT : L0_X = Tri2_Pos.x - Tri0_Pos.x
////    L0_Y AS FLOAT : L0_Y = Tri2_Pos.y - Tri0_Pos.y
////
////    L1_X AS FLOAT : L1_X = Tri1_Pos.x - Tri0_Pos.x
////    L1_Y AS FLOAT : L1_Y = Tri1_Pos.y - Tri0_Pos.y
////
////    L2_X AS FLOAT : L2_X =  Pnt_Pos.x - Tri0_Pos.x
////    L2_Y AS FLOAT : L2_Y =  Pnt_Pos.y - Tri0_Pos.y
////
////    // Dots...
////    Dot00 AS FLOAT : Dot00 = L0_X * L0_X + L0_Y * L0_Y
////    Dot01 AS FLOAT : Dot01 = L0_X * L1_X + L0_Y * L1_Y
////    Dot02 AS FLOAT : Dot02 = L0_X * L2_X + L0_Y * L2_Y
////    Dot11 AS FLOAT : Dot11 = L1_X * L1_X + L1_Y * L1_Y
////    Dot12 AS FLOAT : Dot12 = L1_X * L2_X + L1_Y * L2_Y
////
////    // Compute barycentric coordinates.
////    CrsDotsRcp AS FLOAT : CrsDotsRcp = 1.0 / (dot00 * dot11 - dot01 * dot01)
////    u AS FLOAT : u = (dot11 * dot02 - dot01 * dot12) * CrsDotsRcp
////    v AS FLOAT : v = (dot00 * dot12 - dot01 * dot02) * CrsDotsRcp
////
////    //Print("===================")
////    //Print("    U = "+str(u))
////    //Print("    V = "+str(v))
////    //Print("  U+V = "+str(u + v))
////    //Print("===================")
////
////    // Check if point is in triangle.
////    IF (u >= 0) AND (v >= 0) AND (u + v < 1) THEN EXITFUNCTION 1
////
////ENDFUNCTION 0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Point VS Axis-Aligned Right-Triangle"
////FUNCTION PointVsAart( RiseOrFall      AS INTEGER,  // Triangulation Direction
////                      Point_X         AS INTEGER,
////                      Point_Y         AS INTEGER,
////                      Triangle_X      AS INTEGER,  // X,Y = TopLeft
////                      Triangle_Y      AS INTEGER,  // X,Y = TopLeft
////                      Triangle_Width  AS INTEGER,  // Triangle Width
////                      Triangle_Height AS INTEGER ) // Triangle Height
////    //=====================================================================================================================================
////    // First check if Point is in Rectangle with PointvsAar() before using this function, it will not work properly otherwise.
////
////    // do this internally ???
////    //      Might make sense to keep it external for this one.
////
////    // make which triangle you are testing for an argument?
////    // along with RiseOrFall ?
////
////    //=====================================================================================================================================
////    Point_X = Point_X - TriangleX // convert Point to local space
////    Point_Y = Point_Y - TriangleY // convert Point to local space
////    IF RiseOrFall = 0 // Rise
////        // ******
////        // *1  **
////        // *  * *
////        // * *  *
////        // **  2*
////        // ******
////        //Print( tWidth * Point_Y + tHeight * Point_X - tWidth * tHeight )
////        IF tWidth * Point_Y + tHeight * Point_X - tWidth * tHeight < 0
////            EXITFUNCTION 1
////        ELSE
////            EXITFUNCTION 2
////        ENDIF
////    ELSEIF RiseOrFall = 1 // Fall
////        // ******
////        // **  1*
////        // * *  *
////        // *  * *
////        // *2  **
////        // ******
////        //Print( tHeight * Point_X - tWidth * Point_Y )
////        IF tHeight * Point_X - tWidth * Point_Y > 0
////            EXITFUNCTION 1
////        ELSE
////            EXITFUNCTION 2
////        ENDIF
////    ENDIF
////ENDFUNCTION 0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//FUNCTION GetTri___(VecPos AS Vec2, Which AS INTEGER)
//    // https://www.desmos.com/calculator/mjptaodmua
//ENDFUNCTION
