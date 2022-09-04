Shader "Custom/rgb"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        struct Input
        {
            float4 color : COLOR ;
        };

        fixed4 _Color;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float4 test = float4(1,0,0,1);
            //float4를 float3 형식으로 바꾸는 습관을 들여야 한다. 그러기 위해서 test.rgb를 넣어주었다
            //o.Albedo = 1 or 0.5f; 도 가능하고, o.Albedo = test.rrb or test.rb 등이 가능하다
            o.Albedo = test.rgb;

            o.Alpha = 1;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
