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
    
    static let lengthtype = [cm,m,inch,yard]
}

// 변환함수 (예.18cm / 18inch 입력 시)
func convert(_ inputDic:[String:String]) -> Array<String>{
    let number = Double(inputDic["number"] ?? "")
    let from = inputDic["from"]
    let to = inputDic["to"]
    var result:[String] = []
    
    if from != "" && to == "" {
        switch inputDic["from"] {
        case "cm"?:
            for lengthTypeVal in length.lengthtype {
                result.append(String(number! / lengthTypeVal.rawValue) + String(describing: lengthTypeVal))
            }
            result.remove(at: 0)
            
        default: // cm가 아닐때 숫자 * from / to
            var fromRawVal = 0.0
            var convertUnit:[String] = []
            var centi = 0.0
            
            // from단위가 length에 있는지 판단하고, 같은단위와 cm를 제외한 나머지 단위들을 convertUnit배열에 삽입
            for i in 0 ..< length.lengthtype.count {
                if String(describing: length.lengthtype[i]) != from && String(describing: length.lengthtype[i]) != "cm" {
                    convertUnit.append(String(describing: length.lengthtype[i]))
                }
            }
            // cm 계산하여 centi에 대입
            for fromUnit in length.lengthtype {
                if from == String(describing: fromUnit) {
                    fromRawVal = fromUnit.rawValue
                    centi = number! * fromRawVal
                }
            }
            // 연산
            for lengthTypeVal in length.lengthtype {
                for convertUnitVal in convertUnit {
                    if String(describing: lengthTypeVal) == convertUnitVal {
                        result.append(String(centi / lengthTypeVal.rawValue) + String(describing: convertUnitVal))
                        
                    }
                }
            }
            result.insert(String(centi) + "cm", at: 0)
        }
    }
    return result
}

while true {
    let userInput = getInput()
    if userInput == "quit" || userInput == "q" {
        break
    }
    let inputDic = makeDic(userInput)
    print(convert(inputDic))
}


