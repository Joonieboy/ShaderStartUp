Shader "Custom/textureMixing"
{
    Properties
    {
        //텍스쳐 2개를 넣을 수 있도록 만든다
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Albedo (RGB)", 2D) = "white" {}

        //인터페이스와 연결하여 Range로 어떤 텍스쳐가 나오게 할지 혹은 섞이게 할지 조정할 수 있게 만든다
        _lerpTest ("lerp 기능 테스트", Range(0, 1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard

        sampler2D _MainTex;
        sampler2D _MainTex2;
        float _lerpTest;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_MainTex2;
        };

        fixed4 _Color;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            fixed4 d = tex2D (_MainTex2, IN.uv_MainTex2);

            //lerp를 사용하여 텍스쳐 2개를 보간한다 lerp(A, B, 0 ~ 1 float값);
            //o.Albedo = lerp(c.rgb, d.rgb, _lerpTest);
            
            //풀의 알파채널을 보면, 흰색과 검은색 두 가지가 있다. 흰색은 1이고, 검은색은 0이다
            //풀의 알파값은 0이기 때문에 c.a를 넣으면, 풀만 없어지게 나온다
            //o.Albedo = lerp(c.rgb, d.rgb, c.a);
            
            //반대로 풀만 나오게하고 배경이 없어지게 하려면, 2 가지 방법이 있다
            //1. c.a를 리버스 시킨다 -> 1-c.a
            //o.Albedo = lerp(c.rgb, d.rgb, 1-c.a);

            //2. c와 d의 위치를 바꾸어 준다
            //o.Albedo = lerp(d.rgb, c.rgb, c.a);
            o.Albedo = lerp(d.rgb, (c.r + c.g + c.b) / 3, c.a);

            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
