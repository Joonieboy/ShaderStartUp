Shader "Custom/Fire_2"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Albedo (RGB)", 2D) = "black" {}

        //불이 노이즈로 구겨지는 효과를 조절하기 위한 인터페이스
        _FirePower ("FirePower", float) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue" = "Transparent" }

        CGPROGRAM
        #pragma surface surf Standard alpha:fade

        sampler2D _MainTex;
        sampler2D _MainTex2;
        float _FirePower;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_MainTex2;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // 불 이미지 = c / 노이즈 이미지 = d
            // 노이즈 이미지를 위로 움직이도록 _Time.y를 빼준다
            fixed4 d = tex2D (_MainTex2, float2(IN.uv_MainTex2.x , IN.uv_MainTex2.y - _Time.y));
            // fixed4 c = tex2D (_MainTex, IN.uv_MainTex + d.r);
            
            // IN.uv_MainTex.x - 0.1 * _FirePower는 UV에 d를 더하면서 
            // 조금씩 c의 이미지의 uv에 일정 수치가 더해져서 왼쪽 아래로 내려가는 것을 방지해 주기 위함이다
            fixed4 c = tex2D (_MainTex, float2(IN.uv_MainTex.x - 0.1 * _FirePower, IN.uv_MainTex.y) + d.r * _FirePower);
            
            o.Emission = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
