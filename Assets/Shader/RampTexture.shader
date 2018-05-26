Shader "Custom/RampTexture" {  
    Properties {  
        _MainTex ("Base (RGB)", 2D) = "white" {}  
        _RampTex ("Ramp Tex (RGB)", 2D) = "white" {}  
  
    }  
    SubShader {  
        Tags { "RenderType"="Opaque" }  
        LOD 200  
          
        CGPROGRAM  
        #pragma surface surf RampLight  
  
        sampler2D _MainTex;  
        sampler2D _RampTex;  
  
        half4 LightingRampLight (SurfaceOutput s, half3 lightDir, half atten)   
        {  
            half NdotL = dot(s.Normal, lightDir);  
            float diff = NdotL * 0.5 + 0.5;  
            half3 ramp = tex2D(_RampTex, float2(diff, diff)).rgb;  
            half4 c;  
            c.rgb = s.Albedo * _LightColor0.rgb * ramp * (atten * 2);
            c.a = s.Alpha;  
            return c;  
        }  
  
        struct Input {  
            float2 uv_MainTex;  
        };  
  
        void surf (Input IN, inout SurfaceOutput o) {  
            half4 c = tex2D (_MainTex, IN.uv_MainTex);  
            o.Albedo = c.rgb;  
            o.Alpha = c.a;  
        }  
        ENDCG  
    }   
    FallBack "Diffuse"  
}  