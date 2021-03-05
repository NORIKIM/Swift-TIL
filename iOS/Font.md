# Custom Font 추가

참고 : https://zeddios.tistory.com/199

1. 다운받은 폰트(ttf 또는 otf)를 프로젝트에 추가한다.

   <img src="https://user-images.githubusercontent.com/31604976/110109685-24079880-7df1-11eb-8565-ef80b92b6dc2.png">

2. 폰트 파일을 클릭 하고 오른쪽 inspector-Target Membership에 프로젝트 명 체크

3. 프로젝트 - 타겟 - Build Phases - Copy Bundle Resources에 폰트파일 확인

   (Copy if you needed를 체크했다면 확인 가능)

4. 모든 기기에서 정상적으로 폰트가 나타날 수 있도록 info.plist 작업

   <img src="https://user-images.githubusercontent.com/31604976/110110408-23233680-7df2-11eb-9c8b-3815177f1ce9.png">

5. 적용 하여 사용하면 끝.