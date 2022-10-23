///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
TYPE Canvas
    SizX AS INTEGER
    SizY AS INTEGER
    StpY AS INTEGER

    MEM AS INTEGER
    IMG AS INTEGER
    SPR AS INTEGER
ENDTYPE
#Constant MEM_IMG_HEADER_SIZE = 12


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION CreateCanvas(PosX AS INTEGER, PosY AS INTEGER,
                      SizX AS INTEGER, SizY AS INTEGER )
    Cnvs AS Canvas
    Cnvs.SizX = SizX
    Cnvs.SizY = SizY
    Cnvs.StpY = SizX*4
    Cnvs.MEM = CreateMemblock(MEM_IMG_HEADER_SIZE+(SizX*SizY*4))
        // HEADER
        SetMemblockInt( Cnvs.MEM, 0, SizX ) // SizeX.
        SetMemblockInt( Cnvs.MEM, 4, SizY ) // SizeY.
        SetMemblockInt( Cnvs.MEM, 8,   32 ) // BitDepth.
    Cnvs.IMG = CreateImageFromMemblock(Cnvs.MEM)
    Cnvs.SPR = CreateSprite(Cnvs.IMG)
        SetSpritePosition(Cnvs.SPR, PosX, PosY)
        SetSpriteSize(Cnvs.SPR, SizX, SizY)
ENDFUNCTION Cnvs


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DestroyCanvas(Cnvs REF AS Canvas)
    Cnvs.SizX = 0
    Cnvs.SizY = 0
    DeleteMemblock(Cnvs.MEM) : Cnvs.MEM = 0
    DeleteSprite(Cnvs.SPR)   : Cnvs.SPR = 0
    DeleteImage(Cnvs.IMG)    : Cnvs.IMG = 0
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION SetCanvasPixel(Cnvs REF AS Canvas, iX AS INTEGER, iY AS INTEGER, ClrABGR AS INTEGER)
    SetMemblockInt(Cnvs.MEM, MEM_IMG_HEADER_SIZE + (iY*Cnvs.StpY) + (iX*4), ClrABGR)
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION CommitCanvasChanges(Cnvs REF AS Canvas)
    DeleteImage(Cnvs.IMG)
    Cnvs.IMG = CreateImageFromMemblock(Cnvs.MEM)
    SetSpriteImage(Cnvs.SPR, Cnvs.IMG)
ENDFUNCTION

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION RevertCanvasChanges(Cnvs REF AS Canvas)
    DeleteMemblock(Cnvs.MEM)
    Cnvs.MEM = CreateMemblockFromImage(Cnvs.IMG)
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION SaveCanvas(Cnvs REF AS Canvas, FileName AS STRING)
    SaveImage(Cnvs.IMG, FileName)
ENDFUNCTION

