import Foundation

/*
 STEP 1. 길이 변환 및 출력
 
 - 다음의 센티미터(cm) 단위 값을 미터(m) 단위로 변환해 결과 화면에 출력한다.
 예를 들어 "120cm"을 "1.2m"로 출력한다.
 - 미터(m) 단위 값을 센티미터(cm) 단위로 변환해 결과 화면에 출력한다.
 "1.86m"를 "186cm"로 출력한다.
 */

// cm -> m
func cmToM(num:Double) -> Double{
    return num / 100
}

// m -> cm
func mToCm(num:Double) -> Double {
    return num * 100
}
//----------------------------------------구분선---------------------------------------------------------------
/*
 STEP 2. 길이 단위 변환 함수
 
 - 센티미터 단위 값을 변수에 저장하고 변환하는 데 사용한다.
 - 센티미터 단위 값을 저장한 변수를 미터 단위 값으로 변환한 후 변수에 저장하고 저정한 변수 값을 출력한다.
 - 길이 단위를 바꿀 때 곱하거나 나누는 값은 바뀌지 않는 값이다. 따라서 상수 값으로 지정해서 프로그램을 구현한다.
 - 문자열로 값 뒤에 붙어있는 단위에 따라 길이를 변환해서 결과를 출력하는 함수를 만든다.
 예를 들어 "183cm"처럼 숫자 다음에 cm가 붙어있으면 센티미터 값을 미터로 변환하고 출력한다. "3.14m"처럼 숫자 다음에 m가 붙어있으면 미터 값을
 센티미터로 변환하고 출력한다.
 */

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
//----------------------------------------구분선---------------------------------------------------------------
/*
 STEP 3. 길이 값 입력 및 조건문
 
 - 사용자가 길이 값을 입력하고 변수에 저장하도록 한다.
 - 길이 단위에 따라 센티미터를 미터로 바꾸는 함수와, 미터를 센티미터로 바꾸는 함수로 나눈다.
 - 사용자가 입력한 문자열에서 값 뒤에 붙어있는 단위에 따라서, 앞서 나눠놓은 길이 변환 함수를 호출하고 결과를 출력한다.
 예를 들어 "183cm"처럼 숫자 다음에 cm가 붙어있으면 센티미터 값을 미터로 변환하고 출력한다.
 "3.14m"처럼 숫자 다음에 m가 붙어있으면 미터 값을 센티미터로 변환하고 출력한다.
 */

print("값을 입력해주세요 -> 숫자+단위\n끝내려면 end를 입력해주세요")

// 입력값 받기
func getInput() -> String{
    let input = readLine() ?? "end"
    return input
}

// inputValue에서 cm/m 분리
func getUnitString(_ userInput: String) -> String {
    var cmOrM = ""
    cmOrM = userInput.trimmingCharacters(in: CharacterSet.letters.inverted) // 입력값 문자만 가져옴
    return cmOrM
}

// inputValue에서 숫자만 분리
func getUnitNumber(_ userInput: String) -> Double {
    var num = 0.0
    num = Double(userInput.trimmingCharacters(in: CharacterSet.decimalDigits.inverted))! // 입력값 숫자만 가져옴
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
//----------------------------------------구분선---------------------------------------------------------------
/*
 STEP 4. 인치 길이 변환과 예외 처리
 
 - 사용자가 길이 값과 단위를 입력하고 변환할 단위까지도 입력하도록 확장한다.
 - 센티미터를 인치로 바꾸는 함수와 인치를 센티미터로 바꾸는 함수를 추가로 구현한다.
 - 사용자가 입력한 문자열에서 값 뒤에 붙어있는 단위와 그 이후에 변환할 단위를 붙이면 해당하는 변환 함수를 호출해서 변환하도록 구현한다.
 예를 들어 "18cm inch"라고 입력하면 센티미터를 인치로 바꾸는 함수를 호출한다.
 "25.4inch m"라고 입력하면 인치를 센티미터로 바꾸는 함수를 호출하고, 다시 센티미터 단위를 미터로 바꾸는 함수를 호출한다.
 "0.5m inch"라고 입력하면 미터를 센티미터로 바꾸는 함수를 호출하고, 다시 센티미터 단위를 인치로 바꾸는 함수를 호출한다.
 "183cm"처럼 숫자 다음에 cm만 붙어있으면 센티미터 값을 미터로 변환하고 출력한다.
 "3.14m"처럼 숫자 다음에 m가 붙어있으면 미터 값을 센티미터로 변환하고 출력한다.
 - 만약 지원하지 않는 길이 단위(feet)가 붙어 있을 경우, "지원하지 않는 단위입니다."를 출력하고 다시 입력받도록 한다.
 */
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

/*
 STEP 5. 야드 길이 변환과 반복 입력
 
 - 5단계까지 요구사항을 그대로 유지하면서, 동일하게 야드(yard) 단위도 동작하도록 함수를 구현하고 프로그램을 개선한다.
 예를 들어, "1yard m"라고 입력하면 야드를 센티미터로 바꾸는 함수를 호출하고, 다시 센티미터 단위를 미터로 바꾸는 함수를 호출한다.
 "1m yard"라고 입력하면 미터를 센티미터로 바꾸는 함수를 호출하고, 다시 센티미터를 야드로 바꾸는 함수를 호출한다.
 "2.54yard"처럼 숫자 다음에 yard만 붙어있으면 미터 단위 값으로 변환하고 출력한다.
 - 변환한 값을 출력하고 난 이후에 다시 입력을 반복하도록 개선한다.
 - 만약 "quit" 혹은 "q" 라고 입력하면 프로그램을 종료한다.
 */

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
