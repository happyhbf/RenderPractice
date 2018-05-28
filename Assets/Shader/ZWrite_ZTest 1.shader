Shader "Unlit/ZWrite_ZTest1"
{
	Properties{
		_MainTex("Base (RGB)", 2D) = "white" {}
		_MainColor("Main Color", Color) = (0,0,1,0.5)
	}
		SubShader{
		Tags{ "RenderType" = "Transparent" 
		"Queue" = "Transparent" }
		LOD 200
		Blend SrcAlpha OneMinusSrcAlpha
		/////////////////////////////////////////测试区

		//ZWrite Off
		ZTest Greater
		/////////////////////////////////////////测试区
		CGPROGRAM
#pragma surface surf Lambert

		sampler2D _MainTex;
		float4 _MainColor;

	struct Input {
		float2 uv_MainTex;
	};

	void surf(Input IN, inout SurfaceOutput o) {
		half4 c = tex2D(_MainTex, IN.uv_MainTex);
		o.Albedo = c.rgb * _MainColor.rgb;
		o.Alpha = c.a * _MainColor.a;
	}
	ENDCG
	}
		FallBack "Diffuse"
}
