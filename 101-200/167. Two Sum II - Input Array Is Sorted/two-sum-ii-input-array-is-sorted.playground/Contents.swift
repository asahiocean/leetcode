import Foundation

// 167. Two Sum II - Input Array Is Sorted
// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard numbers.count > 1 else { return [Int]() }
        var left = 0, right = numbers.count - 1
        while left < right {
            if numbers[left] + numbers[right] < target {
                left += 1
            } else if numbers[left] + numbers[right] > target {
                right -= 1
            } else {
                return [left + 1, right + 1]
            }
        }
        return []
    }
}
