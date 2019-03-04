# 단위변환기

### STEP 5. 야드 길이 변환과 반복 입력

**요구사항 **

- 5단계까지 요구사항을 그대로 유지하면서, 동일하게 야드(yard) 단위도 동작하도록 함수를 구현하고 프로그램을 개선한다.
  - 예를 들어, "1yard m"라고 입력하면 야드를 센티미터로 바꾸는 함수를 호출하고, 다시 센티미터 단위를 미터로 바꾸는 함수를 호출한다.
  - "1m yard"라고 입력하면 미터를 센티미터로 바꾸는 함수를 호출하고, 다시 센티미터를 야드로 바꾸는 함수를 호출한다.
- "2.54yard"처럼 숫자 다음에 yard만 붙어있으면 미터 단위 값으로 변환하고 출력한다.
- 변환한 값을 출력하고 난 이후에 다시 입력을 반복하도록 개선한다.
- 만약 "quit" 혹은 "q" 라고 입력하면 프로그램을 종료한다.


```swift
print("# 값을 입력해주세요 -> 숫자+단위(예 : 25inch m)\n끝내려면 'quit' 혹은 'q'를 입력해주세요 >_<")

// 입력값 받기
func getInput() -> String {
    let input = readLine() ?? ""
    return input
}

// input에서 cm/m 분리
func getUnitString(_ userInput: String) -> String {
    var cmOrM = ""
    cmOrM = userInput.trimmingCharacters(in: CharacterSet.letters.inverted) // 입력값 문자만 가져옴
    return cmOrM
}

// input에서 숫자만 분리
func getUnitNumber(_ userInput: String) -> Double {
    var num = 0.0
    num = Double(userInput.trimmingCharacters(in: CharacterSet.decimalDigits.inverted))! // 입력값 숫자만 가져옴
    return num
}
// cm -> m
func convertCentiToM(_ userInput: String) -> String {
    var result = 0.0
    let meter = "m"
    result = getUnitNumber(userInput) / Double(100)
    return String(result) + meter
}

// m -> cm
func convertMeterToCm(_ userInput: String) -> String {
    var result = 0.0
    let centi = "cm"
    result = getUnitNumber(userInput) * Double(100)
   return String(result) + centi
}

// cm -> inch
func convertCentiToInch(_ userInput: String) -> String {
    var result = 0.0
    let inch = "inch"
    result = getUnitNumber(userInput) * 0.39370
    return String(result) + inch
}

// inch -> cm
func convertInchTocenti(_ userInput: String) -> String {
    var result = 0.0
    let centi = "cm"
    result = getUnitNumber(userInput) / 0.39370
    return String(result) + centi
}

// yard -> m
func convertyartToM(_ userInput: String) -> String {
    var result = 0.0
    let meter = "m"
    result = getUnitNumber(userInput) / 1.0936
    return String(result) + meter
}

// m -> yard
func converMToYard(_ userInput: String) -> String {
    var result = 0.0
    let yard = "yard"
    result = getUnitNumber(userInput) * 1.0936
    return String(result) + yard
}

// cm <-> m
while true {
    let userInput = getInput()
    // 사용자가 end를 입력하면 프로그램 종료시키기
    if userInput == "q" || userInput == "quit" {
        break
    }
    
    // 입력값(cmOrM)을 이용하여 변환함수 호출
    switch getUnitString(userInput) {
        case "cm inch":
            print(convertCentiToInch(userInput))
        case "inch cm":
            print(convertInchTocenti(userInput))
        case "m cm":
            print(convertMeterToCm(userInput))
        case "cm m":
            print(convertCentiToM(userInput))
        case "yard m","yard":
            print(convertyartToM(userInput))
        case "m yard":
            print(converMToYard(userInput))
        case "inch m":
            let inchToCm = convertInchTocenti(userInput)
            print(convertCentiToM(inchToCm))
        case "m inch":
            let mToinch = convertMeterToCm(userInput)
            print(convertCentiToInch(mToinch))
        case "feet":
            print("지원하지 않는 단위입니다.")
        default :
            ()
    }
}
```

