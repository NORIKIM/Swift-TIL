# 단위변환기

### STEP 3. 길이 값 입력 및 조건문

**학습목표**

- 사용자가 직접 값을 입력하고 결과를 계산하는 방식을 경험한다.
- 사용자가 입력한 문자열을 변환하거나 일부를 비교하는 방법을 경험한다.
- 비교문 결과에 따라 다른 동작을 하도록 개선한다.
- 옵셔널 데이터 예외처리 방식에 익숙해진다.

<br>

**요구사항 **

- 사용자가 길이 값을 입력하고 변수에 저장하도록 한다.
- 길이 단위에 따라 센티미터를 미터로 바꾸는 함수와, 미터를 센티미터로 바꾸는 함수로 나눈다.
- 사용자가 입력한 문자열에서 값 뒤에 붙어있는 단위에 따라서, 앞서 나눠놓은 길이 변환 함수를 호출하고 결과를 출력한다.
- 예를 들어 "183cm"처럼 숫자 다음에 cm가 붙어있으면 센티미터 값을 미터로 변환하고 출력한다.
- "3.14m"처럼 숫자 다음에 m가 붙어있으면 미터 값을 센티미터로 변환하고 출력한다.

```swift
print("값을 입력해주세요.")
let inputValue = readLine()

var cmOrM = ""
var num = 0.0

// inputValue를 숫자와 cm/m 분리
if let inputValue = inputValue {
    cmOrM = inputValue.trimmingCharacters(in: CharacterSet.letters.inverted)//입력값 문자만 가져옴
    num = Double(inputValue.trimmingCharacters(in: CharacterSet.decimalDigits.inverted))!//입력값 숫자만 가져옴
}

//cm -> m
func centiToM() {
    var result = 0.0
    let meter = "m"
    result = num / Double(100)
    print("\(result)\(meter)")
}

//m -> cm
func meterToCm() {
    var result = 0.0
    let meter = "cm"
    result = num * Double(100)
    print("\(result)\(meter)")
}

//cm <-> m
func conversion() {
    if cmOrM == "cm" {
        centiToM()
    } else {
        meterToCm()
    }
}

conversion()
```

<br>

> 수정

1. 함수명 동사형으로 수정
2. readLine을 함수로 
3. 함수에 매개변수와 리턴 값을 넣음
4. 입력값이 없을 경우 예외처리

```swift
print("값을 입력해주세요 -> 숫자+단위\n끝내려면 end를 입력해주세요")

// 입력값 받기
func getInput() -> String{
    let input = readLine() ?? "end"
    return input
}

// inputValue에서 cm/m 분리
func getUnitString(_ userInput: String) -> String {
    var cmOrM = ""
  // 입력값 문자만 가져옴
    cmOrM = userInput.trimmingCharacters(in: CharacterSet.letters.inverted) 
    return cmOrM
}

// inputValue에서 숫자만 분리
func getUnitNumber(_ userInput: String) -> Double {
    var num = 0.0
  // 입력값 숫자만 가져옴
    num = Double(userInput.trimmingCharacters
                 (in:CharacterSet.decimalDigits.inverted))! 
    return num
}

// cm -> m
func convertCentiToM(_ userInput: String) {
    var result = 0.0
    let meter = "m"
    result = getUnitNumber(userInput) / Double(100)
    print("\(result)\(meter)")
}

// m -> cm
func convertMeterToCm(_ userInput: String) {
    var result = 0.0
    let centi = "cm"
    result = getUnitNumber(userInput) * Double(100)
    print("\(result)\(centi)")
}

// cm <-> m
while true {
   let userInput = getInput()
    if userInput == "end" {
        break
    }
    if getUnitString(userInput) == "cm" {
        convertCentiToM(userInput)
    } else if getUnitString(userInput) == "m" {
        convertMeterToCm(userInput)
    }
}
```



