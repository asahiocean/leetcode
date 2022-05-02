import Foundation

// 905. Sort Array By Parity
// https://leetcode.com/problems/sort-array-by-parity/

class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var arr = nums
        arr.partition { $0 % 2 == 1 }
        return arr
    }
}
