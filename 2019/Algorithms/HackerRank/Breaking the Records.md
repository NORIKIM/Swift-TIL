# Algorithm - Breaking the Records

Maria plays college basketball and wants to go pro. Each season she maintains a record of her play. She tabulates the number of times she breaks her season record for *most points* and *least points* in a game. Points scored in the first game establish her record for the season, and she begins counting from there.

For example, assume her scores for the season are represented in the array . Scores are in the same order as the games played. She would tabulate her results as follows:

```
                                 Count
Game  Score  Minimum  Maximum   Min Max
 0      12     12       12       0   0
 1      24     12       24       0   1
 2      10     10       24       1   1
 3      24     10       24       1   1
```

Given Maria's scores for a season, find and print the number of times she breaks her records for *most* and *least* points scored during the season.

**Function Description**

Complete the *breakingRecords* function in the editor below. It must return an integer array containing the numbers of times she broke her records. Index  is for breaking *most points* records, and index  is for breaking *least points* records.

breakingRecords has the following parameter(s):

- *scores*: an array of integers

**Input Format**

The first line contains an integer , the number of games.
The second line contains  space-separated integers describing the respective values of .

**Output Format**

Print two space-seperated integers describing the respective numbers of times her best (highest) score increased and her worst (lowest) score decreased.

**Sample Input 0**

```
9
10 5 20 20 4 5 2 25 1
```

**Sample Output 0**

```
2 4
```

**Explanation 0**

The diagram below depicts the number of times Maria broke her best and worst records throughout the season:

![image](https://s3.amazonaws.com/hr-assets/0/1487360234-6bca5c518d-breakingbest3.png)

She broke her best record twice (after games  and ) and her worst record four times (after games , , , and ), so we print `2 4` as our answer. Note that she *did not* break her record for best score during game , as her score during that game was *not* strictly greater than her best record at the time.

**Sample Input 1**

```
10
3 4 21 36 10 28 35 5 24 42
```

**Sample Output 1**

```
4 0
```

**Explanation 1**

The diagram below depicts the number of times Maria broke her best and worst records throughout the season:

![image](https://s3.amazonaws.com/hr-assets/0/1487360375-aee4388234-breakingbest5.png)

She broke her best record four times (after games , , , and ) and her worst record zero times (no score during the season was lower than the one she earned during her first game), so we print `4 0` as our answer.

## 설명

게임을 하여 받은 점수들을 비교하여 최고점과 최저점이 몇번 갈아치워 졌는지 카운트 하여 리턴해라

## 풀이

첫 게임에서 받은 점수를 각각 high와 low에 저장하여 받은 점수들과 비교 후 점수가 최고점이면 high를 바꾸고 result에 카운팅 + 1, 최저점이면 low를 바꾸고 result에 카운팅 + 1

```swift
func breakingRecords(scores: [Int]) -> [Int] {
    var high = [scores[0]]
    var low = [scores[0]]
    var result = [0,0]
    
    for i in 0 ..< scores.count {
        if high[high.count - 1] < scores[i] {
            high[0] = scores[i]
            result[0] += 1
        } else {
            if low[low.count - 1] > scores[i] {
                low[0] = scores[i]
                result[1] += 1
            }
        }
    }
 
    return result
}
```

