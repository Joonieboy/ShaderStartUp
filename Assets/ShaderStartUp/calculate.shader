Shader "Custom/calculate"
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
            float4 color : COLOR;
        };

        fixed4 _Color;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float r = 1;
            float2 gg = float2(0.5, 0);
            float3 bbb = float3(1, 0, 1);

            //초기화한 r, gg, bbb를 사용해서 float3에 다양한 방법으로 사용이 가능하다
            // o.Albedo = float3(1,gg);
            // o.Albedo = float3(r.r,bbb.rg);
            o.Albedo = float3(r.r,gg.g,bbb.b);

            o.Alpha = 1;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
