///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
TYPE Vec3
    x AS FLOAT
    y AS FLOAT
    z AS FLOAT
ENDTYPE

TYPE iVec3
    x AS INTEGER
    y AS INTEGER
    z AS INTEGER
ENDTYPE


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  Constructors:
FUNCTION vec3(FltX AS FLOAT, FltY AS FLOAT, FltZ AS FLOAT)
    Result AS Vec3
    Result.x = FltX
    Result.y = FltY
    Result.z = FltZ
ENDFUNCTION Result

FUNCTION ivec3(IntX AS INTEGER, IntY AS INTEGER, IntZ AS INTEGER)
    Result AS iVec3
    Result.x = IntX
    Result.y = IntY
    Result.z = IntZ
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION InitializeVector3()
    // AGK does not support default values for UserTypes nor UserType Constants.
    GLOBAL Zero3     AS Vec3 : Zero3     = vec3(0.0, 0.0, 0.0)
    GLOBAL Axis3_X   AS Vec3 : Axis3_X   = vec3(1.0, 0.0, 0.0)
    GLOBAL Axis3_Y   AS Vec3 : Axis3_Y   = vec3(0.0, 1.0, 0.0)
    GLOBAL Axis3_Z   AS Vec3 : Axis3_Z   = vec3(0.0, 0.0, 1.0)

    GLOBAL Axis3_XY  AS Vec3 : Axis3_XY  = vec3(Sqrt2Rcp, Sqrt2Rcp,      0.0)
    GLOBAL Axis3_YZ  AS Vec3 : Axis3_YZ  = vec3(     0.0, Sqrt2Rcp, Sqrt2Rcp)
    GLOBAL Axis3_ZX  AS Vec3 : Axis3_ZX  = vec3(Sqrt2Rcp,      0.0, Sqrt2Rcp)

    GLOBAL Axis3_XYZ AS Vec3 : Axis3_XYZ = vec3(Sqrt3Rcp, Sqrt3Rcp, Sqrt3Rcp)
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION Print3(Label AS STRING, PrintMe REF AS Vec3, PadLeft AS INTEGER, TruncRight AS INTEGER)
    Print(Label + padstr(PrintMe.x, PadLeft, TruncRight)+" "+padstr(PrintMe.y, PadLeft, TruncRight)+" "+padstr(PrintMe.z, PadLeft, TruncRight))
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION add3(VecA REF AS Vec3, VecB REF AS Vec3) // 'VecA' + 'VecB'
    Result AS Vec3
    Result.x = VecA.x + VecB.x
    Result.y = VecA.y + VecB.y
    Result.z = VecA.z + VecB.z
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION add3f(VecA REF AS Vec3, FltA AS FLOAT) // 'VecA' + 'FltA'
    Result AS Vec3
    Result.x = VecA.x + FltA
    Result.y = VecA.y + FltA
    Result.z = VecA.z + FltA
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION sub3(VecA REF AS Vec3, VecB REF AS Vec3) // 'VecA' - 'VecB'
    Result AS Vec3
    Result.x = VecA.x - VecB.x
    Result.y = VecA.y - VecB.y
    Result.z = VecA.z - VecB.z
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION sub3f(VecA REF AS Vec3, FltA AS FLOAT) // 'VecA' - 'FltA'
    Result AS Vec3
    Result.x = VecA.x - FltA
    Result.y = VecA.y - FltA
    Result.z = VecA.z - FltA
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION mul3(VecA REF AS Vec3, VecB REF AS Vec3) // 'VecA' * 'VecB'
    Result AS Vec3
    Result.x = VecA.x * VecB.x
    Result.y = VecA.y * VecB.y
    Result.z = VecA.z * VecB.z
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION mul3f(VecA REF AS Vec3, FltA AS FLOAT) // 'VecA' * 'FltA'
    Result AS Vec3
    Result.x = VecA.x * FltA
    Result.y = VecA.y * FltA
    Result.z = VecA.z * FltA
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION div3(VecA REF AS Vec3, VecB REF AS Vec3) // 'VecA' / 'VecB'
    Result AS Vec3
    Result.x = VecA.x / VecB.x
    Result.y = VecA.y / VecB.y
    Result.z = VecA.z / VecB.z
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION div3f(VecA REF AS Vec3, FltA AS FLOAT) // 'VecA' / 'FltA'
    Result AS Vec3
    Result.x = VecA.x / FltA
    Result.y = VecA.y / FltA
    Result.z = VecA.z / FltA
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION dot3(VecA REF AS Vec3, VecB REF AS Vec3) // 'VecA' dot 'VecB'
ENDFUNCTION (VecA.x*VecB.x + VecA.y*VecB.y + VecA.z*VecB.z)  //  How much does B overlap with A, relative to A, as a vector1.


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION crs3(VecA REF AS Vec3, VecB REF AS Vec3) //  'VecA' cross 'VecB'
    Result AS Vec3                                //      How much does B 'cross' with A, relative to A, as a perpendicular vector3.
    Result.x = (VecA.y*VecB.z - VecA.z*VecB.y)    //          crs(+X, +Y) = +Z
    Result.y = (VecA.z*VecB.x - VecA.x*VecB.z)    //          crs(+Y, +Z) = +X
    Result.z = (VecA.x*VecB.y - VecA.y*VecB.x)    //          crs(+Z, +X) = +Y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION inv3(VecA AS Vec3) // "Invert"      (Additive Inverse) of 'VecA'.
    VecA.x = -VecA.x
    VecA.y = -VecA.y
    VecA.z = -VecA.z
