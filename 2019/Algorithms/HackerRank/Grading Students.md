```swift
import Foundation

func gradingStudents(grades: [Int]) -> [Int] {
    var result = grades
    
    for grade in 0 ..< result.count {
        if result[grade] < 38 || result[grade] % 5 == 0 {
            continue
        } else {
            while result[grade] % 5 != 0 { result[grade] += 1 }
            if result[grade] - grades[grade] < 3 {
               result[grade] = grades[grade] + (result[grade] - grades[grade])
            } else {
                result[grade] = grades[grade]
            }
        }
    }
    return result
}

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let grades: [Int] = AnyIterator{ readLine() }.prefix(n).map {
    if let gradesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return gradesItem
    } else { fatalError("Bad input") }
}

guard grades.count == n else { fatalError("Bad input") }

let result = gradingStudents(grades: grades)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
```

