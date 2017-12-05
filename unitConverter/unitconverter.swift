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


