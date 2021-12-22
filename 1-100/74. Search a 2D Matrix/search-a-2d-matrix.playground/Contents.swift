import Foundation

// 74. Search a 2D Matrix
// https://leetcode.com/problems/search-a-2d-matrix/

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var nums = [Int]()
        matrix.forEach { nums.append(contentsOf: $0) }
        guard !nums.isEmpty else { return false }
        var l = 0, r = nums.count - 1
        
        while l < r {
            let mid = l + (r - l) >> 1
            if nums[mid] == target { return true }
            nums[mid] < target ? (l = mid + 1) : (r = mid)
        }
        return nums[l] == target
    }
}
