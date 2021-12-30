### [448. Find All Numbers Disappeared in an Array](https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/)

Given an array of integers where **1 ≤ a[i] ≤ n (n = size of array)**, some elements appear twice and others appear once.

Find all the elements of **[1, n]** inclusive that do not appear in this array.

Could you do it without extra space and in **O(n)** runtime? You may assume the returned list does not count as extra space.

#### Example:
```
Input: [4,3,2,7,8,2,3,1]

Output: [5,6]
```

### Code
```swift
import Foundation

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums
        var result = [Int]()
        
        nums.enumerated().forEach({
            let index = abs(nums[$0.offset]) - 1
            guard nums[index] > 0 else { return }
            nums[index] = -nums[index]
        })
        
        for i in 0..<nums.count where nums[i] > 0 {
            result.append(i+1)
        }
        return result
    }
}

func tests() {
    let s = Solution()
    let input = s.findDisappearedNumbers([4,3,2,7,8,2,3,1])
    assert(input == [5,6]) // Perfectly!
}

tests()
```