ENDFUNCTION VecA


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION cmp3(VecA AS Vec3) // "Complement"  (Complimentary Inverse) of 'VecA'.
    VecA.x = 1.0 - VecA.x
    VecA.y = 1.0 - VecA.y
    VecA.z = 1.0 - VecA.z
ENDFUNCTION VecA


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rcp3(VecA AS Vec3) // "Reciprocal"  (Multiplicative Inverse) of 'VecA'.
    VecA.x = 1.0 / VecA.x
    VecA.y = 1.0 / VecA.y
    VecA.z = 1.0 / VecA.z
ENDFUNCTION VecA


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION len3(VecA AS Vec3) // "Length" of 'VecA'. (Distance from (0,0,0))
    VecA.x = sqrt(VecA.x*VecA.x + VecA.y*VecA.y + VecA.z*VecA.z)
ENDFUNCTION VecA.x


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION dst3(VecA AS Vec3, VecB AS Vec3) // "Distance" between 'VecA' and 'VecB'.
    VecA.x = VecB.x - VecA.x // "Delta_X"
    VecA.y = VecB.y - VecA.y // "Delta_Y"
    VecA.z = VecB.z - VecA.z // "Delta_Z"
    VecA.x = sqrt(VecA.x*VecA.x + VecA.y*VecA.y + VecA.z*VecA.z) // "Result"
ENDFUNCTION VecA.x


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION lenthn3(VecA AS Vec3, LengthNew AS FLOAT) // "Lengthen"  'VecA' scaled to 'LengthNew'.
    IF NOT (VecA.x = 0.0 AND VecA.y = 0.0 AND VecA.z = 0.0) // Avoid Divide-by-Zero.
        LengthNew = LengthNew / sqrt(VecA.x*VecA.x + VecA.y*VecA.y + VecA.z*VecA.z) // Get Vector Scaler (LengthNew / LengthOld).
        VecA.x = VecA.x * LengthNew
        VecA.y = VecA.y * LengthNew
        VecA.z = VecA.z * LengthNew
    ENDIF
ENDFUNCTION VecA


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION nrm3(VecA AS Vec3) // "Normalize"  'VecA' scaled to length of 1.0.
    IF NOT (VecA.x = 0.0 AND VecA.y = 0.0 AND VecA.z = 0.0) // Avoid Divide-by-Zero.
        Length AS FLOAT : Length = 1.0 / sqrt(VecA.x*VecA.x + VecA.y*VecA.y + VecA.z*VecA.z) // Get Vector Scaler (LengthNew / LengthOld).
        VecA.x = VecA.x * Length
        VecA.y = VecA.y * Length
        VecA.z = VecA.z * Length
    ENDIF
ENDFUNCTION VecA


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION flr3(VecA AS Vec3) // "Floor"    Each component of 'VecA' rounded down.
    VecA.x = floor(VecA.x)
    VecA.y = floor(VecA.y)
    VecA.z = floor(VecA.z)
