///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Constant MISS    = 0x7fffffff    // Equal to NaN.
#Constant EPSILON = 0.000001


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "Point vs Plane" ???
FUNCTION WhichSideOfPlane(PntPos REF AS Vec3,
                          PlnPos REF AS Vec3, PlnNrm REF AS Vec3)
    IF dot3(PlnNrm, sub3(PntPos, PlnPos)) >= 0.0 THEN EXITFUNCTION 1 // 'Point' is on 'PlnNrm' side.
ENDFUNCTION 0 // 'Point' is behind plane side.


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "Infinite-Ray vs Infinite-Plane"
FUNCTION IRayVsIPlane(RayPos REF AS Vec3, RayNrm REF AS Vec3,
                      PlnPos REF AS Vec3, PlnNrm REF AS Vec3)
    HitPos AS Vec3
    WhichSide AS FLOAT : WhichSide = dot3(PlnNrm, sub3(RayPos, PlnPos))
    Dot_RayNrm_PlnNrm AS FLOAT : Dot_RayNrm_PlnNrm = -dot3(RayNrm, PlnNrm)
    IF WhichSide >= 0.0 : IF (Dot_RayNrm_PlnNrm <  EPSILON) : HitPos.x = MISS : Print("WhichSide = 1") : EXITFUNCTION HitPos : ENDIF
    ELSE                : IF (Dot_RayNrm_PlnNrm > -EPSILON) : HitPos.x = MISS : Print("WhichSide = 0") : EXITFUNCTION HitPos : ENDIF
    ENDIF
    // Project Ray onto Plane from RayPos along RayNrm.
    Distance AS FLOAT : Distance = WhichSide / Dot_RayNrm_PlnNrm
    HitPos = add3( RayPos, mul3f(RayNrm, Distance) )
ENDFUNCTION HitPos


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "Infinite-Ray vs Infinite-Axis-Aligned-Plane"   Plane spans Z & Y.
FUNCTION IRayVsIAAPlaneX(RayPos REF AS Vec3, RayNrm REF AS Vec3, PlnPosX AS FLOAT)
    HitPos AS Vec3
    Distance AS FLOAT : Distance = (PlnPosX - RayPos.x) / RayNrm.x
    IF (Distance < EPSILON) : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
    HitPos = add3( RayPos, mul3f(RayNrm,Distance) )
ENDFUNCTION HitPos


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "Infinite-Ray vs Infinite-Axis-Aligned-Plane"   Plane spans X & Z.
FUNCTION IRayVsIAAPlaneY(RayPos REF AS Vec3, RayNrm REF AS Vec3, PlnPosY AS FLOAT)
    HitPos AS Vec3
    Distance AS FLOAT : Distance = (PlnPosY - RayPos.y) / RayNrm.y
    IF (Distance < EPSILON) : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
    HitPos = add3( RayPos, mul3f(RayNrm,Distance) )
ENDFUNCTION HitPos


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "Infinite-Ray vs Infinite-Axis-Aligned-Plane"   Plane spans X & Y.
FUNCTION IRayVsIAAPlaneZ(RayPos REF AS Vec3, RayNrm REF AS Vec3, PlnPosZ AS FLOAT)
    HitPos AS Vec3
    Distance AS FLOAT : Distance = (PlnPosZ - RayPos.z) / RayNrm.z
    IF (Distance < EPSILON) : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
    HitPos = add3( RayPos, mul3f(RayNrm,Distance) )
ENDFUNCTION HitPos


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "Point vs Axis-Aligned-Box"
FUNCTION PointVsAAB(PntPos REF AS Vec3, BoxPos REF AS Vec3, BoxSiz REF AS Vec3)
    IF (PntPos.x >= BoxPos.x AND PntPos.x < BoxPos.x+BoxSiz.x) AND (PntPos.y >= BoxPos.y AND PntPos.y < BoxPos.y+BoxSiz.y) AND (PntPos.z >= BoxPos.z AND PntPos.z < BoxPos.z+BoxSiz.z) THEN EXITFUNCTION 1
