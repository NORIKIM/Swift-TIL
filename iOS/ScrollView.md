# ScrollView

지옥의 스크롤뷰..

스크롤뷰는 레이아웃에 민감하여 조금이라도 쉽게? 생성하려면 항상 superView를 만들어 그 안에서 스크롤뷰를 컨트롤 해야한다.

## 화면에서 원하는 사이즈의 스크롤뷰 생성하기

1. viewController를 생성
2. View 생성
3. View 안에 scrollView 생성
4. View를 safeArea를 기준으로 원하는 자리와 사이즈 제약을 추가한다
5. viewController.swift 파일로 돌아온다
6. view와 scrollView 아울렛 연결
7. 스크롤뷰를 세팅할 함수를 하나 만들고
8. 함수 안에 for 문을 이용하여 보여줄 뷰로 레이블을 넣는다면 레이블을 코드로 생성하여 frame은 view를 기준으로 만들고
9. scrollView에 addsubview 해준다
10. Scrollview.contentsize를 지정해준다

일단 .. 프로젝트에서 확인하고, 다음에 또 자세히 알아봐야겠음

**프로젝트 Coupon-> https://github.com/NORIKIM/Coupon/blob/master/Coupon/Coupon/ViewController.swift**

