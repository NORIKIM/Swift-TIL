**Function Description**

Complete the *timeConversion* function in the editor below. It should return a new string representing the input time in 24 hour format.

timeConversion has the following parameter(s):

- *s*: a string representing time in  12 hour format

![image-20190306164954586](/Users/jina/Library/Application Support/typora-user-images/image-20190306164954586.png)



```swift
import Foundation

func timeConversion(s: String) -> String {
    let input = s.components(separatedBy: ":")
    var hh = input[0]
    let mm = input[1]
    let ss = input[2].dropLast(2)
    let time = input[2].dropFirst(2)
    
    switch time {
    case "AM":
        if hh == "12" {
            return "00:\(mm):\(ss)"
        }
        return "\(hh):\(mm):\(ss)"
    case "PM":
        if hh == "12" {
            return "\(hh):\(mm):\(ss)"
        }
        hh = String(Int(hh)! + 12)
        return "\(hh):\(mm):\(ss)"
    default:
        return s
    }

    return s
}

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let s = readLine() else { fatalError("Bad input") }

let result = timeConversion(s: s)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
```

