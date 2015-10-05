//--------------------------------------------------------------//
// Header
//--------------------------------------------------------------//
int _LwksEffectInfo
<
   string EffectGroup = "GenericPixelShader";
   string Description = "Masked Motion Blur";        
   string Category    = "Stylize";        
> = 0;

//--------------------------------------------------------------//
// Inputs
//--------------------------------------------------------------//
float _Progress;

texture Input;
texture Mask;

sampler InputSampler = sampler_state {
	Texture = <Input>;
	AddressU = Mirror;
	AddressV = Mirror;
	MinFilter = Linear;
	MagFilter = Linear;
	MipFilter = Linear;
};

sampler MaskSampler = sampler_state {
	Texture = <Mask>;
	AddressU = Mirror;
	AddressV = Mirror;
	MinFilter = Linear;
	MagFilter = Linear;
	MipFilter = Linear;
};

//--------------------------------------------------------------//
// Parameters  
//--------------------------------------------------------------//
float Angle
<
   string Description = "Angle";
   float MinVal = 0.00;
   float MaxVal = 360.0;
> = 0.0;

float Strength
<
   string Description = "Strength";
   float MinVal = 0.0;
   float MaxVal = 2.0;
> = 0.75;

float InputSamples			// Disabled for Windows
<
   string Description = "Samples";
   float MinVal = 0.0;
   float MaxVal = 120.0;
> = 60.0;

float Mix
<
    string Description = "Mix";
    float MinVal = 0.0;
    float MaxVal = 1.0;
> = 0.5;

// New parameter to invert mask

bool invertMask
<
    string Description = "Invert mask";
> = false;

#pragma warning ( disable : 3571 )

//--------------------------------------------------------------
// Pixel Shader
//--------------------------------------------------------------

float4 main( float2 uv : TEXCOORD) : COLOR
{
    float4 original = tex2D( InputSampler, uv);
    float4 Mask = tex2D( MaskSampler, uv);

    if (invertMask) Mask = 1.0f-Mask;	// New line to handle mask inversion

    float OutMask = clamp(( Mask.r * 0.3 ) + ( Mask.g * 0.59 ) + ( Mask.b * 0.11 ), 0.0, 1);

    //float Samples = 60.0;		// Windows only

    float Samples = InputSamples;	// Linux and Mac

    float4 output = 0;  
    float2 offset;

    if (Strength > 0.0) {
        sincos(radians(Angle), offset.y, offset.x);

        offset *= lerp(0.0, (Strength*0.005), OutMask);
        for(int i=0; i<Samples; i++)
        {
            output += tex2D(InputSampler, uv - offset * i);
        }

	output /= Samples;
        output = lerp(original,output,Mix);
    }
    else output = tex2D(InputSampler, uv);

    return output;
}

//--------------------------------------------------------------
// Technique
//--------------------------------------------------------------

//#define PROFILE ps_3_0			// Windows only: delete "//" to enable ps_3_0

technique SampleFxTechnique
{
   pass SinglePass
   {
      PixelShader = compile PROFILE main();
   }
}
