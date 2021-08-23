import Foundation

// https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        for (i, num) in nums.enumerated() {
            if let last = dict[target - num] {
                return [last, i]
            }
            dict[num] = i
        }
        return []
    }
}

func tests() {
    let s = Solution()
    assert(s.twoSum([2,7,11,15], 9) == [0,1])
    assert(s.twoSum([3,2,4], 6) == [1,2])
    assert(s.twoSum([3,3], 6) == [0,1])
}

tests()
