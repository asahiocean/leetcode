import Foundation

// 74. Search a 2D Matrix
// https://leetcode.com/problems/search-a-2d-matrix/

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        var nums: [Int] = []
        for n in matrix { nums.append(contentsOf: n) }
        
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

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3)
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13)
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
