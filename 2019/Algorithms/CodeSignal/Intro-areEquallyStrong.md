# Intro - areEquallyStrong

Call two arms *equally strong* if the heaviest weights they each are able to lift are equal.

Call two people *equally strong* if their strongest arms are equally strong (the strongest arm can be both the right and the left), and so are their weakest arms.

Given your and your friend's arms' lifting capabilities find out if you two are equally strong.

**Example**

- For `yourLeft = 10`, `yourRight = 15`, `friendsLeft = 15`, and `friendsRight = 10`, the output should be
  `areEquallyStrong(yourLeft, yourRight, friendsLeft, friendsRight) = true`;
- For `yourLeft = 15`, `yourRight = 10`, `friendsLeft = 15`, and `friendsRight = 10`, the output should be
  `areEquallyStrong(yourLeft, yourRight, friendsLeft, friendsRight) = true`;
- For `yourLeft = 15`, `yourRight = 10`, `friendsLeft = 15`, and `friendsRight = 9`, the output should be
  `areEquallyStrong(yourLeft, yourRight, friendsLeft, friendsRight) = false`.

**설명**

나의 왼팔, 오른팔과 친구의 왼팔, 오른팔의 무게가 같아야 한다.

```swift
func areEquallyStrong(yourLeft: Int, yourRight: Int, friendsLeft: Int, friendsRight: Int) -> Bool {
    return (yourLeft == friendsLeft || yourLeft == friendsRight) && (yourRight == friendsRight || yourRight == friendsLeft)
}
```

