import Foundation

// 977. Squares of a Sorted Array
// https://leetcode.com/problems/squares-of-a-sorted-array/

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        return nums.map({$0*$0}).sorted()
    }
}
