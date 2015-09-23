//--------------------------------------------------------------
// This node FX controls the colors Red - Green - Blue - Cyan - Magenta - Yellow.
// The colors are not channels but key color subtracted.
// For each color is possible controlling Tint - Saturation - Gamma - Contrast - Gain - Brightness.
// Useful for quick research for the right look of the image or connected with ColorCorrection node.
// Works on Linux and MacOSX, for Win change "PROFILE" with "ps_2_0", "ps_2_b" or so on.
// http://www.alessandrodallafontana.com/ 
//--------------------------------------------------------------
int _LwksEffectInfo
<
   string EffectGroup = "GenericPixelShader";
   string Description = "CC_RGBCMY";
   string Category    = "Colour";
> = 0;


//--------------------------------------------------------------
// Inputs
//--------------------------------------------------------------
texture InputFg;

sampler FgSampler = sampler_state { Texture = <InputFg>;};



//--------------------------------------------------------------
// Parameters
//--------------------------------------------------------------

//RED_P

float4 R_TintColour
<
   string Description = "TintColour";
   string Group = "RED";
> = { 1.0, 1.0, 1.0, 1.0 };

float R_TintAmount
<
   string Description = "TintAmount";
   string Group = "RED";
   float MinVal = 0.0;
   float MaxVal = 1.0;
> = 0.0;

float R_Saturate
<
   string Description = "Saturate";
   string Group = "RED";
   float MinVal = 0.0;
   float MaxVal = 5.0;
> = 1.0;

float R_Gamma
<
   string Description = "Gamma";
   string Group = "RED";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float R_Contrast
<
   string Description = "Contrast";
   string Group = "RED";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float R_Gain
<
   string Description = "Gain";
   string Group = "RED";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float R_Brightness
<
   string Description = "Brightness";
   string Group = "RED";
   float MinVal = -1.0;
   float MaxVal = 1.0;
> = 0.0;

//GREEN_P

float4 G_TintColour
<
   string Description = "TintColour";
   string Group = "GREEN";
> = { 1.0, 1.0, 1.0, 1.0 };

float G_TintAmount
<
   string Description = "TintAmount";
   string Group = "GREEN";
   float MinVal = 0.0;
   float MaxVal = 1.0;
> = 0.0;

float G_Saturate
<
   string Description = "Saturate";
   string Group = "GREEN";
   float MinVal = 0.0;
   float MaxVal = 5.0;
> = 1.0;

float G_Gamma
<
   string Description = "Gamma";
   string Group = "GREEN";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float G_Contrast
<
   string Description = "Contrast";
   string Group = "GREEN";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float G_Gain
<
   string Description = "Gain";
   string Group = "GREEN";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float G_Brightness
<
   string Description = "Brightness";
   string Group = "GREEN";
   float MinVal = -1.0;
   float MaxVal = 1.0;
> = 0.0;

//BLUE_P

float4 B_TintColour
<
   string Description = "TintColour";
   string Group = "BLUE";
> = { 1.0, 1.0, 1.0, 1.0 };

float B_TintAmount
<
   string Description = "TintAmount";
   string Group = "BLUE";
   float MinVal = 0.0;
   float MaxVal = 1.0;
> = 0.0;

float B_Saturate
<
   string Description = "Saturate";
   string Group = "BLUE";
   float MinVal = 0.0;
   float MaxVal = 5.0;
> = 1.0;

float B_Gamma
<
   string Description = "Gamma";
   string Group = "BLUE";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float B_Contrast
<
   string Description = "Contrast";
   string Group = "BLUE";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float B_Gain
<
   string Description = "Gain";
   string Group = "BLUE";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float B_Brightness
<
   string Description = "Brightness";
   string Group = "BLUE";
   float MinVal = -1.0;
   float MaxVal = 1.0;
> = 0.0;

//CYAN_P

float4 C_TintColour
<
   string Description = "TintColour";
   string Group = "CYAN";
> = { 1.0, 1.0, 1.0, 1.0 };