ENDFUNCTION 0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "Infinite-Ray vs Axis-Aligned-Box"
FUNCTION IRayVsAAB(RayPos REF AS Vec3, RayNrm REF AS Vec3, RayNrmRecip REF AS Vec3,
                   BoxPos REF AS Vec3, BoxSiz REF AS Vec3)
    // Distance to bounds Planes from RayPos, for 3 Axes Min & Max, 6 total.
    DistMinX AS FLOAT : DistMinX = (BoxPos.x            - RayPos.x) * RayNrmRecip.x  // We can avoid div here by using (1.0 / RayNormal).
    DistMaxX AS FLOAT : DistMaxX = (BoxPos.x + BoxSiz.x - RayPos.x) * RayNrmRecip.x
    DistMinY AS FLOAT : DistMinY = (BoxPos.y            - RayPos.y) * RayNrmRecip.y
    DistMaxY AS FLOAT : DistMaxY = (BoxPos.y + BoxSiz.y - RayPos.y) * RayNrmRecip.y
    DistMinZ AS FLOAT : DistMinZ = (BoxPos.z            - RayPos.z) * RayNrmRecip.z
    DistMaxZ AS FLOAT : DistMaxZ = (BoxPos.z + BoxSiz.z - RayPos.z) * RayNrmRecip.z

    //       +Y  |      |
    //           |      |                                          +Y -Z (far)
    //       ----+------+---- <-- DistMaxY                          | /
    //           |      |                                           |/
    //           |      |                           DistMinZ -->    +---- +X
    //           |      |                                          /
    //       ----+------+---- <-- DistMinY                        /
    //           |      |                                        /
    //       0   |      |  +X                   DistMaxZ -->   +Z (near)
    //           ^
    //        DistMinX  ^
    //               DistMaxX

    // Reorient Min<-->Max relative to RayPos.
    HoldMe AS FLOAT
    IF (DistMinX > DistMaxX) : HoldMe = DistMinX : DistMinX = DistMaxX : DistMaxX = HoldMe : ENDIF // max(DistMinX, DistMaxX)
    IF (DistMinY > DistMaxY) : HoldMe = DistMinY : DistMinY = DistMaxY : DistMaxY = HoldMe : ENDIF // max(DistMinY, DistMaxY)
    IF (DistMinZ > DistMaxZ) : HoldMe = DistMinZ : DistMinZ = DistMaxZ : DistMaxZ = HoldMe : ENDIF // max(DistMinZ, DistMaxZ)

    // Select PlaneHits in Quadrant/Octant of Box.
    DistFront AS FLOAT
    IF DistMinX > DistMinY // max(DistMinX, DistMinY)
        IF (DistMinX > DistMinZ) : DistFront = DistMinX : ELSE : DistFront = DistMinZ : ENDIF // max(DistMinX, DistMinZ)
    ELSE
        IF (DistMinY > DistMinZ) : DistFront = DistMinY : ELSE : DistFront = DistMinZ : ENDIF // max(DistMinY, DistMinZ)
    ENDIF
    DistBack AS FLOAT
    IF DistMaxX < DistMaxY // min(DistMaxX, DistMaxY)
        IF (DistMaxX < DistMaxZ) : DistBack = DistMaxX : ELSE : DistBack = DistMaxZ : ENDIF // min(DistMaxX, DistMaxZ)
    ELSE
        IF (DistMaxY < DistMaxZ) : DistBack = DistMaxY : ELSE : DistBack = DistMaxZ : ENDIF // min(DistMaxY, DistMaxZ)
    ENDIF

    // Did we hit it?
    HitPos AS Vec3
    IF     (DistBack  <      0.0) : HitPos.x = MISS // Box is behind us.
    ELSEIF (DistFront > DistBack) : HitPos.x = MISS // Ray does not collide.
    ELSE                          : HitPos   = add3( RayPos, mul3f(RayNrm,DistFront) ) // Get HitPosition.
    ENDIF
