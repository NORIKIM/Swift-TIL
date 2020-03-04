# evneDigingsOnly

Check if all digits of the given integer are even.

**Example**

- For `n = 248622`, the output should be
  `evenDigitsOnly(n) = true`;
- For `n = 642386`, the output should be
  `evenDigitsOnly(n) = false`.

**Input/Output**

- **[execution time limit] 20 seconds (swift)**

- **[input] integer n**

  *Guaranteed constraints:*
  `1 ≤ n ≤ 109`.

- **[output] boolean**

  - `true` if all digits of `n` are even, `false` otherwise.

**풀이**

주어지는 숫자의 각 자리수에 해당하는 숫자가 짝수일때만 리턴 true



```swift
func evenDigitsOnly(n: Int) -> Bool {
    let strN = String(n)

    for i in strN.indices {
        guard let num = Int(String(strN[i])) else { return false }
        if num % 2 != 0 {
            return false
        }
    }
    return true
}
```

