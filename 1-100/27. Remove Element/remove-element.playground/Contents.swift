import Foundation

// 27. Remove Element
// https://leetcode.com/problems/remove-element/

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        let filtered = nums.filter({ $0 != val })
        nums = filtered
        return filtered.count
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// Your function should return k = 2, with the first two elements of nums being 2.
    /// It does not matter what you leave beyond the returned k (hence they are underscores).
    func test0() {
        var array = [3,2,2,3]
        solution.removeElement(&array, 3)
        XCTAssertEqual(array, [2,2])
    }
    
    /// Your function should return k = 5, with the first five elements of nums containing 0, 0, 1, 3, and 4.
    /// Note that the five elements can be returned in any order.
    /// It does not matter what you leave beyond the returned k (hence they are underscores).
    func test1() {
        var array = [0,1,2,2,3,0,4,2]
        solution.removeElement(&array, 2)
        XCTAssertEqual(array, [0,1,3,0,4])
    }
}

Tests.defaultTestSuite.run()
