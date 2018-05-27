Shader "Unlit/ZWrite_ZTest"
{
	Properties{
		_MainTex("Base (RGB)", 2D) = "white" {}
		_MainColor("Main Color", Color) = (0,0,1,0.5)
	}
		SubShader{
		Tags{ "RenderType" = "Opaque" }
		LOD 200
		/////////////////////////////////////////测试区
		Tags{ "Queue" = "Geometry+200" }
		ZWrite Off
		//ZTest On
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
