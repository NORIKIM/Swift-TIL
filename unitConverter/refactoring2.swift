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

// 길이 단위
enum length: Double {
    case cm = 1
    case m = 100
    case inch = 2.54
    case yard = 91.44
    
    static let lengthType = [cm,m,inch,yard]
}

// 단위변환을 위한 구조체
struct Convert {
    var inputDic:[String:String]
    
    // 기본단위 변환함수(예.180cm -> [m,inch,yard])
    func convertBaseTo() -> Array<String>{
        let number = Double(inputDic["number"] ?? "")
        let from = inputDic["from"]
        let to = inputDic["to"]
        var result:[String] = []
        
        if from == "cm" && to == "" {
            for lengthCase in length.lengthType {
                result.append(String(number! / lengthCase.rawValue) + String(describing: lengthCase))
            }
            result.remove(at: 0)
        }
        return result
    }
    
    // 기본단위 아닐때 기본단위로 변환(예.180m -> cm)
    // 숫자 * from
    func convertBase() -> String {
        let number = Double(inputDic["number"] ?? "")
        let from = inputDic["from"]
        var result = ""
        
        if from != "" && from != "cm" {
            for lengthCase in length.lengthType {
                if from == String(describing: lengthCase) && from != "cm" {
                    result.append(String(number! * lengthCase.rawValue) + "cm")
                }
            }
        }
        return result
    }
    
    // from -> to // from -> to,secTo
    func convertFromTo() -> Array<String> {
        let from = inputDic["from"]
        let to = inputDic["to"]
        let sec = inputDic["secTo"]
        var toRawVal = 0.0
        var toUnit = ""
        var secRawVal = 0.0
        var secUnit = ""
        let convertBaseResult = convertBase() // "18000cm"
        let separateBaseNum = convertBaseResult.trimmingCharacters(in: CharacterSet.decimalDigits.inverted) // 18000
        var result:[String] = []
        
        if from != "cm" && to != "" || sec != "" {
            for lengthCase in length.lengthType {
                if to == String(describing: lengthCase) {
                    toRawVal = lengthCase.rawValue
                    toUnit = String(describing: lengthCase)
                }
                if sec == String(describing: lengthCase) {
                    secRawVal = lengthCase.rawValue
                    secUnit = String(describing: lengthCase)
                }
            }
            result.append(String(Double(separateBaseNum)! / toRawVal) + toUnit)
            
            if sec != "" {
                result.append(String(Double(separateBaseNum)! / secRawVal) + secUnit)
            }
        }
        return result
    }
    
    // main 실행 구간
    mutating func getValue() {
        var flag:Bool = true
        while flag {
            let userInput = getInput()
            self.inputDic = makeDic(userInput)
            let from = self.inputDic["from"]
            let to = self.inputDic["to"]
            let sec = self.inputDic["secTo"]
            
            if userInput == "quit" || userInput == "q" {
                flag = false
            }
            if from == "cm" && to == "" {
                print(convertBaseTo())
            } else if from != "" && from != "cm" && to == "" {
                print(convertBase())
            } else if from != "cm" && to != "" || sec != "" {
                print(convertFromTo())
            }
        }
    }
}
var convertUnit = Convert(inputDic: [String : String]())
convertUnit.getValue()

