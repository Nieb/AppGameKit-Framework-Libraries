//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Constant PiQ         =  0.78539816339744830961566084581987572104929234984378 /// pi / 4   (Radians =  45 Degrees)
#Constant PiH         =  1.57079632679489661923132169163975144209858469968755 /// pi / 2   (Radians =  90 Degrees)
#Constant Pi          =  3.14159265358979323846264338327950288419716939937511 ///          (Radians = 180 Degrees)
#Constant Pi1H        =  4.71238898038468985769396507491925432629575409906266 /// pi * 1.5 (Radians = 270 Degrees)
#Constant Pi2         =  6.28318530717958647692528676655900576839433879875021 /// pi * 2   (Radians = 360 Degrees)  SurfaceArea of Half-UnitSphere.  (pi*2 * r*h)
#Constant Pi3         =  9.42477796076937971538793014983850865259150819812532 /// pi * 3   (Radians = 540 Degrees)
#Constant Pi4         = 12.56637061435917295385057353311801153678867759750042 /// pi * 4   (Radians = 720 Degrees)  SurfaceArea of UnitSphere.       (pi*4 * r^2)

#Constant PiRcp       =  0.31830988618379067153776752674502872406891929148091 ///  1 /    pi   "Reciprocal"
#Constant Pi2Rcp      =  0.15915494309189533576888376337251436203445964574046 ///  1 / (2*pi)
#Constant Pi3Rcp      =  0.10610329539459689051258917558167624135630643049364 ///  1 / (3*pi)
#Constant Pi4Rcp      =  0.07957747154594766788444188168625718101722982287023 ///  1 / (4*pi)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Constant Sqrt2       =  1.41421356237309504880168872420969807856967187537695
#Constant Sqrt2Rcp    =  0.70710678118654752440084436210484903928483593768847 ///  1 / sqrt(2)

#Constant Sqrt3       =  1.73205080756887729352744634150587236694280525381038
#Constant Sqrt3Rcp    =  0.57735026918962576450914878050195745564760175127013 ///  1 / sqrt(3)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//#Constant TwoSubSqrt2 =  0.58578643762690495119831127579030192143032812462305 ///  2 - sqrt(2)
//#Constant TwoSubSqrt3 =  0.26794919243112270647255365849412763305719474618962 ///  2 - sqrt(3)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Constant Euler       =  2.71828182845904523536028747135266249775724709369996 /// Euler's number.

#Constant NatLog2     =  0.69314718055994530941723212145817656807550013436026 /// ln(2)
#Constant NatLog10    =  2.30258509299404568401799145468436420760110148862877 /// ln(10)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//#Constant Gamma       =  0.57721566490153286060651209008240243104215933593992 /// Euler-Mascheroni constant.

//#Constant Phi         =  1.61803398874989484820458683436563811772030917980576 /// (1+sqrt(5)) / 2    Golden ratio.
//#Constant PhiNeg      = -0.61803398874989484820458683436563811772030917980576 /// (1-sqrt(5)) / 2

//#Constant G           =  0.91596559417721901505460351493238411077414937428167 /// Catalan's constant.

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Constant OneThird    =  0.33333333333333333333333333333333333333333333333333
#Constant TwoThird    =  0.66666666666666666666666666666666666666666666666666


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION deg(Radians AS FLOAT) : ENDFUNCTION Radians * 57.29577951308232087679815481410517033240547246656432 /// (180/pi)
FUNCTION rad(Degrees AS FLOAT) : ENDFUNCTION Degrees *  0.01745329251994329576923690768488612713442871888542 /// (pi/180)

