//--------------------------------------------------------------
//Based on:  http://glslsandbox.com/e#9996.0
// http://www.alessandrodallafontana.it/ 
//--------------------------------------------------------------

int _LwksEffectInfo
<
   string EffectGroup = "GenericPixelShader";
   string Description = "SineLight";
   string Category    = "Mattes";
> = 0;

//--------------------------------------------------------------//
// Params
//--------------------------------------------------------------//
float Num
<
   string Description = "Num";
   string Group = "GEOMETRY";
   float MinVal = 0.0;
   float MaxVal = 400;
> = 200;

float Speed
<
   string Description = "Speed";
   string Group = "GEOMETRY";
   float MinVal = 0.00;
   float MaxVal = 10.00;
> = 5.0;

float Scale
<
   string Description = "Scale";
   string Group = "GEOMETRY";
   float MinVal = 0.00;
   float MaxVal = 3.0;
> = 1;


float CentreX
<
   string Description = "Position";
   string Group = "GEOMETRY";
   string Flags = "SpecifiesPointX";
   float MinVal = -1.00;
   float MaxVal = 1.00;
> = 0.0;

float CentreY
<
   string Description = "Position";
   string Group = "GEOMETRY";
   string Flags = "SpecifiesPointY";
   float MinVal = -1.00;
   float MaxVal = 1.00;
> = 0.0;

float ResX
<
   string Description = "ResX";
   string Group = "GEOMETRY";
   float MinVal = 0.01;
   float MaxVal = 2.0;
> = 0.2;

float ResY
<
   string Description = "ResY";
   string Group = "GEOMETRY";
   float MinVal = 0.01;
   float MaxVal = 2.0;
> = 0.48;

float Sine
<
   string Description = "Sine";
   string Group = "GEOMETRY";
   float MinVal = 0.01;
   float MaxVal = 12.0;
> = 8.00;

float Curve
<
   string Description = "Curve";
   string Group = "GEOMETRY";
   float MinVal = 0.0;
   float MaxVal = 150.0;
> = 4.00;

float Size
<
   string Description = "Size";
   string Group = "FIRST LIGHTS";
   float MinVal = 1;
   float MaxVal = 20;
> = 8;

float LumScale
<
   string Description = "LumScale";
   string Group = "FIRST LIGHTS";
   float MinVal = 0.0;
   float MaxVal = 4.00;
> = 1.0;

float LumBias
<
   string Description = "LumBias";
   string Group = "FIRST LIGHTS";
   float MinVal = -1.0;
   float MaxVal = 1.00;
> = -0.50;

float NumLights
<
   string Description = "NumLights";
   string Group = "SECOND LIGHTS";
   float MinVal = 1;
   float MaxVal = 12;
> = 4;

float LightsDispersal
<
   string Description = "LightsDispersal";
   string Group = "SECOND LIGHTS";
   float MinVal = 0.0;
   float MaxVal = 1.00;
> = 0.20;



float _Progress;



//--------------------------------------------------------------//
// Inputs
//--------------------------------------------------------------//

texture Input1;
texture FirstLights : RenderColorTarget;

sampler Image1 = sampler_state
{
   Texture = <Input1>;
   MinFilter = LINEAR;
   MagFilter = LINEAR;
   MipFilter = LINEAR;
};

sampler FirstLightSampler = sampler_state 
{
   Texture = <FirstLights>;
   MINFILTER = LINEAR;
   MIPFILTER = LINEAR;
   MAGFILTER = LINEAR;
};


//--------------------------------------------------------------//
// Code
//--------------------------------------------------------------//


//FIRST LIGHTS PASS
float4 FirstLightMain( float2 uv1 : TEXCOORD ) : COLOR
{


        
        float time = _Progress*Speed;
        float2 resolution = float2(Scale, Scale);
        
	

    float sum = 0.0;
    float size = resolution.x / ((20-Size)*100);
    for (int i = 0; i < Num; ++i) {
        float2 position = resolution / (Scale*2.0);
	float t = (float(i) + time) / 5.0;
	float c = float(i) * Curve;
        position.x += sin(Sine * t + c) * resolution.x * ResX;
        position.y += sin(t) * resolution.y * ResY;

        sum += size / length(float2(uv1.x+CentreX, uv1.y+CentreY)  - position);
    }
    

        float4 output = max(0.0, sum+LumBias)*LumScale;
       
	return output;
}

//OUTPUT PASS
float4 OutputMain( float2 vTexcoord : TEXCOORD1 ) : COLOR 
{

     float2 texcoord = 1-vTexcoord;
     float2 ghostVec = (0.5 - texcoord) * LightsDispersal;


     float4 output = 0.0;
     for(int i=0; i<NumLights; i++)
        {
     float2 offset = fract(texcoord + ghostVec * float(i));            
     output += tex2D(FirstLightSampler, offset);
     }

    
    
     return output;


}


technique SinglePass
{
pass FirstLightPass
   <
      string Script = "RenderColorTarget0 = FirstLights;";
   >

   {
      PixelShader = compile PROFILE FirstLightMain();
   }
pass OutputPass 
    { 
       PixelShader = compile PROFILE OutputMain(); 
    }
}
