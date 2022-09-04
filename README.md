# ShaderStartUp
Studying with a book what it is SHADER STARTUP
## 1. test.rgb - rgb.shader
surf 안에 float4 test를 변수를 선언하고, 이를 o.Albedo에 적용시킬 수 있다. 가장 기본적인 것이지만, 확실하게 해야 한다. o.Albedo는 float3이지만 float4도 적용을 할 수 있다. 하지만, 이는 바른 코딩이 아니기 때문에 바른 코딩을 위해서는 "o.Albedo = test;" 대신에 "o.Albedo = test.rgb;" 로 작성을 해야 한다.
## 2. float3에 변수 넣어보기 - calculate.shader
위에서 한 것과 마찬가지로 float를 초기화하는데, float2와 float3도 초기화한다. 위에서 했던 test.rgb처럼 사용을 하는 것이다. **calculate** 셰이더 코드에서 r, gg, bbb를 초기화를 했고, 위에서 한 것처럼 r.r, gg.rg, bbb.rb 등 다양한 방식을 사용한다면 재밌는 결과 값을 얻을 수 있다.
## 3. 입력값 출력하기 - changecolor.shader
프로퍼티에 Brightness $ Darkness 코드를 작성하고, SubShader에 변수를 선언하고, 작성한 컬러 코드에 변수를 더해주면 된다. 컬러, 밝기 등 이러한 방식을 통해서 쉽게 입력값을 출력할 수 있다. 프로퍼티는 인스펙터에서 조절할 수 있게 작성하는 곳이고, SubShader는 셰이더 기능의 주요 코드들이 들어가는 중요한 파트이다.
