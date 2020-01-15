**2019.03.06**

Apple and Orange

```swift
import Foundation

// Complete the countApplesAndOranges function below.
func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    var apple = 0
    var orange = 0
    
    for m in apples {
        if a + m >= s && a + m <= t {
            apple += 1
        }
    }
    for n in oranges {
        if b + n >= s && b + n <= t {
            orange += 1
        }
    }
    
    print(apple)
    print(orange)
}

guard let stTemp = readLine() else { fatalError("Bad input") }
let st = stTemp.split(separator: " ").map{ String($0) }

guard let s = Int(st[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let t = Int(st[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let abTemp = readLine() else { fatalError("Bad input") }
let ab = abTemp.split(separator: " ").map{ String($0) }

guard let a = Int(ab[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let b = Int(ab[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let mnTemp = readLine() else { fatalError("Bad input") }
let mn = mnTemp.split(separator: " ").map{ String($0) }

guard let m = Int(mn[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let n = Int(mn[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let applesTemp = readLine() else { fatalError("Bad input") }
let apples: [Int] = applesTemp.split(separator: " ").map {
    if let applesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return applesItem
    } else { fatalError("Bad input") }
}

guard apples.count == m else { fatalError("Bad input") }

guard let orangesTemp = readLine() else { fatalError("Bad input") }
let oranges: [Int] = orangesTemp.split(separator: " ").map {
    if let orangesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return orangesItem
    } else { fatalError("Bad input") }
}

guard oranges.count == n else { fatalError("Bad input") }

countApplesAndOranges(s: s, t: t, a: a, b: b, apples: apples, oranges: oranges)

```



