//--------------------------------------------------------------
// KeyDespiil  Despill Background Based
// http://www.alessandrodallafontana.it/ 
//--------------------------------------------------------------
int _LwksEffectInfo
<
   string EffectGroup = "GenericPixelShader";
   string Description = "KeyDespill";
   string Category    = "Keying";
> = 0;


//--------------------------------------------------------------
// Inputs
//--------------------------------------------------------------
texture InputFg;
texture InputBg;

sampler FgSampler = sampler_state { Texture = <InputFg>;};
sampler BgSampler = sampler_state { Texture = <InputBg>; };


//--------------------------------------------------------------
// Parameters
//--------------------------------------------------------------

int SetTechnique
<
   string Description = "Key";
   string Enum = "Green,Blue";
> = 0;


float RedAmount
<
   string Description = "RedAmount";
   float MinVal = 0.0;
   float MaxVal = 1.00;
> = 0.5;


#pragma warning ( disable : 3571 )


//--------------------------------------------------------------
// Shader
//--------------------------------------------------------------


float4 Green(float2 xy1 : TEXCOORD1, float2 xy2 : TEXCOORD2 ) : COLOR {

    float4 color = tex2D(FgSampler, xy1);
    float4 Back = tex2D(BgSampler, xy2);
    


    float mask = clamp(color.g-lerp(color.r, color.b, RedAmount), 0, 1);
    color.g = color.g-mask;
    color += Back * mask; 
    

    return color;
}

float4 Blue(float2 xy1 : TEXCOORD1, float2 xy2 : TEXCOORD2 ) : COLOR {
    
    float4 color = tex2D(FgSampler, xy1);
    float4 Back = tex2D(BgSampler, xy2);

    float mask = clamp(color.b-lerp(color.r, color.g, RedAmount), 0, 1);
    color.b = color.b-mask;
    color += Back * mask;
    
     
    return color;
}


///----------------------------------------------------
///  Technique  //////
///----------------------------------------------------

technique GreenDespill
{
   pass p0
   {
      PixelShader = compile PROFILE Green();
   }
}

technique BlueDespill
{
   pass p0
   {
      PixelShader = compile PROFILE Blue();
   }
}
