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

// 무게 단위
enum weigth: Double {
    case g = 1
    case kg = 1000
    case lb = 453.592
    case oz = 28.3495
    
    static let weigthType = [g,kg,lb,oz]
}
// 부피 단위
enum volume: Double {
    case l = 1
    case pt = 0.473176
    case qt = 0.946353
    case gal = 3.78541
    
    static let volumeType = [l,pt,qt,gal]
}

// 기본 단위 체크
func checkBaseUnit(_ inputDic:[String:String]) -> String {
    let baseUnit:[String] = ["cm","g","l"]
    var base = ""
    for unit in baseUnit{
        if inputDic["from"] == unit {
            base = unit
        }
    }
    return base
}

// 기본단위 변환함수(예.180cm -> [m,inch,yard])
func convertBaseTo(_ inputDic:[String:String]) -> Array<String>{
    let base = checkBaseUnit(inputDic)
    let number = Double(inputDic["number"] ?? "")
    let from = inputDic["from"]
    let to = inputDic["to"]
    var result:[String] = []
    
    if from == base && to == "" {
        switch base {
        case "cm":
            for lengthCase in length.lengthType {
                result.append(String(number! / lengthCase.rawValue) + String(describing: lengthCase))
            }
            result.remove(at: 0)
        case "g":
            for weigthCase in weigth.weigthType {
                result.append(String(number! / weigthCase.rawValue) + String(describing: weigthCase))
            }
            result.remove(at: 0)
        case "l":
            for volumeCase in volume.volumeType {
                result.append(String(number! / volumeCase.rawValue) + String(describing: volumeCase))
            }
            result.remove(at: 0)
        default:
            ()
        }
    }
    return result
}

// 기본단위 아닐때 기본단위로 변환(예.180m -> cm)
// 숫자 * from
func convertBase(_ inputDic:[String:String]) -> String {
    let base = checkBaseUnit(inputDic)
    let number = Double(inputDic["number"] ?? "")
    let from = inputDic["from"]
    var result = ""
    
    if from != "" && from != base {
        for lengthCase in length.lengthType {
            if from == String(describing: lengthCase) && from != "cm" {
                result.append(String(number! * lengthCase.rawValue) + "cm")
            }
        }
        for weigthCase in weigth.weigthType {
            if from == String(describing: weigthCase) && from != "g" {
                result.append(String(number! * weigthCase.rawValue) + "g")
            }
        }
        for volumeCase in volume.volumeType {
            if from == String(describing: volumeCase) && from != "l" {
                result.append(String(number! * volumeCase.rawValue) + "l")
            }
        }
    }
    return result
}

// from -> to // from -> to,secTo
func convertFromTo(_ inputDic:[String:String]) -> Array<String> {
    let from = inputDic["from"]
    let to = inputDic["to"]
    let sec = inputDic["secTo"]
    let base = checkBaseUnit(inputDic)
    var toRawVal = 0.0
    var toUnit = ""
    var secRawVal = 0.0
    var secUnit = ""
    let convertBaseResult = convertBase(inputDic) // "18000cm"
    let separateBaseNum = convertBaseResult.trimmingCharacters(in: CharacterSet.decimalDigits.inverted) // 18000
    var result:[String] = []
    
    if from != base && to != "" || sec != "" {
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
        for weigthCase in weigth.weigthType {
            if to == String(describing: weigthCase) {
                toRawVal = weigthCase.rawValue
                toUnit = String(describing: weigthCase)
            }
            if sec == String(describing: weigthCase) {
                secRawVal = weigthCase.rawValue
                secUnit = String(describing: weigthCase)
            }
        }
        for volumeCase in volume.volumeType {
            if to == String(describing: volumeCase) {
                toRawVal = volumeCase.rawValue
                toUnit = String(describing: volumeCase)
            }
            if sec == String(describing: volumeCase) {
                secRawVal = volumeCase.rawValue
                secUnit = String(describing: volumeCase)
            }
        }
        result.append(String(Double(separateBaseNum)! / toRawVal) + toUnit)
        
        if sec != "" {
            result.append(String(Double(separateBaseNum)! / secRawVal) + secUnit)
        }
    }
    return result
}

while true {
    let userInput = getInput()
    let inputDic = makeDic(userInput)
    let base = checkBaseUnit(inputDic)
    let from = inputDic["from"]
    let to = inputDic["to"]
    let sec = inputDic["secTo"]
    
    if userInput == "quit" || userInput == "q" {
        break
    }
    
    if from == base && to == "" {
        print(convertBaseTo(inputDic))
    } else if from != "" && from != base && to == "" {
        print(convertBase(inputDic))
    } else if from != base && to != "" || sec != "" {
        print(convertFromTo(inputDic))
    }
}


