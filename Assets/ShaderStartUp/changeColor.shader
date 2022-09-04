Shader "Custom/changeColor"
{
    Properties
    {
        //테스트 컬러를 만들어주었다.
        _TestColor("testcolor", Color) = (1,1,1,1)
        
        //RGB 각각 조절하기
        _Red("Red", Range(0,1)) = 0
        _Green("Green", Range(0,1)) = 0
        _Blue("Blue", Range(0,1)) = 0
        
        //색상을 밝게 혹은 어둡게 만들기
        _BrightDark("Brightness $ Darkness", Range(-1,1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        struct Input
        {
            float4 color : COLOR ;
        };

        //테스트컬러 변수를 만들었다.
        float4 _TestColor;

        //R, G, B 각각 조정하기 위해서 변수를 선언했다
        float _Red, _Green, _Blue;
        
        //Brightness $ Darkness 변수 선언
        float _BrightDark;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            //o.Albedo에 테스트 컬러 변수를 넣었다. o.Emmision에도 적용이 가능하다
            // o.Albedo = _TestColor.rgb;

            //R, G, B 각각 인스펙터에서 조절할 수 있다
            //o.Albedo = float3(_Red, _Green, _Blue);
            
            //색상을 밝게 혹은 어둡게 만들기
            o.Albedo = float3(_Red, _Green, _Blue) + _BrightDark;

            o.Alpha = 1;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
