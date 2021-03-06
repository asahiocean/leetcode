import Foundation

// 74. Search a 2D Matrix
// https://leetcode.com/problems/search-a-2d-matrix/

class Solution {
    func searchMatrix(_ m: [[Int]], _ t: Int) -> Bool {
        if m.isEmpty { return false }
        var nums: [Int] = []
        m.forEach { nums.append(contentsOf: $0) }
        
        var lhs = 0, rhs = nums.count - 1
        
        while lhs < rhs {
            let mid = lhs + (rhs - lhs) >> 1
            if nums[mid] == t { return true }
            nums[mid] < t ? (lhs = mid + 1) : (rhs = mid)
        }
        return nums[lhs] == t
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
