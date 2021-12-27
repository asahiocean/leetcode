import Foundation

// 74. Search a 2D Matrix
// https://leetcode.com/problems/search-a-2d-matrix/

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        var nums = [Int]()
        matrix.forEach { nums.append(contentsOf: $0) }
        
        guard !nums.isEmpty else { return false }
        
        var left = 0, right = nums.count - 1
        
        while left < right {
            let mid = left + (right - left) >> 1
            if nums[mid] == target { return true }
            nums[mid] < target ? (left = mid + 1) : (right = mid)
        }
        return nums[left] == target
    }
}
