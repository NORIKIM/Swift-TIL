# Circle of Numbers

Consider integer numbers from 0 to n - 1 written down along the circle in such a way that the distance between any two neighboring numbers is equal (note that 0 and n - 1 are neighboring, too).

Given n and firstNumber, find the number which is written in the radially opposite position to firstNumber.

**Example**

For n = 10 and firstNumber = 2, the output should be
circleOfNumbers(n, firstNumber) = 7.

<img src="https://codesignal.s3.amazonaws.com/tasks/circleOfNumbers/img/example.png?_tm=1582003395936">

**Input/Output**

[execution time limit] 20 seconds (swift)

[input] integer n

A positive even integer.

Guaranteed constraints:
4 ≤ n ≤ 20.

[input] integer firstNumber

Guaranteed constraints:
0 ≤ firstNumber ≤ n - 1.

[output] integer


**설명**

원을 그려 n만큼의 숫자들을 나열 시켰을 때 firstNumber와 마주보는 반대편의 숫자를 찾아라


**풀이**

만약 n이 10이고 firstNumber가 6이라고 했을 때, 0부터 n만큼의 숫자를 나열하면 0~9까지의 숫자가 나열된다.firstNumber와 마주보는 숫자를 찾기위해 주어진 10개의 숫자를 반을 나누고 나눈 숫자만큼 firstNumber에서 전진하면 마주보는 숫자는 1이 된다.

```swift
func circleOfNumbers(n: Int, firstNumber: Int) -> Int {
    let result = firstNumber - (n / 2)
    
    if result < 0 {
        return firstNumber + (n / 2)
    }
    
    return result
}
``` 

다른 사람 풀이

```swift
func circleOfNumbers(n: Int, firstNumber: Int) -> Int {
    return (firstNumber + (n / 2)) % 2
```