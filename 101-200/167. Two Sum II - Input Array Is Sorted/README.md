# [167. Two Sum II - Input array is sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)

Given an array of integers ```numbers``` that is already **sorted in ascending order**, find two numbers such that they add up to a specific **target** number.

Return the indices of the two numbers (**1-indexed**) as an integer array ```answer``` of size ```2```, where ```1 <= answer[0] < answer[1] <= numbers.length```.

You may assume that each input would have **exactly one solution** and you **may not** use the same element twice.

#### Example 1:
```swift
Input: numbers = [2,7,11,15], target = 9
Output: [1,2]
Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
```

#### Example 2:
```swift
Input: numbers = [2,3,4], target = 6
Output: [1,3]
```

#### Example 3:
```swift
Input: numbers = [-1,0], target = -1
Output: [1,2]
``` 

#### Constraints:
```swift
2 <= numbers.length <= 3 * 104
-1000 <= numbers[i] <= 1000
numbers is sorted in increasing order.
-1000 <= target <= 1000
Only one valid answer exists.
```

#### Solution:
```swift
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        if numbers.count <= 1 { [Int]() }
        var l = 0, r = numbers.count - 1
        
        while l < r {
            if numbers[l] + numbers[r] < target {
                l += 1
            } else if numbers[l] + numbers[r] > target {
                r -= 1
            } else {
                return [l + 1, r + 1]
            }
        }
        return []
    }
}
```