ENDFUNCTION HitPos


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION RayVsTriangle(RayPos REF AS Vec3, RayNrm REF AS Vec3, RayLen AS FLOAT, TriVrt AS Vec3[], BackFaceTest AS INTEGER)
  //TriVrt[0] = TriVrt[0]
    TriVrt[1] = sub3(TriVrt[1], TriVrt[0])  // TriVrt1 In TriangleSpace.
    TriVrt[2] = sub3(TriVrt[2], TriVrt[0])  // TriVrt2 In TriangleSpace.

    TriNrm      AS Vec3 : TriNrm      = crs3(TriVrt[1], TriVrt[2])
    RayPosLocal AS Vec3 : RayPosLocal = sub3(TriVrt[0], RayPos)  // RayPos In TriangleSpace.
    Crs_RPL_RN  AS Vec3 : Crs_RPL_RN  = crs3(RayPosLocal, RayNrm)

    Dtrmnt AS FLOAT : Dtrmnt = dot3(RayNrm, TriNrm)  // "Determinant".

    Dot_CrsRPLRN_V2 AS FLOAT
    Dot_CrsRPLRN_V1 AS FLOAT
    Dot_RPL_TN  AS FLOAT
    IF Dtrmnt >= 0.0
        IF NOT BackFaceTest : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
        Dot_CrsRPLRN_V2 =  dot3(Crs_RPL_RN,  TriVrt[2]) : IF (Dot_CrsRPLRN_V2 < 0.0 OR Dot_CrsRPLRN_V2                   >        Dtrmnt                    ) : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
        Dot_CrsRPLRN_V1 = -dot3(Crs_RPL_RN,  TriVrt[1]) : IF (Dot_CrsRPLRN_V1 < 0.0 OR Dot_CrsRPLRN_V2 + Dot_CrsRPLRN_V1 >        Dtrmnt                    ) : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
        Dot_RPL_TN      =  dot3(RayPosLocal, TriNrm)    : IF (Dot_RPL_TN      < 0.0 OR Dot_RPL_TN                        > RayLen*Dtrmnt OR Dtrmnt < EPSILON) : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
    ELSE
        Dot_CrsRPLRN_V2 =  dot3(Crs_RPL_RN,  TriVrt[2]) : IF (Dot_CrsRPLRN_V2 > 0.0 OR Dot_CrsRPLRN_V2                   <        Dtrmnt                    ) : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
        Dot_CrsRPLRN_V1 = -dot3(Crs_RPL_RN,  TriVrt[1]) : IF (Dot_CrsRPLRN_V1 > 0.0 OR Dot_CrsRPLRN_V2 + Dot_CrsRPLRN_V1 <        Dtrmnt                    ) : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
        Dot_RPL_TN      =  dot3(RayPosLocal, TriNrm)    : IF (Dot_RPL_TN      > 0.0 OR Dot_RPL_TN                        < RayLen*Dtrmnt                    ) : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
    ENDIF

    HitPos AS Vec3
    // DtrmntRcp = 1.0 / Dtrmnt
    // HitDist   = Dot_RPL_TN * DtrmntRcp
    HitPos = add3(    RayPos, mul3f( RayNrm, Dot_RPL_TN * (1.0/Dtrmnt) )    )
ENDFUNCTION HitPos


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION RayVsTriMesh(RayPos REF AS Vec3, RayNrm REF AS Vec3, RayLen AS FLOAT, TriMesh REF AS Vec3[], BackFaceTest AS INTEGER)

    // Option to stop at first Hit,
    // or to register all hits, then return closest hit,
    // or return all hits sorted in order?

    Hits   AS Vec3[]
    HitPos AS Vec3