ENDFUNCTION VecA


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION cil3(VecA AS Vec3) // "Ceiling"  Each component of 'VecA' rounded up.
    VecA.x = ceil(VecA.x)
    VecA.y = ceil(VecA.y)
    VecA.z = ceil(VecA.z)
ENDFUNCTION VecA


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rnd3(VecA AS Vec3) // "Round"    Each component of 'VecA' rounded to nearest Integer.
    VecA.x = round(VecA.x)
    VecA.y = round(VecA.y)
    VecA.z = round(VecA.z)
ENDFUNCTION VecA


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rndto3(VecA REF AS Vec3, RoundTo AS FLOAT) // "Round To"  Each component of 'VecA' rounded to nearest multiple of 'RoundTo'.
    Result AS Vec3
    Result.x = fmod(VecA.x, RoundTo)
    Result.y = fmod(VecA.y, RoundTo)
    Result.z = fmod(VecA.z, RoundTo)
    Threshold AS FLOAT : Threshold = RoundTo * 0.5
    IF     (Result.x > 0.0) : IF (Result.x >=  Threshold) : Result.x = VecA.x + RoundTo -     Result.x  : ELSE : Result.x = VecA.x -     Result.x  : ENDIF
    ELSEIF (Result.x < 0.0) : IF (Result.x <= -Threshold) : Result.x = VecA.x - RoundTo + abs(Result.x) : ELSE : Result.x = VecA.x + abs(Result.x) : ENDIF
    ELSE                                                  : Result.x = VecA.x
    ENDIF
    IF     (Result.y > 0.0) : IF (Result.y >=  Threshold) : Result.y = VecA.y + RoundTo -     Result.y  : ELSE : Result.y = VecA.y -     Result.y  : ENDIF
    ELSEIF (Result.y < 0.0) : IF (Result.y <= -Threshold) : Result.y = VecA.y - RoundTo + abs(Result.y) : ELSE : Result.y = VecA.y + abs(Result.y) : ENDIF
    ELSE                                                  : Result.y = VecA.y
    ENDIF
    IF     (Result.z > 0.0) : IF (Result.z >=  Threshold) : Result.z = VecA.z + RoundTo -     Result.z  : ELSE : Result.z = VecA.z -     Result.z  : ENDIF
    ELSEIF (Result.z < 0.0) : IF (Result.z <= -Threshold) : Result.z = VecA.z - RoundTo + abs(Result.z) : ELSE : Result.z = VecA.z + abs(Result.z) : ENDIF
    ELSE                                                  : Result.z = VecA.z
    ENDIF
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION avg3_2(VecA REF AS Vec3, VecB REF AS Vec3) // "Average" of 2 Vectors.
    Result AS Vec3
    Result.x = (VecA.x + VecB.x) * 0.5
    Result.y = (VecA.y + VecB.y) * 0.5
    Result.z = (VecA.z + VecB.z) * 0.5
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION avg3_3(VecA REF AS Vec3, VecB REF AS Vec3, VecC REF AS Vec3) // "Average" of 3 Vectors.
    Result AS Vec3
    Result.x = (VecA.x + VecB.x + VecC.x) * OneThird
    Result.y = (VecA.y + VecB.y + VecC.y) * OneThird
    Result.z = (VecA.z + VecB.z + VecC.z) * OneThird
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION avg3_4(VecA REF AS Vec3, VecB REF AS Vec3, VecC REF AS Vec3, VecD REF AS Vec3) // "Average" of 4 Vectors.
    Result AS Vec3
    Result.x = (VecA.x + VecB.x + VecC.x + VecD.x) * 0.25
    Result.y = (VecA.y + VecB.y + VecC.y + VecD.y) * 0.25
    Result.z = (VecA.z + VecB.z + VecC.z + VecD.z) * 0.25
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION ref3(VecA REF AS Vec3, SurfaceNrm REF AS Vec3) // "Reflect"   //@@  Add Multiplier?
    Dot AS FLOAT : Dot = (VecA.x * SurfaceNrm.x) + (VecA.y * SurfaceNrm.y) + (VecA.z * SurfaceNrm.z)
    Result AS Vec3
    Result.x = VecA.x + (SurfaceNrm.x * Dot * -2.0)
    Result.y = VecA.y + (SurfaceNrm.y * Dot * -2.0)
    Result.z = VecA.z + (SurfaceNrm.z * Dot * -2.0)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION def3(VecA REF AS Vec3, SurfaceNrm REF AS Vec3) // "Deflect"   //@@  Add Multiplier?
    Dot AS FLOAT : Dot = (VecA.x * SurfaceNrm.x) + (VecA.y * SurfaceNrm.y) + (VecA.z * SurfaceNrm.z)
    Result AS Vec3
    Result.x = (SurfaceNrm.x * Dot * 2.0) - VecA.x
    Result.y = (SurfaceNrm.y * Dot * 2.0) - VecA.y
    Result.z = (SurfaceNrm.z * Dot * 2.0) - VecA.z
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION prj3(Pnt  REF AS Vec3,                         // "Projection"  Get ClosestPointOnLine from 'Point'.
              LinA REF AS Vec3, LinB REF AS Vec3)
    Delta_AP_X AS FLOAT : Delta_AP_X = Pnt.x - LinA.x  // Pnt.x = ...  @@ Could reuse Pnt var here.
    Delta_AP_Y AS FLOAT : Delta_AP_Y = Pnt.y - LinA.y  // Pnt.y = ...
    Delta_AP_Z AS FLOAT : Delta_AP_Z = Pnt.z - LinA.z  // Pnt.z = ...

    Delta_AB_X AS FLOAT : Delta_AB_X = LinB.x - LinA.x  // LinB.x = ...  @@ Could reuse LinB var here.
    Delta_AB_Y AS FLOAT : Delta_AB_Y = LinB.y - LinA.y  // LinB.y = ...
    Delta_AB_Z AS FLOAT : Delta_AB_Z = LinB.z - LinA.z  // LinB.z = ...

    Dot_AP_AB            AS FLOAT : Dot_AP_AB            = (Delta_AP_X * Delta_AB_X) + (Delta_AP_Y * Delta_AB_Y) + (Delta_AP_Z * Delta_AB_Z)
    Delta_AB_Length_Sqrd AS FLOAT : Delta_AB_Length_Sqrd = (Delta_AB_X * Delta_AB_X) + (Delta_AB_Y * Delta_AB_Y) + (Delta_AB_Z * Delta_AB_Z)

    // Get distance, from LinA as multiple of DltAB, to NearestPointOnLine:
    Delta_Scalar AS FLOAT : Delta_Scalar = Dot_AP_AB / Delta_AB_Length_Sqrd // (LengthNew / LengthOld)

    Result AS Vec3
    Result.x = LinA.x + (Delta_AB_X * Delta_Scalar)
    Result.y = LinA.y + (Delta_AB_Y * Delta_Scalar)
    Result.z = LinA.z + (Delta_AB_Z * Delta_Scalar)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION prj3n(Pnt     REF AS Vec3,                      // "Projection"  Get ClosestPointOnLine from 'Point'.
               Lin_Pos REF AS Vec3, Lin_Nrm REF AS Vec3)
    Dot_AP_AB AS FLOAT : Dot_AP_AB = ((Pnt.x - Lin_Pos.x) * Lin_Nrm.x) + ((Pnt.y - Lin_Pos.y) * Lin_Nrm.y) + ((Pnt.z - Lin_Pos.z) * Lin_Nrm.z)
    Result AS Vec3
    Result.x = Lin_Pos.x + (Lin_Nrm.x * Dot_AP_AB)
    Result.y = Lin_Pos.y + (Lin_Nrm.y * Dot_AP_AB)
    Result.z = Lin_Pos.z + (Lin_Nrm.z * Dot_AP_AB)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION AngleToVec3_OnPlnX(Theta AS FLOAT) // Result will be on plane spanning YZ.
    Theta = -Theta // Theta is inverted.
    Result AS Vec3
    Result.x =  0.0
    Result.y =  sin(Theta)
    Result.z = -cos(Theta)
