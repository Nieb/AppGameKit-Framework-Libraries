///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawPoint(Pnt_Pos REF AS Vec2, Size AS FLOAT, ClrABGR AS INTEGER)
    DrawEllipse( Pnt_Pos.x, Pnt_Pos.y, Size, Size, ClrABGR, ClrABGR, 1 )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawLine_(PntA_Pos AS Vec2,
                   PntB_Pos AS Vec2,
                   ClrABGR  AS INTEGER)
    DrawLine( PntA_Pos.x,PntA_Pos.y,  PntB_Pos.x,PntB_Pos.y,  ClrABGR,ClrABGR )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawLineC(PntA_Pos AS Vec2,
                   PntB_Pos AS Vec2,
                   Clr REF AS RGBA)
    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r
    DrawLine( PntA_Pos.x,PntA_Pos.y,  PntB_Pos.x,PntB_Pos.y,  ClrABGR,ClrABGR )
ENDFUNCTION


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//FUNCTION DrawCircle(PointA REF AS Vec2, Color REF AS RGBA, Radius AS FLOAT, Fill AS INTEGER)
//    ColorABGR AS INTEGER : ColorABGR = (Color.a << 24) + (Color.b << 16) + (Color.g <<  8) + Color.r
//    DrawEllipse( WorldToScreenX( PointA.x ), WorldToScreenY( -PointA.y ), Radius, Radius, ColorABGR, ColorABGR, Fill )
//ENDFUNCTION

