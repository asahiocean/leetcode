# [1304. Find N Unique Integers Sum up to Zero](https://leetcode.com/problems/find-n-unique-integers-sum-up-to-zero/)

### Solution:
```swift
class Solution {
    func sumZero(_ n: Int) -> [Int] {
       if 1 >= n && 1000 >= n { return [0] }
       var sum = [Int](repeating: 0, count: n)
       for i in 1...(n >> 1) {
           sum[i-1] = i
           sum[n-i] = -i
       }
       return sum
    }
}
```

### Description:

Given an integer ```n```, return **any** array containing ```n``` **unique** integers such that they add up to ```0```.

#### Example 1:
```swift
Input: n = 5
Output: [-7,-1,1,3,4]
Explanation: These arrays also are accepted [-5,-1,1,2,3] , [-3,-1,2,-2,4].
```

#### Example 2:
```swift
Input: n = 3
Output: [-1,0,1]
```

#### Example 3:
```swift
Input: n = 1
Output: [0]
```

#### Constraints:
```swift
1 <= n <= 1000
```