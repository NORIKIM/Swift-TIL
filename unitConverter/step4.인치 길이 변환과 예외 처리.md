# 단위변환기

### STEP 4. 인치 길이 변환과 예외 처리

**학습목표**

- 사용자가 입력한 문자열을 변환하거나 일부를 비교하는 여러 방법을 경험한다.
- 복합적인 비교문 결과에 따라 다양한 동작을 하도록 개선한다.
- 지원하지 않는 경우에 대한 예외처리를 경험한다.

<br>

**요구사항 **

- 사용자가 길이 값과 단위를 입력하고 변환할 단위까지도 입력하도록 확장한다.
- 센티미터를 인치로 바꾸는 함수와 인치를 센티미터로 바꾸는 함수를 추가로 구현한다.
- 사용자가 입력한 문자열에서 값 뒤에 붙어있는 단위와 그 이후에 변환할 단위를 붙이면 해당하는 변환 함수를 호출해서 변환하도록 구현한다.
  - 예를 들어 "18cm inch"라고 입력하면 센티미터를 인치로 바꾸는 함수를 호출한다.
  - "25.4inch m"라고 입력하면 인치를 센티미터로 바꾸는 함수를 호출하고, 다시 센티미터 단위를 미터로 바꾸는 함수를 호출한다.
  - "0.5m inch"라고 입력하면 미터를 센티미터로 바꾸는 함수를 호출하고, 다시 센티미터 단위를 인치로 바꾸는 함수를 호출한다.
  - "183cm"처럼 숫자 다음에 cm만 붙어있으면 센티미터 값을 미터로 변환하고 출력한다.
  - "3.14m"처럼 숫자 다음에 m가 붙어있으면 미터 값을 센티미터로 변환하고 출력한다.
- 만약 지원하지 않는 길이 단위(feet)가 붙어 있을 경우, "지원하지 않는 단위입니다."를 출력하고 다시 입력받도록 한다.


```swift
print("# 값을 입력해주세요 -> 숫자+단위(예 : 25inch m)\n끝내려면 end를 입력해주세요 >_<")

// 입력값 받기
func getInput() -> String {
    let input = readLine() ?? "end"
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
func convertInchTocenti(_ userInput: String) -> String{
    var result = 0.0
    let centi = "cm"
    result = getUnitNumber(userInput) / 0.39370
    return String(result) + centi
}

// cm <-> m
while true {
    let userInput = getInput()
    // 사용자가 end를 입력하면 프로그램 종료시키기
    if userInput == "end" {
        break
    }
    
    // 입력값(cmOrM)을 이용하여 변환함수 호출
    switch getUnitString(userInput) {
        case "cm inch":
            print(convertCentiToInch(userInput))
        case "inch cm":
            print(convertInchTocenti(userInput))
        case "m":
            print(convertMeterToCm(userInput))
        case "cm":
            print(convertCentiToM(userInput))
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

