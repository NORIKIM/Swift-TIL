# Intro - avoidObstacles

You are given an array of integers representing coordinates of obstacles situated on a straight line.

Assume that you are jumping from the point with coordinate `0` to the right. You are allowed only to make jumps of the same length represented by some integer.

Find the minimal length of the jump enough to avoid all the obstacles.

**Example**

For `inputArray = [5, 3, 6, 7, 9]`, the output should be
`avoidObstacles(inputArray) = 4`.

Check out the image below for better understanding:

![img](https://codesignal.s3.amazonaws.com/tasks/avoidObstacles/img/example.png?_tm=1551432749641)

**설명**

inputArray의 값들에 겹치지 않게 0부터 점프를 하려면 몇개씩 점프해야하는가

**풀이**

최소 2개 이상씩 점프해야 하므로 몇개씩 점프해야하는지 알려주는 count 변수를 만들어서 최소 점프 수 2를 초기화

inputArray를 점프수로 나눈 나머지를 map하여 0을 포함하면(원소를 count로 나누어 0이면 점프수의 배수라는 의미) true를 리턴받고 count를 1증가시킨다

포함하지 않으면 false를 리턴받고 while문을 나온다.

```swift
func avoidObstacles(inputArray: [Int]) -> Int {
    var count = 2
    
    while inputArray.map({$0 % count}).contains(0) {
        count += 1
    }
    
    return count
}
```

