# switch

예제 1. 점수에 따라 등급 나누기
```swift
func grade(score: Int) -> String {
  switch score {
  case 100:
    return "A"
  case _ where score >= 90:
    return "B"
  case 80 ... 89:
    return "C"
  case _ where score == 70 || score < 60:
    return "D"
  }
}
```