ENDFUNCTION Result

FUNCTION AngleToVec3_OnPlnY(Theta AS FLOAT) // Result will be on plane spanning XZ.
    Theta = -Theta // Theta is inverted.
    Result AS Vec3
    Result.x =  cos(Theta)
    Result.y = 0.0
    Result.z = -sin(Theta)
ENDFUNCTION Result

FUNCTION AngleToVec3_OnPlnZ(Theta AS FLOAT) // Result will be on plane spanning XY.
    Theta = -Theta // Theta is inverted.
    Result AS Vec3
    Result.x = cos(Theta)
    Result.y = sin(Theta)
    Result.z = 0.0
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PitchYawToVec3(Pch AS FLOAT, Yaw AS FLOAT)
    //  Thetas & Z are inverted.
    //      PitchYawToVec3( 0,  0) = ( 0, 0,-1)
    //      PitchYawToVec3(90,  0) = ( 0,-1, 0)
    //      PitchYawToVec3( 0, 90) = ( 1, 0, 0)
    Result AS Vec3
    Result.y =             cos( Pch )
    Result.x =  Result.y * sin( Yaw )
    Result.z = -Result.y * cos( Yaw )
    Result.y =            -sin( Pch ) // Actual Y value.
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION pch3(Pnt REF AS Vec3, Theta AS FLOAT) // "Rotate" 'Point' around Pivot(0,0,0) on AxisX.
    IF (Theta = 0.0)
        EXITFUNCTION Pnt
    ELSE
        Theta = -Theta // Theta is inverted.

        CosT AS FLOAT : CosT = cos(Theta)
        SinT AS FLOAT : SinT = sin(Theta)

        Result AS Vec3
        Result.x =      Pnt.x                  // 1.0*Pnt.x +  0.0*Pnt.y +   0.0*Pnt.z
        Result.y = CosT*Pnt.y + -SinT*Pnt.z    // 0.0*Pnt.x + CosT*Pnt.y + -SinT*Pnt.z
        Result.z = SinT*Pnt.y +  CosT*Pnt.z    // 0.0*Pnt.x + SinT*Pnt.y +  CosT*Pnt.z
    ENDIF
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION pch3p(Pnt REF AS Vec3, Pivot REF AS Vec3, Theta AS FLOAT) // "Rotate" 'Point' around 'Pivot' on AxisX.
    IF (Theta = 0.0)
        EXITFUNCTION Pnt
    ELSE
        Theta = -Theta // Theta is inverted.

        DltX AS FLOAT : DltX = Pnt.x - Pivot.x
        DltY AS FLOAT : DltY = Pnt.y - Pivot.y
        DltZ AS FLOAT : DltZ = Pnt.z - Pivot.z

        CosT AS FLOAT : CosT = cos(Theta)
        SinT AS FLOAT : SinT = sin(Theta)

        Result AS Vec3
        Result.x = Pivot.x  +       DltX                 // Pivot.x  +  1.0*DltX +  0.0*DltY +   0.0*DltZ
        Result.y = Pivot.y  +  CosT*DltY + -SinT*DltZ    // Pivot.y  +  0.0*DltX + CosT*DltY + -SinT*DltZ
        Result.z = Pivot.z  +  SinT*DltY +  CosT*DltZ    // Pivot.z  +  0.0*DltX + SinT*DltY +  CosT*DltZ
    ENDIF
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION yaw3(Pnt REF AS Vec3, Theta AS FLOAT) // "Rotate" 'Point' around Pivot(0,0,0) on AxisY.
    IF (Theta = 0.0)
        EXITFUNCTION Pnt
    ELSE
        Theta = -Theta // Theta is inverted.

        CosT AS FLOAT : CosT = cos(Theta)
        SinT AS FLOAT : SinT = sin(Theta)

        Result AS Vec3
        Result.x =  CosT*Pnt.x + SinT*Pnt.z    //  CosT*Pnt.x + 0.0*Pnt.y + SinT*Pnt.z
        Result.y =       Pnt.y                 //   0.0*Pnt.x + 1.0*Pnt.y +  0.0*Pnt.z
        Result.z = -SinT*Pnt.x + CosT*Pnt.z    // -SinT*Pnt.x + 0.0*Pnt.y + CosT*Pnt.z
    ENDIF
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION yaw3p(Pnt REF AS Vec3, Pivot REF AS Vec3, Theta AS FLOAT) // "Rotate" 'Point' around 'Pivot' on AxisY.
    IF (Theta = 0.0)
        EXITFUNCTION Pnt
    ELSE
        Theta = -Theta // Theta is inverted.

        DltX AS FLOAT : DltX = Pnt.x - Pivot.x
        DltY AS FLOAT : DltY = Pnt.y - Pivot.y
        DltZ AS FLOAT : DltZ = Pnt.z - Pivot.z

        CosT AS FLOAT : CosT = cos(Theta)
        SinT AS FLOAT : SinT = sin(Theta)

        Result AS Vec3
        Result.x = Pivot.x  +   CosT*DltX + SinT*DltZ    // Pivot.x  +   CosT*DltX + 0.0*DltY + SinT*DltZ
        Result.y = Pivot.y  +        DltY                // Pivot.y  +    0.0*DltX + 1.0*DltY +  0.0*DltZ
        Result.z = Pivot.z  +  -SinT*DltX + CosT*DltZ    // Pivot.z  +  -SinT*DltX + 0.0*DltY + CosT*DltZ
    ENDIF
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rol3(Pnt REF AS Vec3, Theta AS FLOAT) // "Rotate" 'Point' around Pivot(0,0,0) on AxisZ.
    IF (Theta = 0.0)
        EXITFUNCTION Pnt
    ELSE
        Theta = -Theta // Theta is inverted.

        CosT AS FLOAT : CosT = cos(Theta)
        SinT AS FLOAT : SinT = sin(Theta)

        Result AS Vec3
        Result.x = CosT*Pnt.x + -SinT*Pnt.y    // CosT*Pnt.x + -SinT*Pnt.y + 0.0*Pnt.z
        Result.y = SinT*Pnt.x +  CosT*Pnt.y    // SinT*Pnt.x +  CosT*Pnt.y + 0.0*Pnt.z
        Result.z =      Pnt.z                  //  0.0*Pnt.x +   0.0*Pnt.y + 1.0*Pnt.z
    ENDIF
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rol3p(Pnt REF AS Vec3, Pivot REF AS Vec3, Theta AS FLOAT) // "Rotate" 'Point' around 'Pivot' on AxisZ.
    IF (Theta = 0.0)
        EXITFUNCTION Pnt
    ELSE
        Theta = -Theta // Theta is inverted.

        DltX AS FLOAT : DltX = Pnt.x - Pivot.x
        DltY AS FLOAT : DltY = Pnt.y - Pivot.y
        DltZ AS FLOAT : DltZ = Pnt.z - Pivot.z

        CosT AS FLOAT : CosT = cos(Theta)
        SinT AS FLOAT : SinT = sin(Theta)

        Result AS Vec3
        Result.x = Pivot.x  +  CosT*DltX + -SinT*DltY    // Pivot.x  +  CosT*DltX + -SinT*DltY + 0.0*DltZ
        Result.y = Pivot.y  +  SinT*DltX +  CosT*DltY    // Pivot.y  +  SinT*DltX +  CosT*DltY + 0.0*DltZ
        Result.z = Pivot.z  +       DltZ                 // Pivot.z  +   0.0*DltX +   0.0*DltY + 1.0*DltZ
    ENDIF
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rot3(Pnt REF AS Vec3, Axis REF AS Vec3, Theta AS FLOAT) // "Rotate" 'Point' around Pivot(0,0,0) on 'Axis'.
    IF (Theta = 0.0)
        EXITFUNCTION Pnt
    ELSE
        Theta = -Theta // Theta is inverted.

        iCosT AS FLOAT : iCosT = 1.0-cos(Theta)
         CosT AS FLOAT :  CosT =     cos(Theta)
         SinT AS FLOAT :  SinT =     sin(Theta)

        Result AS Vec3
        Result.x = ( Pnt.x * (Axis.x*Axis.x*iCosT +        CosT) )  +  ( Pnt.y * (Axis.y*Axis.x*iCosT - Axis.z*SinT) )  +  ( Pnt.z * (Axis.z*Axis.x*iCosT + Axis.y*SinT) )
        Result.y = ( Pnt.x * (Axis.x*Axis.y*iCosT + Axis.z*SinT) )  +  ( Pnt.y * (Axis.y*Axis.y*iCosT +        CosT) )  +  ( Pnt.z * (Axis.z*Axis.y*iCosT - Axis.x*SinT) )
        Result.z = ( Pnt.x * (Axis.x*Axis.z*iCosT - Axis.y*SinT) )  +  ( Pnt.y * (Axis.y*Axis.z*iCosT + Axis.x*SinT) )  +  ( Pnt.z * (Axis.z*Axis.z*iCosT +        CosT) )
    ENDIF
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rot3p(Pnt REF AS Vec3, Pivot REF AS Vec3, Axis REF AS Vec3, Theta AS FLOAT) // "Rotate" 'Point' around 'Pivot' on 'Axis'.
    IF (Theta = 0.0)
        EXITFUNCTION Pnt
    ELSE
        Theta = -Theta // Theta is inverted.

        DltX AS FLOAT : DltX = Pnt.x - Pivot.x
        DltY AS FLOAT : DltY = Pnt.y - Pivot.y
        DltZ AS FLOAT : DltZ = Pnt.z - Pivot.z

        iCosT AS FLOAT : iCosT = 1.0-cos(Theta)
         CosT AS FLOAT :  CosT =     cos(Theta)
         SinT AS FLOAT :  SinT =     sin(Theta)

        Result AS Vec3
        Result.x = Pivot.x  +  ( DltX * (Axis.x*Axis.x*iCosT +        CosT) )  +  ( DltY * (Axis.y*Axis.x*iCosT - Axis.z*SinT) )  +  ( DltZ * (Axis.z*Axis.x*iCosT + Axis.y*SinT) )
        Result.y = Pivot.y  +  ( DltX * (Axis.x*Axis.y*iCosT + Axis.z*SinT) )  +  ( DltY * (Axis.y*Axis.y*iCosT +        CosT) )  +  ( DltZ * (Axis.z*Axis.y*iCosT - Axis.x*SinT) )
        Result.z = Pivot.z  +  ( DltX * (Axis.x*Axis.z*iCosT - Axis.y*SinT) )  +  ( DltY * (Axis.y*Axis.z*iCosT + Axis.x*SinT) )  +  ( DltZ * (Axis.z*Axis.z*iCosT +        CosT) )
    ENDIF
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rot3m(Pnt REF AS Vec3, ThetaVec REF AS Vec3) // "Rotate" 'Point' around Pivot(0,0,0) on multiple axes.     // Simultaneous Multi-Axis Angular Rotation.
    IF (ThetaVec.x = 0.0 AND ThetaVec.y = 0.0 AND ThetaVec.z = 0.0)
        EXITFUNCTION Pnt
    ELSE
        // Derive singular rotation 'Theta'. (Length of 'ThetaVec'.)
        Theta AS FLOAT : Theta = -sqrt(ThetaVec.x*ThetaVec.x + ThetaVec.y*ThetaVec.y + ThetaVec.z*ThetaVec.z) // Theta is inverted.

        // Derive singular rotation 'Axis'. ('ThetaVec' normalized.)
        ThetaRcp AS FLOAT : ThetaRcp = 1.0 / Theta
        Axis AS Vec3
        Axis.x = ThetaVec.x * ThetaRcp
        Axis.y = ThetaVec.y * ThetaRcp
        Axis.z = ThetaVec.z * ThetaRcp

        iCosT AS FLOAT : iCosT = 1.0-cos(Theta) // "Complimentary-Inverse Cosine-Theta".
         CosT AS FLOAT :  CosT =     cos(Theta)
         SinT AS FLOAT :  SinT =     sin(Theta)

        Result AS Vec3
        Result.x = ( Pnt.x * (Axis.x*Axis.x*iCosT +        CosT) )  +  ( Pnt.y * (Axis.y*Axis.x*iCosT - Axis.z*SinT) )  +  ( Pnt.z * (Axis.z*Axis.x*iCosT + Axis.y*SinT) )
        Result.y = ( Pnt.x * (Axis.x*Axis.y*iCosT + Axis.z*SinT) )  +  ( Pnt.y * (Axis.y*Axis.y*iCosT +        CosT) )  +  ( Pnt.z * (Axis.z*Axis.y*iCosT - Axis.x*SinT) )
        Result.z = ( Pnt.x * (Axis.x*Axis.z*iCosT - Axis.y*SinT) )  +  ( Pnt.y * (Axis.y*Axis.z*iCosT + Axis.x*SinT) )  +  ( Pnt.z * (Axis.z*Axis.z*iCosT +        CosT) )
    ENDIF
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION bulkrot3p(Points REF AS Vec3[], Pivot REF AS Vec3, Axis REF AS Vec3, Theta AS FLOAT)
    //@@  TODO.
    //      Rotate Array of Points.
ENDFUNCTION