float C_TintAmount
<
   string Description = "TintAmount";
   string Group = "CYAN";
   float MinVal = 0.0;
   float MaxVal = 1.0;
> = 0.0;

float C_Saturate
<
   string Description = "Saturate";
   string Group = "CYAN";
   float MinVal = 0.0;
   float MaxVal = 5.0;
> = 1.0;

float C_Gamma
<
   string Description = "Gamma";
   string Group = "CYAN";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float C_Contrast
<
   string Description = "Contrast";
   string Group = "CYAN";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float C_Gain
<
   string Description = "Gain";
   string Group = "CYAN";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float C_Brightness
<
   string Description = "Brightness";
   string Group = "CYAN";
   float MinVal = -1.0;
   float MaxVal = 1.0;
> = 0.0;

//MAGENTA_P

float4 M_TintColour
<
   string Description = "TintColour";
   string Group = "MAGENTA";
> = { 1.0, 1.0, 1.0, 1.0 };

float M_TintAmount
<
   string Description = "TintAmount";
   string Group = "MAGENTA";
   float MinVal = 0.0;
   float MaxVal = 1.0;
> = 0.0;

float M_Saturate
<
   string Description = "Saturate";
   string Group = "MAGENTA";
   float MinVal = 0.0;
   float MaxVal = 5.0;
> = 1.0;

float M_Gamma
<
   string Description = "Gamma";
   string Group = "MAGENTA";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float M_Contrast
<
   string Description = "Contrast";
   string Group = "MAGENTA";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float M_Gain
<
   string Description = "Gain";
   string Group = "MAGENTA";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float M_Brightness
<
   string Description = "Brightness";
   string Group = "MAGENTA";
   float MinVal = -1.0;
   float MaxVal = 1.0;
> = 0.0;

//YELLOW_P

float4 Y_TintColour
<
   string Description = "TintColour";
   string Group = "YELLOW";
> = { 1.0, 1.0, 1.0, 1.0 };

float Y_TintAmount
<
   string Description = "TintAmount";
   string Group = "YELLOW";
   float MinVal = 0.0;
   float MaxVal = 1.0;
> = 0.0;

float Y_Saturate
<
   string Description = "Saturate";
   string Group = "YELLOW";
   float MinVal = 0.0;
   float MaxVal = 5.0;
> = 1.0;

float Y_Gamma
<
   string Description = "Gamma";
   string Group = "YELLOW";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float Y_Contrast
<
   string Description = "Contrast";
   string Group = "YELLOW";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float Y_Gain
<
   string Description = "Gain";
   string Group = "YELLOW";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 1.0;

float Y_Brightness
<
   string Description = "Brightness";
   string Group = "YELLOW";
   float MinVal = -1.0;
   float MaxVal = 1.0;
> = 0.0;



//--------------------------------------------------------------
// Shader
//--------------------------------------------------------------


