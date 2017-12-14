import Foundation

print("# 값을 입력해주세요 -> 숫자+단위(예 : 25inch m)\n끝내려면 'quit' 혹은 'q'를 입력해주세요 >_<")

// 입력값 받기
func getInput() -> String {
    let input = readLine() ?? ""
    return input
}

// input에서 숫자만 분리
func getUnitNumber(_ userInput: String) -> String {
    var num = ""
    num = userInput.trimmingCharacters(in: CharacterSet.decimalDigits.inverted) // 입력값 숫자만 가져옴
    return num
}

// input에서 단위 분리
func getUnitString(_ userInput: String) -> Array<String> {
    var unit = ""
    unit = userInput.trimmingCharacters(in: CharacterSet.letters.inverted) // 입력값 문자만 가져옴
    let separateUnit = unit.components(separatedBy: " ") //["cm","m"]
    return separateUnit
}

//바꾸고 싶은 단위
func getFromUnit(_ userInput: String) -> String {
    let getUnitValue = getUnitString(userInput)
    let from = getUnitValue[0]
    return from // "cm"
}

//바꾸려는 단위
func getToUnit(_ userInput: String) -> String {
    let getUnitValue = getUnitString(userInput)
    var to = ""
    if getUnitValue.count == 1 {
        to = ""
    }
    if getUnitValue.count == 2 {
        if getUnitValue[1].contains(",") {
            let separateUnit = getUnitValue[1].components(separatedBy: ",")
            to = separateUnit[0]
        } else {
            to = getUnitValue[1]
        }
    }
    return to
}

// 쉼표 뒤 단위(두번째 바꾸려는) 분리
func getSecToUnit(_ userInput: String) -> String {
    var secTo = ""
    let to = getToUnit(userInput)
    if to == "" {
        secTo = ""
    } else {
        let getUnitValue = getUnitString(userInput)
        if getUnitValue[1].contains(",") {
            let separateUnit = getUnitValue[1].components(separatedBy: ",")
            secTo = separateUnit[1]
        }
    }
    return secTo
}

// 받은 입력값 딕셔너리로 만들기
func makeDic(_ userInput: String) -> [String:String] {
    var saveValue:[String:String] = [:]
    saveValue = ["number":getUnitNumber(userInput),"from":getFromUnit(userInput),"to":(getToUnit(userInput)),"secTo":getSecToUnit(userInput)]
    // ex.userInput = 18cm yard,inch
    // [number:18, from:cm, to:yard, secTo:inch] - string타입
    return saveValue
}

// 길이단위 값
enum length: Double {
    case cm = 1
    case m = 100
    case inch = 2.54
    case yard = 91.44
}

while true {
    let userInput = getInput()
    if userInput == "quit" || userInput == "q" {
        break
    }
    let inputDic = makeDic(userInput)
    print(convert(inputDic))
}


