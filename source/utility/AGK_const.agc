///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//#Constant s32 = INTEGER
//#Constant f32 = FLOAT
//#Constant str = STRING

//  Superficial type labels for AGK_Thing indexes:
#Constant AGK_Font     = INTEGER    //  .iFNT
#Constant AGK_Image    = INTEGER    //  .iIMG
#Constant AGK_Object   = INTEGER    //  .iOBJ
#Constant AGK_Sound    = INTEGER    //  .iSND

#Constant AGK_Sprite   = INTEGER    //  .iSPR
#Constant AGK_Text     = INTEGER    //  .iTXT

#Constant AGK_MemBlock = INTEGER    //  .iMEM


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SetObjectDepthReadMode( ObjID, MODE )
#Constant ODRM_NeverPass          = 0   //  NeverPass
#Constant ODRM_LessThan           = 1   //  LessThan
#Constant ODRM_Equal              = 2   //  Equal
#Constant ODRM_LessThanOrEqual    = 3   //  LessThanOrEqual
#Constant ODRM_GreaterThan        = 4   //  GreaterThan
#Constant ODRM_NotEqual           = 5   //  NotEqual
#Constant ODRM_GreaterThanOrEqual = 6   //  GreaterThanOrEqual
#Constant ODRM_AlwaysPass         = 7   //  AlwaysPass


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SetSpriteTransparency( SprID, BLENDMODE )
// SetObjectTransparency( ObjID, BLENDMODE )
#Constant BLENDMODE_Off      = 0    //  Default for OBJECT.
#Constant BLENDMODE_Alpha    = 1    //  Default for SPRITE.
#Constant BLENDMODE_Additive = 2

//  Transparency without blending.
// SetObjectAlphaMask( ObjID, 0|1 )


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SetTextAlignment( TxtID , ALIGN )
#Constant TXT_Lf = 0
#Constant TXT_Cn = 1
#Constant TXT_Rt = 2


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// PlaySprite( SprID, Fps, LOOP )
// PlayObjectAnimation( ObjID, AnimNameString, StartTime, EndTime, LOOP, TweenTime )
// PlaySound( SndID, Volume, LOOP )
// PlayMusic( MusID, LOOP )
#Constant NOLOOP = 0
#Constant LOOPIT = 1