float4 CC_RGBCMY_shader(float2 xy : TEXCOORD1 ) : COLOR {

float4 Cs = tex2D( FgSampler, xy );

float R = Cs.r;
float G = Cs.g;
float B = Cs.b;
float C = 1.0f - R;
float M = 1.0f - G;
float Y = 1.0f - B;

float red = R-max(G,B);
float green = G-max(R,B);
float blue = B-max(R,G);
float cyan=C-max(M,Y);
float magenta=M-max(C,Y);
float yellow=Y-max(C,M);


float red_out=clamp(red-max(green,blue),0,1);
float green_out=clamp(green-max(red,blue),0,1);
float blue_out=clamp(blue-max(green,red),0,1);
float cyan_out=clamp(cyan-max(yellow,magenta),0,1);
float magenta_out=clamp(magenta-max(cyan,yellow),0,1);
float yellow_out=clamp(yellow-max(magenta,cyan),0,1);


float lum = ( Cs.r * 0.3 ) + ( Cs.g * 0.59 ) + ( Cs.b * 0.11 );

//RED

float4 Tint_R = float4( 
lum + R_TintColour.r - 0.5,
lum + R_TintColour.g - 0.5,
lum + R_TintColour.b - 0.5,
1.0 );

float4 Cs_R = lerp( Cs, Tint_R, R_TintAmount);
Cs_R = saturate( lum + ( ( Cs_R - lum ) * R_Saturate ) );
Cs_R = ( ( ( ( pow( Cs_R, 1.0 / R_Gamma ) * R_Gain ) + R_Brightness ) - 0.5 ) * R_Contrast ) + 0.5;

//GREEN

float4 Tint_G = float4( 
lum + G_TintColour.r - 0.5,
lum + G_TintColour.g - 0.5,
lum + G_TintColour.b - 0.5,
1.0 );

float4 Cs_G = lerp( Cs, Tint_G, G_TintAmount);
Cs_G = saturate( lum + ( ( Cs_G - lum ) * G_Saturate ) );
Cs_G = ( ( ( ( pow( Cs_G, 1.0 / G_Gamma ) * G_Gain ) + G_Brightness ) - 0.5 ) * G_Contrast ) + 0.5;

//BLUE

float4 Tint_B = float4( 
lum + B_TintColour.r - 0.5,
lum + B_TintColour.g - 0.5,
lum + B_TintColour.b - 0.5,
1.0 );

float4 Cs_B = lerp( Cs, Tint_B, B_TintAmount);
Cs_B = saturate( lum + ( ( Cs_B - lum ) * B_Saturate ) );
Cs_B = ( ( ( ( pow( Cs_B, 1.0 / B_Gamma ) * B_Gain ) + B_Brightness ) - 0.5 ) * B_Contrast ) + 0.5;

//CYAN

float4 Tint_C = float4( 
lum + C_TintColour.r - 0.5,
lum + C_TintColour.g - 0.5,
lum + C_TintColour.b - 0.5,
1.0 );

float4 Cs_C = lerp( Cs, Tint_C, C_TintAmount);
Cs_C = saturate( lum + ( ( Cs_C - lum ) * C_Saturate ) );
Cs_C = ( ( ( ( pow( Cs_C, 1.0 / C_Gamma ) * C_Gain ) + C_Brightness ) - 0.5 ) * C_Contrast ) + 0.5;

//MAGENTA

float4 Tint_M = float4( 
lum + M_TintColour.r - 0.5,
lum + M_TintColour.g - 0.5,
lum + M_TintColour.b - 0.5,
1.0 );

float4 Cs_M = lerp( Cs, Tint_M, M_TintAmount);
Cs_M = saturate( lum + ( ( Cs_M - lum ) * M_Saturate ) );
Cs_M = ( ( ( ( pow( Cs_M, 1.0 / M_Gamma ) * M_Gain ) + M_Brightness ) - 0.5 ) * M_Contrast ) + 0.5;

//YELLOW

float4 Tint_Y = float4( 
lum + Y_TintColour.r - 0.5,
lum + Y_TintColour.g - 0.5,
lum + Y_TintColour.b - 0.5,
1.0 );

float4 Cs_Y = lerp( Cs, Tint_Y, Y_TintAmount);
Cs_Y = saturate( lum + ( ( Cs_Y - lum ) * Y_Saturate ) );
Cs_Y = ( ( ( ( pow( Cs_Y, 1.0 / Y_Gamma ) * Y_Gain ) + Y_Brightness ) - 0.5 ) * Y_Contrast ) + 0.5;

//OUTPUT
Cs_R=lerp(Cs, Cs_R, red_out);
Cs_G=lerp(Cs_R, Cs_G, green_out);
Cs_B=lerp(Cs_G, Cs_B, blue_out);
Cs_C=lerp(Cs_B, Cs_C, cyan_out);
Cs_M=lerp(Cs_C, Cs_M, magenta_out);
Cs=lerp(Cs_M, Cs_Y, yellow_out);



return Cs;
}


///----------------------------------------------------
///  Technique  //////
///----------------------------------------------------


technique CC_RGBCMY_Technique
{
   pass CC_RGBCMY_pass
   {
      PixelShader = compile PROFILE CC_RGBCMY_shader();
   }
}