////  //TriVrt[0] = TriVrt[0]
////    TriVrt[1] = sub3(TriVrt[1], TriVrt[0])  // TriVrt1 In TriangleSpace.
////    TriVrt[2] = sub3(TriVrt[2], TriVrt[0])  // TriVrt2 In TriangleSpace.
////
////    TriNrm      AS Vec3 : TriNrm      = crs3(TriVrt[1], TriVrt[2])
////    RayPosLocal AS Vec3 : RayPosLocal = sub3(TriVrt[0], RayPos)  // RayPos In TriangleSpace.
////    Crs_RPL_RN  AS Vec3 : Crs_RPL_RN  = crs3(RayPosLocal, RayNrm)
////
////    Dtrmnt AS FLOAT : Dtrmnt = dot3(RayNrm, TriNrm)  // Determinant.
////
////    Dot_CrsRPLRN_V2 AS FLOAT
////    Dot_CrsRPLRN_V1 AS FLOAT
////    Dot_RPL_TN  AS FLOAT
////    IF Dtrmnt >= 0.0
////        IF NOT BackFaceTest : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
////        Dot_CrsRPLRN_V2 =  dot3(Crs_RPL_RN,  TriVrt[2]) : IF Dot_CrsRPLRN_V2 < 0.0 OR Dot_CrsRPLRN_V2                   > Dtrmnt      : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
////        Dot_CrsRPLRN_V1 = -dot3(Crs_RPL_RN,  TriVrt[1]) : IF Dot_CrsRPLRN_V1 < 0.0 OR Dot_CrsRPLRN_V2 + Dot_CrsRPLRN_V1 > Dtrmnt      : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
////        Dot_RPL_TN      =  dot3(RayPosLocal, TriNrm)    : IF Dot_RPL_TN      < 0.0 OR Dot_RPL_TN  > RayLen*Dtrmnt OR Dtrmnt < EPSILON : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
////    ELSE
////        Dot_CrsRPLRN_V2 =  dot3(Crs_RPL_RN,  TriVrt[2]) : IF Dot_CrsRPLRN_V2 > 0.0 OR Dot_CrsRPLRN_V2                   < Dtrmnt      : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
////        Dot_CrsRPLRN_V1 = -dot3(Crs_RPL_RN,  TriVrt[1]) : IF Dot_CrsRPLRN_V1 > 0.0 OR Dot_CrsRPLRN_V2 + Dot_CrsRPLRN_V1 < Dtrmnt      : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
////        Dot_RPL_TN      =  dot3(RayPosLocal, TriNrm)    : IF Dot_RPL_TN      > 0.0 OR Dot_RPL_TN  < RayLen*Dtrmnt                     : HitPos.x = MISS : EXITFUNCTION HitPos : ENDIF
////    ENDIF
////
////    // DtrmntRcp = 1.0 / Dtrmnt
////    // HitDist   = Dot_RPL_TN * DtrmntRcp
////    HitPos = add3(    RayPos, mul3f( RayNrm, Dot_RPL_TN * (1.0/Dtrmnt) )    )

ENDFUNCTION HitPos


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PointVsSphere(PntPos REF AS Vec3,
                       SphPos REF AS Vec3, SphRds AS FLOAT)

    Delta_X  AS FLOAT : Delta_X  = SphPos.x - PntPos.x
    Delta_Y  AS FLOAT : Delta_Y  = SphPos.y - PntPos.y
    Distance AS FLOAT : Distance = SphPos.z - PntPos.z // "Delta_Z".

    Distance = sqrt(Delta_X*Delta_X + Delta_Y*Delta_Y + Distance*Distance)

    IF Distance <= SphRds THEN EXITFUNCTION 1

ENDFUNCTION 0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION IRayVsSphere(RayPos REF AS Vec3, RayNrm REF AS Vec3,
                      SphPos REF AS Vec3, SphRds AS FLOAT)

    HitPos AS Vec3

    /// Is RayPos inside the Sphere?
    ///     HitPos = RayPos

    /// Project SphPos onto Ray-Line, is this point inside the Sphere?
    ///     Then, determine HitPos...
    ///         HitPos = ...

ENDFUNCTION HitPos

