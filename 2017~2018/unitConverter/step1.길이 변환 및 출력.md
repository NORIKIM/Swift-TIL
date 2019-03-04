# 단위변환기

### STEP 1. 길이 변환 및 출력

- 요구사항

다음의 센티미터(cm) 단위 값을 미터(m) 단위로 변환해 결과 화면에 출력한다.

 예를 들어 "120cm"을 "1.2m"로 출력한다.

미터(m) 단위 값을 센티미터(cm) 단위로 변환해 결과 화면에 출력한다.

 "1.86m"를 "186cm"로 출력한다.

```swift
// cm -> m
func cmToM(num:Double) -> Double{
    return num / 100
}

// m -> cm
func mToCm(num:Double) -> Double {
    return num * 100
}
```

