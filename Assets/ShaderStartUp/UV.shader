Shader "Custom/UV"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _UVTest ("Test Range", Range(0,1)) = 0
        _FlowSpeed ("Floow Speed", float) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MainTex;
        float _UVTest;
        float _FlowSpeed;

        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _Color;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);

            // 색을 UV 값으로 하여, UV가 어떻게 나타나는지 확인할 수 있다
            // o.Emission = float3(IN.uv_MainTex.x, IN.uv_MainTex.y, 0.5);

            // Range로 UV가 어떻게 움직이는지 확인
            // fixed4 c = tex2D (_MainTex, IN.uv_MainTex + _UVTest);
            
            // 시간에 따라 UV가 움직이도록 _Time() 내장변수를 사용하였다
            // fixed4 c = tex2D (_MainTex, IN.uv_MainTex.x + _Time.y);

            // x 또는 y 값으로만 흘러가게도 만들 수 있다, 물 흘러가게 할 때에도 사용한다
            // fixed4 c = tex2D (_MainTex, float2(IN.uv_MainTex.x + _Time.y, IN.uv_MainTex.y));
            // fixed4 c = tex2D (_MainTex, float2(IN.uv_MainTex.x, IN.uv_MainTex.y + _Time.y));

            // FlowSpeed 변수를 만들어 얼마나 빠르게 흘러갈지 조절할 수 있다
            // fixed4 c = tex2D (_MainTex, float2(IN.uv_MainTex.x, IN.uv_MainTex.y + _Time.y * _FlowSpeed));

            // Sin 시간으로 흐르는 UV 색
            o.Emission = float3(IN.uv_MainTex.x, IN.uv_MainTex.y, _SinTime.w);

            // o.Emission = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
