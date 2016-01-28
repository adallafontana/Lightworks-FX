//--------------------------------------------------------------
// Unpremultiply Alpha 
// http://www.alessandrodallafontana.it/  
//--------------------------------------------------------------
int _LwksEffectInfo
<
   string EffectGroup = "GenericPixelShader";
   string Description = "Unpremultiply";
   string Category    = "Mixes";
> = 0;

//--------------------------------------------------------------
// Inputs
//--------------------------------------------------------------
texture FG;

//--------------------------------------------------------------//
// Samplers
//--------------------------------------------------------------//


sampler FGSampler = sampler_state
{
   Texture = <FG>;
   MINFILTER = LINEAR;
   MIPFILTER = LINEAR;
   MAGFILTER = LINEAR;
};



//--------------------------------------------------------------
// Parameters
//--------------------------------------------------------------





//--------------------------------------------------------------
// Shader
//--------------------------------------------------------------


float4 main( float2 uv : TEXCOORD1 ) : COLOR 
{
    float4 color = tex2D(FGSampler, uv);
    color = float4(color.r/color.a, color.g/color.a, color.b/color.a, color.a);
    
    return color;
}

technique SimpleTechnique
{
pass MainPass

   {
      PixelShader = compile PROFILE main();
   }

}
