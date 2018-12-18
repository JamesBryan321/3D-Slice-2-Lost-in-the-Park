// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unlit/gUNHOLDER"
{
	Properties
	{
	    _Color("Main Color", color) = (1,1,1,0)
        _scale("scale", Range(0,1)) = 0
	}
	SubShader
	{
	

		Pass
		{
		CGPROGRAM
        #pragma vertex vertexFunction
        #pragma fragment fragmentFunction
        
        #include "UnityCG.cginc"
        
        struct appData
        {
            float4 pos : POSITION;
            float3 normal :NORMAL;
        };
        
        struct v2f 
        {
        float4 pos : SV_POSITION;
        float3 normal : NORMAL;
        };
        
        
        fixed4 _Color;
        float _scale;
        
        v2f vertexFunction (appData v)
        {
        
        v2f o;
         o.pos = o.pos + float4(_scale * o.normal,1);
        
        o.pos = UnityObjectToClipPos(v.pos);
       
        o.normal = UnityObjectToWorldNormal(v.normal);
        return o;
        
        
        }
        
        fixed4 fragmentFunction(v2f i) : SV_Target
        {
        return fixed4(i.normal,0);
        
        
        }
        
		ENDCG
		}
	}
}
