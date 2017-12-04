# 단위변환기

### STEP 2. 길이 단위 변환 함수

- 요구사항

센티미터 단위 값을 변수에 저장하고 변환하는 데 사용한다.

센티미터 단위 값을 저장한 변수를 미터 단위 값으로 변환한 후 변수에 저장하고 저정한 변수 값을 출력한다.

길이 단위를 바꿀 때 곱하거나 나누는 값은 바뀌지 않는 값이다. 따라서 상수 값으로 지정해서 프로그램을 구현한다.

문자열로 값 뒤에 붙어있는 단위에 따라 길이를 변환해서 결과를 출력하는 함수를 만든다.

  예를 들어 "183cm"처럼 숫자 다음에 cm가 붙어있으면 센티미터 값을 미터로 변환하고 출력한다. "3.14m"처럼 숫자 다음에 m가 붙어있으면 미터 값을 센티미터로 변환하고 출력한다.

```swift
// cm <-> m
func unitConvert(num:Double,unit:String) -> Double {
    var result = 0.0
    let hundred = 100
    if unit == "cm" {
        result = num / Double(hundred)
    } else if unit == "m" {
        result = num * Double(hundred)
    }
    return result
}
```

